/// <summary>
/// Declaration codeunit for TIC external business events on purchase order
/// lines. Declaration only — detection lives in "TIC Purch Line Watcher".
/// </summary>
codeunit 50515 "TIC Purch Line Events"
{
    // -------------------------------------------------------------------
    // One event covers modify / delete. Branch on changeType.
    //
    //   modified -> both sides populated, changedFields lists what moved
    //   deleted  -> values carry the last known state, previous* match
    //
    // There is deliberately no 'created' changeType: line creation is
    // silent, matching the sales line watcher. The insert subscriber only
    // seeds dedupe state.
    //
    // Parameters must be simple types only: no Record, no var.
    // -------------------------------------------------------------------
    [ExternalBusinessEvent(
        'purchaseOrderLineChanged',
        'Purchase order line changed',
        'Raised when an existing purchase order line is removed or has its Quantity or Expected Receipt Date changed.',
        EventCategory::"TIC Purchase Order")]
    [RequiredPermissions(PermissionObjectType::TableData, Database::"Purchase Line", 'R')]
    procedure PurchaseOrderLineChanged(
        documentId: Guid;
        documentNo: Code[20];
        lineId: Guid;
        lineNo: Integer;
        changeType: Text[250];
        changedFields: Text[250];
        itemNo: Code[20];
        quantity: Decimal;
        previousQuantity: Decimal;
        expectedReceiptDate: Date;
        previousExpectedReceiptDate: Date)
    begin
    end;
}
