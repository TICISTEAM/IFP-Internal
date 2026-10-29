/// <summary>
/// Detects changes to the four watched shipping fields on Sales Header
/// (Document Type = Order) and raises the external business event.
/// </summary>
codeunit 50505 "TIC Sales Order Ship Watcher"
{
    Access = Internal;

    var
        ShipmentDateLbl: Label 'shipmentDate', Locked = true;
        ShipToAddressLbl: Label 'shipToAddress', Locked = true;
        LocationCodeLbl: Label 'locationCode', Locked = true;
        ShippingAgentCodeLbl: Label 'shippingAgentCode', Locked = true;

    // Does NOT raise an event. Validating Sell-to Customer cascades Ship-to
    // Address, Location Code and Shipping Agent Code onto the header AFTER the
    // insert, so without this those defaults surface as user changes.
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsertSalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    var
        EventState: Codeunit "TIC Sales Hdr Event State";
    begin
        if not IsWatchedHeader(Rec) then
            exit;

        EventState.MarkAsCreated(Rec.SystemId);
        EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnAfterModifySalesHeader(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; RunTrigger: Boolean)
    var
        ShipEvents: Codeunit "TIC Sales Order Ship Events";
        EventState: Codeunit "TIC Sales Hdr Event State";
        ChangedFields: Text;
    begin
        if not IsWatchedHeader(Rec) then
            exit;

        ChangedFields := GetChangedShippingFields(Rec, xRec);
        if ChangedFields = '' then
            exit;

        // Still being populated after its insert — keep the signature current
        // so the first real edit is measured from the finished order, then exit.
        if EventState.IsWithinCreationWindow(Rec.SystemId) then begin
            EventState.RegisterSignature(Rec.SystemId, BuildSignature(Rec));
            exit;
        end;

        // One user edit = several Modify calls, and callers holding a pre-edit
        // record variable report a stale xRec, so xRec alone isn't enough.
        if not EventState.ShouldRaise(Rec.SystemId, BuildSignature(Rec)) then
            exit;

        ShipEvents.RaiseShippingDetailsChanged(
            Rec.SystemId,
            Rec."No.",
            ChangedFields,
            Rec."Shipment Date",
            xRec."Shipment Date",
            Rec."Ship-to Address",
            xRec."Ship-to Address",
            Rec."Location Code",
            xRec."Location Code",
            Rec."Shipping Agent Code",
            xRec."Shipping Agent Code");
    end;

    local procedure IsWatchedHeader(var Rec: Record "Sales Header"): Boolean
    begin
        if Rec.IsTemporary() then
            exit(false);
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit(false);

        exit(true);
    end;

    local procedure GetChangedShippingFields(var Rec: Record "Sales Header"; var xRec: Record "Sales Header") ChangedFields: Text
    begin
        if Rec."Shipment Date" <> xRec."Shipment Date" then
            AppendField(ChangedFields, ShipmentDateLbl);

        if Rec."Ship-to Address" <> xRec."Ship-to Address" then
            AppendField(ChangedFields, ShipToAddressLbl);

        if Rec."Location Code" <> xRec."Location Code" then
            AppendField(ChangedFields, LocationCodeLbl);

        if Rec."Shipping Agent Code" <> xRec."Shipping Agent Code" then
            AppendField(ChangedFields, ShippingAgentCodeLbl);
    end;

    // Locked format 9 = invariant, so the signature never shifts with locale.
    local procedure BuildSignature(var Rec: Record "Sales Header"): Text
    begin
        exit(
            Format(Rec."Shipment Date", 0, 9) + '|' +
            Rec."Ship-to Address" + '|' +
            Rec."Location Code" + '|' +
            Rec."Shipping Agent Code");
    end;

    local procedure AppendField(var ChangedFields: Text; FieldName: Text)
    begin
        if ChangedFields <> '' then
            ChangedFields += ',';
        ChangedFields += FieldName;
    end;
}