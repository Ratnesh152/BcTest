xmlport 50003 "Sales Staging Uploader"
{
    Direction = Import;
    FieldSeparator = '<TAB>';
    UseRequestPage = false;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    schema
    {
        textelement(root)
        {
            XmlName = 'SalesStagingUploader';
            tableelement(Integer; Integer)
            {
                textelement(Source_System) { }
                textelement(Company_Code) { }
                textelement(Sales_Document_Type) { }
                textelement(Sales_Document_No) { }
                textelement(Line_No) { }
                textelement(Customer_No) { }
                textelement(Customer_Name) { }
                textelement(Customer_Email) { }
                textelement(Customer_Phone_No) { }
                textelement(Customer_GST_Registration_No) { }
                textelement(Ship_to_Address) { }
                textelement(Ship_to_Address2) { }
                textelement(Ship_to_City) { }
                textelement(Ship_to_Post_Code) { }
                textelement(Ship_to_State_Code) { }
                textelement(Posting_Date) { }
                textelement(Location_Code) { }
                textelement(Currency_Code) { }
                textelement(POS_Out_of_India) { }
                textelement(Bill_of_Export_No) { }
                textelement(Bill_of_Export_Date) { }
                textelement(GST_without_Payment_of_Duty) { }
                textelement(Branch_Dimension_Code) { }
                textelement(Region_Dimension_Code) { }
                textelement(Type) { }
                textelement(Product_Service_No) { }
                textelement(Quantity) { }
                textelement(Unit_of_Measure) { }
                textelement(Unit_Price) { }
                textelement(Amount_Excl_GST) { }
                textelement(GST_) { }
                textelement(CGST_Amount) { }
                textelement(SGST_Amount) { }
                textelement(IGST_Amount) { }
                textelement(HSN_SAC_Code) { }
                textelement(GST_Group_Code) { }
                textelement(Is_Debit_Note) { }
                textelement(Original_Inv_No) { }
                textelement(Shipment_id) { }
                textelement(Currency_Exchange_Rate) { }
                textelement(Sales_Invoice_No) { }
                textelement(Batch_No) { }
                textelement(Purchase_Reference) { }
                textelement(Purchase_Document_Date) { }
                trigger OnBeforeInsertRecord()
                begin
                    Integer.DeleteAll();
                    CreateSalesStagingUploaderLines();
                end;
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        Message('FIle %1 Uploaded Successfully.', currXMLport.Filename);
    end;

    var
        SalesStagingUpload: Record "AXT Sales Staging Upload";
        AmountExclGST: Decimal;
        BillToExportDate: Date;
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAMt: Decimal;
        CurrExchRate: Decimal;
        GSTPercent: Decimal;
        IsDebitNote: Boolean;
        LineNo: Integer;
        POSOutOfIndia: Boolean;
        PostingDate: Date;
        GSTwithoutPaymentofDuty: Boolean;
        SalesDocumentDate: date;
        Qty: Decimal;
        ShipmentId: Integer;
        UnitPrice: Decimal;

    local procedure CreateSalesStagingUploaderLines()
    begin
        SalesStagingUpload.Init();
        Evaluate(SalesStagingUpload."Source System", Source_System);
        SalesStagingUpload.Validate("Company Code", Company_Code);
        SalesStagingUpload.Validate("Sales Document Type", Sales_Document_Type);
        SalesStagingUpload.Validate("Sales Document No.", Sales_Document_No);
        Evaluate(LineNo, Line_No);
        SalesStagingUpload.Validate("Line No.", LineNo);
        SalesStagingUpload.Validate("Customer No.", Customer_No);
        SalesStagingUpload.Validate("Customer Name", Customer_Name);
        SalesStagingUpload.Validate("Customer Email", Customer_Email);
        SalesStagingUpload.Validate("Customer Phone No.", Customer_Phone_No);
        SalesStagingUpload.Validate("Customer GST Registration No.", Customer_GST_Registration_No);
        SalesStagingUpload.Validate("Ship-to Address", Ship_to_Address);
        SalesStagingUpload.Validate("Ship-to Address2", Ship_to_Address2);
        SalesStagingUpload.Validate("Ship-to City", Ship_to_City);
        SalesStagingUpload.Validate("Ship-to Post Code", Ship_to_Post_Code);
        SalesStagingUpload.Validate("Ship-to State Code", Ship_to_State_Code);
        Evaluate(PostingDate, Posting_Date);
        SalesStagingUpload.Validate("Posting Date", PostingDate);
        SalesStagingUpload.Validate("Location Code", Location_Code);
        SalesStagingUpload.Validate("Currency Code", Currency_Code);
        Evaluate(POSOutOfIndia, POS_Out_of_India);
        SalesStagingUpload.Validate("POS Out of India", POSOutOfIndia);
        SalesStagingUpload.Validate("Bill of Export No.", Bill_of_Export_No);
        Evaluate(BillToExportDate, Bill_of_Export_Date);
        SalesStagingUpload.Validate("Bill of Export Date", BillToExportDate);
        SalesStagingUpload.Validate("GST without Payment of Duty", GSTwithoutPaymentofDuty);
        SalesStagingUpload.Validate("Branch Dimension Code", Branch_Dimension_Code);
        SalesStagingUpload.Validate("Region Dimension Code", Region_Dimension_Code);
        Evaluate(SalesStagingUpload.Type, Type);
        SalesStagingUpload.Validate("Product Service No.", Product_Service_No);
        Evaluate(Qty, Quantity);
        SalesStagingUpload.Validate(Quantity, Qty);
        SalesStagingUpload.Validate("Unit of Measure", Unit_of_Measure);
        Evaluate(UnitPrice, Unit_Price);
        SalesStagingUpload.Validate("Unit Price", UnitPrice);
        Evaluate(AmountExclGST, Amount_Excl_GST);
        SalesStagingUpload.Validate("Amount Excl. GST", AmountExclGST);
        Evaluate(GSTPercent, GST_);
        SalesStagingUpload.Validate("GST %", GSTPercent);
        Evaluate(CGSTAmt, CGST_Amount);
        SalesStagingUpload.Validate("CGST Amount", CGSTAmt);
        Evaluate(SGSTAmt, SGST_Amount);
        SalesStagingUpload.Validate("SGST Amount", SGSTAmt);
        Evaluate(IGSTAMt, IGST_Amount);
        SalesStagingUpload.Validate("IGST Amount", IGSTAMt);
        SalesStagingUpload.Validate("HSN SAC Code", HSN_SAC_Code);
        SalesStagingUpload.Validate("GST Group Code", GST_Group_Code);
        Evaluate(IsDebitNote, Is_Debit_Note);
        Evaluate(GSTwithoutPaymentofDuty, GST_without_Payment_of_Duty);
        SalesStagingUpload.Validate("Is Debit Note", IsDebitNote);
        SalesStagingUpload.Validate("Original Inv. No.", Original_Inv_No);
        Evaluate(ShipmentId, Shipment_id);
        SalesStagingUpload.Validate("Shipment id", ShipmentId);
        Evaluate(CurrExchRate, Currency_Exchange_Rate);
        SalesStagingUpload.Validate("Currency Exchange Rate", CurrExchRate);
        SalesStagingUpload.Validate("Sales Invoice No.", Sales_Invoice_No);
        SalesStagingUpload.Validate("Batch No.", Batch_No);
        SalesStagingUpload.Validate("Purchase Reference", Purchase_Reference);
        Evaluate(SalesDocumentDate, Purchase_Document_Date);
        SalesStagingUpload.Validate("Purchase Document Date", SalesDocumentDate);
    end;
}