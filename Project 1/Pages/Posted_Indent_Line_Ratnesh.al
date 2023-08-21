page 50003 "PostedIndentLineRatnesh"
{
    Caption = 'Posted Indent Line Ratnesh';
    PageType = ListPart;
    SourceTable = "Posted Indent Line Ratnesh";
    AutoSplitKey = true;
    layout
    {
        area(content)
        {
            repeater(GroupName)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Discount Percent"; Rec."Discount Percent")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    local procedure GetTotalAmount()
    begin
        Rec."Total Amount" := (rec.Amount * rec.Quantity);
    end;
}
