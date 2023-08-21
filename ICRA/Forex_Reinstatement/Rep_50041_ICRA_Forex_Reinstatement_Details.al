// report 50041 ICRA_Forex_Reinstatement_Detls
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     Caption = 'Forex Reinstatement Details';
//     DefaultLayout = RDLC;
//     RDLCLayout = '.\Reports\Rep_50041_ICRA_Forex_Reinstatement_Details.rdl';
//     dataset
//     {
//         dataitem("Exch. Rate Adjmt. Reg."; "Exch. Rate Adjmt. Reg.")
//         {
//             DataItemTableView = sorting("No.") order(ascending) where("Account Type" = filter(<> "G/L Account"));
//             column(SNoLbl; SNoLbl)
//             {
//             }
//             column(FromDate; FromDate)
//             {
//             }
//             column(ToDate; ToDate)
//             {
//             }
//             column(TypeLbl; TypeLbl)
//             {
//             }
//             column(CVBLbl; CVBLbl)
//             {
//             }
//             column(CVBNLbl; CVBNLbl)
//             {
//             }
//             column(VoucherNoLbl; VoucherNoLbl)
//             {
//             }
//             column(DateLbl; DateLbl)
//             {
//             }
//             column(CurrencyCodeLbl; CurrencyCodeLbl)
//             {
//             }
//             column(OutstandingAmountFCLbl; OutstandingAmountFCLbl)
//             {
//             }
//             column(BookingExchRateLbl; BookingExchRateLbl)
//             {
//             }
//             column(OutstandingAmountLCLbl; OutstandingAmountLCLbl)
//             {
//             }
//             column(ReinstatmentExchRateLbl; ReinstatmentExchRateLbl)
//             {
//             }
//             column(GainLossLbl; GainLossLbl)
//             {
//             }
//             column(UnrealisedgainLossLbl; UnrealisedgainLossLbl)
//             {
//             }
//             column(ReinstatedAmountLCLbl; ReinstatedAmountLCLbl)
//             {
//             }
//             column(Currency_Code; "Currency Code")
//             {
//             }
//             column(CompanyInfo_Name; CompanyInfo.Name)
//             {
//             }
//             column(ReportNameLbl; ReportNameLbl)
//             {
//             }
//             column(ReportFiltersLbl; ReportFiltersLbl)
//             {
//             }
//             column(CustomerFilterLbl; CustomerFilterLbl)
//             {
//             }
//             column(VendorFilterLbl; VendorFilterLbl)
//             {
//             }
//             column(DateFilterLbl; DateFilterLbl)
//             {
//             }
//             column(VendorFilter; VendorFilter)
//             {
//             }
//             column(DateFilter; DateFilter)
//             {
//             }
//             trigger OnPreDataItem()
//             begin
//                 CompanyInfo.Get();
//                 "Exch. Rate Adjmt. Reg.".SetCurrentKey("Account Type");
//                 "Exch. Rate Adjmt. Reg.".SetRange("Creation Date", FromDate, ToDate);
//             end;

//             trigger OnAfterGetRecord()
//             begin
//                 BookingExchRate := 0;
//                 ExchRate := 0;
//                 if "Exch. Rate Adjmt. Reg."."Account Type" = "Exch. Rate Adjmt. Reg."."Account Type"::Vendor Then begin
//                     SNo := SNo + 1;
//                     DVLERec.Reset();
//                     DVLERec.SetRange("Exch. Rate Adjmt. Reg. No.", "Exch. Rate Adjmt. Reg."."No.");
//                     if DVLERec.FindFirst then begin
//                         DVLERec1.Reset();
//                         DVLERec1.SetRange("Vendor Ledger Entry No.", DVLERec."Vendor Ledger Entry No.");
//                         DVLERec1.SetRange("Entry Type", DVLERec1."Entry Type"::"Initial Entry");
//                         if DVLERec1.FindFirst Then begin
//                             VendorRec.Get(DVLERec1."Vendor No.");
//                             ReportBuffer.init;
//                             ReportBuffer."Entry No." := SNo;
//                             ReportBuffer.Int1 := SNo;
//                             ReportBuffer."Text100-1" := FORMAT("Exch. Rate Adjmt. Reg."."Account Type");
//                             ReportBuffer."Text100-2" := VendorRec.Name;
//                             ReportBuffer."Text100-3" := VendorRec."No.";
//                             ReportBuffer.Code1 := DVLERec1."Document No.";
//                             ReportBuffer.Date1 := "Exch. Rate Adjmt. Reg."."Creation Date";
//                             ReportBuffer.Code2 := "Exch. Rate Adjmt. Reg."."Currency Code";
//                             ReportBuffer.Dec1 := "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                             BookingExchRate := "Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)" / "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                             ReportBuffer.Dec2 := BookingExchRate;
//                             ReportBuffer.Dec3 := "Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)";
//                             ExchRate := ("Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)" + "Exch. Rate Adjmt. Reg."."Adjusted Amt. (LCY)") / "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                             ReportBuffer.Dec4 := ExchRate;
//                             ReportBuffer.Dec5 := ExchRate - BookingExchRate;
//                             ReportBuffer.Dec6 := "Exch. Rate Adjmt. Reg."."Adjusted Amt. (LCY)";
//                             ReportBuffer.Dec7 := "Exch. Rate Adjmt. Reg."."Adjusted Base" * ExchRate;
//                             ReportBuffer.Insert();
//                         end;
//                     end;
//                 end Else
//                     if "Exch. Rate Adjmt. Reg."."Account Type" = "Exch. Rate Adjmt. Reg."."Account Type"::Customer Then begin
//                         SNo := SNo + 1;
//                         DCLERec.Reset();
//                         DCLERec.SetRange("Exch. Rate Adjmt. Reg. No.", "Exch. Rate Adjmt. Reg."."No.");
//                         if DCLERec.FindFirst then begin
//                             DCLERec1.Reset();
//                             DCLERec1.SetRange("Cust. Ledger Entry No.", DCLERec."Cust. Ledger Entry No.");
//                             DCLERec1.SetRange("Entry Type", DCLERec."Entry Type"::"Initial Entry");
//                             if DCLERec1.FindFirst then begin
//                                 CustomerRec.Get(DCLERec1."Customer No.");
//                                 ReportBuffer.init;
//                                 ReportBuffer."Entry No." := SNo;
//                                 ReportBuffer.Int1 := SNo;
//                                 ReportBuffer."Text100-1" := FORMAT("Exch. Rate Adjmt. Reg."."Account Type");
//                                 ReportBuffer."Text100-2" := CustomerRec.Name;
//                                 ReportBuffer."Text100-3" := CustomerRec."No.";
//                                 ReportBuffer.Code1 := DCLERec1."Document No.";
//                                 ReportBuffer.Date1 := "Exch. Rate Adjmt. Reg."."Creation Date";
//                                 ReportBuffer.Code2 := "Exch. Rate Adjmt. Reg."."Currency Code";
//                                 ReportBuffer.Dec1 := "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                                 BookingExchRate := "Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)" / "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                                 ReportBuffer.Dec2 := BookingExchRate;
//                                 ReportBuffer.Dec3 := "Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)";
//                                 ExchRate := ("Exch. Rate Adjmt. Reg."."Adjusted Base (LCY)" + "Exch. Rate Adjmt. Reg."."Adjusted Amt. (LCY)") / "Exch. Rate Adjmt. Reg."."Adjusted Base";
//                                 ReportBuffer.Dec4 := ExchRate;
//                                 ReportBuffer.Dec5 := ExchRate - BookingExchRate;
//                                 ReportBuffer.Dec6 := "Exch. Rate Adjmt. Reg."."Adjusted Amt. (LCY)";
//                                 ReportBuffer.Dec7 := "Exch. Rate Adjmt. Reg."."Adjusted Base" * ExchRate;
//                                 ReportBuffer.Insert();
//                             end;
//                         end;
//                     End ELSE
//                         IF "Exch. Rate Adjmt. Reg."."Account Type" = "Exch. Rate Adjmt. Reg."."Account Type"::"Bank Account" Then begin
//                             ReportBuffer.SetRange("Text100-2", "Exch. Rate Adjmt. Reg."."Posting Group");
//                             if Not ReportBuffer.FindFirst Then begin
//                                 SNo := SNo + 1;
//                                 RateAdjustExchangeRegister.Reset();
//                                 RateAdjustExchangeRegister.SetCurrentKey("Creation Date");
//                                 RateAdjustExchangeRegister.SetRange("Account Type", RateAdjustExchangeRegister."Account Type"::"Bank Account");
//                                 RateAdjustExchangeRegister.SetRange("Posting Group", "Exch. Rate Adjmt. Reg."."Posting Group");
//                                 RateAdjustExchangeRegister.SetRange("Creation Date", FromDate, ToDate);
//                                 if RateAdjustExchangeRegister.FindLast then begin
//                                     ReportBuffer.init;
//                                     ReportBuffer."Entry No." := SNo;
//                                     ReportBuffer.Int1 := SNo;
//                                     ReportBuffer."Text100-1" := FORMAT("Exch. Rate Adjmt. Reg."."Account Type");
//                                     ReportBuffer."Text100-2" := RateAdjustExchangeRegister."Posting Group";
//                                     ReportBuffer."Text100-3" := '';
//                                     ReportBuffer.Code1 := '';
//                                     ReportBuffer.Date1 := RateAdjustExchangeRegister."Creation Date";
//                                     ReportBuffer.Code2 := RateAdjustExchangeRegister."Currency Code";
//                                     ReportBuffer.Dec1 := RateAdjustExchangeRegister."Adjusted Base";
//                                     BookingExchRate := RateAdjustExchangeRegister."Adjusted Base (LCY)" / RateAdjustExchangeRegister."Adjusted Base";
//                                     ReportBuffer.Dec2 := BookingExchRate;
//                                     ReportBuffer.Dec3 := RateAdjustExchangeRegister."Adjusted Base (LCY)";
//                                     ExchRate := (RateAdjustExchangeRegister."Adjusted Base (LCY)" + RateAdjustExchangeRegister."Adjusted Amt. (LCY)") / RateAdjustExchangeRegister."Adjusted Base";
//                                     ReportBuffer.Dec4 := ExchRate;
//                                     ReportBuffer.Dec5 := ExchRate - BookingExchRate;
//                                     ReportBuffer.Dec6 := RateAdjustExchangeRegister."Adjusted Amt. (LCY)";
//                                     ReportBuffer.Dec7 := RateAdjustExchangeRegister."Adjusted Base" * ExchRate;
//                                     ReportBuffer.Insert();
//                                 end;
//                             end Else
//                                 CurrReport.Skip();
//                         End;
//             end;
//         }
//         dataitem(Integer; Integer)
//         {
//             DataItemTableView = sorting(Number);
//             column(SNo; ReportBuffer.Int1)
//             {
//             }
//             column(Type; ReportBuffer."Text100-1")
//             {
//             }
//             column(CustVendName; ReportBuffer."Text100-2")
//             {
//             }
//             column(CustVendNo; ReportBuffer."Text100-3")
//             {
//             }
//             column(DocumentNo; ReportBuffer.Code1)
//             {
//             }
//             column(PostingDate; ReportBuffer.Date1)
//             {
//             }
//             column(CurrencyCode; ReportBuffer.Code2)
//             {
//             }
//             column(RemainingAmount; ReportBuffer.Dec1)
//             {
//             }
//             column(BookingExchangeRate; ReportBuffer.Dec2)
//             {
//             }
//             column(OutstandingAmountLC; ReportBuffer.Dec3)
//             {
//             }
//             column(ReinstatmentExchRate; ReportBuffer.Dec4)
//             {
//             }
//             column(GainLoss; ReportBuffer.Dec5)
//             {
//             }
//             column(UnrealisedgainLoss; ReportBuffer.Dec6)
//             {
//             }
//             column(ReinstatedAmountLC; ReportBuffer.Dec7)
//             {
//             }
//             trigger OnPreDataItem()
//             begin
//                 ReportBuffer.Reset();
//                 if ReportBuffer.IsEmpty then
//                     Error('Data is not availble with in your date range %1 to %2', FromDate, ToDate);
//                 SetRange(Number, 1, ReportBuffer.Count);
//             end;

//             trigger OnAfterGetRecord()
//             begin

//                 if Number = 1 then
//                     ReportBuffer.findfirst
//                 else
//                     ReportBuffer.next;
//             end;
//         }
//     }

//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(Options)
//                 {
//                     field(FromDate; FromDate)
//                     {
//                         Caption = 'From Date';
//                         ApplicationArea = all;
//                     }
//                     field(ToDate; ToDate)
//                     {
//                         Caption = 'To Date';
//                         ApplicationArea = all;
//                     }
//                 }
//             }
//         }

//     }
//     trigger OnPreReport()
//     begin
//         if FromDate = 0D then error(ErrorFromDate);
//         if ToDate = 0D then error(ErrorUptoDate);
//         if todate < FromDate then Error(ErrorDate);
//     end;

//     var
//         ErrorFromDate: Label 'Please Specify From Date';
//         ErrorUptoDate: Label 'Please Specify To Date';
//         ErrorDate: Label 'To Date must be more than From Date';
//         ReportNameLbl: Label 'Forex Reinstatement Details';
//         ReportFiltersLbl: Label 'Filters :';
//         DateFilterLbl: Label 'Date Filter';
//         VendorFilterLbl: Label 'Vendor Filter';
//         CustomerFilterLbl: Label 'Customer Filter';
//         SNoLbl: Label 'SL. No.';
//         FromDate: Date;
//         ToDate: Date;
//         TypeLbl: Label 'Type';
//         CVBLbl: Label 'Client/Vendor/Bank Name';
//         CVBNLbl: Label 'Client/Vendor/Bank No.';
//         VoucherNoLbl: Label 'Invoice No./Rcpt, Pmt Voucher No.';
//         DateLbl: Label 'Date';
//         CurrencyCodeLbl: Label 'Currency Code';
//         OutstandingAmountFCLbl: Label 'Outstanding Amount FC';
//         BookingExchRateLbl: Label 'Booking Exch. Rate';
//         OutstandingAmountLCLbl: Label 'Outstanding Amount LC';
//         ReinstatmentExchRateLbl: Label 'Reinstatment Exch Rate';
//         GainLossLbl: Label 'Gain / (Loss)';
//         UnrealisedgainLossLbl: Label 'Unrealised Gain / (Loss)';
//         ReinstatedAmountLCLbl: Label 'Reinstated Amount LC';
//         ReportBuffer: record "ICRA Report Buffer" temporary;
//         SNo: Integer;
//         VendorRec: Record Vendor;
//         VLERec: Record "Vendor Ledger Entry";
//         DVLERec: Record "Detailed Vendor Ledg. Entry";
//         DVLERec1: Record "Detailed Vendor Ledg. Entry";
//         BookingExchRate: Decimal;
//         RateAdjustExchangeRegister: Record "Exch. Rate Adjmt. Reg.";
//         ExchRate: Decimal;
//         DCLERec: Record "Detailed Cust. Ledg. Entry";
//         DCLERec1: Record "Detailed Cust. Ledg. Entry";
//         CLERec: Record "Cust. Ledger Entry";
//         CustomerRec: Record Customer;
//         SourceCodeSetup: Record "Source Code Setup";
//         CompanyInfo: Record "Company Information";
//         CustomerFilter: Text[1024];
//         VendorFilter: Text[1024];
//         BankNo: Text;
//         DateFilter: Text;

// }