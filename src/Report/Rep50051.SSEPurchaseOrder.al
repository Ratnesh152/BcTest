report 50051 "SSE Purchase Order"
{
    Caption = 'Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './src/Report/Rep50051.SSEPurchaseOrder.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.", "Buy-from Vendor Name";
            DataItemTableView = sorting("No.") where("Document Type" = filter(Order));
            column(Document_No; "No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Document_Date; "Document Date")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Address; CompanyInformation.Address + '' + CompanyInformation."Address 2" + ' ' + CompanyInformation.City)
            {
            }
            column(CompanyInformation_PhoneNo; CompanyInformation."Phone No.")
            {
            }
            column(CompanyInformation_EMail; CompanyInformation."E-Mail")
            {
            }
            column(CompanyInformation_ContactPerson; CompanyInformation."Contact Person")
            {
            }
            column(CompanyInformationCountryCode; CompanyInformation."Country/Region Code")
            {
            }
            column(CompanyCountryName; CompanyCountryName)
            {
            }
            column(CompanyInformation; CompanyInformation."Post Code")
            {
            }
            column(Reference_Invoice_No_; "Reference Invoice No.")
            {
            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Buy_from_Address; "Buy-from Address" + ' ' + "Buy-from Address 2" + ' ' + "Buy-from City" + ' ' + "Buy-from Post Code")
            {
            }
            column(Buy_from_City; "Buy-from City")
            {
            }
            column(Buy_from_Contact; "Buy-from Contact")
            {
            }
            column(Buy_from_Post_Code; "Buy-from Post Code")
            {
            }
            column(Buy_from_Contact_No_; "Buy-from Contact No.")
            {
            }
            column(Buy_from_County; "Buy-from County")
            {
            }
            column(BuyFromState; BuyFromState)
            {
            }
            column(Pay_to_Name; "Pay-to Name")
            {
            }
            column(Vendor_GST_Reg__No_; "Vendor GST Reg. No.")
            {
            }
            column(Pay_to_Address; "Pay-to Address" + ' ' + "Pay-to Address 2" + ' ' + "Pay-to City" + ' ' + "Pay-to Post Code")
            {
            }
            column(Pay_to_Contact; "Pay-to Contact")
            {
            }
            column(Pay_to_Vendor_No_; "Pay-to Vendor No.")
            {
            }
            column(PayToCountryName; PayToCountryName)
            {
            }
            column(PayToVendorGSTIN; PayToVendorGSTIN)
            {
            }
            column(PayToVendorState; PayToVendorState)
            {
            }
            column(Vendor_State; State)
            {
            }
            column(LocationAddress; LocationAddress)
            {
            }
            column(LocationCity; LocationCity)
            {
            }
            column(LocationName; LocationName)
            {
            }
            column(LocationGSTIN; LocationGSTIN)
            {
            }
            column(LocationStateName; LocationStateName)
            {
            }
            column(DocumentType; StrSubstNo(DocumentType, Document))
            {
            }
            column(RefNo; '')
            {
            }
            column(ProjectNumber; ProjectNumber)
            {
            }
            column(ContactEmail; ContactEmail)
            {
            }
            column(ContactName; ContactName)
            {
            }
            column(ContactPhone; ContactPhone)
            {
            }
            column(RoundOff; RoundOff)
            {
            }
            column(NewAmountInWords; NewAmountInWords)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLinkReference = "Purchase Header";
                    DataItemLink = "Document No." = field("No.");
                    DataItemTableView = sorting("Document No.");
                    column(Type_No_; "Purchase Line"."No.")
                    {
                    }
                    column(Sr_No; Sr_No)
                    {
                    }
                    column(LineType; Format(Type, 0, 2))
                    {
                    }
                    column(Description; "Purchase Line".Description + ' ' + "Purchase Line"."Description 2")
                    {
                    }
                    column(Unit_of_Measure_Code; "Purchase Line"."Unit of Measure Code")
                    {
                    }
                    column(Quantity; "Purchase Line".Quantity)
                    {
                    }
                    column(Unit_Cost; "Purchase Line"."Unit Cost")
                    {
                    }
                    column(Line_Amount; "Purchase Line"."Line Amount")
                    {
                    }
                    column(IGSTAmt; IGSTAmt)
                    {
                    }
                    column(SGSTAmt; SGSTAmt)
                    {
                    }
                    column(CGSTAmt; CGSTAmt)
                    {
                    }
                    column(HSN_SAC_Code; "Purchase Line"."HSN/SAC Code")
                    {
                    }
                    column(GST_Group_Code; "Purchase Line"."GST Group Code")
                    {
                    }
                    column(CGSTPercent; CGSTPercent)
                    {
                    }
                    column(SGSTPercent; SGSTPercent)
                    {
                    }
                    column(IGSTPercent; IGSTPercent)
                    {
                    }
                    column(TotalTax; TotalTax)
                    {
                    }
                    column(TotalInvAmount; TotalInvAmount)
                    {
                    }
                    column(TotalInclTaxLine; TotalInclTaxLine)
                    {
                    }
                    column(GST_Jurisdiction_Type; "GST Jurisdiction Type")
                    {
                    }
                    column(NewTotalInvAmount1; NewTotalInvAmount1)
                    {
                    }
                    column(NewTotalInvAmount2; NewTotalInvAmount2)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        IGSTAmt := 0;
                        CGSTAmt := 0;
                        SGSTAmt := 0;
                        IGSTPercent := 0;
                        CGSTPercent := 0;
                        SGSTPercent := 0;
                        TotalTax := 0;
                        TotalInclTaxLine := 0;

                        if "Purchase Line".Type <> "Purchase Line".Type::" " then
                            Sr_No += 1;
                        TaxTransactionValue.Reset();
                        TaxTransactionValue.SetRange("Tax Record ID", "Purchase Line".RecordId);
                        TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                        if TaxTransactionValue.FindSet() then
                            repeat
                                if TaxTransactionValue."Value ID" = 6 then begin
                                    SGSTAmt := Round(TaxTransactionValue.Amount);
                                    SGSTPercent := TaxTransactionValue.Percent;
                                end;
                                if TaxTransactionValue."Value ID" = 2 then begin
                                    CGSTAmt := Round(TaxTransactionValue.Amount);
                                    CGSTPercent := TaxTransactionValue.Percent;
                                end;

                                if TaxTransactionValue."Value ID" = 3 then begin
                                    IGSTAmt := Round(TaxTransactionValue.Amount);
                                    IGSTPercent := TaxTransactionValue.Percent;
                                end;
                            until TaxTransactionValue.Next() = 0;

                        TotalTax := (IGSTAmt + CGSTAmt + SGSTAmt);
                        TotalInclTaxLine := TotalTax + "Purchase Line"."Line Amount";
                        TotalInvAmount += TotalInclTaxLine;

                        NewTotalInvAmount1 := TotalInvAmount;
                        NewTotalInvAmount2 := Round(TotalInvAmount, 1, '=');
                        RoundOff := NewTotalInvAmount2 - NewTotalInvAmount1;

                        ReportCheck.InitTextVariable;
                        ReportCheck.FormatNoText(NoText, NewTotalInvAmount2, '');
                        AmountInWords := DelChr((NoText[1] + ' ' + NoText[2]), '=', '*');
                        NewAmountInWords := UpperCase(AmountInWords);
                    end;
                }
                dataitem("SSE PO Term Details"; "SSE PO Term Details")
                {
                    DataItemLinkReference = "Purchase Header";
                    DataItemLink = "Purchase Order No." = field("No.");
                    DataItemTableView = sorting("Purchase Order No.", "Line No.") order(ascending);
                    column(Purchase_Order_No_; "Purchase Order No.")
                    {
                    }
                    column(PO_Term_Type_Code; "PO Term Type Code")
                    {
                    }
                    column(Term_Details; TermDetails)
                    {
                    }
                    trigger OnAfterGetRecord()
                    var
                        SSEPOTermsDetails: Record "SSE PO Term Details";
                    begin
                        TermDetails := '';

                        CR := 13;
                        LF := 10;
                        SSEPOTermsDetails.Reset();
                        SSEPOTermsDetails.SetRange("Purchase Order No.", "SSE PO Term Details"."Purchase Order No.");
                        SSEPOTermsDetails.SetRange("PO Term Type Code", "SSE PO Term Details"."PO Term Type Code");
                        if SSEPOTermsDetails.FindSet() then
                            repeat
                                TermDetails += SSEPOTermsDetails."Term Details" + CR + LF;
                            until SSEPOTermsDetails.Next() = 0;
                    end;
                }
            }
            trigger OnAfterGetRecord()
            begin
                CompanyCountryName := '';
                CompanyCountryName := '';
                LocationName := '';
                LocationAddress := '';
                LocationCity := '';
                LocationGSTIN := '';
                LocationStateName := '';
                BuyFromState := '';
                PayToCountryName := '';
                ContactEmail := '';
                ContactName := '';
                PaytoVendorGSTIN := '';
                PayToVendorState := '';

                if "AXT Workflow Sub Document Type" = "AXT Workflow Sub Document Type"::WorkOrder then
                    Document := 'Service Order'
                else
                    Document := 'Purchase Order';

                if "Purchase Header"."Currency Code" = '' then
                    "Currency Code" := GlSetup."LCY Code";

                if Country.get(CompanyInformation."Country/Region Code") then
                    CompanyCountryName := Country.Name;

                if Location.Get("Location Code") then begin
                    LocationName := Location.Name;
                    LocationAddress := Location.Address + ' ' + Location."Address 2";
                    LocationCity := Location.City + '-' + Location."Post Code";
                    LocationGSTIN := Location."GST Registration No.";
                    if States.Get(Location."State Code") then
                        LocationStateName := States.Description;
                end;
                if States.Get(State) then
                    BuyFromState := States.Description;

                if Country.Get("Pay-to Country/Region Code") then
                    PayToCountryName := Country.Name;
                if Contacts.get("Pay-to Contact No.") then begin
                    ContactName := Contacts.Name;
                    ContactEmail := Contacts."E-Mail";
                    ContactPhone := Contacts."Mobile Phone No.";
                    if ContactPhone = '' then
                        ContactPhone := Contacts."Phone No.";
                end;
                if Vendor.get("Pay-to Vendor No.") then begin
                    PaytoVendorGSTIN := Vendor."GST Registration No.";
                    if States.get(Vendor."State Code") then
                        PayToVendorState := States.Description;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Sr_No := 0;
                IGSTAmt := 0;
                CGSTAmt := 0;
                SGSTAmt := 0;
                IGSTPercent := 0;
                CGSTPercent := 0;
                SGSTPercent := 0;
                TotalTax := 0;
                TotalInclTaxLine := 0;
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
                group(GroupName)
                {

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        GSTSetup.Get();
        GlSetup.Get();
        CompanyInformation.get();
    end;

    var
        Sr_No: Integer;
        TotalTax: Decimal;
        RoundOff: Decimal;
        PayToVendorGSTIN: Code[20];
        PayToVendorState: Text[50];
        ProjectNumber: Text;
        CR: Char;
        LF: Char;
        NewTotalInvAmount1: Decimal;
        NewTotalInvAmount2: Decimal;
        ContactName: Text[100];
        ContactPhone: Text[30];
        ContactEmail: Text[80];
        NewAmountInWords: Text;
        PayToCountryName: Text[100];
        CompanyCountryName: Text[50];
        TotalInclTaxLine: Decimal;
        TotalInvAmount: Decimal;
        TermDetails: Text;
        BuyFromState: Text[50];
        Document: Text[30];
        RefNo: Text;
        LocationName: Text[100];
        LocationAddress: Text[200];
        LocationCity: Text[60];
        LocationGSTIN: Code[20];
        LocationStateName: Text[50];
        BillToName: Text[100];
        BillToAddress: Text;
        BillToCountry: Text;
        BillToPostCode: Text;
        BillToState: Text;
        BillToGSTIN: Code[20];
        DocumentType: Label '%1';
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        CGSTAmt: Decimal;
        SGSTPercent: Decimal;
        IGSTPercent: Decimal;
        CGSTPercent: Decimal;
        NOText: array[2] of Text;
        AmountInWords: text;
        States: Record State;
        Contacts: Record Contact;
        Vendor: Record Vendor;
        Location: Record Location;
        PurchaseOrderGST: Report "Purchase Order GST";
        TaxTransactionValue: Record "Tax Transaction Value";
        GSTSetup: Record "GST Setup";
        ReportCheck: Report "Check Report";
        GlSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        Country: Record "Country/Region";
}