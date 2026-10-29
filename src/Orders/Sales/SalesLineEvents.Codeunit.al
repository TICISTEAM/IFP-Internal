/// <summary>
/// Declaration codeunit for TIC external business events on sales order lines.
/// Declaration only — detection logic lives in "TIC Sales Line Watcher".
/// </summary>
codeunit 50506 "TIC Sales Line Events"
{
    // -------------------------------------------------------------------
    // One event covers create / modify / delete. Branch on changeType.
    //
    //   created  -> previous* are blank/zero, changedFields is empty
    //   modified -> both sides populated, changedFields lists what moved
    //   deleted  -> new values carry the last known state, previous* match
    //
    // Parameters must be simple types only: no Record, no var.
    // -------------------------------------------------------------------
    [ExternalBusinessEvent(
        'salesOrderLineChanged',
        'Sales order line changed',
        'Raised when a sales order line is added, removed, or has its Quantity or Shipment Date changed.',
        EventCategory::"TIC Sales Order")]
    [RequiredPermissions(PermissionObjectType::TableData, Database::"Sales Line", 'R')]
    procedure SalesOrderLineChanged(
        documentId: Guid;
        documentNo: Code[20];
        lineId: Guid;
        lineNo: Integer;
        changeType: Text[250];
        changedFields: Text[250];
        itemNo: Code[20];
        quantity: Decimal;
        previousQuantity: Decimal;
        shipmentDate: Date;
        previousShipmentDate: Date)
    begin
    end;
}
