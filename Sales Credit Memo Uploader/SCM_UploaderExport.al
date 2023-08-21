xmlport 50001 "SCM Uploader Export"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    FileName = 'SCM Uploader Export.csv';
    FormatEvaluate = Legacy;
    Format = VariableText;
    TextEncoding = UTF16;
    UseRequestPage = false;
    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'SCMUploader';
                SourceTableView = sorting(Number) order(ascending) where(Number = filter(1));
                textelement(Source_System)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Source_System := 'Source System';
                    end;
                }
                textelement(Company_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Company_Code := 'Company Code';
                    end;
                }
                textelement(Customer_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Customer_No := 'Customer No';
                    end;
                }
                textelement(Sales_Document_Type)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Sales_Document_Type := 'Sales Document Type';
                    end;
                }
                textelement(Is_Debit_Note)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Is_Debit_Note := 'Is Debit Note';
                    end;
                }
                textelement(Sales_Document_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Sales_Document_No := 'Sales Document No';
                    end;
                }
                textelement(Ship_To_Address)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Ship_To_Address := 'Ship to Address';
                    end;
                }
                textelement(Ship_To_Address_2)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Ship_To_Address_2 := 'Ship to Address 2';
                    end;
                }
                textelement(Ship_To_City)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Ship_To_City := 'Ship to City';
                    end;
                }
                textelement(Ship_To_Post_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Ship_To_Post_Code := 'Ship to Post Code';
                    end;
                }
                textelement(Ship_To_State_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Ship_To_State_Code := 'Ship to State Code';
                    end;
                }
                textelement(Posting_Date)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Posting_Date := 'Posting Date';
                    end;
                }
                textelement(Location_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Location_Code := 'Location Code';
                    end;
                }
                textelement(Currency_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Currency_Code := 'Currency Code';
                    end;
                }
                textelement(Bill_To_Export_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Bill_To_Export_No := 'Bill To Export No';
                    end;
                }
                textelement(Bill_To_Export_Date)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Bill_To_Export_Date := 'Bill to Export Date';
                    end;
                }
                textelement(GST_Without_Payment_Of_Duty)
                {
                    trigger OnBeforePassVariable()
                    begin
                        GST_Without_Payment_Of_Duty := 'GST Without Payment of Duty';
                    end;
                }
                textelement(Branch_Dimension)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Branch_Dimension := 'Branch Dimension';
                    end;
                }
                textelement(Department_Dimension)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Department_Dimension := 'Department Dimension';
                    end;
                }
                textelement(Region_Dimension)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Region_Dimension := 'Region Dimension';
                    end;
                }
                textelement(Original_Inv_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Original_Inv_No := 'Original Inv No';
                    end;
                }
                textelement(Shipment_Id)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Shipment_Id := 'Shipment Id';
                    end;
                }
                textelement(Line_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Line_No := 'Line No';
                    end;
                }
                textelement(Type)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Type := 'Type';
                    end;
                }
                textelement(Product_Service_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Product_Service_No := 'Product Service No';
                    end;
                }
                textelement(Quantity)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Quantity := 'Quantity';
                    end;
                }
                textelement(Unit_Of_Measure)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Unit_Of_Measure := 'Unit of Measure';
                    end;
                }
                textelement(Unit_Price)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Unit_Price := 'Unit Price';
                    end;
                }
                textelement(Amount_Excl_GST)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Amount_Excl_GST := 'Amount Excl GST';
                    end;
                }
                textelement(GST_Percentage)
                {
                    trigger OnBeforePassVariable()
                    begin
                        GST_Percentage := 'GST Percentage';
                    end;
                }
                textelement(CGST_Amount)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CGST_Amount := 'CGST Amount';
                    end;
                }
                textelement(SGST_Amount)
                {
                    trigger OnBeforePassVariable()
                    begin
                        SGST_Amount := 'SGST Amount';
                    end;
                }
                textelement(IGST_Amount)
                {
                    trigger OnBeforePassVariable()
                    begin
                        IGST_Amount := 'IGST Amount';
                    end;
                }
                textelement(HSN_SAC_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        HSN_SAC_Code := 'HSN/SAC Code';
                    end;
                }
                textelement(GST_Group_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        GST_Group_Code := 'GST Group Code';
                    end;
                }
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        Message('%1 Exported Successfully', currXMLport.Filename);
    end;
}
