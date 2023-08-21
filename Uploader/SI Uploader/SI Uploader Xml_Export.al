xmlport 50012 "SI Uploader Export"
{

    Direction = Export;
    FieldSeparator = '<TAB>';
    FileName = 'SI Uploader.csv';
    format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF8;
    UseRequestPage = false;
    schema
    {
        textelement(root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'SIUploader';
                SourceTableView = sorting(Number) order(ascending) where(Number = filter(1));
                textelement(Customer_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Customer_No := 'Customer No.';
                    end;
                }
                textelement(Posting_Date)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Posting_Date := 'Posting Date';
                    end;
                }
                textelement(External_Doc_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        External_Doc_No := 'External Document No.';
                    end;
                }
                textelement(Location_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Location_Code := 'Location Code';
                    end;
                }
                textelement(Line_Type)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Line_Type := 'Type';
                    end;
                }
                textelement(Line_No)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Line_No := 'No.';
                    end;
                }
                textelement(Line_Description)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Line_Description := 'Description';
                    end;
                }
                textelement(Unit_Of_Measure_Code)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Unit_Of_Measure_Code := 'Unit of Measure';
                    end;
                }
                textelement(Line_Quentity)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Line_Quentity := 'Quantity';
                    end;
                }
                textelement(Unit_Price)
                {
                    trigger OnBeforePassVariable()
                    begin
                        Unit_Price := 'Unit Price';
                    end;
                }
                textelement(GST_Group_Code)
                {
                    MinOccurs = Zero;
                    trigger OnBeforePassVariable()
                    begin
                        GST_Group_Code := 'GST Group Code';
                    end;
                }
                textelement(HSN_Code)
                {
                    MinOccurs = Zero;
                    trigger OnBeforePassVariable()
                    begin
                        HSN_Code := 'HSN Code';
                    end;
                }
                textelement(GST_Group_Type)
                {
                    MinOccurs = Zero;
                    trigger OnBeforePassVariable()
                    begin
                        GST_Group_Type := 'GST Group Type';
                    end;
                }
                textelement(Department_Code)
                {
                    MinOccurs = Zero;
                    trigger OnBeforePassVariable()
                    begin
                        Department_Code := 'Department Code';
                    end;
                }
                textelement(Cost_Center)
                {
                    MinOccurs = Zero;
                    trigger OnBeforePassVariable()
                    begin
                        Cost_Center := 'Cost Center';
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