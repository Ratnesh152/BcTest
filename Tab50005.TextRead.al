table 50005 "Text Read"
{
    Caption = 'Text Read';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary key"; integer)
        {
            Caption = 'Primary key';
        }
        field(2; "Trans Id"; code[20])
        {
        }
        field(3; "Trans Date"; Text[20])
        {
        }
        field(4; "Value Date"; Text[20])
        {
        }
        field(5; "Posting Date"; Text[20])
        {
        }
        field(6; "Transfer Amount"; Text[20])
        {
        }
        field(7; "Transfer Currency"; code[5])
        {
        }
        field(8; "Tranfer comment"; Text[100])
        {
        }
        field(9; "Reference Number"; Code[30])
        {
        }
        field(10; "Transfer Balance"; Text[20])
        {
        }
        field(11; ClosingBal; Text[20])
        {
        }
        field(12; ClearBalance; Text[20])
        {
        }
        field(13; OpeningBal; Text[20])
        {
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
