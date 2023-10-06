page 50014 "Job Stage Master"
{
    ApplicationArea = All;
    Caption = 'Job Stage Master';
    PageType = List;
    SourceTable = "Job Stage Master";
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Default; Rec.Default)
                {
                    ToolTip = 'Specifies the value of the Default field.';
                }
            }
        }
    }
}
