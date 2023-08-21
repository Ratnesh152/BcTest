report 50217 "Tax Invoice Smartworks"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Tax Invoice Smartworks';
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Smartworks/Tax Invoice.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Smartworks Tax Invoice';
            column(No_; "No.")
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Name2; CompanyInfo."Name 2")
            {
            }
            column(CompanyInfo_Bank_Acc_No; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyInfo_Email; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfo_CIN_No; CompanyInfo."Registration No.")
            {
            }
            column(CompanyInfo_address1; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Phone_No; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_Website; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfo_Contact_Person; CompanyInfo."Contact Person")
            {
            }
            column(CompanyInfo_SWIFT_Code; CompanyInfo."SWIFT Code")
            {
            }
            column(CompanyInfo_Bank_Name; CompanyInfo."Bank Name")
            {
            }
            column(CompanyInfo_FAX_No; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo_PostCode; CompanyInfo."Post Code")
            {
            }
            column(Location_Address; Location.Address)
            {
            }
            column(Location_Addres2; Location."Address 2")
            {
            }
            column(Location_City; Location.City)
            {
            }
            column(Location_ContactPerson; Location.Contact)
            {
            }
            column(Location_PostCode; Location."Post Code")
            {
            }
            column(Location_StateName; LocationState.Description)
            {
            }
            column(LocationState; LocationState."State Code (GST Reg. No.)")
            {
            }
            // column(Location_GSTIN; Location."GST Registration No.")
            // {
            // }
            column(Reversed; Reversed)
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            // column(Vehicle_No_; "Vehicle No.")
            // {
            // }
            column(BankDetails_Name; BankAccount.Name)
            {
            }
            column(BankAccount_AccountNo; BankAccount."Bank Account No.")
            {
            }
            column(BankDetailsAddress; BankAccount.Address)
            {
            }
            column(BankDetails_Address2; BankAccount."Address 2")
            {
            }
            column(BankDetails_City; BankAccount.City)
            {
            }
            // column(BankDetails_IFSC; BankAccount."IFSC Code")
            // {
            // }
            column(BankAccount_Contact_Person; BankAccount.Contact)
            {
            }
            column(BankAccount_SWIFT_Code; BankAccount."SWIFT Code")
            {
            }
            // column(Company_PAN; CompanyInfo."P.A.N. No.")
            // {
            // }
            column(Company_RegNo; CompanyInfo."Registration No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Sell_to_Customer_Name_2; "Sell-to Customer Name 2")
            {
            }
            column(Sell_to_Address; "Sell-to Address")
            {
            }
            column(Sell_to_Address_2; "Sell-to Address 2")
            {
            }
            column(Sell_to_City; "Sell-to City")
            {
            }
            column(Sell_to_E_Mail; "Sell-to E-Mail")
            {
            }
            column(Sell_to_Phone_No_; "Sell-to Phone No.")
            {
            }
            // column(IRN_Hash; "IRN Hash")
            // {
            // }
            // column(QR_Code; "QR Code")
            // {
            // }
            column(Sell_to_Post_Code; "Sell-to Post Code")
            {
            }
            column(Bill_to_Name; "Bill-to Name")
            {
            }
            column(Bill_to_Name_2; "Bill-to Name 2")
            {
            }
            column(Bill_to_Address; "Bill-to Address")
            {
            }
            column(Bill_to_Address_2; "Bill-to Address 2")
            {
            }
            column(Bill_to_City; "Bill-to City")
            {
            }
            column(Bill_to_Contact; "Bill-to Contact")
            {
            }
            column(Bill_to_Post_Code; "Bill-to Post Code")
            {
            }
            // column(GST_Bill_to_State_Code; "GST Bill-to State Code")
            // {
            // }
            column(Bill_to_Email; customer."E-Mail")
            {
            }
            column(Bill_to_PhoneNo; customer."Phone No.")
            {
            }
            column(Ship_to_Name; "Ship-to Name")
            {
            }
            column(Ship_to_Name_2; "Ship-to Name 2")
            {
            }
            column(Ship_to_Address; "Ship-to Address")
            {
            }
            column(Ship_to_Address_2; "Ship-to Address 2")
            {
            }
            column(Ship_to_City; "Ship-to City")
            {
            }
            column(Ship_to_Post_Code; "Ship-to Post Code")
            {
            }
            column(Shipto_StateName; Shipto_StateName)
            {
            }
            column(Shipto_StateGSTCode; Shipto_StateGSTCode)
            {
            }
            column(Shipto_phone; Shipto_phone)
            {
            }
            column(Shipto_Email; Shipto_Email)
            {
            }
            column(LineOrderNo; LineOrderNo)
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Customer_GSTIN_No; Customer_GSTIN_No)
            {
            }
            // column(Customer_PAN; customer."P.A.N. No.")
            // {
            // }
            // column(CustomerStateCode; customer."State Code")
            // {
            // }
            column(CustState_GST_CodeNo; CustState_GST_CodeNo)
            {
            }
            column(CustState_Name; CustState_Name)
            {
            }
            column(IGSTTable; IGSTTable)
            {
            }
            column(SGSTTable; SGSTTable)
            {
            }
            column(PaymentTermDescription; PaymentTermDescription)
            {
            }
            column(Payment_Terms_Code; "Payment Terms Code")
            {
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = sorting(Number);
                column(OutputNo; Number)
                {
                }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    DataItemLinkReference = "Sales Invoice Header";
                    DataItemTableView = sorting("Document No.", "Line No.");
                    column(SrNo; SrNo)
                    {
                    }
                    column(Description; Description)
                    {
                    }
                    column(Description_2; "Description 2")
                    {
                    }
                    // column(HSN_SAC_Code; "HSN/SAC Code")
                    // {
                    // }
                    column(Quantity; Quantity)
                    {
                    }
                    column(Unit_of_Measure; "Unit of Measure")
                    {
                    }
                    column(Line_Amount; "Line Amount")
                    {
                    }
                    column(Order_No_Line; "Order No.")
                    {
                    }
                    column(Shipment_No_; "Shipment No.")
                    {
                    }
                    column(SalesLineType; Format("Sales Invoice Line".Type, 0, 2))
                    {
                    }
                    column(IGST_Amount; Abs(IGST_Amount))
                    {
                    }
                    column(IGST_Percnt; IGST_Percnt)
                    {
                    }
                    column(SGST_Percnt; SGST_Percnt)
                    {
                    }
                    column(CGST_Percnt; CGST_Percnt)
                    {
                    }
                    column(CGST_Amount; Abs(CGST_Amount))
                    {
                    }
                    column(SGST_Amount; Abs(SGST_Amount))
                    {
                    }
                    column(TCSAmt; TCSAmt)
                    {
                    }
                    column(Total_IGST_Amount; Abs(Total_IGST_Amount))
                    {
                    }
                    column(Total_SGST_Amount; Abs(Total_SGST_Amount))
                    {
                    }
                    column(Total_CGST_Amount; Abs(Total_CGST_Amount))
                    {
                    }
                    column(Unit_Price; "Unit Price")
                    {
                    }
                    column(TotalLineAmount; TotalLineAmount)
                    {
                    }
                    column(AmountInCludingTax; AmountInCludingTax)
                    {
                    }
                    column(AmountInWords; NewAmountInWords)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        if "Sales Invoice Line".Type IN ["Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Item, "Sales Invoice Line".Type::"Fixed Asset"] then
                            if "Sales Invoice Line".Quantity <> 0 then
                                SrNo += 1;
                        //
                        TCSAmt := 0;
                        CGST_Percnt := 0;
                        CGST_Amount := 0;
                        SGST_Percnt := 0;
                        SGST_Amount := 0;
                        IGST_Percnt := 0;
                        IGST_Amount := 0;
                        DetailedGSTLedgerEntry.RESET;
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                        DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                        DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'IGST');
                        IF DetailedGSTLedgerEntry.FINDSET THEN begin
                            REPEAT
                                IGST_Percnt := DetailedGSTLedgerEntry."GST %";
                                IGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                            Total_IGST_Amount += abs(DetailedGSTLedgerEntry."GST Amount");
                        end;
                        if IGST_Percnt <> 0 then
                            IGSTTable += 1;
                        //
                        DetailedGSTLedgerEntry.RESET;
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                        DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                        DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'CGST');
                        IF DetailedGSTLedgerEntry.FINDSET THEN begin
                            REPEAT
                                CGST_Percnt := DetailedGSTLedgerEntry."GST %";
                                CGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                            Total_CGST_Amount += abs(DetailedGSTLedgerEntry."GST Amount");
                        end;
                        //
                        DetailedGSTLedgerEntry.RESET;
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "Document No.");
                        DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                        DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                        DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."GST Component Code", 'SGST');
                        IF DetailedGSTLedgerEntry.FINDSET then begin
                            REPEAT
                                SGST_Percnt := DetailedGSTLedgerEntry."GST %";
                                SGST_Amount := DetailedGSTLedgerEntry."GST Amount";
                            UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                            Total_SGST_Amount += abs(DetailedGSTLedgerEntry."GST Amount");
                        end;
                        if SGST_Percnt <> 0 then
                            SGSTTable += 1;
                        TCSEntry.Reset();
                        TCSEntry.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                        if TCSEntry.FindSet() then
                            repeat
                                if "Sales Invoice Header"."Currency Code" <> '' then
                                    TCSAmt += "Sales Invoice Header"."Currency Factor" * TCSEntry."Total TCS Including SHE CESS"
                                else
                                    TCSAmt += TCSEntry."Total TCS Including SHE CESS";
                                TCSAmt := Round(TCSAmt, 1);
                            until TCSEntry.Next() = 0;

                        OrderComment := ' ';
                        SalesOrderComment.Reset();
                        SalesOrderComment.SetRange("Document Type", SalesOrderComment."Document Type"::"Posted Invoice");
                        SalesOrderComment.SetRange("No.", "Sales Invoice Line"."Document No.");
                        SalesOrderComment.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                        if SalesOrderComment.FindSet() then
                            repeat
                                orderComment += SalesOrderComment.Comment + ' ';
                            until SalesOrderComment.Next() = 0;
                        //
                        if "Sales Invoice Line"."Line Amount" <> 0 then
                            TotalLineAmount += "Sales Invoice Line"."Line Amount";
                        AmountInCludingTax := Round(TotalLineAmount + Total_CGST_Amount + Total_IGST_Amount + Total_SGST_Amount + TCSAmt);
                        RepCheck.InitTextVariable;
                        RepCheck.FormatNoText(NoText, AmountInCludingTax, "Sales Invoice Header"."Currency Code");
                        AmountInWords := NoText[1] + ' ' + NoText[2];
                        newtext := UpperCase(AmountInWords);
                        where := '=';
                        which := '*';
                        NewAmountInWords := DelChr(newtext, Where, which);
                        //
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

                    AmountInCludingTax := 0;
                    Total_IGST_Amount := 0;
                    Total_CGST_Amount := 0;
                    Total_SGST_Amount := 0;
                end;

            }
            trigger OnAfterGetRecord()
            begin
                //
                customer.Reset();
                if customer.get("Sell-to Customer No.") then begin
                    // if customer."State Code" <> ' ' then
                    //     if states.Get(customer."State Code") then begin
                    //         CustState_Name := states.Description;
                    //         CustState_GST_CodeNo := States."State Code (GST Reg. No.)";
                    //     end;
                end;
                //
                // if States.get(CompanyInfo."State Code") then begin
                //     Company_StateName := States.Description;
                //     Company_Gst_StateCode := States."State Code (GST Reg. No.)";
                // end;
                //
                // if Customer.get("Sell-to Customer No.") then
                //     Customer_GSTIN_No := customer."GST Registration No.";
                //
                Shipto_Address.Reset();
                Shipto_Address.SetRange("Customer No.", "Sell-to Customer No.");
                Shipto_Address.SetRange(Code, "Ship-to Code");
                if Shipto_Address.FindFirst() then begin
                    // if States.Get(Shipto_Address.State) then begin
                    //     Shipto_StateName := States.Description;
                    //     Shipto_StateGSTCode := States."State Code (GST Reg. No.)";
                    // end;
                end;
                //
                if Shipto_Address.Get("Sell-to Customer No.") then begin
                    Shipto_phone := Shipto_Address."Phone No.";
                    Shipto_Email := Shipto_Address."E-Mail";
                end;
                if Shipto_Email = '' then
                    Shipto_Email := customer."E-Mail";
                if Shipto_phone = '' then
                    Shipto_phone := customer."Phone No.";
                SalesInvLine.Reset();
                SalesInvLine.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvLine.SetFilter("Location Code", '<>%1', '');
                if SalesInvLine.FindFirst() then begin
                    Location.Get(SalesInvLine."Location Code");
                    // LocationState.Get(Location."State Code");
                end;
                SalesInvoice1.reset();
                SalesInvoice1.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoice1.SetFilter("Order No.", '<>%1', '');
                if SalesInvoice1.FindFirst() then begin
                    if SalesInvoice1.Quantity <> 0 then
                        LineOrderNo := SalesInvoice1."Order No.";
                end;
                // PaymentTermDescription := '';
                // PaymentTerms.Reset();
                // if PaymentTerms.Get("Payment Terms Code") then
                //     PaymentTermDescription := PaymentTerms.Description;
            end;

            trigger OnPostDataItem()
            begin
            end;

            trigger OnPreDataItem()
            begin
                BankAccount.get(BankAccountCode);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(BankDetail)
                {
                    Caption = 'Bank Details';
                    field(BankAccountCode; BankAccountCode)
                    {
                        Caption = 'Bank Account Code';
                        ShowMandatory = true;
                        ApplicationArea = All;
                        TableRelation = "Bank Account"."No.";
                    }
                }
            }
        }
    }
    trigger OnInitReport()
    begin
        GLSetup.Get();
        Salesetup.Get();
        CompanyInfo.get();
    end;

    trigger OnPreReport()
    begin
        if BankAccountCode = '' then
            Error(BankCodenotBlank);
    end;

    trigger OnPostReport()
    begin
    end;

    var
        shiptoemail: Text;
        shiptophone: Text;
        SrNo: Integer;
        Where: Text;
        which: Text;
        newtext: Text;
        NewAmountInWords: Text;
        SalesInvoice1: Record "Sales Invoice Line";
        SalesOrderComment: Record "Sales Comment Line";
        CompanyInfo: Record "Company Information";
        salesInvHead: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        BilltoState: Record State;
        Shipto_Address: Record "Ship-to Address";
        TaxTransactionValue: Record "Tax Transaction Value";
        customer: Record "Customer";
        TCSAmt: Decimal;
        TCSEntry: Record "TCS Entry";
        Location: Record Location;
        GSTSetup: Record "GST Setup";
        GLSetup: Record "General Ledger Setup";
        Salesetup: Record "Sales & Receivables Setup";
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        States: Record State;
        DispatchDocNo: Code[20];
        DispatchDoDate: Date;
        DispatchThrough: Text;
        EwayBillNo: Code[30];
        LineOrderNo: Code[20];
        NoText: array[2] of Text;
        LocationState: Record State;
        TempSalesInvoiceLine: Record "Sales Invoice Line" temporary;
        NoOfLoops: Integer;
        SalesInvoiceComment: Record "Sales Invoice Line";
        NoOfCopy: Integer;
        BankAccount: Record "Bank Account";
        TOD_Comment: text;
        OrderComment: Text;
        TotalAmtInclTax: Decimal;
        TotalLineAmount: Decimal;
        Total_IGST_Amount: Decimal;
        Shipto_StateName: Text;
        Shipto_StateGSTCode: Code[10];
        CopyText: Text[30];
        RepCheck: Report "Check Report";
        NoOfCopies: Integer;
        AmountInWords: text;
        Shipto_Email: Text;
        Total_TCS_Amount: Decimal;
        Shipto_phone: Text;
        AmountInCludingTax: Decimal;
        Total_GST_Amount: Decimal;
        ShowInternalInfo: Boolean;
        IGST_Amount: Decimal;
        IGST_Percnt: Decimal;
        SGST_Amount: Decimal;
        SGST_Percnt: Decimal;
        CGST_Amount: Decimal;
        CGST_Percnt: Decimal;
        Total_SGST_Amount: Decimal;
        Total_CGST_Amount: Decimal;
        Company_StateName: Text;
        Company_Gst_StateCode: Code[10];
        CustState_Name: Text;
        IRN: Text;
        QRN: Text;
        Customer_GSTIN_No: Code[20];
        CustState_GST_CodeNo: code[10];
        IGSTTable: Integer;
        SGSTTable: Integer;
        PaymentTerms: Record "Payment Terms";
        PaymentTermDescription: Text;
        BankAccountCode: Code[20];
        BankCodenotBlank: Label 'Please Specify Bank Account Code';
}
