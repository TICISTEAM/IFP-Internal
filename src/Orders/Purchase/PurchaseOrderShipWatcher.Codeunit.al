/// <summary>
/// Raises the purchase shipping-details business event for changes to EXISTING
/// purchase orders. Order creation is deliberately silent.
/// </summary>
codeunit 50513 "TIC Purch Order Ship Watcher"
{
    Access = Internal;

    var
        LocationCodeLbl: Label 'locationCode', Locked = true;
        ExpectedReceiptDateLbl: Label 'expectedReceiptDate', Locked = true;

    // Does NOT raise an event. Validating Buy-from Vendor cascades defaults
    // onto the header AFTER insert, which would otherwise look like changes.
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertPurchaseHeader(var Rec: Record "Purchase Header"; RunTrigger: Boolean)
    var
        EventState: Codeunit "TIC Purch Hdr Event State";
    begin
        if not IsWatchedHeader(Rec) then
            exit;

        EventState.MarkAsCreated(Rec.SystemId);
        EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifyPurchaseHeader(var Rec: Record "Purchase Header"; var xRec: Record "Purchase Header"; RunTrigger: Boolean)
    var
        ShipEvents: Codeunit "TIC Purch Order Ship Events";
        EventState: Codeunit "TIC Purch Hdr Event State";
        ChangedFields: Text;
    begin
        if not IsWatchedHeader(Rec) then
            exit;

        ChangedFields := GetChangedShippingFields(Rec, xRec);
        if ChangedFields = '' then
            exit;

        if EventState.IsWithinCreationWindow(Rec.SystemId) then begin
            EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
            exit;
        end;

        if not EventState.ShouldRaise(Rec.SystemId, BuildSignature(Rec)) then
            exit;

        ShipEvents.PurchaseOrderShippingDetailsChanged(
            Rec.SystemId,
            Rec."No.",
            ChangedFields,
            Rec."Location Code",
            xRec."Location Code",
            Rec."Expected Receipt Date",
            xRec."Expected Receipt Date",
            Rec."Shipment Date.IFP",
            xRec."Shipment Date.IFP",
            Rec."Buy-from Vendor No.",
            xRec."Buy-from Vendor No.",
            Rec."Ship-to Address",
            xRec."Ship-to Address")
    end;

    local procedure IsWatchedHeader(var Rec: Record "Purchase Header"): Boolean
    begin
        if Rec.IsTemporary() then
            exit(false);
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit(false);

        exit(true);
    end;

    local procedure GetChangedShippingFields(var Rec: Record "Purchase Header"; var xRec: Record "Purchase Header") ChangedFields: Text
    begin
        if Rec."Location Code" <> xRec."Location Code" then
            AppendField(ChangedFields, LocationCodeLbl);

        if Rec."Expected Receipt Date" <> xRec."Expected Receipt Date" then
            AppendField(ChangedFields, ExpectedReceiptDateLbl);
    end;

    // Locked format 9 = invariant, so the signature never shifts with locale.
    local procedure BuildSignature(var Rec: Record "Purchase Header"): Text
    begin
        exit(
            Rec."Location Code" + '|' +
            Format(Rec."Expected Receipt Date", 0, 9));
    end;

    local procedure AppendField(var ChangedFields: Text; FieldName: Text)
    begin
        if ChangedFields <> '' then
            ChangedFields += ',';
        ChangedFields += FieldName;
    end;
}
