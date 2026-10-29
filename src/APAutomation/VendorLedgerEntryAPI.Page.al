page 50582 "Vendor Ledger Entry API"
{
    PageType = API;
    APIPublisher = 'tic';
    APIGroup = 'AP_Automation';
    APIVersion = 'v1.0';
    EntityCaption = 'Vendor Ledger Entry';
    EntitySetCaption = 'Vendor Ledger Entries';
    EntityName = 'vendorLedgerEntry';
    EntitySetName = 'vendorLedgerEntries';
    SourceTable = "Vendor Ledger Entry";
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
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    Editable = false;
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    Editable = false;
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    Editable = false;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    Editable = false;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    Editable = false;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    Editable = false;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    Editable = false;
                }
                field(remainingAmount; Rec."Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    Editable = false;
                }
                field(open; Rec.Open)
                {
                    Caption = 'Open';
                    Editable = false;
                }
                field(appliesToId; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                    Editable = false;
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                    Editable = false;
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
                    Editable = false;
                }
                field(remainingPmtDiscPossible; Rec."Remaining Pmt. Disc. Possible")
                {
                    Caption = 'Remaining Pmt. Disc. Possible';
                    Editable = false;
                }
                field(amountToApply; Rec."Amount to Apply") { }
                field(vendorName; Rec."Vendor Name") { }
                field(appliesToDocType; Rec."Applies-to Doc. Type") { }
                field(appliesToDocNo; Rec."Applies-to Doc. No.") { }
                field(closedByEntryNo; Rec."Closed by Entry No.") { }
            }
        }
    }
}
