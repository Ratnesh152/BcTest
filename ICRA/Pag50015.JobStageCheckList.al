page 50015 "Job Stage Check List"
{
    ApplicationArea = All;
    Caption = 'Job Stage Check List';
    PageType = List;
    SourceTable = "Job Stage Check List";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Stage Code"; Rec."Stage Code")
                {
                    ToolTip = 'Specifies the value of the Stage Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
