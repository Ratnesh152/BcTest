tableextension 50105 RatneshTDSEntryExt extends "TDS Entry"
{
    fields
    {
        field(50100; "External Document No."; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50101; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
        }
    }
}