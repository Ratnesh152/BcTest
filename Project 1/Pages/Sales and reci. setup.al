pageextension 50104 SalesReciSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Student Nos."; Rec."Student Nos.")
            {
                ApplicationArea = all;
            }
            field("Indent Nos."; Rec."Indent Nos.")
            {
                ApplicationArea = All;
            }
            field("Posted Indent Nos."; Rec."Posted Indent Nos.")
            {
                ApplicationArea = All;
            }
        }
    }
}