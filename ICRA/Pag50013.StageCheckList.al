page 50013 "Stage Check List"
{
    ApplicationArea = All;
    Caption = 'Stage Check List';
    PageType = List;
    SourceTable = "Stage Check List";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Stage Code"; Rec."Stage Code")
                {
                    ToolTip = 'Specifies the value of the Stage Code field.';
                }
                field("Line No."; Rec."Line No")
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
