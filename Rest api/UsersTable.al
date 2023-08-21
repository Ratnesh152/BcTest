table 50500 JP_Users
{
    Caption = 'Json Placeholder Users';

    DataClassification = ToBeClassified;

    fields
    {
        field(1; UUID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; id; Integer) { DataClassification = ToBeClassified; }
        field(3; name; Text[50]) { DataClassification = ToBeClassified; }
        field(4; username; Text[30]) { DataClassification = ToBeClassified; }
        field(5; email; Text[30]) { DataClassification = ToBeClassified; }
        field(6; street; Text[50]) { DataClassification = ToBeClassified; }
        field(7; suite; Text[50]) { DataClassification = ToBeClassified; }
        field(8; city; Text[50]) { DataClassification = ToBeClassified; }
        field(9; zipcode; Text[50]) { DataClassification = ToBeClassified; }
        field(10; lat; Text[250]) { DataClassification = ToBeClassified; }
        field(11; lng; Text[250]) { DataClassification = ToBeClassified; }
        field(12; phone; Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(13; website; Text[150])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(14; companyName; Text[100]) { DataClassification = ToBeClassified; }
        field(15; companyCatchPhrase; Text[250]) { DataClassification = ToBeClassified; }
        field(16; companyBS; Text[250]) { DataClassification = ToBeClassified; }
    }

    keys
    {
        key(PK; UUID)
        {
            Clustered = true;
        }
    }
}