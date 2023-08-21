pageextension 50121 "Purch. Invoice Subform  Ext" extends "Sales Invoice"
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