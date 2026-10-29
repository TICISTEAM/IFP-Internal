page 50500 "TIC Sales Order Hdr API"
{
    PageType = API;
    Caption = 'Sales Order Header API';
    APIPublisher = 'tic';
    APIGroup = 'integration';
    APIVersion = 'v1.0';
    EntityName = 'salesOrderHeader';
    EntitySetName = 'salesOrderHeaders';
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Order));
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;
    ChangeTrackingAllowed = true;

    // Flip these to true only for the operations Power Automate actually needs.
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
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }

                field(documentType; Rec."Document Type") { }
                field(sellToCustomerNo; Rec."Sell-to Customer No.") { }
                field(no; Rec."No.") { }
                field(billToCustomerNo; Rec."Bill-to Customer No.") { }
                field(billToName; Rec."Bill-to Name") { }
                field(billToName2; Rec."Bill-to Name 2") { }
                field(billToAddress; Rec."Bill-to Address") { }
                field(billToAddress2; Rec."Bill-to Address 2") { }
                field(billToCity; Rec."Bill-to City") { }
                field(billToContact; Rec."Bill-to Contact") { }
                field(yourReference; Rec."Your Reference") { }
                field(shipToCode; Rec."Ship-to Code") { }
                field(shipToName; Rec."Ship-to Name") { }
                field(shipToName2; Rec."Ship-to Name 2") { }
                field(shipToAddress; Rec."Ship-to Address") { }
                field(shipToAddress2; Rec."Ship-to Address 2") { }
                field(shipToCity; Rec."Ship-to City") { }
                field(shipToContact; Rec."Ship-to Contact") { }
                field(orderDate; Rec."Order Date") { }
                field(postingDate; Rec."Posting Date") { }
                field(shipmentDate; Rec."Shipment Date") { }
                field(postingDescription; Rec."Posting Description") { }
                field(paymentTermsCode; Rec."Payment Terms Code") { }
                field(dueDate; Rec."Due Date") { }
                field(paymentDiscount; Rec."Payment Discount %") { }
                field(pmtDiscountDate; Rec."Pmt. Discount Date") { }
                field(shipmentMethodCode; Rec."Shipment Method Code") { }
                field(locationCode; Rec."Location Code") { }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code") { }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code") { }
                field(customerPostingGroup; Rec."Customer Posting Group") { }
                field(currencyCode; Rec."Currency Code") { }
                field(currencyFactor; Rec."Currency Factor") { }
                field(customerPriceGroup; Rec."Customer Price Group") { }
                field(pricesIncludingVAT; Rec."Prices Including VAT") { }
                field(invoiceDiscCode; Rec."Invoice Disc. Code") { }
                field(customerDiscGroup; Rec."Customer Disc. Group") { }
                field(languageCode; Rec."Language Code") { }
                field(formatRegion; Rec."Format Region") { }
                field(salespersonCode; Rec."Salesperson Code") { }
                field(orderClass; Rec."Order Class") { }
                field(noPrinted; Rec."No. Printed") { }
                field(onHold; Rec."On Hold") { }
                field(appliesToDocType; Rec."Applies-to Doc. Type") { }
                field(appliesToDocNo; Rec."Applies-to Doc. No.") { }
                field(balAccountNo; Rec."Bal. Account No.") { }
                field(ship; Rec."Ship") { }
                field(invoice; Rec."Invoice") { }
                field(printPostedDocuments; Rec."Print Posted Documents") { }
                field(shippingNo; Rec."Shipping No.") { }
                field(postingNo; Rec."Posting No.") { }
                field(lastShippingNo; Rec."Last Shipping No.") { }
                field(lastPostingNo; Rec."Last Posting No.") { }
                field(prepaymentNo; Rec."Prepayment No.") { }
                field(lastPrepaymentNo; Rec."Last Prepayment No.") { }
                field(prepmtCrMemoNo; Rec."Prepmt. Cr. Memo No.") { }
                field(lastPrepmtCrMemoNo; Rec."Last Prepmt. Cr. Memo No.") { }
                field(vATRegistrationNo; Rec."VAT Registration No.") { }
                field(combineShipments; Rec."Combine Shipments") { }
                field(registrationNumber; Rec."Registration Number") { }
                field(reasonCode; Rec."Reason Code") { }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { }
                field(eU3PartyTrade; Rec."EU 3-Party Trade") { }
                field(transactionType; Rec."Transaction Type") { }
                field(transportMethod; Rec."Transport Method") { }
                field(vATCountryRegionCode; Rec."VAT Country/Region Code") { }
                field(sellToCustomerName; Rec."Sell-to Customer Name") { }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2") { }
                field(sellToAddress; Rec."Sell-to Address") { }
                field(sellToAddress2; Rec."Sell-to Address 2") { }
                field(sellToCity; Rec."Sell-to City") { }
                field(sellToContact; Rec."Sell-to Contact") { }
                field(billToPostCode; Rec."Bill-to Post Code") { }
                field(billToCounty; Rec."Bill-to County") { }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code") { }
                field(sellToPostCode; Rec."Sell-to Post Code") { }
                field(sellToCounty; Rec."Sell-to County") { }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code") { }
                field(shipToPostCode; Rec."Ship-to Post Code") { }
                field(shipToCounty; Rec."Ship-to County") { }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code") { }
                field(balAccountType; Rec."Bal. Account Type") { }
                field(exitPoint; Rec."Exit Point") { }
                field(correction; Rec."Correction") { }
                field(documentDate; Rec."Document Date") { }
                field(externalDocumentNo; Rec."External Document No.") { }
                field(transactionSpecification; Rec."Transaction Specification") { }
                field(paymentMethodCode; Rec."Payment Method Code") { }
                field(shippingAgentCode; Rec."Shipping Agent Code") { }
                field(packageTrackingNo; Rec."Package Tracking No.") { }
                field(noSeries; Rec."No. Series") { }
                field(postingNoSeries; Rec."Posting No. Series") { }
                field(shippingNoSeries; Rec."Shipping No. Series") { }
                field(taxAreaCode; Rec."Tax Area Code") { }
                field(taxLiable; Rec."Tax Liable") { }
                field(vATBusPostingGroup; Rec."VAT Bus. Posting Group") { }
                field(reserve; Rec."Reserve") { }
                field(appliesToID; Rec."Applies-to ID") { }
                field(vATBaseDiscount; Rec."VAT Base Discount %") { }
                field(status; Rec."Status") { }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation") { }
                field(invoiceDiscountValue; Rec."Invoice Discount Value") { }
                field(sendICDocument; Rec."Send IC Document") { }
                field(iCStatus; Rec."IC Status") { }
                field(sellToICPartnerCode; Rec."Sell-to IC Partner Code") { }
                field(billToICPartnerCode; Rec."Bill-to IC Partner Code") { }
                field(iCReferenceDocumentNo; Rec."IC Reference Document No.") { }
                field(iCDirection; Rec."IC Direction") { }
                field(prepayment; Rec."Prepayment %") { }
                field(prepaymentNoSeries; Rec."Prepayment No. Series") { }
                field(compressPrepayment; Rec."Compress Prepayment") { }
                field(prepaymentDueDate; Rec."Prepayment Due Date") { }
                field(prepmtCrMemoNoSeries; Rec."Prepmt. Cr. Memo No. Series") { }
                field(prepmtPostingDescription; Rec."Prepmt. Posting Description") { }
                field(prepmtPmtDiscountDate; Rec."Prepmt. Pmt. Discount Date") { }
                field(prepmtPaymentTermsCode; Rec."Prepmt. Payment Terms Code") { }
                field(prepmtPaymentDiscount; Rec."Prepmt. Payment Discount %") { }
                field(quoteNo; Rec."Quote No.") { }
                field(quoteValidUntilDate; Rec."Quote Valid Until Date") { }
                field(quoteSentToCustomer; Rec."Quote Sent to Customer") { }
                field(quoteAccepted; Rec."Quote Accepted") { }
                field(quoteAcceptedDate; Rec."Quote Accepted Date") { }
                field(jobQueueStatus; Rec."Job Queue Status") { }
                field(jobQueueEntryID; Rec."Job Queue Entry ID") { }
                field(companyBankAccountCode; Rec."Company Bank Account Code") { }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.") { }
                field(altVATRegistrationNo; Rec."Alt. VAT Registration No.") { }
                field(altGenBusPostingGroup; Rec."Alt. Gen. Bus Posting Group") { }
                field(altVATBusPostingGroup; Rec."Alt. VAT Bus Posting Group") { }
                field(isTest; Rec."IsTest") { }
                field(sellToPhoneNo; Rec."Sell-to Phone No.") { }
                field(sellToEMail; Rec."Sell-to E-Mail") { }
                field(journalTemplName; Rec."Journal Templ. Name") { }
                field(vATReportingDate; Rec."VAT Reporting Date") { }
                field(rcvdFromCountRegionCode; Rec."Rcvd.-from Count./Region Code") { }
                field(workDescription; Rec."Work Description") { }
                field(shipToPhoneNo; Rec."Ship-to Phone No.") { }
                field(dimensionSetID; Rec."Dimension Set ID") { }
                field(paymentServiceSetID; Rec."Payment Service Set ID") { }
                field(directDebitMandateID; Rec."Direct Debit Mandate ID") { }
                field(docNoOccurrence; Rec."Doc. No. Occurrence") { }
                field(campaignNo; Rec."Campaign No.") { }
                field(sellToContactNo; Rec."Sell-to Contact No.") { }
                field(billToContactNo; Rec."Bill-to Contact No.") { }
                field(opportunityNo; Rec."Opportunity No.") { }
                field(sellToCustomerTemplCode; Rec."Sell-to Customer Templ. Code") { }
                field(billToCustomerTemplCode; Rec."Bill-to Customer Templ. Code") { }
                field(responsibilityCenter; Rec."Responsibility Center") { }
                field(shippingAdvice; Rec."Shipping Advice") { }
                field(postingFromWhseRef; Rec."Posting from Whse. Ref.") { }
                field(requestedDeliveryDate; Rec."Requested Delivery Date") { }
                field(promisedDeliveryDate; Rec."Promised Delivery Date") { }
                field(shippingTime; Rec."Shipping Time") { }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time") { }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code") { }
                field(receive; Rec."Receive") { }
                field(returnReceiptNo; Rec."Return Receipt No.") { }
                field(returnReceiptNoSeries; Rec."Return Receipt No. Series") { }
                field(lastReturnReceiptNo; Rec."Last Return Receipt No.") { }
                field(priceCalculationMethod; Rec."Price Calculation Method") { }
                field(allowLineDisc; Rec."Allow Line Disc.") { }
                field(getShipmentUsed; Rec."Get Shipment Used") { }
                field(assignedUserID; Rec."Assigned User ID") { }
                field(salesTaxAmountRounding; Rec."Sales Tax Amount Rounding") { }
                field(prepmtSalesTaxRoundingAmt; Rec."Prepmt. Sales Tax Rounding Amt") { }
                field(shipToUPSZone; Rec."Ship-to UPS Zone") { }
                field(taxExemptionNo; Rec."Tax Exemption No.") { }
                field(sTETransactionID; Rec."STE Transaction ID") { }
                field(transitFromDateTime; Rec."Transit-from Date/Time") { }
                field(transitHours; Rec."Transit Hours") { }
                field(transitDistance; Rec."Transit Distance") { }
                field(insurerName; Rec."Insurer Name") { }
                field(insurerPolicyNumber; Rec."Insurer Policy Number") { }
                field(foreignTrade; Rec."Foreign Trade") { }
                field(vehicleCode; Rec."Vehicle Code") { }
                field(trailer1; Rec."Trailer 1") { }
                field(trailer2; Rec."Trailer 2") { }
                field(medicalInsurerName; Rec."Medical Insurer Name") { }
                field(medicalInsPolicyNumber; Rec."Medical Ins. Policy Number") { }
                field(sATWeightUnitOfMeasure; Rec."SAT Weight Unit Of Measure") { }
                field(sATInternationalTradeTerm; Rec."SAT International Trade Term") { }
                field(exchangeRateUSD; Rec."Exchange Rate USD") { }
                field(sATCustomsRegime; Rec."SAT Customs Regime") { }
                field(sATTransferReason; Rec."SAT Transfer Reason") { }
                field(prepmtIncludeTax; Rec."Prepmt. Include Tax") { }
                field(cFDIPurpose; Rec."CFDI Purpose") { }
                field(cFDIRelation; Rec."CFDI Relation") { }
                field(cFDIExportCode; Rec."CFDI Export Code") { }
                field(cFDIPeriod; Rec."CFDI Period") { }
                field(sATAddressID; Rec."SAT Address ID") { }
                field(cFDICertificateOfOriginNo; Rec."CFDI Certificate of Origin No.") { }
                field(originalShipmentDateIFP; Rec."Original Shipment Date.IFP") { }
                field(eDITMWLoadOfferGenIFP; Rec."EDI TMW Load Offer Gen.IFP") { }
                field(eDITMWLoadOfferDateIFP; Rec."EDI TMW Load Offer Date.IFP") { }
                field(eDITMWReleasedIFP; Rec."EDI TMW Released.IFP") { }
                field(fOBIFP; Rec."FOB.IFP") { }
                field(manualFreightEntryIFP; Rec."Manual Freight Entry.IFP") { }
                field(freightAmtIFP; Rec."Freight Amt.IFP") { }
                field(corporateIDIFP; Rec."Corporate ID.IFP") { }
                field(corporateNameIFP; Rec."Corporate Name.IFP") { }
                field(freightCarrierCodeIFP; Rec."Freight Carrier Code.IFP") { }
                field(itemAvailOrderIFP; Rec."Item Avail Order.IFP") { }
                field(exportPortCodeIFP; Rec."Export Port Code.IFP") { }
                field(loadingDateIFP; Rec."Loading Date.IFP") { }
                field(transportationTripNoIFP; Rec."Transportation Trip No.IFP") { }
                field(portDeptDateIFP; Rec."Port Dept Date.IFP") { }
                field(approvedAmountIFP; Rec."Approved Amount.IFP") { }
                field(pendingApprovalReasonIFP; Rec."Pending Approval Reason.IFP") { }
                field(customerServiceRepIFP; Rec."Customer Service Rep.IFP") { }
                field(salesSupportRepIFP; Rec."Sales Support Rep.IFP") { }
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

            // Uncomment to expose lines as a nested navigation property
            // (GET .../salesOrderHeaders(<id>)?$expand=salesOrderLines).
            // Keep the flat line endpoint too — Power Automate handles it better.
            //
            // part(salesOrderLines; "TIC Sales Order Line API")
            // {
            //     Caption = 'Lines';
            //     EntityName = 'salesOrderLine';
            //     EntitySetName = 'salesOrderLines';
            //     SubPageLink = "Document Id" = field(SystemId);
            // }
        }
    }
}
