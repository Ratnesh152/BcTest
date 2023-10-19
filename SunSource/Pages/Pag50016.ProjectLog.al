page 50016 "Project Log"
{
    ApplicationArea = All;
    Caption = 'Project Log';
    PageType = List;
    SourceTable = "Project Log";
    UsageCategory = Lists;
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("User Name"; Rec."User Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Create Date"; Rec."Create Date")
                {
                    ToolTip = 'Specifies the value of the Create Date field.';
                }
                field("Crete Time"; Rec."Crete Time")
                {
                    ToolTip = 'Specifies the value of the Crete Time field.';
                }
            }
        }
    }
}
