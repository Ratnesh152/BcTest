report 50020 "Store Receipt"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Store Receipt';
    // RDLCLayout = './Source/Report Layout/PostedPurchaseReceipt.rdl';
    RDLCLayout = './Smartworks/PostedPurchaseReceipt.rdl';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.", "Pay-to Name";
            DataItemTableView = sorting("No.") order(ascending);
            column(No_; "No.") { }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Date; "Document Date") { }
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfoPostCode; CompanyInfo."Post Code") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            // column(CompanyInfo_StateCode; CompanyInfo."State Code") { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            // column(CompanyInfo_GST_Reg_No; CompanyInfo."GST Registration No.") { }
            column(Inward_Entry_No_; Inward_Entry_No) { }
            column(Invoice_Date_; Invoice_Date) { }
            column(Invoice_No_; Invoice_No) { }
            column(Challan_Date_; Challan_Date) { }
            column(Challan_No_; Challan_No) { }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number);
                column(OutputNo; Number)
                {
                }
                column(HeaderText; HeaderText)
                {
                }
                dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    DataItemLinkReference = "Purch. Rcpt. Header";
                    DataItemTableView = sorting("Document No.", "Line No.");
                    column(Item_No; "No.") { }
                    column(Description; Description) { }
                    column(Quantity_; Quantity) { }
                    column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                    column(Unit_Cost; "Unit Cost") { }
                    column(Line_Discount__; "Line Discount %") { }
                    column(AmountInWords; AmountInWords) { }
                    column(TotalLineAmount; TotalLineAmount) { }
                    // column(Extended_Text; "Extended Text") { }
                    // column(Extended_Text_2; "Extended Text 2") { }
                    column(IGSTAmount; IGSTAmount) { }
                    column(CGSTAmount; CGSTAmount) { }
                    column(SGSTAmount; SGSTAmount) { }
                    column(TotIGSTAmount; TotIGSTAmount) { }
                    column(TotCGSTAmount; TotCGSTAmount) { }
                    column(TotSGSTAmount; TotSGSTAmount) { }
                    column(GSTPer; GSTPer) { }
                    column(GSTAmount; GSTAmount) { }
                    column(LineGSTAmt; LineGSTAmt) { }
                    column(IGSTPer; IGSTPer) { }
                    column(SGSTPer; SGSTPer) { }
                    column(CGSTPer; CGSTPer) { }
                    column(Total_TDS; Total_TDS) { }
                    column(RecptLineAmt; RecptLineAmt) { }
                    column(amountwithTax; amountwithTax) { }
                    column(Text2; Text2) { }
                    trigger OnAfterGetRecord()
                    var
                        TaxTransactionValuetds: Record "Tax Transaction Value";
                    begin
                        LineAmount := 0;
                        TotalLineAmount := 0;
                        AmountInWords := '';
                        newtext1 := '';
                        AmountInWords1 := '';
                        RecptLineAmt := 0;
                        clear(CGSTAmount);
                        clear(SGSTAmount);
                        clear(IGSTAmount);
                        Clear(GSTPer);
                        Clear(IGSTPer);
                        Clear(CGSTPer);
                        Clear(TotCGSTAmount);
                        Clear(TotIGSTAmount);
                        Clear(TotSGSTAmount);
                        Clear(SGSTPer);
                        clear(LineGSTAmt);
                        PurchaseHeader.Reset();
                        PurchaseHeader.SetRange("No.", "Order No.");
                        if PurchaseHeader.FindSet() then begin
                            PurchLine.Reset();
                            PurchLine.SetRange("Document No.", PurchaseHeader."No.");
                            PurchLine.SetRange("Line No.", "Line No.");
                            if PurchLine.FindSet() then
                                repeat
                                    TaxTranValue.Reset();
                                    TaxTranValue.SetRange("Tax Record ID", PurchLine.RecordId);
                                    if TaxTranValue.FindSet() then
                                        repeat
                                            if TaxTranValue."Tax Type" = 'GST' then begin
                                                if TaxTranValue."Value ID" = 2 then begin
                                                    CGSTAmount += TaxTranValue.Amount;
                                                    LineGSTAmt += TaxTranValue.Amount;
                                                    CGSTPer := TaxTranValue.Percent;
                                                    if TaxTranValue."Value Type" = TaxTranValue."Value Type"::COMPONENT then
                                                        GSTPer += TaxTranValue.Percent;
                                                    TotCGSTAmount += TaxTranValue.Amount;
                                                end;
                                                if TaxTranValue."Value ID" = 6 then begin
                                                    SGSTAmount += TaxTranValue.Amount;
                                                    LineGSTAmt += TaxTranValue.Amount;
                                                    SGSTPer := TaxTranValue.Percent;
                                                    if TaxTranValue."Value Type" = TaxTranValue."Value Type"::COMPONENT then
                                                        GSTPer += TaxTranValue.Percent;
                                                    TotSGSTAmount += TaxTranValue.Amount;
                                                end;
                                                if TaxTranValue."Value ID" = 3 then begin
                                                    IGSTAmount += TaxTranValue.Amount;
                                                    LineGSTAmt += TaxTranValue.Amount;
                                                    IGSTPer := TaxTranValue.Percent;
                                                    if TaxTranValue."Value Type" = TaxTranValue."Value Type"::COMPONENT then
                                                        GSTPer += TaxTranValue.Percent;
                                                    TotIGSTAmount += TaxTranValue.Amount;
                                                end;
                                            end;
                                        until TaxTranValue.Next() = 0;
                                until PurchLine.Next() = 0;
                            TaxTransactionValuetds.Reset();
                            TaxTransactionValuetds.SetRange("Tax Record ID", PurchLine.RecordId);
                            TaxTransactionValuetds.SetRange("Tax Type", TDSSetup."Tax Type");
                            TaxTransactionValuetds.SetRange("Value Type", TaxTransactionValuetds."Value Type"::COMPONENT);
                            TaxTransactionValuetds.SetFilter(Percent, '<>%1', 0);
                            if TaxTransactionValuetds.FindSet() then
                                repeat
                                    Total_TDS += TaxTransactionValuetds.Amount;
                                until TaxTransactionValuetds.Next() = 0;
                        end;
                        GSTAmount += LineGSTAmt;
                        RecptLineAmt := "Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost";
                        AmountwithTax += RecptLineAmt + IGSTAmount + SGSTAmount + CGSTAmount;
                        where := '=';
                        which := '*';
                        ReportCheck.InitTextVariable();
                        ReportCheck.FormatNoText(NoText, AmountwithTax, "Purch. Rcpt. Header"."Currency Code");
                        AmountInWords1 := NoText[1] + ' ' + NoText[2];
                        newtext1 := UpperCase(AmountInWords1);
                        AmountInWords := DelChr(newtext1, Where, which);
                    end;

                    trigger OnPreDataItem()
                    begin
                    end;
                }
                trigger OnPreDataItem()
                begin
                    if NoOfCopies <= 0 then
                        NoOfCopies := 1;
                    SetRange(Number, 1, NoOfCopies);
                end;

                trigger OnAfterGetRecord()
                begin
                    amountwithTax := 0;
                    Clear(GSTAmount);
                    if Number = 1 then
                        HeaderText := HeaderText1;
                    if Number = 2 then
                        HeaderText := HeaderText2;
                    if Number = 3 then
                        HeaderText := HeaderText3;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                // GoodsRecptHeader.Reset();
                // GoodsRecptHeader.SetRange("No.", "Purch. Rcpt. Header"."No.");
                // if GoodsRecptHeader.FindSet() then begin
                //     Invoice_No := GoodsRecptHeader."Vendor Invoice No.";
                //     Invoice_Date := GoodsRecptHeader."Vendor Invoice Date";
                //     Inward_Entry_No := GoodsRecptHeader."Gate Entry No.";
                //     Challan_No := GoodsRecptHeader."E-Way Bill";
                //     Challan_Date := GoodsRecptHeader."E-Way Bill Date";
                // end;
                text1 := 'Goods Receipt Header: GRN,PUN05/GND/2324/00047';
                Text2 := DelChr(text1, '=', 'Goods Receipt Header: GRN,');
            end;

            trigger OnPreDataItem()
            begin
                Invoice_No := '';
                Invoice_Date := 0D;
                Inward_Entry_No := '';
                Challan_Date := 0D;
                Challan_No := '';
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
                    // field(NoOfCopies; NoOfCopies)
                    // {
                    //     Caption = 'No. of copies';
                    // ApplicationArea = All;
                    // }
                }
            }
        }
    }
    labels
    {
        GRN_No = 'GRN No';
        Supplier = 'Supplier';
        Challan_No = 'Challan No';
        Consignment_No = 'Consignment No';
        Invoice_No = 'Invoice No';
        GRN_Date = 'GRN Date';
        Inward_Entry_No = 'Inward Entry No';
        Challan_Date = 'Challan Date';
        Invoice_Date = 'Invoice Date';
        Consignment_Date = 'Consignment Date';
        Item_Code_HSN_SAC = 'Item Code/Hsn/Sac';
        Item_Description = 'Item Description';
        PO_No = 'PO No';
        Quantity = 'Quantity';
        Uom = 'UOM';
        Rate = 'Rate';
        Discount = 'Discount';
        Amount = 'Amount';
        Status = 'APPROVED';
    }
    trigger OnPreReport()
    begin
        GLSetup.Get();
        CompanyInfo.get();
        TdsSetup.get();
    end;

    trigger OnInitReport()
    begin
        NoOfCopies := 3;
    end;

    var
        CheckReport: Report "Check Report";
        AmountInWords: Text;
        AmountInWords1: Text;
        newtext1: Text;
        where: Text;
        PageNo: Integer;
        which: Text;
        NoText: array[2] of Text;
        Total_Value: Decimal;
        text1: Text;
        Text2: Text;
        TCS_Amount: Decimal;
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        // GoodsRecptHeader: Record "Goods Receipt Header";
        ReportCheck: Report "Check Report";
        Invoice_No: Code[20];
        NoOfCopies: Integer;
        Invoice_Date: Date;
        LineAmount: Decimal;
        Inward_Entry_No: Code[20];
        TotalLineAmount: Decimal;
        Challan_Date: Date;
        Challan_No: code[20];
        HeaderText1: Label 'HO COPY';
        HeaderText2: Label 'MILL COPY';
        HeaderText3: Label 'PARTY COPY';
        HeaderText: text;
        PurchaseHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        TaxTranValue: Record "Tax Transaction Value";
        GstSetup: Record "GST Setup";
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        GSTAmount: Decimal;
        GSTPer: Decimal;
        LineGSTAmt: Decimal;
        TotIGSTAmount: Decimal;
        TotSGSTAmount: Decimal;
        TotCGSTAmount: Decimal;
        IGSTPer: Decimal;
        SGSTPer: Decimal;
        CGSTPer: Decimal;
        RecptLineAmt: Decimal;
        TdsSetup: Record "TDS Setup";
        amountwithTax: Decimal;
        Total_TDS: Decimal;
}