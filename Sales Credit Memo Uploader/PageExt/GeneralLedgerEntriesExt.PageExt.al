pageextension 50122 "General Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            field(Reference; Rec.Reference)
            {
                ApplicationArea = All;
            }
        }
    }
}