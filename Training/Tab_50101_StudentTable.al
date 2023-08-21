table 50101 StudenRestAPI
{
    Caption = ' Student Rest API Table';
    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; PhoneNo; text[20])
        {
            Caption = 'Phone No';
        }
        field(4; Email; Text[50])
        {
            Caption = 'E-Mail';
        }
        field(5; Website; Text[50])
        {
            Caption = 'Website';
        }
        field(6; Lattitude; Decimal)
        {
            Caption = 'Lattitude';
        }
        field(7; Longitude; Decimal)
        {
            Caption = 'Longitude';
        }
        field(8; City; Text[50])
        {
            Caption = 'City';
        }
        field(9; Active; Boolean)
        {
            Caption = 'Status';
        }
        field(10; WebId; Integer)
        {
            Caption = 'Web ID';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }
}