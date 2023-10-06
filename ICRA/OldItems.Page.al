page 50012 "Old Items"
{
    ApplicationArea = All;
    Caption = 'Old Items';
    PageType = List;
    SourceTable = "Old Item";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                }
                field("Product Group"; Rec."Product Group")
                {
                    ToolTip = 'Specifies the value of the Product Group field.';
                }
                field("Product Sub Group"; Rec."Product Sub Group")
                {
                    ToolTip = 'Specifies the value of the Product Sub Group field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("SSE Item Description"; Rec."SSE Item Description")
                {
                    ToolTip = 'Specifies the value of the SSE Item Description field.';
                }
                field(UOM; Rec.UOM)
                {
                    ToolTip = 'Specifies the value of the UOM field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("SPV Code"; Rec."SPV Code")
                {
                    ToolTip = 'Specifies the value of the SPV Code field.';
                }
                field("SPV Name"; Rec."SPV Name")
                {
                    ToolTip = 'Specifies the value of the SPV Name field.';
                }
                field("Warrenty Expire Date"; Rec."Warrenty Expire Date")
                {
                    ToolTip = 'Specifies the value of the Warrenty Expire Date field.';
                }
                field("Warrenty Start date"; Rec."Warrenty Start date")
                {
                    ToolTip = 'Specifies the value of the Warrenty Start date field.';
                }
            }
        }
    }
}
