page 52004 "Posted Indent List Ratnesh"
{
    ApplicationArea = All;
    Caption = 'Posted Indent List Ratnesh';
    PageType = List;
    Editable = false;
    CardPageId = "Posted Indent Card Ratnesh";
    SourceTable = "Posted Indent Header Ratnesh";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Contro1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
