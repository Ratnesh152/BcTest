table 50041 "ICRA Report Buffer"
{
    Caption = 'ICRA Report Buffer';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; Int1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Text100-1"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Text100-2"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Text100-3"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Code1; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Date1; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Code2; code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Dec1; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Dec2; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Dec3; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Dec4; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Dec5; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Dec6; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; Dec7; Decimal)
        {
            DataClassification = ToBeClassified;
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