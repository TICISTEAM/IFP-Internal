/// <summary>
/// Grants Execute on the TIC business event codeunits.
/// The watchers run implicitly as event subscribers under whichever user
/// edits a sales order, so this must be assigned to every user who can
/// modify sales orders — not just to BI/admin staff.
///
/// Objects are referenced by NAME, so this compiles regardless of the
/// object IDs you settled on.
/// </summary>
permissionset 50509 "TIC Order Events"
{
    Assignable = true;
    Caption = 'TIC Order Events';

    Permissions =
        codeunit "TIC Sales Order Ship Events" = X,
        codeunit "TIC Sales Order Ship Watcher" = X,
        codeunit "TIC Sales Line Events" = X,
        codeunit "TIC Sales Line Watcher" = X,
        codeunit "TIC Sales Line Event State" = X,
        codeunit "TIC Sales Hdr Event State" = X,
        codeunit "TIC Purch Order Ship Events" = X,
        codeunit "TIC Purch Order Ship Watcher" = X,
        codeunit "TIC Purch Hdr Event State" = X,
        codeunit "TIC Purch Line Events" = X,
        codeunit "TIC Purch Line Watcher" = X,
        codeunit "TIC Purch Line Event State" = X;
}
