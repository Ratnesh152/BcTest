page 50005 "Stage Master"
{
    ApplicationArea = All;
    Caption = 'Stage Master';
    PageType = List;
    SourceTable = "Stage Master";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Check List Required"; Rec."Check List Required")
                {
                    ToolTip = 'Specifies the value of the Check List Required field.';
                }
            }
        }
    }
}
