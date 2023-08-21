pageextension 50004 "PO Creation Allow" extends "Purchase Order"
{
    actions
    {
        modify("&Print")
        {
            Visible = false;
        }
        modify("&Print_Promoted")
        {
            Visible = false;
        }
    }
    trigger OnOpenPage()
    var
        Usersetup: Record "User Setup";
    begin

        Usersetup.Reset();
        Usersetup.SetRange("User ID", UserId);
        if Usersetup.Get(UserId) then
            if Usersetup."New PO Creation" = false then
                Error('%1 user is not allowed to create Purchase Order', UserId);
    end;
}