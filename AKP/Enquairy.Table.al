table 50000 "Enquairy Header"
{
    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; "Document Type"; Enum "Purchase Document Type")
        {
        }
        field(3; Department; Code[20])
        {
            TableRelation = Dimension;
        }
        field(4; Date; Date)
        {
        }
        field(5; Purpose; Text[50])
        {
        }
        field(6; "Expected Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            OptionMembers = Open,Approved,Rejected;
        }
        field(8; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(key1; "No.")
        {
            Clustered = true;
        }
    }
}