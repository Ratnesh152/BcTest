table 50016 "Job Stage Check List"
{
    Caption = 'Job Stage Check List';
    DataClassification = CustomerContent;

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
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Job No.", "Stage Code", "Line No.")
        {
            Clustered = true;
        }
    }
}
