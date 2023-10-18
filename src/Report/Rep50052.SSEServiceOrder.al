report 50052 "SSE Service Order"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/Report/Rep50052.SSEServiceOrder.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }
    var
        myInt: Integer;
}