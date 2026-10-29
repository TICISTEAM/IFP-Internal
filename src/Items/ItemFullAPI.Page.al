/// <summary>
/// API page exposing the full Item table field set (base app + ILM/LAX/WHI/IWX/.IFP extension fields).
/// Endpoint: /api/tic/bi/v1.0/companies({id})/items
/// Read-only by default. See the notes block below before first compile.
/// </summary>
page 50601 "Item Full API.IFP"
{
    PageType = API;
    Caption = 'Item Full API', Locked = true;
    APIPublisher = 'tic';
    APIGroup = 'items';
    APIVersion = 'v1.0';
    EntityName = 'item';
    EntitySetName = 'items';
    EntityCaption = 'Item';
    EntitySetCaption = 'Items';

    SourceTable = Item;
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;
    Editable = false;              // flip to true (and drop the read-only trigger guards) to allow writes
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(no; Rec."No.") { }
                field(no2; Rec."No. 2") { }
                field(description; Rec."Description") { }
                field(searchDescription; Rec."Search Description") { }
                field(description2; Rec."Description 2") { }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure") { }
                field(priceUnitConversion; Rec."Price Unit Conversion") { }
                field(type; Rec."Type") { }
                field(inventoryPostingGroup; Rec."Inventory Posting Group") { }
                field(shelfNo; Rec."Shelf No.") { }
                field(itemDiscGroup; Rec."Item Disc. Group") { }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.") { }
                field(statisticsGroup; Rec."Statistics Group") { }
                field(commissionGroup; Rec."Commission Group") { }
                field(unitPrice; Rec."Unit Price") { }
                field(priceProfitCalculation; Rec."Price/Profit Calculation") { }
                field(profit; Rec."Profit %") { }
                field(costingMethod; Rec."Costing Method") { }
                field(unitCost; Rec."Unit Cost") { }
                field(standardCost; Rec."Standard Cost") { }
                field(lastDirectCost; Rec."Last Direct Cost") { }
                field(indirectCost; Rec."Indirect Cost %") { }
                field(costIsAdjusted; Rec."Cost is Adjusted") { }
                field(allowOnlineAdjustment; Rec."Allow Online Adjustment") { }
                field(vendorNo; Rec."Vendor No.") { }
                field(vendorItemNo; Rec."Vendor Item No.") { }
                field(leadTimeCalculation; Rec."Lead Time Calculation") { }   // DateFormula - see note in header
                field(reorderPoint; Rec."Reorder Point") { }
                field(maximumInventory; Rec."Maximum Inventory") { }
                field(reorderQuantity; Rec."Reorder Quantity") { }
                field(alternativeItemNo; Rec."Alternative Item No.") { }
                field(unitListPrice; Rec."Unit List Price") { }
                field(dutyDue; Rec."Duty Due %") { }
                field(dutyCode; Rec."Duty Code") { }
                field(grossWeight; Rec."Gross Weight") { }
                field(netWeight; Rec."Net Weight") { }
                field(unitsPerParcel; Rec."Units per Parcel") { }
                field(unitVolume; Rec."Unit Volume") { }
                field(durability; Rec."Durability") { }   // DateFormula - see note in header
                field(freightType; Rec."Freight Type") { }
                field(tariffNo; Rec."Tariff No.") { }
                field(dutyUnitConversion; Rec."Duty Unit Conversion") { }
                field(countryRegionPurchasedCode; Rec."Country/Region Purchased Code") { }
                field(budgetQuantity; Rec."Budget Quantity") { }
                field(budgetedAmount; Rec."Budgeted Amount") { }
                field(budgetProfit; Rec."Budget Profit") { }
                field(blocked; Rec."Blocked") { }
                field(blockReason; Rec."Block Reason") { }
                field(lastDateTimeModified; Rec."Last DateTime Modified") { }
                field(lastDateModified; Rec."Last Date Modified") { }
                field(lastTimeModified; Rec."Last Time Modified") { }
                field(priceIncludesVAT; Rec."Price Includes VAT") { }
                field(vATBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)") { }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group") { }
                // NOTE: "Picture" is a MediaSet field and cannot be exposed on an API page.
                // Use the standard picture sub-page/API, or expose a URL instead.
                // field(picture; Rec."Picture") { }
                field(countryRegionOfOriginCode; Rec."Country/Region of Origin Code") { }
                field(automaticExtTexts; Rec."Automatic Ext. Texts") { }
                field(noSeries; Rec."No. Series") { }
                field(taxGroupCode; Rec."Tax Group Code") { }
                field(vATProdPostingGroup; Rec."VAT Prod. Posting Group") { }
                field(reserve; Rec."Reserve") { }
                field(globalDimension1Code; Rec."Global Dimension 1 Code") { }
                field(globalDimension2Code; Rec."Global Dimension 2 Code") { }
                field(stockoutWarning; Rec."Stockout Warning") { }
                field(preventNegativeInventory; Rec."Prevent Negative Inventory") { }
                field(variantMandatoryIfExists; Rec."Variant Mandatory if Exists") { }
                field(applicationWkshUserID; Rec."Application Wksh. User ID") { }
                field(assemblyPolicy; Rec."Assembly Policy") { }
                field(gTIN; Rec."GTIN") { }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code") { }
                field(lowLevelCode; Rec."Low-Level Code") { }
                field(lotSize; Rec."Lot Size") { }
                field(serialNos; Rec."Serial Nos.") { }
                field(lastUnitCostCalcDate; Rec."Last Unit Cost Calc. Date") { }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost") { }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost") { }
                field(scrap; Rec."Scrap %") { }
                field(rolledUpMatNonInvtCost; Rec."Rolled-up Mat. Non-Invt. Cost") { }
                field(inventoryValueZero; Rec."Inventory Value Zero") { }
                field(discreteOrderQuantity; Rec."Discrete Order Quantity") { }
                field(minimumOrderQuantity; Rec."Minimum Order Quantity") { }
                field(maximumOrderQuantity; Rec."Maximum Order Quantity") { }
                field(safetyStockQuantity; Rec."Safety Stock Quantity") { }
                field(orderMultiple; Rec."Order Multiple") { }
                field(safetyLeadTime; Rec."Safety Lead Time") { }   // DateFormula - see note in header
                field(flushingMethod; Rec."Flushing Method") { }
                field(replenishmentSystem; Rec."Replenishment System") { }
                field(roundingPrecision; Rec."Rounding Precision") { }
                field(salesUnitOfMeasure; Rec."Sales Unit of Measure") { }
                field(purchUnitOfMeasure; Rec."Purch. Unit of Measure") { }
                field(timeBucket; Rec."Time Bucket") { }   // DateFormula - see note in header
                field(reorderingPolicy; Rec."Reordering Policy") { }
                field(includeInventory; Rec."Include Inventory") { }
                field(manufacturingPolicy; Rec."Manufacturing Policy") { }
                field(reschedulingPeriod; Rec."Rescheduling Period") { }   // DateFormula - see note in header
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period") { }   // DateFormula - see note in header
                field(dampenerPeriod; Rec."Dampener Period") { }   // DateFormula - see note in header
                field(dampenerQuantity; Rec."Dampener Quantity") { }
                field(overflowLevel; Rec."Overflow Level") { }
                field(manufacturerCode; Rec."Manufacturer Code") { }
                field(itemCategoryCode; Rec."Item Category Code") { }
                field(createdFromNonstockItem; Rec."Created From Nonstock Item") { }
                field(purchasingCode; Rec."Purchasing Code") { }
                field(excludedFromCostAdjustment; Rec."Excluded from Cost Adjustment") { }
                field(serviceItemGroup; Rec."Service Item Group") { }

                field(itemTrackingCode; Rec."Item Tracking Code") { }
                field(lotNos; Rec."Lot Nos.") { }
                field(expirationCalculation; Rec."Expiration Calculation") { }   // DateFormula - see note in header
                field(warehouseClassCode; Rec."Warehouse Class Code") { }
                field(specialEquipmentCode; Rec."Special Equipment Code") { }
                field(putAwayTemplateCode; Rec."Put-away Template Code") { }
                field(putAwayUnitOfMeasureCode; Rec."Put-away Unit of Measure Code") { }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code") { }
                field(lastCountingPeriodUpdate; Rec."Last Counting Period Update") { }
                field(useCrossDocking; Rec."Use Cross-Docking") { }
                field(nextCountingStartDate; Rec."Next Counting Start Date") { }
                field(nextCountingEndDate; Rec."Next Counting End Date") { }
                field(unitOfMeasureId; Rec."Unit of Measure Id") { }
                field(taxGroupId; Rec."Tax Group Id") { }
                field(salesBlocked; Rec."Sales Blocked") { }
                field(purchasingBlocked; Rec."Purchasing Blocked") { }
                field(itemCategoryId; Rec."Item Category Id") { }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group Id") { }
                field(genProdPostingGroupId; Rec."Gen. Prod. Posting Group Id") { }
                field(serviceBlocked; Rec."Service Blocked") { }
                field(productionBlocked; Rec."Production Blocked") { }
                field(overReceiptCode; Rec."Over-Receipt Code") { }
                field(dutyClass; Rec."Duty Class") { }
                field(sATItemClassification; Rec."SAT Item Classification") { }
                field(sATHazardousMaterial; Rec."SAT Hazardous Material") { }
                field(sATPackagingType; Rec."SAT Packaging Type") { }
                field(sATMaterialType; Rec."SAT Material Type") { }
                field(newLotDefLotStatusIFP; Rec."New Lot Def Lot Status.IFP") { }
                field(prodUOMIFP; Rec."Prod UOM.IFP") { }
                field(incentiveCommGrpIFP; Rec."Incentive Comm Grp.IFP") { }
                field(excludeFromIncentivesIFP; Rec."Exclude from Incentives.IFP") { }
                field(skipLogisticsIFP; Rec."Skip Logistics.IFP") { }
                field(marketingPriceCodeIFP; Rec."Marketing Price Code.IFP") { }
                field(exportDescIFP; Rec."Export Desc.IFP") { }
                field(incInMarketPriceCalcIFP; Rec."Inc in Market Price Calc.IFP") { }
                field(qualitySchedIFP; Rec."Quality Sched.IFP") { }
                field(iNTLeadTimeCalculationIFP; Rec."INT Lead Time Calculation.IFP") { }   // DateFormula - see note in header
                field(updateBrixPercentageIFP; Rec."Update Brix Percentage.IFP") { }
                field(routingNo; Rec."Routing No.") { }
                field(productionBOMNo; Rec."Production BOM No.") { }
                field(singleLevelMaterialCost; Rec."Single-Level Material Cost") { }
                field(singleLevelCapacityCost; Rec."Single-Level Capacity Cost") { }
                field(singleLevelSubcontrdCost; Rec."Single-Level Subcontrd. Cost") { }
                field(singleLevelCapOvhdCost; Rec."Single-Level Cap. Ovhd Cost") { }
                field(singleLevelMfgOvhdCost; Rec."Single-Level Mfg. Ovhd Cost") { }
                field(overheadRate; Rec."Overhead Rate") { }
                field(rolledUpSubcontractedCost; Rec."Rolled-up Subcontracted Cost") { }
                field(rolledUpMfgOvhdCost; Rec."Rolled-up Mfg. Ovhd Cost") { }
                field(rolledUpCapOverheadCost; Rec."Rolled-up Cap. Overhead Cost") { }
                field(orderTrackingPolicy; Rec."Order Tracking Policy") { }
                field(singleLvlMatNonInvtCost; Rec."Single-Lvl Mat. Non-Invt. Cost") { }
                field(allowWhseOverpick; Rec."Allow Whse. Overpick") { }
                field(critical; Rec."Critical") { }
                field(commonItemNo; Rec."Common Item No.") { }
                field(systemId; Rec.SystemId) { Editable = false; }   // ODataKeyFields
                field(systemCreatedAt; Rec.SystemCreatedAt) { Editable = false; }
                field(systemCreatedBy; Rec.SystemCreatedBy) { Editable = false; }
                field(systemModifiedAt; Rec.SystemModifiedAt) { Editable = false; }
                field(systemModifiedBy; Rec.SystemModifiedBy) { Editable = false; }

                // ------------------------------------------------------------
                // OPTIONAL: FlowFields. Not in the requested list because they
                // are not stored columns - BC calculates them at runtime. Add
                // them here if this API is feeding an item-card / availability
                // consumer, and they arrive as ordinary computed columns.
                // Bridge: Net = Inventory - Not Available - On Hold - Pending QC.
                // ------------------------------------------------------------
                // field(inventory; Rec.Inventory) { Editable = false; }
                // field(qtyOnSalesOrder; Rec."Qty. on Sales Order") { Editable = false; }
                // field(qtyOnPurchOrder; Rec."Qty. on Purch. Order") { Editable = false; }
                // field(qtyOnComponentLines; Rec."Qty. on Component Lines") { Editable = false; }
                // field(netCurrentOnHandIFP; Rec."Net Current On Hand.IFP") { Editable = false; }
            }
        }
    }
}
