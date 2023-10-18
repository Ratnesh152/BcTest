tableextension 50106 SaleRecvSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Student Nos."; code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50101; "Indent Nos."; code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50102; "Posted Indent Nos."; code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

    }

}