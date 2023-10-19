pageextension 50002 "User Setup Extn" extends "User Setup"
{
    layout
    {
        addafter("User ID")
        {
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
