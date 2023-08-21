xmlport 50007 "AXT Purch. Doc. Staging Upload"
{
    Direction = Import;
    FieldSeparator = '<TAB>';
    Caption = 'AXT Purchase Document Staging Uploader';
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(AXTPurchDocStagingUpload; "AXT Purch. Doc. Staging Upload")
            {
                XmlName = 'PurchaseDocumentStagingUploader';
                fieldelement(SourceSystem; AXTPurchDocStagingUpload."Source System") { }
                fieldelement(CompanyCode; AXTPurchDocStagingUpload."Company Code") { }
                fieldelement(PurchaseDocumentType; AXTPurchDocStagingUpload."Purchase Document Type") { }
                fieldelement(PurchaseDocumentNo; AXTPurchDocStagingUpload."Purchase Document No.") { }
                fieldelement(LineNo; AXTPurchDocStagingUpload."Line No.") { }
                fieldelement(VendorNo; AXTPurchDocStagingUpload."Vendor No.") { }
                fieldelement(NatureofTransaction; AXTPurchDocStagingUpload."Nature of Transaction") { }
                fieldelement(VendorInvCMDNNo; AXTPurchDocStagingUpload."Vendor Inv CMDN No.") { }
                fieldelement(PurchaseInvoiceNo; AXTPurchDocStagingUpload."Purchase Invoice No.") { }
                fieldelement(ShipmentID; AXTPurchDocStagingUpload."Shipment ID") { }
                fieldelement(OriginalInvoiceNo; AXTPurchDocStagingUpload."Original Invoice No.") { }
                fieldelement(PostingDate; AXTPurchDocStagingUpload."Posting Date") { }
                fieldelement(DueDate; AXTPurchDocStagingUpload."Due Date") { }
                fieldelement(DocumentDate; AXTPurchDocStagingUpload."Document Date") { }
                fieldelement(LocationCode; AXTPurchDocStagingUpload."Location Code") { }
                fieldelement(CurrencyCode; AXTPurchDocStagingUpload."Currency Code") { }
                fieldelement(CurrencyRate; AXTPurchDocStagingUpload."Currency Rate") { }
                fieldelement(OrderAddressCode; AXTPurchDocStagingUpload."Order Address Code") { }
                fieldelement(InvoiceDiscountAmount; AXTPurchDocStagingUpload."Invoice Discount Amount") { }
                fieldelement(BranchDimension; AXTPurchDocStagingUpload."Branch Dimension") { }
                fieldelement(DepartmentDimension; AXTPurchDocStagingUpload."Department Dimension") { }
                fieldelement(RegionDimension; AXTPurchDocStagingUpload."Region Dimension") { }
                fieldelement(Comment; AXTPurchDocStagingUpload.Comment) { }
                fieldelement(IsDebitNote; AXTPurchDocStagingUpload."Is Debit Note") { }
                fieldelement(Type; AXTPurchDocStagingUpload."Type") { }
                fieldelement(ProductServiceNo; AXTPurchDocStagingUpload."Product Service No.") { }
                fieldelement(Quantity; AXTPurchDocStagingUpload.Quantity) { }
                fieldelement(UnitOfMeasure; AXTPurchDocStagingUpload."Unit Of Measure") { }
                fieldelement(DirectUnitCost; AXTPurchDocStagingUpload."Direct Unit Cost") { }
                fieldelement(LineDiscountAmount; AXTPurchDocStagingUpload."Line Discount Amount") { }
                fieldelement(TDSSection; AXTPurchDocStagingUpload."TDS Section") { }
                fieldelement(GSTGroupCode; AXTPurchDocStagingUpload."GST Group Code") { }
                fieldelement(HSNSACCode; AXTPurchDocStagingUpload."HSN/SAC Code") { }
                fieldelement(GSTAssessableValue; AXTPurchDocStagingUpload."GST Assessable Value") { }
                fieldelement(CustomDutyAmount; AXTPurchDocStagingUpload."Custom Duty Amount") { }
                fieldelement(Exempted; AXTPurchDocStagingUpload.Exempted) { }
                fieldelement(GSTCredit; AXTPurchDocStagingUpload."GST Credit") { }
                fieldelement(GSTPercentage; AXTPurchDocStagingUpload."GST Percentage") { }
                fieldelement(CGSTAmount; AXTPurchDocStagingUpload."CGST Amount") { }
                fieldelement(SGSTAmount; AXTPurchDocStagingUpload."SGST Amount") { }
                fieldelement(IGSTAmount; AXTPurchDocStagingUpload."IGST Amount") { }
                fieldelement(BranchLineDimension; AXTPurchDocStagingUpload."Branch Line Dimension") { }
                fieldelement(DepartmentLineDimension; AXTPurchDocStagingUpload."Department Line Dimension") { }
                fieldelement(RegionLineDimension; AXTPurchDocStagingUpload."Region Line Dimension") { }
                fieldelement(TDSAmount; AXTPurchDocStagingUpload."TDS Amount") { }
                fieldelement(ProductServiceDescription; AXTPurchDocStagingUpload."Product Service Description") { }
                fieldelement(AmountExclGST; AXTPurchDocStagingUpload."Amount Excl. GST") { }
                fieldelement(BCTaxCalcRequired; AXTPurchDocStagingUpload."BC Tax Calc. Required") { }
                fieldelement(PaymentReferenceNo; AXTPurchDocStagingUpload."Payment Reference No.") { }
                fieldelement(BatchNo; AXTPurchDocStagingUpload."Batch No.") { }
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        MESSAGE('File %1 Uploaded Successfully.', currXMLport.FILENAME);
    end;
}
