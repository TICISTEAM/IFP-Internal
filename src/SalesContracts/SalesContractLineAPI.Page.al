page 50394 "Sales Contract Line API"
{
    PageType = API;
    APIPublisher = 'tic';
    APIGroup = 'contracts';
    APIVersion = 'v1.0';
    EntityCaption = 'Sales Contract Line';
    EntitySetCaption = 'Sales Contract Lines';
    EntityName = 'salesContractLine';
    EntitySetName = 'salesContractLines';
    SourceTable = "Price List Line";   // Adjust if the actual table name differs
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            repeater(Records)
            {
                field(systemId; Rec.SystemId) { }

                field(priceListCode; Rec."Price List Code") { }
                field(lineNo; Rec."Line No.") { }
                field(sourceType; Rec."Source Type") { }
                field(sourceNo; Rec."Source No.") { }
                field(parentSourceNo; Rec."Parent Source No.") { }
                field(sourceID; Rec."Source ID") { }
                field(assetType; Rec."Asset Type") { }
                field(assetNo; Rec."Asset No.") { }
                field(variantCode; Rec."Variant Code") { }
                field(currencyCode; Rec."Currency Code") { }
                field(workTypeCode; Rec."Work Type Code") { }
                field(startingDate; Rec."Starting Date") { }
                field(endingDate; Rec."Ending Date") { }
                field(minimumQuantity; Rec."Minimum Quantity") { }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { }
                field(amountType; Rec."Amount Type") { }
                field(unitPrice; Rec."Unit Price") { }
                field(costFactor; Rec."Cost Factor") { }
                field(unitCost; Rec."Unit Cost") { }
                field(lineDiscount; Rec."Line Discount %") { }
                field(allowLineDisc; Rec."Allow Line Disc.") { }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { }
                field(priceIncludesVAT; Rec."Price Includes VAT") { }
                field(vATBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)") { }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group") { }
                field(assetID; Rec."Asset ID") { }
                field(lineAmount; Rec."Line Amount") { }
                field(priceType; Rec."Price Type") { }
                field(description; Rec."Description") { }
                field(status; Rec."Status") { }
                field(directUnitCost; Rec."Direct Unit Cost") { }
                field(sourceGroup; Rec."Source Group") { }
                field(productNo; Rec."Product No.") { }
                field(assignToNo; Rec."Assign-to No.") { }
                field(assignToParentNo; Rec."Assign-to Parent No.") { }
                field(variantCodeLookup; Rec."Variant Code Lookup") { }
                field(unitOfMeasureCodeLookup; Rec."Unit of Measure Code Lookup") { }
                field(unpostedSalesOrdersIFP; Rec."Unposted Sales Orders.IFP") { }
                field(contractPriceListIFP; Rec."Contract Price List.IFP") { }
                field(locationIFP; Rec."Location.IFP") { }
                field(lineLimitUOMCodeIFP; Rec."Line Limit UOM Code.IFP") { }
                field(lineUOMQtyPerIFP; Rec."Line UOM QtyPer.IFP") { }
                field(lineLimitIFP; Rec."Line Limit.IFP") { }
                field(masterContractIFP; Rec."Master Contract.IFP") { }
                field(saleContUnPOrderIFP; Rec."SaleContUnPOrder.IFP") { }
                field(saleContUnPOrderShipNotInvIFP; Rec."SaleContUnPOrderShipNotInv.IFP") { }
                field(saleContUnPCrMemoIFP; Rec."SaleContUnPCrMemo.IFP") { }
                field(saleContUnPInvIFP; Rec."SaleContUnPInv.IFP") { }
                field(saleContUnPReturnIFP; Rec."SaleContUnPReturn.IFP") { }
                field(saleContInvoicesIFP; Rec."SaleContInvoices.IFP") { }
                field(saleContCreditsIFP; Rec."SaleContCredits.IFP") { }
                field(saleContReturnRcptsIFP; Rec."SaleContReturnRcpts.IFP") { }
                field(assignToAddrIFP; Rec."Assign-to Addr.IFP") { }
                field(itemCategoryIFP; Rec."Item Category.IFP") { }
                field(pricingMethodIFP; Rec."Pricing Method.IFP") { }
                field(costAdjIFP; Rec."Cost Adj.IFP") { }
                field(itemCatParentIFP; Rec."Item Cat Parent.IFP") { }
                field(expiredIFP; Rec."Expired.IFP") { }
                field(dropCityIFP; Rec."Drop City.IFP") { }
                field(exludeSalesOrderIFP; Rec."Exlude Sales Order.IFP") { }
                field(lineDiscountFixedAmountIFP; Rec."Line Discount Fixed Amount.IFP") { }
                field(rebateFixedAmountIFP; Rec."Rebate Fixed Amount.IFP") { }
                field(rebatePercentageIFP; Rec."Rebate Percentage.IFP") { }
                field(documentIDIFP; Rec."Document ID.IFP") { }
                field(cEContractIDIFP; Rec."CE Contract ID.IFP") { }
                field(costFactorAmtIFP; Rec."Cost Factor Amt.IFP") { }
                field(cEDummyGuidIFP; Rec."CE Dummy Guid.IFP") { }
                field(negDiscPctIFP; Rec."Neg Disc Pct_IFP") { }
                field(systemCreatedAt; Rec."SystemCreatedAt") { }
                field(systemCreatedBy; Rec."SystemCreatedBy") { }
                field(systemModifiedAt; Rec."SystemModifiedAt") { }
                field(systemModifiedBy; Rec."SystemModifiedBy") { }
            }
        }
    }
}
