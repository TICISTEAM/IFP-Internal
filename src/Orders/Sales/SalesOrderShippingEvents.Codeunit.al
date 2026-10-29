/// <summary>
/// Declaration codeunit for TIC external business events on sales orders.
/// Keep this codeunit free of business logic — it exists only to declare and
/// raise events. Detection logic lives in "TIC Sales Order Ship Watcher".
/// </summary>
codeunit 50504 "TIC Sales Order Ship Events"
{
    Access = Internal;

    // -------------------------------------------------------------------
    // Public entry point. Business event methods must be local, so callers
    // go through this wrapper.
    // -------------------------------------------------------------------
    internal procedure RaiseShippingDetailsChanged(
        DocumentId: Guid;
        DocumentNo: Code[20];
        ChangedFields: Text;
        ShipmentDate: Date;
        PreviousShipmentDate: Date;
        ShipToAddress: Text[100];
        PreviousShipToAddress: Text[100];
        LocationCode: Code[10];
        PreviousLocationCode: Code[10];
        ShippingAgentCode: Code[10];
        PreviousShippingAgentCode: Code[10])
    begin
        SalesOrderShippingDetailsChanged(
            DocumentId,
            DocumentNo,
            ChangedFields,
            ShipmentDate,
            PreviousShipmentDate,
            ShipToAddress,
            PreviousShipToAddress,
            LocationCode,
            PreviousLocationCode,
            ShippingAgentCode,
            PreviousShippingAgentCode);
    end;

    // -------------------------------------------------------------------
    // The business event itself. Body stays empty — calling the method is
    // what raises the event. Parameters must be simple types only:
    // no Record, no var, no complex objects.
    //
    // changedFields is a comma-separated list of the camelCase field names
    // that actually changed, so a single flow can branch on it.
    // -------------------------------------------------------------------
    [ExternalBusinessEvent(
        'salesOrderShippingDetailsChanged',
        'Sales order shipping details changed',
        'Raised when Shipment Date, Ship-to Address, Location Code or Shipping Agent Code changes on a sales order.',
        EventCategory::"TIC Sales Order",
        '1.0')]
    local procedure SalesOrderShippingDetailsChanged(
        documentId: Guid;
        documentNo: Code[20];
        changedFields: Text[250];
        shipmentDate: Date;
        previousShipmentDate: Date;
        shipToAddress: Text[100];
        previousShipToAddress: Text[100];
        locationCode: Code[10];
        previousLocationCode: Code[10];
        shippingAgentCode: Code[10];
        previousShippingAgentCode: Code[10])
    begin
    end;
}
