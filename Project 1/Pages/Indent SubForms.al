page 50104 "Indent Subform Ratnesh"
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption = 'Lines Ratnesh';
    AutoSplitKey = true;
    SourceTable = "Indent Line Ratnesh";
    RefreshOnActivate = true;
    layout
    {
        area(Content)
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
            group(contro1)
            {
                ShowCaption = false;
                group(Control2)

                {
                    ShowCaption = false;
                    field("Line Amount"; IndentLine.Amount)
                    {
                        ApplicationArea = All;
                        AutoFormatType = 1;
                        trigger OnValidate()
                        begin
                            rec."Total Indent Amount" += Rec.Quantity * Rec.Amount;
                        end;
                    }
                    field("Discount Amount"; Rec."Discount Amount")
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        begin
                        end;
                    }
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Items)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Items: Page "Item List";
                begin
                    Items.Run();
                end;
            }
            action(Comments)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Comments: Page "Comment Sheet";
                begin

                end;
            }
        }
    }
    var
        IndentLine: Record "Indent Line Ratnesh";
}