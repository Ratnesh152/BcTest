report 50001 "Sales Inv Line/Sales Cr. Memo"
{
    ApplicationArea = All;
    Caption = 'Sales Inv Line/Sales Cr.Memo';
    DefaultLayout = RDLC;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Smartworks/Rep50001.Sales_Resister.rdl';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            RequestFilterFields = "Document No.";
            column(Document_No_; "Document No.")
            {
            }
            column(Line_No_; "Line No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Type; Type)
            {
            }
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(Unit_Price; "Unit Price")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {
            }
            column(Responsibility_Center; "Responsibility Center")
            {
            }
            // column(GST_Place_of_Supply; "GST Place of Supply")
            // {
            // }
            // column(GST_Group_Code; "GST Group Code")
            // {
            // }
            // column(GST_Group_Type; "GST Group Type")
            // {
            // }
            // column(HSN_SAC_Code; "HSN/SAC Code")
            // {
            // }
            // column(GST_Jurisdiction_Type; "GST Jurisdiction Type")
            // {
            // }
            // column(Invoice_Type; "Invoice Type")
            // {
            // }
            column(SellToCustomerName; SellToCustomerName)
            {
            }
            column(CustomerEmail; CustomerEmail)
            {
            }
            column(CustomerGSTRegNo; CustomerGSTRegNo)
            {
            }
            column(LocationGSTRegNo; LocationGSTRegNo)
            {
            }
            column(IRNNo; IRNNo)
            {
            }
            column(LDCNo; LDCNo)
            {
            }
            column(SWBankAccount; SWBankAccount)
            {
            }
            column(IGST_Amount; abs(IGST_Amount))
            {
            }
            column(SGST_Amount; abs(SGST_Amount))
            {
            }
            column(CGST_Amount; abs(CGST_Amount))
            {
            }
            column(Total_Invoice_Tax; abs(Total_Invoice_Tax))
            {
            }
            column(Total_InvoicAmount_Incl_Tax; Total_InvoicAmount_Incl_Tax)
            {
            }
            trigger OnAfterGetRecord()
            begin
                IGST_Amount := 0;
                SGST_Amount := 0;
                CGST_Amount := 0;
                SalesInvHeader.Reset();
                SalesInvHeader.SetRange("No.", "Document No.");
                if SalesInvHeader.FindSet() then begin
                    SellToCustomerName := SalesInvHeader."Sell-to Customer Name";
                    CustomerEmail := SalesInvHeader."Sell-to E-Mail";
                    // CustomerGSTRegNo := SalesInvHeader."Customer GST Reg. No.";
                    // LocationGSTRegNo := SalesInvHeader."Location GST Reg. No.";
                    // IRNNo := SalesInvHeader."IRN Hash";
                    SWBankAccount := SalesInvHeader."Company Bank Account Code";
                    // LDCNo := SalesInvHeader.dc
                    // NatureOfSupply := SalesInvHeader."Nature of Supply";
                end;
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'IGST');
                IF DetailedGSTLedgerEntry.FINDSET THEN begin
                    REPEAT
                        IGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                //
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'CGST');
                IF DetailedGSTLedgerEntry.FINDSET THEN begin
                    REPEAT
                        CGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                //
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'SGST');
                IF DetailedGSTLedgerEntry.FINDSET then begin
                    REPEAT
                        SGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                Total_Invoice_Tax += IGST_Amount + SGST_Amount + CGST_Amount;
                Total_InvoicAmount_Incl_Tax += Total_Invoice_Tax + "Sales Invoice Line".Amount;
            end;
        }
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            RequestFilterFields = "Document No.";
            column(Document_No_Memo; "Document No.")
            {
            }
            column(Line_No_Memo; "Line No.")
            {
            }
            column(Sell_to_Customer_No_Memo; "Sell-to Customer No.")
            {
            }
            column(Posting_Date_Memo; "Posting Date")
            {
            }
            column(Location_Code_Memo; "Location Code")
            {
            }
            column(Type_Memo; Type)
            {
            }
            column(No__Memo; "No.")
            {
            }
            column(Description_Memo; Description)
            {
            }
            column(Quantity_Memo; Quantity)
            {
            }
            column(Unit_Price_Memo; "Unit Price")
            {
            }
            column(Unit_of_Measure_Memo; "Unit of Measure")
            {
            }
            column(Amount_Memo; Amount)
            {
            }
            // column(HSN_SAC_Code_Memo; "HSN/SAC Code")
            // {
            // }
            column(Bill_to_Customer_No_Memo; "Bill-to Customer No.")
            {
            }
            column(Responsibility_Center_Memo; "Responsibility Center")
            {
            }
            // column(GST_Place_of_Supply_Memo; "GST Place of Supply")
            // {
            // }
            // column(GST_Group_Code_Memo; "GST Group Code")
            // {
            // }
            column(GST_Group_Type_Memo; "GST Group Type")
            {
            }
            column(GST_Jurisdiction_Type_Memo; "GST Jurisdiction Type")
            {
            }
            // column(Invoice_Type_Memo; "Invoice Type")
            // {
            // }
            column(SellToCustomerNameMemo; SellToCustomerNameMemo)
            {
            }
            column(CustomerEmailMemo; CustomerEmailMemo)
            {
            }
            column(CustomerGSTRegNoMemo; CustomerGSTRegNoMemo)
            {
            }
            column(LocationGSTRegNoMemo; LocationGSTRegNoMemo)
            {
            }
            column(IRNNoMemo; IRNNoMemo)
            {
            }
            column(LDCNoMemo; LDCNoMemo)
            {
            }
            column(SWBankAccountMemo; SWBankAccountMemo)
            {
            }
            column(IGST_AmountMemo; IGST_AmountMemo)
            {
            }
            column(SGST_AmountMemo; SGST_AmountMemo)
            {
            }
            column(CGST_AmountMemo; CGST_AmountMemo)
            {
            }
            column(Total__CreditMemoTax; Total__CreditMemoTax)
            {
            }
            column(Total_MemoAmount_Incl_Tax; Total_MemoAmount_Incl_Tax)
            {
            }
            trigger OnAfterGetRecord()
            begin
                IGST_AmountMemo := 0;
                SGST_AmountMemo := 0;
                CGST_AmountMemo := 0;
                SalesCreditMemoHeader.Reset();
                SalesCreditMemoHeader.SetRange("No.", "Document No.");
                if SalesCreditMemoHeader.FindSet() then begin
                    SellToCustomerNameMemo := SalesCreditMemoHeader."Sell-to Customer Name";
                    CustomerEmailMemo := SalesCreditMemoHeader."Sell-to E-Mail";
                    // CustomerGSTRegNoMemo := SalesCreditMemoHeader."Customer GST Reg. No.";
                    // LocationGSTRegNoMemo := SalesCreditMemoHeader."Location GST Reg. No.";
                    // IRNNoMemo := SalesCreditMemoHeader."IRN Hash";
                    // SWBankAccountMemo := SalesCreditMemoHeader."Company Bank Account Code";
                    // NatureOfSupplyMemo := SalesCreditMemoHeader."Nature of Supply";
                    // LDCNoMemo := SalesCreditMemoHeader.
                    // type:= SalesCreditMemoHeader."Ship-to GST Customer Type";
                end;
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'IGST');
                IF DetailedGSTLedgerEntry.FINDSET THEN begin
                    REPEAT
                        IGST_AmountMemo := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                //
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'CGST');
                IF DetailedGSTLedgerEntry.FINDSET THEN begin
                    REPEAT
                        CGST_AmountMemo := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                //
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'SGST');
                IF DetailedGSTLedgerEntry.FINDSET then begin
                    REPEAT
                        SGST_AmountMemo := DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                end;
                Total__CreditMemoTax += IGST_AmountMemo + SGST_AmountMemo + CGST_AmountMemo;
                Total_MemoAmount_Incl_Tax += Total__CreditMemoTax + "Sales Cr.Memo Line".Amount;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
            }
        }
    }
    var
        SalesInvHeader: Record "Sales Invoice Header";
        SalesCreditMemoHeader: Record "Sales Cr.Memo Header";
        DetailedGstLedgerEntry: Record "Detailed GST Ledger Entry";
        SellToCustomerName: Text;
        CustomerEmail: Text;
        CustomerGSTRegNo: Code[20];
        LocationGSTRegNo: Code[20];
        SWBankAccount: Code[20];
        LDCNo: Code[20];
        IRNNo: Text;
        Total_Invoice_Tax: Decimal;
        Total_InvoicAmount_Incl_Tax: Decimal;
        GstCustomerType: Text;
        NatureOfSupply: text;
        IGST_Amount: Decimal;
        CGST_Amount: Decimal;
        SGST_Amount: Decimal;
        GST_Amount: Decimal;
        SellToCustomerNameMemo: Text;
        CustomerEmailMemo: Text;
        CustomerGSTRegNoMemo: Code[20];
        LocationGSTRegNoMemo: Code[20];
        SWBankAccountMemo: Code[20];
        LDCNoMemo: Code[20];
        IRNNoMemo: Text;
        GstCustomerTypeMemo: Text;
        NatureOfSupplyMemo: text;
        IGST_AmountMemo: Decimal;
        CGST_AmountMemo: Decimal;
        SGST_AmountMemo: Decimal;
        GST_AmountMemo: Decimal;
        Total_MemoAmount_Incl_Tax: Decimal;
        Total__CreditMemoTax: Decimal;



}
