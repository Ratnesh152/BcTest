report 50223 "Process Report PurchInv in Pdf"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.", "Pay-to Name";
        }
    }
    var
        ReportParameter: Text;

    trigger OnPostReport()
    begin
        ReportParameter := Report.RunRequestPage(406);
        Report.Print(406, ReportParameter);
    end;
}
