page 50102 "Indent Lists Ratnesh"
{
    ApplicationArea = All;
    Caption = 'Indent Lists Ratnesh';
    Editable = false;
    SourceTable = "Indent Header Ratnesh";
    PageType = List;
    UsageCategory = Lists;
    InsertAllowed = false;
    RefreshOnActivate = true;
    CardPageId = "Indent Card Ratnesh";

    layout
    {
        area(Content)
        {
            repeater(Contro1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Student No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group("Indent Report")
            {
                action("Indent Reoprt")
                {
                    ApplicationArea = All;
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Report;
                    trigger OnAction()
                    var
                        // IndentReport: Report "Indent Report";
                    begin
                        // IndentReport.Run();
                    end;
                }
            }
        }
        area(Creation)
        {
            action("New PO")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    POCreate: Codeunit "Create New PO Validation";
                begin
                    UserSetup.Reset();
                    UserSetup.SetRange("User ID", UserId);
                    if UserSetup.FindFirst() then
                        if UserSetup."New PO Creation" = false then
                            CurrPage.Close();
                    Message('%1 is allowsd user', UserId);
                end;
            }
        }
    }
}