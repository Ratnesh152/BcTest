report 59000 "Delete Data Indent Header"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    trigger OnPreReport()
    begin
        // Error('Not Allowed');
        IndentHeaderRatensh.DeleteAll();
        Message('Data Deleted');
    end;

    var
        IndentHeaderRatensh: Record "Indent Header Ratnesh";
}