page 60258 "Salesperson API"
{
    PageType = API;
    APIPublisher = 'tic';
    APIGroup = 'salespeople';
    APIVersion = 'v1.0';
    EntityName = 'salesperson';
    EntitySetName = 'salespeople';
    SourceTable = "Salesperson/Purchaser";
    DelayedInsert = true;
    ODataKeyFields = "Code";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    Editable = false;
                }
                field(name; Rec."Name")
                {
                    Caption = 'Name';
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }

                field(customerServiceRepIFP; Rec."Customer Service Rep.IFP")
                {
                    Caption = 'Customer Service Rep. Code';

                    trigger OnValidate()
                    begin
                        Rec.Validate("Customer Service Rep.IFP");
                    end;
                }

                field(salesSupportRepIFP; Rec."Sales Support Rep.IFP")
                {
                    Caption = 'Sales Support Rep. Code';

                    trigger OnValidate()
                    begin
                        Rec.Validate("Sales Support Rep.IFP");
                    end;
                }

            }
        }
    }

}