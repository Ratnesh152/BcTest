table 50041 "ICRA Report Buffer"
{
    Caption = 'ICRA Report Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; Int1; Integer)
        {
        }
        field(3; "Text100-1"; Text[30])
        {
        }
        field(4; "Text100-2"; text[50])
        {
        }
        field(5; "Text100-3"; code[20])
        {
        }
        field(6; Code1; Code[20])
        {
        }
        field(7; Date1; Date)
        {
        }
        field(8; Code2; code[3])
        {
        }
        field(9; Dec1; Decimal)
        {
        }
        field(10; Dec2; Decimal)
        {
        }
        field(11; Dec3; Decimal)
        {
        }
        field(12; Dec4; Decimal)
        {
        }
        field(13; Dec5; Decimal)
        {
        }
        field(14; Dec6; Decimal)
        {
        }
        field(15; Dec7; Decimal)
        {
        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}