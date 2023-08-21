table 50005 "Text Read"
{
    Caption = 'Text Read';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary key"; integer)
        {
            Caption = 'Primary key';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Trans Id"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Trans Date"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Value Date"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Posting Date"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Transfer Amount"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Transfer Currency"; code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Tranfer comment"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Reference Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Transfer Balance"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; ClosingBal; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; ClearBalance; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; OpeningBal; Text[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Trans Id")
        {
            Clustered = true;
        }
    }
}
