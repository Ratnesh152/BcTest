table 50014 "Stage Check List"
{
    Caption = 'Stage Check List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Stage Code"; Integer)
        {
            Caption = 'Stage Code';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Stage Code", "Line No")
        {
            Clustered = true;
        }
    }
}
