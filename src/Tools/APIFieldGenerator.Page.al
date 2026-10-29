page 50395 "API Field Generator"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'API Field Generator';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(TableNoInput; TableNo)
                {
                    ApplicationArea = All;
                    Caption = 'Table No.';
                    ToolTip = 'The ID of the table to generate API field blocks for. Includes fields added by table extensions.';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        AllObjWithCaption: Record AllObjWithCaption;
                        Objects: Page Objects;
                    begin
                        AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Table);
                        Objects.SetTableView(AllObjWithCaption);
                        Objects.LookupMode(true);
                        if Objects.RunModal() = Action::LookupOK then begin
                            Objects.GetRecord(AllObjWithCaption);
                            TableNo := AllObjWithCaption."Object ID";
                        end;
                        exit(true);
                    end;
                }
                field(IncludeFlowFieldsInput; IncludeFlowFields)
                {
                    ApplicationArea = All;
                    Caption = 'Include FlowFields';
                    ToolTip = 'FlowFields are calculated on read and can slow down large API pulls. Leave off unless you need them.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Generate)
            {
                ApplicationArea = All;
                Caption = 'Generate Field Blocks';
                Image = ExportFile;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    GenerateFieldBlocks();
                end;
            }
        }
    }

    var
        TableNo: Integer;
        IncludeFlowFields: Boolean;

    local procedure GenerateFieldBlocks()
    var
        FieldRec: Record Field;
        TempBlob: Codeunit "Temp Blob";
        UsedNames: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        Builder: TextBuilder;
        ApiName: Text;
        FileName: Text;
    begin
        if TableNo = 0 then
            Error('Enter a table number first.');

        FieldRec.SetRange(TableNo, TableNo);
        FieldRec.SetRange(Enabled, true);
        FieldRec.SetFilter(ObsoleteState, '<>%1', FieldRec.ObsoleteState::Removed);
        if IncludeFlowFields then
            FieldRec.SetFilter(Class, '%1|%2', FieldRec.Class::Normal, FieldRec.Class::FlowField)
        else
            FieldRec.SetRange(Class, FieldRec.Class::Normal);

        if FieldRec.FindSet() then
            repeat
                if IsSupportedType(FieldRec.Type) then begin
                    ApiName := MakeApiName(FieldRec.FieldName, FieldRec."No.", UsedNames);
                    Builder.AppendLine(
                        StrSubstNo('                field(%1; Rec."%2") { }', ApiName, FieldRec.FieldName));
                end else
                    Builder.AppendLine(
                        StrSubstNo('                // Skipped (unsupported type %1): %2', Format(FieldRec.Type), FieldRec.FieldName));
            until FieldRec.Next() = 0;

        TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
        OutStr.WriteText(Builder.ToText());
        TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
        FileName := StrSubstNo('APIFields_Table%1.txt', TableNo);
        DownloadFromStream(InStr, 'Download generated fields', '', 'Text Files (*.txt)|*.txt', FileName);
    end;

    local procedure IsSupportedType(FieldType: Option TableFilter,RecordID,OemText,Date,Time,DateFormula,Decimal,Media,MediaSet,Text,Code,Binary,BLOB,Boolean,Integer,OemCode,Option,BigInteger,Duration,GUID,DateTime): Boolean
    begin
        // Types that cannot (or should not) be exposed on an API page
        exit(not (FieldType in [FieldType::BLOB, FieldType::Media, FieldType::MediaSet,
                                FieldType::TableFilter, FieldType::RecordID, FieldType::Binary]));
    end;

    local procedure MakeApiName(FieldName: Text; FieldNo: Integer; var UsedNames: List of [Text]): Text
    var
        Result: Text;
        Ch: Char;
        i: Integer;
        NextUpper: Boolean;
    begin
        // API element names must be alphanumeric, start with a lowercase letter,
        // and be unique within the page. Builds camelCase from the field name.
        NextUpper := false;
        for i := 1 to StrLen(FieldName) do begin
            Ch := FieldName[i];
            if ((Ch >= 'A') and (Ch <= 'Z')) or ((Ch >= 'a') and (Ch <= 'z')) or ((Ch >= '0') and (Ch <= '9')) then begin
                if (Result = '') then
                    Result += LowerCase(Format(Ch))
                else
                    if NextUpper then
                        Result += UpperCase(Format(Ch))
                    else
                        Result += Format(Ch);
                NextUpper := false;
            end else
                NextUpper := true;   // separator found; capitalize next char
        end;

        if Result = '' then
            Result := StrSubstNo('field%1', FieldNo);
        if (Result[1] >= '0') and (Result[1] <= '9') then
            Result := 'f' + Result;

        // Ensure uniqueness ("No." and "No" would otherwise collide)
        if UsedNames.Contains(Result) then
            Result := StrSubstNo('%1Field%2', Result, FieldNo);
        UsedNames.Add(Result);

        exit(Result);
    end;
}
