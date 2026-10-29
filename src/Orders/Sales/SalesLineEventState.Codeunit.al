/// <summary>
/// Session-scoped state for the sales line watcher:
///   1. Suppresses per-line delete events while a whole order is deleted.
///   2. Dedupes repeat raises for the same line + same values.
///
/// (2) exists because one user edit produces several Modify calls (page write,
/// reservation logic, invoice discount recalc). Those callers often hold a
/// record variable fetched BEFORE the edit, so their xRec still carries the
/// old quantity and an xRec-only comparison sees the same change repeatedly.
/// </summary>
codeunit 50508 "TIC Sales Line Event State"
{
    SingleInstance = true;
    Access = Internal;

    var
        LastReported: Dictionary of [Guid, Text];
        CreatedInSession: Dictionary of [Guid, DateTime];
        HeaderIsDeleting: Boolean;

    internal procedure IsHeaderDeleting(): Boolean
    begin
        exit(HeaderIsDeleting);
    end;

    /// <summary>
    /// Returns true only if this line hasn't already been reported at these
    /// exact values. Records the signature as a side effect.
    /// </summary>
    internal procedure ShouldRaise(LineId: Guid; Signature: Text): Boolean
    var
        ExistingSignature: Text;
    begin
        if LastReported.Get(LineId, ExistingSignature) then
            if ExistingSignature = Signature then
                exit(false);

        LastReported.Set(LineId, Signature);
        exit(true);
    end;

    internal procedure RegisterSignature(LineId: Guid; Signature: Text)
    begin
        LastReported.Set(LineId, Signature);
    end;

    internal procedure MarkAsCreated(LineId: Guid)
    begin
        CreatedInSession.Set(LineId, CurrentDateTime());
    end;

    /// <summary>
    /// True while a line is still inside the grace window after its insert.
    /// BC populates a new line through insert-then-validate-then-modify, so
    /// those follow-up writes look like real changes without this guard.
    /// Self-cleaning: the entry is dropped once the window elapses.
    /// </summary>
    internal procedure IsWithinCreationWindow(LineId: Guid): Boolean
    var
        CreatedAt: DateTime;
    begin
        if not CreatedInSession.Get(LineId, CreatedAt) then
            exit(false);

        if (CurrentDateTime() - CreatedAt) <= CreationGraceWindow() then
            exit(true);

        CreatedInSession.Remove(LineId);
        exit(false);
    end;

    // Tune this. Too short and the tail of line entry leaks through as
    // change events; too long and a genuine quick edit gets swallowed.
    local procedure CreationGraceWindow(): Duration
    begin
        exit(30000); // 30 seconds
    end;

    internal procedure ForgetLine(LineId: Guid)
    begin
        if LastReported.ContainsKey(LineId) then
            LastReported.Remove(LineId);
        if CreatedInSession.ContainsKey(LineId) then
            CreatedInSession.Remove(LineId);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeDeleteEvent', '', false, false)]
    local procedure OnBeforeDeleteSalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary() then
            exit;
        HeaderIsDeleting := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnAfterDeleteSalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary() then
            exit;
        HeaderIsDeleting := false;
    end;
}