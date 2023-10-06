page 50011 "Hazard Inventory Line"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Hazard Inventory";
    Caption = 'Hazard Inventory';

    layout
    {
        area(Content)
        {
            repeater(Contents)
            {
                ShowCaption = false;
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = All;
                }
                field(Hazard; Rec.Hazard)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Risk Group Who Might be Harmed"; Rec."Risk Group Who Might be Harmed")
                {
                    Caption = 'At risk group who might be harmed';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Existing Control & Rec Measure"; Rec."Existing Control & Rec Measure")
                {
                    Caption = 'Existing controls & recovery measures';
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Assessment of Control Effectiv"; Rec."Assessment of Control Effectiv")
                {
                    Caption = 'Assessment of Control Effective';
                    ApplicationArea = All;
                }
                field("Initial Risk Rating"; Rec."Initial Risk Rating")
                {
                    ApplicationArea = All;
                }
                field("Add. Control & Recovery Method"; Rec."Add. Control & Recovery Method")
                {
                    MultiLine = true;
                    Caption = 'Additional Control & Recovery Method';
                    ApplicationArea = All;
                }
                field("Risk / Exposure Rating"; Rec."Risk / Exposure Rating")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}