table 50500 JP_Users
{
    Caption = 'Json Placeholder Users';
    DataClassification = CustomerContent;

    fields
    {
        field(1; UUID; Integer)
        {
            AutoIncrement = true;
        }
        field(2; id; Integer) { }
        field(3; name; Text[50]) { }
        field(4; username; Text[30]) { }
        field(5; email; Text[30]) { }
        field(6; street; Text[50]) { }
        field(7; suite; Text[50]) { }
        field(8; city; Text[50]) { }
        field(9; zipcode; Text[50]) { }
        field(10; lat; Text[250]) { }
        field(11; lng; Text[250]) { }
        field(12; phone; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(13; website; Text[150])
        {
            ExtendedDatatype = URL;
        }
        field(14; companyName; Text[100]) { }
        field(15; companyCatchPhrase; Text[250]) { }
        field(16; companyBS; Text[250]) { }
    }

    keys
    {
        key(PK; UUID)
        {
            Clustered = true;
        }
    }
}