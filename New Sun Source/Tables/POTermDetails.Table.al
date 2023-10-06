table 50052 "SSE PO Term Details"
{
    fields
    {
        field(1; "Purchase Order No."; Code[20])
        {
        }
        field(2; "PO Term Type Code"; Text[100])
        {
            TableRelation = "SSE Term Type";
            NotBlank = true;
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; "Term Details"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Purchase Order No.", "PO Term Type Code", "Line No.")
        {
            Clustered = true;
        }
    }
}