page 50501 "TIC Sales Order Line API"
{
    PageType = API;
    Caption = 'Sales Order Line API';
    APIPublisher = 'tic';
    APIGroup = 'integration';
    APIVersion = 'v1.0';
    EntityName = 'salesOrderLine';
    EntitySetName = 'salesOrderLines';
    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const(Order));
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;
    ChangeTrackingAllowed = true;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(documentType; Rec."Document Type") { }
                field(sellToCustomerNo; Rec."Sell-to Customer No.") { }
                field(type; Rec."Type") { }
                field(no; Rec."No.") { }
                field(locationCode; Rec."Location Code") { }
                field(postingGroup; Rec."Posting Group") { }
                field(shipmentDate; Rec."Shipment Date") { }
                field(description; Rec."Description") { }
                field(description2; Rec."Description 2") { }
                field(unitOfMeasure; Rec."Unit of Measure") { }
                field(quantity; Rec."Quantity") { }
                field(outstandingQuantity; Rec."Outstanding Quantity") { }
                field(qtyToInvoice; Rec."Qty. to Invoice") { }
                field(qtyToShip; Rec."Qty. to Ship") { }
                field(unitPrice; Rec."Unit Price") { }
                field(unitCostLCY; Rec."Unit Cost (LCY)") { }
                field(vAT; Rec."VAT %") { }
                field(lineDiscount; Rec."Line Discount %") { }
                field(lineDiscountAmount; Rec."Line Discount Amount") { }
                field(amount; Rec."Amount") { }
                field(amountIncludingVAT; Rec."Amount Including VAT") { }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { }
                field(grossWeight; Rec."Gross Weight") { }
                field(netWeight; Rec."Net Weight") { }
                field(unitsPerParcel; Rec."Units per Parcel") { }
                field(unitVolume; Rec."Unit Volume") { }
                field(applToItemEntry; Rec."Appl.-to Item Entry") { }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code") { }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code") { }
                field(customerPriceGroup; Rec."Customer Price Group") { }
                field(jobNo; Rec."Job No.") { }
                field(workTypeCode; Rec."Work Type Code") { }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.") { }
                field(outstandingAmount; Rec."Outstanding Amount") { }
                field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced") { }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced") { }
                field(quantityShipped; Rec."Quantity Shipped") { }
                field(quantityInvoiced; Rec."Quantity Invoiced") { }
                field(shipmentNo; Rec."Shipment No.") { }
                field(shipmentLineNo; Rec."Shipment Line No.") { }
                field(profit; Rec."Profit %") { }
                field(billToCustomerNo; Rec."Bill-to Customer No.") { }
                field(invDiscountAmount; Rec."Inv. Discount Amount") { }
                field(purchaseOrderNo; Rec."Purchase Order No.") { }
                field(purchOrderLineNo; Rec."Purch. Order Line No.") { }
                field(dropShipment; Rec."Drop Shipment") { }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { }
                field(vATCalculationType; Rec."VAT Calculation Type") { }
                field(transactionType; Rec."Transaction Type") { }
                field(transportMethod; Rec."Transport Method") { }
                field(attachedToLineNo; Rec."Attached to Line No.") { }
                field(exitPoint; Rec."Exit Point") { }
                field(transactionSpecification; Rec."Transaction Specification") { }
                field(taxCategory; Rec."Tax Category") { }
                field(taxAreaCode; Rec."Tax Area Code") { }
                field(taxLiable; Rec."Tax Liable") { }
                field(taxGroupCode; Rec."Tax Group Code") { }
                field(vATClauseCode; Rec."VAT Clause Code") { }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group") { }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group") { }
                field(currencyCode; Rec."Currency Code") { }
                field(outstandingAmountLCY; Rec."Outstanding Amount (LCY)") { }
                field(shippedNotInvoicedLCY; Rec."Shipped Not Invoiced (LCY)") { }
                field(shippedNotInvLCYNoVAT; Rec."Shipped Not Inv. (LCY) No VAT") { }
                field(reserve; Rec."Reserve") { }
                field(blanketOrderNo; Rec."Blanket Order No.") { }
                field(blanketOrderLineNo; Rec."Blanket Order Line No.") { }
                field(vATBaseAmount; Rec."VAT Base Amount") { }
                field(unitCost; Rec."Unit Cost") { }
                field(systemCreatedEntry; Rec."System-Created Entry") { }
                field(lineAmount; Rec."Line Amount") { }
                field(vATDifference; Rec."VAT Difference") { }
                field(invDiscAmountToInvoice; Rec."Inv. Disc. Amount to Invoice") { }
                field(vATIdentifier; Rec."VAT Identifier") { }
                field(iCPartnerRefType; Rec."IC Partner Ref. Type") { }
                field(iCPartnerReference; Rec."IC Partner Reference") { }
                field(prepayment; Rec."Prepayment %") { }
                field(prepmtLineAmount; Rec."Prepmt. Line Amount") { }
                field(prepmtAmtInv; Rec."Prepmt. Amt. Inv.") { }
                field(prepmtAmtInclVAT; Rec."Prepmt. Amt. Incl. VAT") { }
                field(prepaymentAmount; Rec."Prepayment Amount") { }
                field(prepmtVATBaseAmt; Rec."Prepmt. VAT Base Amt.") { }
                field(prepaymentVAT; Rec."Prepayment VAT %") { }
                field(prepmtVATCalcType; Rec."Prepmt. VAT Calc. Type") { }
                field(prepaymentVATIdentifier; Rec."Prepayment VAT Identifier") { }
                field(prepaymentTaxAreaCode; Rec."Prepayment Tax Area Code") { }
                field(prepaymentTaxLiable; Rec."Prepayment Tax Liable") { }
                field(prepaymentTaxGroupCode; Rec."Prepayment Tax Group Code") { }
                field(prepmtAmtToDeduct; Rec."Prepmt Amt to Deduct") { }
                field(prepmtAmtDeducted; Rec."Prepmt Amt Deducted") { }
                field(prepaymentLine; Rec."Prepayment Line") { }
                field(prepmtAmountInvInclVAT; Rec."Prepmt. Amount Inv. Incl. VAT") { }
                field(prepmtAmountInvLCY; Rec."Prepmt. Amount Inv. (LCY)") { }
                field(iCPartnerCode; Rec."IC Partner Code") { }
                field(prepmtVATAmountInvLCY; Rec."Prepmt. VAT Amount Inv. (LCY)") { }
                field(prepaymentVATDifference; Rec."Prepayment VAT Difference") { }
                field(prepmtVATDiffToDeduct; Rec."Prepmt VAT Diff. to Deduct") { }
                field(prepmtVATDiffDeducted; Rec."Prepmt VAT Diff. Deducted") { }
                field(iCItemReferenceNo; Rec."IC Item Reference No.") { }
                field(pmtDiscountAmount; Rec."Pmt. Discount Amount") { }
                field(prepmtPmtDiscountAmount; Rec."Prepmt. Pmt. Discount Amount") { }
                field(lineDiscountCalculation; Rec."Line Discount Calculation") { }
                field(dimensionSetID; Rec."Dimension Set ID") { }
                field(qtyToAssembleToOrder; Rec."Qty. to Assemble to Order") { }
                field(qtyToAsmToOrderBase; Rec."Qty. to Asm. to Order (Base)") { }
                field(jobTaskNo; Rec."Job Task No.") { }
                field(jobContractEntryNo; Rec."Job Contract Entry No.") { }
                field(deferralCode; Rec."Deferral Code") { }
                field(returnsDeferralStartDate; Rec."Returns Deferral Start Date") { }
                field(selectedAllocAccountNo; Rec."Selected Alloc. Account No.") { }
                field(allocationAccountNo; Rec."Allocation Account No.") { }
                field(allocSalesLineSystemId; Rec."Alloc. Sales Line SystemId") { }
                field(variantCode; Rec."Variant Code") { }
                field(binCode; Rec."Bin Code") { }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { }
                field(planned; Rec."Planned") { }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision") { }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { }
                field(qtyRoundingPrecisionBase; Rec."Qty. Rounding Precision (Base)") { }
                field(quantityBase; Rec."Quantity (Base)") { }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)") { }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)") { }
                field(qtyToShipBase; Rec."Qty. to Ship (Base)") { }
                field(qtyShippedNotInvdBase; Rec."Qty. Shipped Not Invd. (Base)") { }
                field(qtyShippedBase; Rec."Qty. Shipped (Base)") { }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)") { }
                field(fAPostingDate; Rec."FA Posting Date") { }
                field(depreciationBookCode; Rec."Depreciation Book Code") { }
                field(deprUntilFAPostingDate; Rec."Depr. until FA Posting Date") { }
                field(duplicateInDepreciationBook; Rec."Duplicate in Depreciation Book") { }
                field(useDuplicationList; Rec."Use Duplication List") { }
                field(responsibilityCenter; Rec."Responsibility Center") { }
                field(outOfStockSubstitution; Rec."Out-of-Stock Substitution") { }
                field(originallyOrderedNo; Rec."Originally Ordered No.") { }
                field(originallyOrderedVarCode; Rec."Originally Ordered Var. Code") { }
                field(itemCategoryCode; Rec."Item Category Code") { }
                field(nonstock; Rec."Nonstock") { }
                field(purchasingCode; Rec."Purchasing Code") { }
                field(specialOrder; Rec."Special Order") { }
                field(specialOrderPurchaseNo; Rec."Special Order Purchase No.") { }
                field(specialOrderPurchLineNo; Rec."Special Order Purch. Line No.") { }
                field(itemReferenceNo; Rec."Item Reference No.") { }
                field(itemReferenceUnitOfMeasure; Rec."Item Reference Unit of Measure") { }
                field(itemReferenceType; Rec."Item Reference Type") { }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.") { }
                field(completelyShipped; Rec."Completely Shipped") { }
                field(requestedDeliveryDate; Rec."Requested Delivery Date") { }
                field(promisedDeliveryDate; Rec."Promised Delivery Date") { }
                field(shippingTime; Rec."Shipping Time") { }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time") { }
                field(plannedDeliveryDate; Rec."Planned Delivery Date") { }
                field(plannedShipmentDate; Rec."Planned Shipment Date") { }
                field(shippingAgentCode; Rec."Shipping Agent Code") { }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { }
                field(allowItemChargeAssignment; Rec."Allow Item Charge Assignment") { }
                field(returnQtyToReceive; Rec."Return Qty. to Receive") { }
                field(returnQtyToReceiveBase; Rec."Return Qty. to Receive (Base)") { }
                field(returnQtyRcdNotInvd; Rec."Return Qty. Rcd. Not Invd.") { }
                field(retQtyRcdNotInvdBase; Rec."Ret. Qty. Rcd. Not Invd.(Base)") { }
                field(returnRcdNotInvd; Rec."Return Rcd. Not Invd.") { }
                field(returnRcdNotInvdLCY; Rec."Return Rcd. Not Invd. (LCY)") { }
                field(returnQtyReceived; Rec."Return Qty. Received") { }
                field(returnQtyReceivedBase; Rec."Return Qty. Received (Base)") { }
                field(applFromItemEntry; Rec."Appl.-from Item Entry") { }
                field(bOMItemNo; Rec."BOM Item No.") { }
                field(returnReceiptNo; Rec."Return Receipt No.") { }
                field(returnReceiptLineNo; Rec."Return Receipt Line No.") { }
                field(returnReasonCode; Rec."Return Reason Code") { }
                field(copiedFromPostedDoc; Rec."Copied From Posted Doc.") { }
                field(priceCalculationMethod; Rec."Price Calculation Method") { }
                field(allowLineDisc; Rec."Allow Line Disc.") { }
                field(customerDiscGroup; Rec."Customer Disc. Group") { }
                field(subtype; Rec."Subtype") { }
                field(priceDescription; Rec."Price description") { }
                field(packageTrackingNo; Rec."Package Tracking No.") { }
                field(retentionAttachedToLineNo; Rec."Retention Attached to Line No.") { }
                field(retentionVAT; Rec."Retention VAT %") { }
                field(customTransitNumber; Rec."Custom Transit Number") { }
                field(sATCustomsDocumentType; Rec."SAT Customs Document Type") { }
                field(contractCodeIFP; Rec."Contract Code.IFP") { }
                field(custIncentiveCommGrpIFP; Rec."Cust Incentive Comm Grp.IFP") { }
                field(itemIncentiveCommGrpIFP; Rec."Item Incentive Comm Grp.IFP") { }
                field(reasonCodeIFP; Rec."Reason Code.IFP") { }
                field(lineGrossWeightIFP; Rec."Line Gross Weight.IFP") { }
                field(lineNetWeightIFP; Rec."Line Net Weight.IFP") { }
                field(unitPriceFOBIFP; Rec."Unit Price FOB.IFP") { }
                field(lineAmountFOBIFP; Rec."Line Amount FOB.IFP") { }
                field(unitPriceFreightIFP; Rec."Unit Price Freight.IFP") { }
                field(lineAmountFreightIFP; Rec."Line Amount Freight.IFP") { }
                field(contractLineNoIFP; Rec."Contract Line No.IFP") { }
                field(skipLogisticsIFP; Rec."Skip Logistics.IFP") { }
                field(lotNoIFP; Rec."Lot No.IFP") { }
                field(resTypeIFP; Rec."Res Type.IFP") { }
                field(iLETabIFP; Rec."ILE Tab.IFP") { }
                field(originalQuantityIFP; Rec."Original Quantity.IFP") { }
                field(returnOrderNoIFP; Rec."Return Order No.IFP") { }
                field(manualPricingIFP; Rec."Manual Pricing.IFP") { }
                field(dropCityIFP; Rec."DropCity.IFP") { }
                field(portDeptDateIFP; Rec."Port Dept Date.IFP") { }
                field(bOLIFP; Rec."BOL.IFP") { }
                field(ticketNumberIFP; Rec."Ticket Number.IFP") { }
                field(expRcptDateIFP; Rec."Exp Rcpt Date.IFP") { }
                field(brixQuantityIFP; Rec."Brix Quantity.IFP") { }
                field(brixPercentageIFP; Rec."Brix Percentage.IFP") { }
                field(systemCreatedAt; Rec."SystemCreatedAt") { }
                field(systemCreatedBy; Rec."SystemCreatedBy") { }
                field(systemModifiedAt; Rec."SystemModifiedAt") { }
                field(systemModifiedBy; Rec."SystemModifiedBy") { }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
            }
        }
    }
}
