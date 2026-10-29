/// <summary>
/// Raises the purchase order line business event for changes to EXISTING
/// lines. Line creation is deliberately silent — the insert subscriber only
/// seeds state so the writes that follow an insert aren't mistaken for changes.
/// </summary>
codeunit 50516 "TIC Purch Line Watcher"
{
    Access = Internal;

    var
        QuantityLbl: Label 'quantity', Locked = true;
        ExpectedReceiptDateLbl: Label 'expectedReceiptDate', Locked = true;
        ModifiedLbl: Label 'modified', Locked = true;
        DeletedLbl: Label 'deleted', Locked = true;

    // Does NOT raise an event. Records the line as newly created so the
    // validate/modify writes that follow don't surface as changes.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertPurchaseLine(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        EventState: Codeunit "TIC Purch Line Event State";
    begin
        if not IsWatchedLine(Rec) then
            exit;

        EventState.MarkAsCreated(Rec.SystemId);
        EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyPurchaseLine(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        LineEvents: Codeunit "TIC Purch Line Events";
        EventState: Codeunit "TIC Purch Line Event State";
        ChangedFields: Text;
    begin
        if not IsWatchedLine(Rec) then
            exit;

        ChangedFields := GetChangedLineFields(Rec, xRec);
        if ChangedFields = '' then
            exit;

        // Still being populated after its insert — keep the signature current
        // so the first real edit is measured from the finished line, then exit.
        if EventState.IsWithinCreationWindow(Rec.SystemId) then begin
            EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
            exit;
        end;

        // One user edit = several Modify calls. Callers holding a pre-edit
        // record variable report a stale xRec, so xRec alone isn't enough.
        if not EventState.ShouldRaise(Rec.SystemId, BuildSignature(Rec)) then
            exit;

        LineEvents.PurchaseOrderLineChanged(
            ResolveDocumentId(Rec),
            Rec."Document No.",
            Rec.SystemId,
            Rec."Line No.",
            ModifiedLbl,
            ChangedFields,
            Rec."No.",
            Rec.Quantity,
            xRec.Quantity,
            Rec."Expected Receipt Date",
            xRec."Expected Receipt Date");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeletePurchaseLine(var Rec: Record "Purchase Line"; RunTrigger: Boolean)
    var
        LineEvents: Codeunit "TIC Purch Line Events";
        EventState: Codeunit "TIC Purch Line Event State";
        WasWithinCreationWindow: Boolean;
    begin
        if not IsWatchedLine(Rec) then
            exit;

        WasWithinCreationWindow := EventState.IsWithinCreationWindow(Rec.SystemId);
        EventState.ForgetLine(Rec.SystemId);

        // Whole order being deleted, or a line created and removed before it
        // ever really existed — neither is a change to an existing line.
        if EventState.IsHeaderDeleting() or WasWithinCreationWindow then
            exit;

        LineEvents.PurchaseOrderLineChanged(
            ResolveDocumentId(Rec),
            Rec."Document No.",
            Rec.SystemId,
            Rec."Line No.",
            DeletedLbl,
            '',
            Rec."No.",
            Rec.Quantity,
            Rec.Quantity,
            Rec."Expected Receipt Date",
            Rec."Expected Receipt Date");
    end;

    local procedure IsWatchedLine(var Rec: Record "Purchase Line"): Boolean
    begin
        if Rec.IsTemporary() then
            exit(false);
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit(false);

        // Skip skeleton rows the subpage creates before anything is typed.
        if (Rec."No." = '') and (Rec.Description = '') then
            exit(false);

        exit(true);
    end;

    local procedure GetChangedLineFields(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line") ChangedFields: Text
    begin
        if Rec.Quantity <> xRec.Quantity then
            AppendField(ChangedFields, QuantityLbl);

        if Rec."Expected Receipt Date" <> xRec."Expected Receipt Date" then
            AppendField(ChangedFields, ExpectedReceiptDateLbl);
    end;

    // Locked format 9 = invariant, so the signature never shifts with locale.
    local procedure BuildSignature(var Rec: Record "Purchase Line"): Text
    begin
        exit(Format(Rec.Quantity, 0, 9) + '|' + Format(Rec."Expected Receipt Date", 0, 9));
    end;

    local procedure AppendField(var ChangedFields: Text; FieldName: Text)
    begin
        if ChangedFields <> '' then
            ChangedFields += ',';
        ChangedFields += FieldName;
    end;

    // "Document Id" isn't reliably populated on lines created outside the API,
    // so fall back to resolving the header's SystemId directly.
    local procedure ResolveDocumentId(var Rec: Record "Purchase Line"): Guid
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        if not IsNullGuid(Rec."SystemId") then
            exit(Rec."SystemId");

        if PurchaseHeader.Get(Rec."Document Type", Rec."Document No.") then
            exit(PurchaseHeader.SystemId);

        exit(Rec."SystemId");
    end;
}
