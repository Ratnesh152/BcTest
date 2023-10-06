table 50013 "Stage Master"
{
    Caption = 'Stage Master';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Integer)
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Check List Required"; Boolean)
        {
            Caption = 'Check List Required';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
