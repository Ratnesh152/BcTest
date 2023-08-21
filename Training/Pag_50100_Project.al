/// <summary>
/// Page Project (ID 50100).
/// </summary>
page 50100 Project
{

    Caption = 'Project';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Project;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;
                }
                field(CustomerCode; Rec.CustomerCode)
                {
                    Caption = 'Customer Code';
                    ApplicationArea = All;
                }
                field(ProjectAmount; Rec."Project Amount")
                {
                    Caption = 'Project Amount';
                    ApplicationArea = All;
                }
                field(CommisionPercnt; Rec."Commision Percnt")
                {
                    Caption = 'Comission Percent';
                    ApplicationArea = All;
                }
                field(ComissionAmount; Rec.ComissionAmount)
                {
                    Caption = 'Comisson Amount';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Project: Record Project;
                    begin

                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Close Current Page")
            {
                ApplicationArea = All;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
            action(GetComissionAmount)
            {
                Caption = 'Get Comission Amount';
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Project.CalculateComissionAmount(Rec."Project Amount", Rec."Commision Percnt")
                end;
            }
        }
    }
    trigger OnClosePage()
    begin
        Message(ClosePageText);
    end;

    var
        ClosePageText: Label 'Page Closed Succesfully';
        Project: Record Project;
}