table 50015 "Job Stage Master"
{
    Caption = 'Job Stage Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
        }
        field(2; "Stage Code"; Integer)
        {
            Caption = 'Stage Code';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; Default; Boolean)
        {
            Caption = 'Default';
        }
    }
    keys
    {
        key(PK; "Job No.", "Stage Code")
        {
            Clustered = true;
        }
    }
}
