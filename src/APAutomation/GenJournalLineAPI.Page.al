page 50581 "Gen. Journal Line API"
{
    PageType = API;
    APIPublisher = 'tic';
    APIGroup = 'AP_Automation';
    APIVersion = 'v1.0';
    EntityCaption = 'General Journal Line';
    EntitySetCaption = 'General Journal Lines';
    EntityName = 'generalJournalLine';
    EntitySetName = 'generalJournalLines';
    SourceTable = "Gen. Journal Line";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System Id';
                    Editable = false;
                }
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                    Editable = false;
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                    Editable = false;
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    Editable = false;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    Editable = false;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    Editable = false;
                }
                field(accountType; Rec."Account Type")
                {
                    Caption = 'Account Type';
                    Editable = false;
                }
                field(accountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    Editable = false;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    Editable = false;
                }
                field(amountLCY; Rec."Amount (LCY)")
                {
                    Caption = 'Amount (LCY)';
                    Editable = false;
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                    Editable = false;
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                    Editable = false;
                }
                field(appliesToId; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                    Editable = false;
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    Editable = false;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    Editable = false;
                }
                field(bankPaymentType; Rec."Bank Payment Type")
                {
                    Caption = 'Bank Payment Type';
                    Editable = false;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    Editable = false;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    Editable = false;
                }
                field(description; Rec."Description") { }
                field(paymentReference; Rec."Payment Reference") { }
                field(documentDate; Rec."Document Date") { }
                field(exportedToPaymentFile; Rec."Exported to Payment File") { }
            }
        }
    }
}
