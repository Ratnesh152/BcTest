pageextension 50000 PostedSalesInvoiveExt extends "Posted Sales Invoice"
{

    actions
    {
        addafter(Print)
        {
            action("Print Custom Report")
            {
                trigger OnAction()
                var
                    IsHandled: Boolean;
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    IsHandled := false;
                    if not IsHandled then
                        SalesInvHeader.PrintRecords(true);
                end;
            }
            action("Update Log Entries")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ProjectLog: Record "Project Log";
                begin
                    ProjectLog.UpdateProjectLog();
                    Message('Log Entry Updated');
                end;
            }
        }

    }

    var
        SalesInvHeader: Record "Sales Invoice Header";
}