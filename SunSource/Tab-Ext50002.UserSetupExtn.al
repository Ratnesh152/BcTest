tableextension 50002 "User Setup Extn" extends "User Setup"
{
    fields
    {
        field(50000; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = ToBeClassified;
        }
    }
}
