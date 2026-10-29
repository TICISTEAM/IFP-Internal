page 50397 "Sales Contract API"
{
    PageType = API;
    APIPublisher = 'tic';
    APIGroup = 'contracts';
    APIVersion = 'v1.0';
    EntityCaption = 'Sales Contract';
    EntitySetCaption = 'Sales Contracts';
    EntityName = 'salesContract';
    EntitySetName = 'salesContracts';
    SourceTable = "Price List Header";   // Adjust if the actual table name differs in your environment
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false;
    // Set to true if Power Automate needs to write back

    layout
    {
        area(Content)
        {
            repeater(Records)
            {
                field(contractPriceListIFP; Rec."Contract Price List.IFP") { }
                field(systemId; Rec.SystemId) { }
                field(description; Rec."Description") { }
                field(sourceGroup; Rec."Source Group") { }
                field(sourceType; Rec."Source Type") { }
                field(sourceNo; Rec."Source No.") { }
                field(parentSourceNo; Rec."Parent Source No.") { }
                field(sourceID; Rec."Source ID") { }
                field(priceType; Rec."Price Type") { }
                field(amountType; Rec."Amount Type") { }
                field(currencyCode; Rec."Currency Code") { }
                field(startingDate; Rec."Starting Date") { }
                field(endingDate; Rec."Ending Date") { }
                field(priceIncludesVAT; Rec."Price Includes VAT") { }
                field(vATBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)") { }
                field(allowLineDisc; Rec."Allow Line Disc.") { }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { }
                field(noSeries; Rec."No. Series") { }
                field(status; Rec."Status") { }
                field(filterSourceNo; Rec."Filter Source No.") { }
                field(allowUpdatingDefaults; Rec."Allow Updating Defaults") { }
                field(assignToNo; Rec."Assign-to No.") { }
                field(assignToParentNo; Rec."Assign-to Parent No.") { }
                field(assignToNameIFP; Rec."Assign-to Name.IFP") { }
                field(assignToAddrIFP; Rec."Assign-to Addr.IFP") { }
                field(salespersonIFP; Rec."Salesperson.IFP") { }
                field(paymentTermsIFP; Rec."Payment Terms.IFP") { }
                field(assignToContractNoIFP; Rec."Assign-to Contract No.IFP") { }
                field(contractLimitUOMCodeIFP; Rec."Contract Limit UOM Code.IFP") { }
                field(contractLimitIFP; Rec."Contract Limit.IFP") { }
                field(assignToSalespersonCodeIFP; Rec."Assign-to Salesperson Code.IFP") { }
                field(originalContractLimitIFP; Rec."Original Contract Limit.IFP") { }
                field(itemCategoryIFP; Rec."Item Category.IFP") { }
                field(commoditySubclassIFP; Rec."Commodity Subclass.IFP") { }
                field(cOBTBulkPriceIFP; Rec."COBT - Bulk Price.IFP") { }
                field(freightTermsTypeIFP; Rec."Freight Terms Type.IFP") { }
                field(contractTypeIFP; Rec."Contract Type.IFP") { }
                field(masterContractIFP; Rec."Master Contract.IFP") { }
                field(futuresOptionIFP; Rec."Futures Option.IFP") { }
                field(locationCodeIFP; Rec."Location Code.IFP") { }
                field(shortcutDim1CodeIFP; Rec."Shortcut Dim 1 Code.IFP") { }
                field(shortcutDim2CodeIFP; Rec."Shortcut Dim 2 Code.IFP") { }
                field(shipmentMethodCodeIFP; Rec."Shipment Method Code.IFP") { }
                field(shippingAgentCodeIFP; Rec."Shipping Agent Code.IFP") { }
                field(contactNoIFP; Rec."Contact No.IFP") { }
                field(eMailIFP; Rec."E-Mail.IFP") { }
                field(customerServiceRepIFP; Rec."Customer Service Rep.IFP") { }
                field(salesSupportRepIFP; Rec."Sales Support Rep.IFP") { }
                field(cEContractIDIFP; Rec."CE Contract ID.IFP") { }
                field(code; Rec."Code") { }

            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec.Code = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Price List Nos.");
            Rec."No. Series" := SalesSetup."Price List Nos.";
            Rec.Code := NoSeries.GetNextNo(Rec."No. Series", WorkDate());
        end;
        exit(true);
    end;
    // Exposes lines nested under the header so Power Automate can
    // $expand=salesContractLines in a single call.
    // Requires the part's SubPageLink field names to match your tables.
    /*
    part(salesContractLines; "Sales Contract Line API")
    {
        EntityName = 'salesContractLine';
        EntitySetName = 'salesContractLines';
        SubPageLink = "Contract No." = field("No.");   // Adjust key field names
    }
    */
}
