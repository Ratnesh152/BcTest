report 50004 GLentrytest
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = sorting("G/L Account No.") order(ascending);
            column(G_L_Account_No_; "G/L Account No.")
            {
            }
            trigger OnPreDataItem()
            begin
                // if Glaccount.Get("G/L Account No.") then
                //     if Glaccount."Income/Balance" = Glaccount."Income/Balance"::"Income Statement" then
                //         "G/L Entry".setr
                // CurrReport.Skip();
                // Glaccount.SetRange("Income/Balance", Glaccount."Income/Balance"::"Income Statement");
                "G/L Entry".SetFilter("G/L Account No.", '%1', Glaccount."No.");

            end;
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

    trigger OnPreReport()
    begin
        if Glaccount.get("G/L Entry"."G/L Account No.") then
            if Glaccount."Income/Balance" = Glaccount."Income/Balance"::"Income Statement" then;
    end;

    var
        Glaccount: Record "G/L Account";
        Glaccount1: Record "G/L Account";

}