/// <summary>
/// Session-scoped state for the sales header watcher:
///   1. Suppresses the modify flurry that follows an order insert, so events
///      only describe changes to orders that already existed.
///   2. Dedupes repeat raises for the same header + same values.
/// </summary>
codeunit 50511 "TIC Sales Hdr Event State"
{
    SingleInstance = true;
    Access = Internal;

    var
        LastReported: Dictionary of [Guid, Text];
        CreatedInSession: Dictionary of [Guid, DateTime];

    internal procedure ShouldRaise(HeaderId: Guid; Signature: Text): Boolean
    var
        ExistingSignature: Text;
    begin
        if LastReported.Get(HeaderId, ExistingSignature) then
            if ExistingSignature = Signature then
                exit(false);

        LastReported.Set(HeaderId, Signature);
        exit(true);
    end;

    internal procedure RegisterSignature(HeaderId: Guid; Signature: Text)
    begin
        LastReported.Set(HeaderId, Signature);
    end;

    internal procedure MarkAsCreated(HeaderId: Guid)
    begin
        CreatedInSession.Set(HeaderId, CurrentDateTime());
    end;

    internal procedure IsWithinCreationWindow(HeaderId: Guid): Boolean
    var
        CreatedAt: DateTime;
    begin
        if not CreatedInSession.Get(HeaderId, CreatedAt) then
            exit(false);

        if (CurrentDateTime() - CreatedAt) <= CreationGraceWindow() then
            exit(true);

        CreatedInSession.Remove(HeaderId);
        exit(false);
    end;

    // Longer than the line equivalent: header entry (customer, addresses,
    // shipping setup) takes a user meaningfully longer than typing a line.
    local procedure CreationGraceWindow(): Duration
    begin
        exit(120000); // 2 minutes
    end;

    internal procedure ForgetHeader(HeaderId: Guid)
    begin
        if LastReported.ContainsKey(HeaderId) then
            LastReported.Remove(HeaderId);
        if CreatedInSession.ContainsKey(HeaderId) then
            CreatedInSession.Remove(HeaderId);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteSalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary() then
            exit;
        ForgetHeader(Rec.SystemId);
    end;
}
