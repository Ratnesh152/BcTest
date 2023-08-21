// report 50205 "GL Account Balance"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = '.\GL Account Balance Report\GL Accounts Balance.rdl';
//     ApplicationArea = all;
//     Caption = 'GL Accounts Balance';
//     PreviewMode = PrintLayout;
//     UsageCategory = ReportsAndAnalysis;
//     dataset
//     {
//         dataitem("G/L Account"; "G/L Account")
//         {
//             DataItemTableView = SORTING("No.");
//             RequestFilterFields = "No.", "Account Type", "Date Filter";
//             column(STRSUBSTNO_Text000_PeriodText_; StrSubstNo(Text000, PeriodText))
//             {
//             }
//             column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
//             {
//             }
//             column(ShowNetValue; ShowNetValue)
//             {
//             }

//             column(OpeningBalanceLbl; OpeningBalanceLbl)
//             {
//             }
//             column(PeriodText; PeriodText)
//             {
//             }

//             column(GLFilter; GLFilter)
//             {
//             }
//             column(G_L_Account_No_; "No.")
//             {
//             }
//             column(BalanceCaption; BalanceCaptionLbl)
//             {
//             }
//             column(Debit_Amount; "Debit Amount")
//             {
//             }
//             column(Credit_Amount; "Credit Amount")
//             {
//             }
//             dataitem("Integer"; "Integer")
//             {
//                 DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

//                 column(G_L_Account___No__; "G/L Account"."No.")
//                 {
//                 }
//                 column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__Name; PadStr('', "G/L Account".Indentation * 2) + "G/L Account".Name)
//                 {
//                 }
//                 column(DebitBalance; DebitBalance)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(CreditBalance; CreditBalance)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(OpeningBalance; OpeningBalance)
//                 {
//                     AutoFormatType = 1;
//                 }
//                 column(ClosingBalance; ClosingBalance)
//                 {
//                 }
//                 column(G_L_Account___Account_Type_; Format("G/L Account"."Account Type", 0, 2))
//                 {
//                 }
//                 column(No__of_Blank_Lines; "G/L Account"."No. of Blank Lines")
//                 {
//                 }
//                 column(Balanceatdate; "G/L Account"."Balance at Date")
//                 {
//                 }
//                 column(Net_Balance; "G/L Account"."Net Change")
//                 {
//                 }
//                 column(debitamount; "G/L Account"."Debit Amount")
//                 {
//                 }
//                 column(Credit_Amount1; "G/L Account"."Credit Amount" * -1)
//                 {
//                 }
//                 column(OpeningBalance1; "G/L Account"."Balance at Date")
//                 {
//                 }
//                 dataitem(BlankLineRepeater; "Integer")
//                 {
//                     DataItemTableView = SORTING(Number);

//                     column(BlankLineNo; BlankLineNo)
//                     {
//                     }
//                     trigger OnAfterGetRecord()
//                     begin
//                         if BlankLineNo = 0 then CurrReport.Break();
//                         BlankLineNo -= 1;
//                     end;
//                 }
//                 trigger OnAfterGetRecord()
//                 begin
//                     BlankLineNo := "G/L Account"."No. of Blank Lines" + 1;
//                 end;
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 CalcFields("Net Change", "Balance at Date");
//                 ClosingBalance := 0;
//                 DebitBalance := 0;
//                 CreditBalance := 0;
//                 OpeningBalance := 0;
//                 ReportExecutionDate := CurrentDateTime;
//                 if ChangeGroupNo then begin
//                     PageGroupNo += 1;
//                     ChangeGroupNo := false;
//                 end;
//                 ChangeGroupNo := "New Page";
//                 OpeningBalance := "Balance at Date" + "Net Change" * -1;
//                 ClosingBalance := OpeningBalance + "G/L Account"."Debit Amount" + ("G/L Account"."Credit Amount") * (-1);
//             end;

//             trigger OnPreDataItem()
//             begin
//                 PageGroupNo := 0;
//                 ChangeGroupNo := false;
//             end;
//         }
//     }
//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(Content)
//             {
//             }
//         }
//     }
//     trigger OnPreReport()
//     begin
//         "G/L Account".SecurityFiltering(SecurityFilter::Filtered);
//         GLFilter := "G/L Account".GetFilters();
//         PeriodText := "G/L Account".GetFilter("Date Filter");
//         OpeningDatefilter := "G/L Account".GetRangeMin("Date Filter");
//         ShowNetValue := true;
//     end;

//     var
//         Text000: Label 'Period: %1';
//         PeriodText: Text[30];
//         BalanceCaptionLbl: Label 'Closing Balance';
//         PageGroupNo: Integer;
//         ChangeGroupNo: Boolean;
//         BlankLineNo: Integer;
//         OpeningBalanceLbl: Label 'Opening Balance';
//         GLAcc: record "G/L Account";
//         OpeningDatefilter: Date;
//         ReportExecutionDate: DateTime;
//         ShowNetValue: Boolean;
//         OpeningBalance: Decimal;
//         ClosingBalance: Decimal;
//         DebitBalance: Decimal;
//         CreditBalance: Decimal;
//         GLEntry: Record "G/L Entry";

//     protected var
//         GLFilter: Text;
// }
