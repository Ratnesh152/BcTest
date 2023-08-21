page 52001 "Student List"
{
    ApplicationArea = All;
    Caption = 'Student List';
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Student Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.';
                }

                field("Resistration No."; Rec."Resistration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Resistration No. field.';
                }

                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country field.';
                }
            }
        }
        area(FactBoxes)
        {
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Comments)
            {
                ApplicationArea = All;
                Image = Comment;
                RunObject = page "Comment Sheet";
                ToolTip = 'View or add comments for the record.';

            }
        }
    }
}
