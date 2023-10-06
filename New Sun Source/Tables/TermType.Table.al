table 50051 "SSE Term Type"
{
    Caption = 'Term Type';
    LookupPageId = "SSE Term Types";
    fields
    {
        field(1; "Po Term Type Code"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Po Term Type Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Po Term Type Code")
        {
        }
    }
}