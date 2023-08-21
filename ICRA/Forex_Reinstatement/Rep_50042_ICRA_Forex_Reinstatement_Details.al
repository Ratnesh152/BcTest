report 50042 "Forex_Reinstatement_Details"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Forex_Reinstatement_Details';
    RDLCLayout = './ICRA/Forex_Reinstatement/Rep_50042_ICRA_Forex_Reinstatement_Details.rdl';
    dataset
    {
        dataitem("Exch. Rate Adjmt. Reg."; "Exch. Rate Adjmt. Reg.")
        {
            DataItemTableView = sorting("Account Type", "Creation Date") order(ascending) where("Account Type" = filter(Customer | Vendor));
            column(Company_Name; CompanyInfo.Name) { }
            column(No_; "No.") { }
            column(Account_Type; "Account Type") { }
            column(VendorFilterLbl; VendorFilterLbl) { }
            column(DateFilterLbl; DateFilterLbl) { }
            column(CustomerFilterLbl; CustomerFilterLbl) { }
            column(ReportFiltersLbl; ReportFiltersLbl) { }
            column(ReportNameLbl; ReportNameLbl) { }
            column(DateLbl; DateLbl) { }
            column(TypeLbl; TypeLbl) { }
            column(CVNameLbl; CVNameLbl) { }
            column(CVNoLbl; CVNoLbl) { }
            column(BookingExchRateLbl; BookingExchRateLbl) { }
            column(Sl_NoLbl; Sl_NoLbl) { }
            column(GainLossLbl; GainLossLbl) { }
            column(EntryNoLbl; EntryNoLbl) { }
            column(InvoiceNoLbl; InvoiceNoLbl) { }
            column(UnrealisedgainLossLbl; UnrealisedgainLossLbl) { }
            column(OutstandingAmountFCLbl; OutstandingAmountFCLbl) { }
            column(OutstandingAmountLCLbl; OutstandingAmountLCLbl) { }
            column(ReinstatedAmountLCLbl; ReinstatedAmountLCLbl) { }
            column(ReinstatmentExchRateLbl; ReinstatmentExchRateLbl) { }
            column(CurrencyCodeLbl; CurrencyCodeLbl) { }
            column(FromDate; FromDate) { }
            column(ToDate; ToDate) { }
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Exch. Rate Adjmt. Reg. No." = field("No.");
                column(Cust_SrNo; SrNo) { }
                column(Cust_No; "Customer No.") { }
                column(Cust_Name; Customer.Name) { }
                column(Cust_Invoice_No; CustLedgEntries."Document No.") { }
                column(Cust_Currecny; "Exch. Rate Adjmt. Reg."."Currency Code") { }
                column(Posting_Date; "Posting Date") { }
                column(Cust_LineAmt1; LineAmt[1]) { }
                column(Cust_LineAmt2; LineAmt[2]) { }
                column(Cust_LineAmt3; LineAmt[3]) { }
                column(Cust_LineAmt4; LineAmt[4]) { }
                column(Cust_LineAmt5; LineAmt[5]) { }
                column(Cust_LineAmt6; LineAmt[6]) { }
                column(Cust_LineAmt7; LineAmt[7]) { }
                trigger OnAfterGetRecord()
                var
                    DetCustLedgEntries: Record "Detailed Cust. Ledg. Entry";
                begin
                    SrNo := SrNo + 1;
                    CustLedgEntries.get("Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                    Customer.get("Detailed Cust. Ledg. Entry"."Customer No.");
                    DetCustLedgEntries.Reset();
                    DetCustLedgEntries.SetRange("Cust. Ledger Entry No.", "Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                    DetCustLedgEntries.SetFilter("Entry No.", '<=%1', "Detailed Cust. Ledg. Entry"."Entry No.");
                    DetCustLedgEntries.CalcSums(Amount, "Amount (LCY)");
                    Clear(LineAmt);
                    LineAmt[1] := DetCustLedgEntries.Amount;
                    LineAmt[7] := DetCustLedgEntries."Amount (LCY)";
                    LineAmt[3] := LineAmt[7] - "Detailed Cust. Ledg. Entry"."Amount (LCY)";
                    LineAmt[2] := LineAmt[3] / LineAmt[1];
                    LineAmt[4] := LineAmt[7] / LineAmt[1];
                    LineAmt[5] := LineAmt[4] - LineAmt[2];
                    LineAmt[6] := LineAmt[5] * LineAmt[1];
                end;
            }
            dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
            {
                DataItemLink = "Exch. Rate Adjmt. Reg. No." = field("No.");
                column(Vend_SrNo; SrNo) { }
                column(Vend_No; "Vendor No.") { }
                column(Vend_Name; Vendor.Name) { }
                column(Vend_Invoice_No; VendLedEntries."Document No.") { }
                column(Vend_Currecny; "Exch. Rate Adjmt. Reg."."Currency Code") { }
                column(Vend_Posting_Date; "Posting Date") { }
                column(Vend_LineAmt1; LineAmt[1]) { }
                column(Vend_LineAmt2; LineAmt[2]) { }
                column(Vend_LineAmt3; LineAmt[3]) { }
                column(Vend_LineAmt4; LineAmt[4]) { }
                column(Vend_LineAmt5; LineAmt[5]) { }
                column(Vend_LineAmt6; LineAmt[6]) { }
                column(Vend_LineAmt7; LineAmt[7]) { }
                trigger OnAfterGetRecord()
                var
                    DetVendLedgerEntries: Record "Detailed Vendor Ledg. Entry";
                begin
                    SrNo := SrNo + 1;
                    VendLedEntries.get("Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.");
                    Vendor.get("Detailed vendor Ledg. Entry"."Vendor No.");
                    DetVendLedgerEntries.Reset();
                    DetVendLedgerEntries.SetRange("Vendor Ledger Entry No.", "Detailed Vendor Ledg. Entry"."Vendor Ledger Entry No.");
                    DetVendLedgerEntries.SetFilter("Entry No.", '<=%1', "Detailed Vendor Ledg. Entry"."Entry No.");
                    DetVendLedgerEntries.CalcSums(Amount, "Amount (LCY)");
                    Clear(LineAmt);
                    LineAmt[1] := DetVendLedgerEntries.Amount;
                    LineAmt[7] := DetVendLedgerEntries."Amount (LCY)";
                    LineAmt[3] := LineAmt[7] - "Detailed Vendor Ledg. Entry"."Amount (LCY)";
                    LineAmt[2] := LineAmt[3] / LineAmt[1];
                    LineAmt[4] := LineAmt[7] / LineAmt[1];
                    LineAmt[5] := LineAmt[4] - LineAmt[2];
                    LineAmt[6] := LineAmt[5] * LineAmt[1];
                end;
            }
            trigger OnPreDataItem()
            begin
                "Exch. Rate Adjmt. Reg.".SetCurrentKey("Account Type");
                "Exch. Rate Adjmt. Reg.".SetRange("Creation Date", FromDate, ToDate);
            end;
        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(FromDate; FromDate)
                    {
                        Caption = 'From Date';
                        ApplicationArea = all;
                    }
                    field(ToDate; ToDate)
                    {
                        Caption = 'To Date';
                        ApplicationArea = all;
                    }
                }
            }
        }
    }
    labels
    {
        // label(CustName;'Customer Name')
    }

    trigger OnPreReport()
    begin
        CompanyInfo.get();
        if FromDate = 0D then error(ErrorFromDate);
        if ToDate = 0D then error(ErrorUptoDate);
        if todate < FromDate then Error(ErrorDate);
    end;

    var
        SrNo: Integer;
        CompanyInfo: Record "Company Information";
        CustLedgEntries: Record "Cust. Ledger Entry";
        VendLedEntries: Record "Vendor Ledger Entry";
        Customer: Record "Customer";
        Vendor: Record Vendor;
        Cust_Name: Text;
        Invoice_No: Code[20];
        LineAmt: array[7] of Decimal;
        ErrorFromDate: Label 'Please Specify From Date';
        ErrorUptoDate: Label 'Please Specify To Date';
        ErrorDate: Label 'To Date must be more than From Date';
        ReportNameLbl: Label 'Forex Reinstatement Details';
        ReportFiltersLbl: Label 'Filters :';
        DateFilterLbl: Label 'Date Filter';
        VendorFilterLbl: Label 'Vendor Filter';
        CustomerFilterLbl: Label 'Customer Filter';
        Sl_NoLbl: Label 'SL. No.';
        TypeLbl: Label 'Type';
        CVNameLbl: Label 'Client/Vendor Name';
        CVNoLbl: Label 'Client/Vendor No.';
        InvoiceNoLbl: Label 'Invoice No.';
        DateLbl: Label 'Date';
        CurrencyCodeLbl: Label 'Currency Code';
        OutstandingAmountFCLbl: Label 'Outstanding Amount FC';
        BookingExchRateLbl: Label 'Booking Exch. Rate';
        OutstandingAmountLCLbl: Label 'Outstanding Amount LC';
        ReinstatmentExchRateLbl: Label 'Reinstatment Exch. Rate';
        GainLossLbl: Label 'Gain / Loss';
        UnrealisedgainLossLbl: Label 'Unrealised Gain / Loss';
        ReinstatedAmountLCLbl: Label 'Reinstated Amount LC';
        EntryNoLbl: Label 'Entry No Exch. Reg.';
        FromDate: Date;
        ToDate: Date;
}