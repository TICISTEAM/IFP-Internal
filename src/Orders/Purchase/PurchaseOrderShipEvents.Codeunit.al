/// <summary>
/// Declaration codeunit for TIC external business events on purchase orders.
/// Declaration only — detection lives in "TIC Purch Order Ship Watcher".
/// </summary>
codeunit 50512 "TIC Purch Order Ship Events"
{
    [ExternalBusinessEvent(
        'purchaseOrderShippingDetailsChanged',
        'Purchase order shipping details changed',
        'Raised when Location Code or Expected Receipt Date changes on an existing purchase order.',
        EventCategory::"TIC Purchase Order")]
    [RequiredPermissions(PermissionObjectType::TableData, Database::"Purchase Header", 'R')]
    procedure PurchaseOrderShippingDetailsChanged(
        documentId: Guid;
        documentNo: Code[20];
        changedFields: Text[250];
        locationCode: Code[10];
        previousLocationCode: Code[10];
        expectedReceiptDate: Date;
        previousExpectedReceiptDate: Date;
        shipmentDate: Date;
        previousShipmentDate: Date;
        buyFromVendorNo: Code[20];
        previousBuyFromVendorNo: Code[20];
        shipToAddress: Text[100];
        previousShipToAddress: Text[100])
    // TO ADD A THIRD DATE FIELD once you've confirmed its name:
    //   1. add these two parameters here:
    //        thirdDate: Date;
    //        previousThirdDate: Date)
    //   2. add a Label + comparison in the watcher's GetChangedShippingFields
    //   3. add it to BuildSignature
    //   4. pass both values in the raise call
    //   5. re-run Refresh Business Event Catalog (signature changed)
    begin
    end;
}
