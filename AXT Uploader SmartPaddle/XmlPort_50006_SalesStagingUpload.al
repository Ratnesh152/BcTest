xmlport 50006 "AXT Sales Staging Uploader"
{
    Format = VariableText;
    FieldSeparator = '<TAB>';
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    Direction = Import;
    UseRequestPage = false;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(AXTSalesStagingUpload; "AXT Sales Staging Upload")
            {
                XmlName = 'SalesStagingUploader';
                fieldelement(SourceSystem; AXTSalesStagingUpload."Source System") { }
                fieldelement(CompanyCode; AXTSalesStagingUpload."Company Code") { }
                fieldelement(SalesDocumentType; AXTSalesStagingUpload."Sales Document Type") { }
                fieldelement(SalesDocumentNo; AXTSalesStagingUpload."Sales Document No.") { }
                fieldelement(LineNo; AXTSalesStagingUpload."Line No.") { }
                fieldelement(CustomerNo; AXTSalesStagingUpload."Customer No.") { }
                fieldelement(CustomerName; AXTSalesStagingUpload."Customer Name") { }
                fieldelement(CustomerEmail; AXTSalesStagingUpload."Customer Email") { }
                fieldelement(CustomerPhoneNo; AXTSalesStagingUpload."Customer Phone No.") { }
                fieldelement(CustomerGSTRegistrationNo; AXTSalesStagingUpload."Customer GST Registration No.") { }
                fieldelement(ShiptoAddress; AXTSalesStagingUpload."Ship-to Address") { }
                fieldelement(ShiptoAddress2; AXTSalesStagingUpload."Ship-to Address2") { }
                fieldelement(ShiptoCity; AXTSalesStagingUpload."Ship-to City") { }
                fieldelement(ShiptoPostCode; AXTSalesStagingUpload."Ship-to Post Code") { }
                fieldelement(ShiptoStateCode; AXTSalesStagingUpload."Ship-to State Code") { }
                fieldelement(PostingDate; AXTSalesStagingUpload."Posting Date") { }
                fieldelement(LocationCode; AXTSalesStagingUpload."Location Code") { }
                fieldelement(CurrencyCode; AXTSalesStagingUpload."Currency Code") { }
                fieldelement(POSOutofIndia; AXTSalesStagingUpload."POS Out of India") { }
                fieldelement(BillofExportNo; AXTSalesStagingUpload."Bill of Export No.") { }
                fieldelement(BillofExportDate; AXTSalesStagingUpload."Bill of Export Date") { }
                fieldelement(GSTwithoutPaymentofDuty; AXTSalesStagingUpload."GST without Payment of Duty") { }
                fieldelement(BranchDimensionCode; AXTSalesStagingUpload."Branch Dimension Code") { }
                fieldelement(RegionDimensionCode; AXTSalesStagingUpload."Region Dimension Code") { }
                fieldelement(Type; AXTSalesStagingUpload."Type") { }
                fieldelement(ProductServiceNo; AXTSalesStagingUpload."Product Service No.") { }
                fieldelement(Quantity; AXTSalesStagingUpload.Quantity) { }
                fieldelement(UnitofMeasure; AXTSalesStagingUpload."Unit of Measure") { }
                fieldelement(UnitPrice; AXTSalesStagingUpload."Unit Price") { }
                fieldelement(AmountExclGST; AXTSalesStagingUpload."Amount Excl. GST") { }
                fieldelement(GST; AXTSalesStagingUpload."GST %") { }
                fieldelement(CGSTAmount; AXTSalesStagingUpload."CGST Amount") { }
                fieldelement(SGSTAmount; AXTSalesStagingUpload."SGST Amount") { }
                fieldelement(IGSTAmount; AXTSalesStagingUpload."IGST Amount") { }
                fieldelement(HSNSACCode; AXTSalesStagingUpload."HSN SAC Code") { }
                fieldelement(GSTGroupCode; AXTSalesStagingUpload."GST Group Code") { }
                fieldelement(IsDebitNote; AXTSalesStagingUpload."Is Debit Note") { }
                fieldelement(OriginalInvNo; AXTSalesStagingUpload."Original Inv. No.") { }
                fieldelement(Shipmentid; AXTSalesStagingUpload."Shipment id") { }
                fieldelement(CurrencyExchangeRate; AXTSalesStagingUpload."Currency Exchange Rate") { }
                fieldelement(SalesInvoiceNo; AXTSalesStagingUpload."Sales Invoice No.") { }
                fieldelement(BatchNo; AXTSalesStagingUpload."Batch No.") { }
                fieldelement(PurchaseReference; AXTSalesStagingUpload."Purchase Reference") { }
                fieldelement(PurchaseDocumentDate; AXTSalesStagingUpload."Purchase Document Date") { }
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        MESSAGE('File %1 Uploaded Successfully.', currXMLport.FILENAME);
    end;
}
