pageextension 50111 CompanyInfoExt extends "Company Information"
{
    actions
    {
        addfirst(Processing)
        {
            action("Delete Picture")
            {
                Caption = 'Delete Picture';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if Rec.Picture.HasValue then
                        if Confirm(ConfirmDeletePicture) then begin
                            Clear(Rec.Picture);
                            CurrPage.SaveRecord();
                        end;
                end;
            }
        }
    }
    var
        ConfirmDeletePicture: Label 'Do you want to delete company logo?';
}