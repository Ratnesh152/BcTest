tableextension 50121 "Purchase Line Ext" extends "Sales Header"
{
    fields
    {
        field(50100; Reference; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }
}