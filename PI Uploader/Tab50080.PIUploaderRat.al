table 50080 "PI Uploader Rat"
{
    DataPerCompany = false;
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry ID"; Guid)
        {
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Document Date"; Date)
        {
        }
        field(6; "Due Date"; Date)
        {
        }
        field(7; "Vendor Invoice No."; Text[35])
        {
        }
        field(8; Location; Code[10])
        {
        }
        field(30; "Document ID"; Integer)
        {
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,Created,Error;
        }
        field(36; "Error Text"; Text[250])
        {
        }
        field(37; "Purchase Invoice No."; Code[20])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry ID")
        {
        }
        key(Key2; "Document ID")
        {
        }
    }
}

