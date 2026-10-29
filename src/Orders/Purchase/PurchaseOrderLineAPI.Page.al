page 50503 "TIC Purch Order Line API"
{
    PageType = API;
    Caption = 'Purchase Order Line API';
    APIPublisher = 'tic';
    APIGroup = 'integration';
    APIVersion = 'v1.0';
    EntityName = 'purchaseOrderLine';
    EntitySetName = 'purchaseOrderLines';
    SourceTable = "Purchase Line";
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
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }

                field(documentType; Rec."Document Type") { }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.") { }
                field(type; Rec."Type") { }
                field(no; Rec."No.") { }
                field(locationCode; Rec."Location Code") { }
                field(postingGroup; Rec."Posting Group") { }
                field(expectedReceiptDate; Rec."Expected Receipt Date") { }
                field(description; Rec."Description") { }
                field(description2; Rec."Description 2") { }
                field(unitOfMeasure; Rec."Unit of Measure") { }
                field(quantity; Rec."Quantity") { }
                field(outstandingQuantity; Rec."Outstanding Quantity") { }
                field(qtyToInvoice; Rec."Qty. to Invoice") { }
                field(qtyToReceive; Rec."Qty. to Receive") { }
                field(directUnitCost; Rec."Direct Unit Cost") { }
                field(unitCostLCY; Rec."Unit Cost (LCY)") { }
                field(vAT; Rec."VAT %") { }
                field(lineDiscount; Rec."Line Discount %") { }
                field(lineDiscountAmount; Rec."Line Discount Amount") { }
                field(amount; Rec."Amount") { }
                field(amountIncludingVAT; Rec."Amount Including VAT") { }
                field(unitPriceLCY; Rec."Unit Price (LCY)") { }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { }
                field(grossWeight; Rec."Gross Weight") { }
                field(netWeight; Rec."Net Weight") { }
                field(unitsPerParcel; Rec."Units per Parcel") { }
                field(unitVolume; Rec."Unit Volume") { }
                field(applToItemEntry; Rec."Appl.-to Item Entry") { }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code") { }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code") { }
                field(jobNo; Rec."Job No.") { }
                field(indirectCost; Rec."Indirect Cost %") { }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.") { }
                field(outstandingAmount; Rec."Outstanding Amount") { }
                field(qtyRcdNotInvoiced; Rec."Qty. Rcd. Not Invoiced") { }
                field(amtRcdNotInvoiced; Rec."Amt. Rcd. Not Invoiced") { }
                field(quantityReceived; Rec."Quantity Received") { }
                field(quantityInvoiced; Rec."Quantity Invoiced") { }
                field(receiptNo; Rec."Receipt No.") { }
                field(receiptLineNo; Rec."Receipt Line No.") { }
                field(orderNo; Rec."Order No.") { }
                field(orderLineNo; Rec."Order Line No.") { }
                field(profit; Rec."Profit %") { }
                field(payToVendorNo; Rec."Pay-to Vendor No.") { }
                field(invDiscountAmount; Rec."Inv. Discount Amount") { }
                field(vendorItemNo; Rec."Vendor Item No.") { }
                field(salesOrderNo; Rec."Sales Order No.") { }
                field(salesOrderLineNo; Rec."Sales Order Line No.") { }
                field(dropShipment; Rec."Drop Shipment") { }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { }
                field(vATCalculationType; Rec."VAT Calculation Type") { }
                field(transactionType; Rec."Transaction Type") { }
                field(transportMethod; Rec."Transport Method") { }
                field(attachedToLineNo; Rec."Attached to Line No.") { }
                field(entryPoint; Rec."Entry Point") { }
                field(transactionSpecification; Rec."Transaction Specification") { }
                field(taxAreaCode; Rec."Tax Area Code") { }
                field(taxLiable; Rec."Tax Liable") { }
                field(taxGroupCode; Rec."Tax Group Code") { }
                field(useTax; Rec."Use Tax") { }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group") { }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group") { }
                field(currencyCode; Rec."Currency Code") { }
                field(outstandingAmountLCY; Rec."Outstanding Amount (LCY)") { }
                field(amtRcdNotInvoicedLCY; Rec."Amt. Rcd. Not Invoiced (LCY)") { }
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
                field(outstandingAmtExVATLCY; Rec."Outstanding Amt. Ex. VAT (LCY)") { }
                field(aRcdNotInvExVATLCY; Rec."A. Rcd. Not Inv. Ex. VAT (LCY)") { }
                field(pmtDiscountAmount; Rec."Pmt. Discount Amount") { }
                field(prepmtPmtDiscountAmount; Rec."Prepmt. Pmt. Discount Amount") { }
                field(dimensionSetID; Rec."Dimension Set ID") { }
                field(jobTaskNo; Rec."Job Task No.") { }
                field(jobLineType; Rec."Job Line Type") { }
                field(jobUnitPrice; Rec."Job Unit Price") { }
                field(jobTotalPrice; Rec."Job Total Price") { }
                field(jobLineAmount; Rec."Job Line Amount") { }
                field(jobLineDiscountAmount; Rec."Job Line Discount Amount") { }
                field(jobLineDiscount; Rec."Job Line Discount %") { }
                field(jobUnitPriceLCY; Rec."Job Unit Price (LCY)") { }
                field(jobTotalPriceLCY; Rec."Job Total Price (LCY)") { }
                field(jobLineAmountLCY; Rec."Job Line Amount (LCY)") { }
                field(jobLineDiscAmountLCY; Rec."Job Line Disc. Amount (LCY)") { }
                field(jobCurrencyFactor; Rec."Job Currency Factor") { }
                field(jobCurrencyCode; Rec."Job Currency Code") { }
                field(jobPlanningLineNo; Rec."Job Planning Line No.") { }
                field(jobRemainingQty; Rec."Job Remaining Qty.") { }
                field(jobRemainingQtyBase; Rec."Job Remaining Qty. (Base)") { }
                field(deferralCode; Rec."Deferral Code") { }
                field(returnsDeferralStartDate; Rec."Returns Deferral Start Date") { }
                field(selectedAllocAccountNo; Rec."Selected Alloc. Account No.") { }
                field(allocationAccountNo; Rec."Allocation Account No.") { }
                field(allocPurchLineSystemId; Rec."Alloc. Purch. Line SystemId") { }
                field(invoicingFromLineSystemId; Rec."Invoicing From Line SystemId") { }
                field(prodOrderNo; Rec."Prod. Order No.") { }
                field(variantCode; Rec."Variant Code") { }
                field(binCode; Rec."Bin Code") { }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure") { }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision") { }
                field(qtyRoundingPrecisionBase; Rec."Qty. Rounding Precision (Base)") { }
                field(unitOfMeasureCode; Rec."Unit of Measure Code") { }
                field(quantityBase; Rec."Quantity (Base)") { }
                field(outstandingQtyBase; Rec."Outstanding Qty. (Base)") { }
                field(qtyToInvoiceBase; Rec."Qty. to Invoice (Base)") { }
                field(qtyToReceiveBase; Rec."Qty. to Receive (Base)") { }
                field(qtyRcdNotInvoicedBase; Rec."Qty. Rcd. Not Invoiced (Base)") { }
                field(qtyReceivedBase; Rec."Qty. Received (Base)") { }
                field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)") { }
                field(fAPostingDate; Rec."FA Posting Date") { }
                field(fAPostingType; Rec."FA Posting Type") { }
                field(depreciationBookCode; Rec."Depreciation Book Code") { }
                field(salvageValue; Rec."Salvage Value") { }
                field(deprUntilFAPostingDate; Rec."Depr. until FA Posting Date") { }
                field(deprAcquisitionCost; Rec."Depr. Acquisition Cost") { }
                field(maintenanceCode; Rec."Maintenance Code") { }
                field(insuranceNo; Rec."Insurance No.") { }
                field(budgetedFANo; Rec."Budgeted FA No.") { }
                field(duplicateInDepreciationBook; Rec."Duplicate in Depreciation Book") { }
                field(useDuplicationList; Rec."Use Duplication List") { }
                field(responsibilityCenter; Rec."Responsibility Center") { }
                field(itemCategoryCode; Rec."Item Category Code") { }
                field(nonstock; Rec."Nonstock") { }
                field(purchasingCode; Rec."Purchasing Code") { }
                field(specialOrder; Rec."Special Order") { }
                field(specialOrderSalesNo; Rec."Special Order Sales No.") { }
                field(specialOrderSalesLineNo; Rec."Special Order Sales Line No.") { }
                field(itemReferenceNo; Rec."Item Reference No.") { }
                field(itemReferenceUnitOfMeasure; Rec."Item Reference Unit of Measure") { }
                field(itemReferenceType; Rec."Item Reference Type") { }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.") { }
                field(completelyReceived; Rec."Completely Received") { }
                field(requestedReceiptDate; Rec."Requested Receipt Date") { }
                field(promisedReceiptDate; Rec."Promised Receipt Date") { }
                field(leadTimeCalculation; Rec."Lead Time Calculation") { }
                field(inboundWhseHandlingTime; Rec."Inbound Whse. Handling Time") { }
                field(plannedReceiptDate; Rec."Planned Receipt Date") { }
                field(orderDate; Rec."Order Date") { }
                field(allowItemChargeAssignment; Rec."Allow Item Charge Assignment") { }
                field(returnQtyToShip; Rec."Return Qty. to Ship") { }
                field(returnQtyToShipBase; Rec."Return Qty. to Ship (Base)") { }
                field(returnQtyShippedNotInvd; Rec."Return Qty. Shipped Not Invd.") { }
                field(retQtyShpdNotInvdBase; Rec."Ret. Qty. Shpd Not Invd.(Base)") { }
                field(returnShpdNotInvd; Rec."Return Shpd. Not Invd.") { }
                field(returnShpdNotInvdLCY; Rec."Return Shpd. Not Invd. (LCY)") { }
                field(returnQtyShipped; Rec."Return Qty. Shipped") { }
                field(returnQtyShippedBase; Rec."Return Qty. Shipped (Base)") { }
                field(nonDeductibleVAT; Rec."Non-Deductible VAT %") { }
                field(nonDeductibleVATBase; Rec."Non-Deductible VAT Base") { }
                field(nonDeductibleVATAmount; Rec."Non-Deductible VAT Amount") { }
                field(nonDeductibleVATDiff; Rec."Non-Deductible VAT Diff.") { }
                field(prepmtNonDeductVATBase; Rec."Prepmt. Non-Deduct. VAT Base") { }
                field(prepmtNonDeductVATAmount; Rec."Prepmt. Non-Deduct. VAT Amount") { }
                field(itemChargeHasNonDedVAT; Rec."Item Charge Has Non.Ded. VAT") { }
                field(returnShipmentNo; Rec."Return Shipment No.") { }
                field(returnShipmentLineNo; Rec."Return Shipment Line No.") { }
                field(returnReasonCode; Rec."Return Reason Code") { }
                field(subtype; Rec."Subtype") { }
                field(copiedFromPostedDoc; Rec."Copied From Posted Doc.") { }
                field(overReceiptQuantity; Rec."Over-Receipt Quantity") { }
                field(overReceiptCode; Rec."Over-Receipt Code") { }
                field(overReceiptApprovalStatus; Rec."Over-Receipt Approval Status") { }
                field(taxToBeExpensed; Rec."Tax To Be Expensed") { }
                field(provincialTaxAreaCode; Rec."Provincial Tax Area Code") { }
                field(gSTHST; Rec."GST/HST") { }
                field(noOfFixedAssetCards; Rec."No. of Fixed Asset Cards") { }
                field(contractCodeIFP; Rec."Contract Code.IFP") { }
                field(logisticsChargeIFP; Rec."Logistics Charge.IFP") { }
                field(contractLineNoIFP; Rec."Contract Line No.IFP") { }
                field(lotNoIFP; Rec."Lot No.IFP") { }
                field(bOLIFP; Rec."BOL.IFP") { }
                field(ticketNumberIFP; Rec."Ticket Number.IFP") { }
                field(projectCostFactorIFP; Rec."Project Cost Factor.IFP") { }
                field(projectPriceAmtDiffIFP; Rec."Project Price Amt Diff.IFP") { }
                field(jobUnitPriceIFP; Rec."Job Unit Price.IFP") { }
                field(originalQuantityIFP; Rec."Original Quantity.IFP") { }
                field(reasonCodeIFP; Rec."Reason Code.IFP") { }
                field(routingNo; Rec."Routing No.") { }
                field(operationNo; Rec."Operation No.") { }
                field(workCenterNo; Rec."Work Center No.") { }
                field(finished; Rec."Finished") { }
                field(prodOrderLineNo; Rec."Prod. Order Line No.") { }
                field(overheadRate; Rec."Overhead Rate") { }
                field(mPSOrder; Rec."MPS Order") { }
                field(planningFlexibility; Rec."Planning Flexibility") { }
                field(safetyLeadTime; Rec."Safety Lead Time") { }
                field(routingReferenceNo; Rec."Routing Reference No.") { }
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
