xmlport 50009 "PI Uploader-Export Template"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    FileName = 'PI_Uploader.csv';
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;
    schema
    {
        textelement(root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'PIUploader';
                SourceTableView = SORTING(Number)
                                  ORDER(Ascending)
                                  WHERE(Number = FILTER(1));
                textelement(Company_Name)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Company_Name := 'Company Name';
                    end;
                }
                textelement(Vendor_No)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Vendor_No := 'Vendor No.';
                    end;
                }
                textelement(Posting_Date)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Posting_Date := 'Posting Date';
                    end;
                }
                textelement(Document_Date)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Document_Date := 'Document Date';
                    end;
                }
                textelement(Due_Date)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Due_Date := 'Due Date';
                    end;
                }
                textelement(Vendor_Invoice_No)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Vendor_Invoice_No := 'Vendor Invoice No.';
                    end;
                }
                textelement(Location_Code)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Location_Code := 'Location Code';
                    end;
                }
                textelement(Structure_Code)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Structure_Code := 'Structure Code';
                    end;
                }
                textelement(Link_Path)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Link_Path := 'Link Path';
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
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Unit_Of_Measure_Code := 'Unit of Mesasure Code';
                    end;
                }
                textelement(Line_Quentity)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Line_Quentity := 'Quantity';
                    end;
                }
                textelement(Direct_Unit_Cost)
                {

                    trigger OnBeforePassVariable()
                    begin
                        Direct_Unit_Cost := 'Direct Unit Cost';
                    end;
                }
                textelement(Description_2)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Description_2 := 'Description 2';
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
                textelement(TDS_Neature_Of_Deduction)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        TDS_Neature_Of_Deduction := 'TDS Nature of Deduction';
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
                textelement(GST_Credit)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        GST_Credit := 'GST Credit';
                    end;
                }
                textelement(Project_Code)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Project_Code := 'Project Code';
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
                textelement(Employee_Code)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassVariable()
                    begin
                        Employee_Code := 'Employee Code';
                    end;
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        MESSAGE('File %1 Uploaded Template Exprot Successfully.', currXMLport.FILENAME);
    end;

    var
        FirstLine: Boolean;
        PIUploader: Record 50020;
        PDate: Date;
        DDate: Date;
        DueDate: Date;
        Qty: Decimal;
        UCost: Decimal;
        VINV: Text;
        LastDOCID: Integer;

    local procedure CreatePILines()
    begin
        PIUploader.INIT;
        PIUploader."Entry ID" := CREATEGUID;
        PIUploader.VALIDATE("Company Name", Company_Name);
        PIUploader.VALIDATE("Vendor No.", Vendor_No);

        EVALUATE(PDate, Posting_Date);
        PIUploader.VALIDATE("Posting Date", PDate);

        EVALUATE(DDate, Document_Date);
        PIUploader.VALIDATE("Document Date", DDate);

        EVALUATE(DueDate, Due_Date);
        PIUploader.VALIDATE("Due Date", DueDate);

        PIUploader.VALIDATE("Vendor Invoice No.", Vendor_Invoice_No);
        IF VINV <> Vendor_Invoice_No THEN BEGIN
            VINV := Vendor_Invoice_No;
            LastDOCID := LastDOCID + 1;
        END;
        PIUploader.VALIDATE("Document ID", LastDOCID);

        PIUploader.VALIDATE(Location, Location_Code);
        PIUploader.VALIDATE(Structure, Structure_Code);
        PIUploader.VALIDATE("Link Path", Link_Path);

        EVALUATE(PIUploader.Type, Line_Type);

        PIUploader.VALIDATE("No.", Line_No);
        PIUploader.VALIDATE(Description, Line_Description);
        PIUploader.VALIDATE("Unit Of Measure Code", Unit_Of_Measure_Code);

        EVALUATE(Qty, Line_Quentity);
        PIUploader.VALIDATE(Quantity, Qty);

        EVALUATE(UCost, Direct_Unit_Cost);
        PIUploader.VALIDATE("Direct Unit Cost Exc Tax", UCost);

        PIUploader.VALIDATE("Description 2", Description_2);
        PIUploader.VALIDATE("GST Group Code", GST_Group_Code);
        PIUploader.VALIDATE("HSN Code", HSN_Code);
        PIUploader.VALIDATE("TDS Nature Of Deduction", TDS_Neature_Of_Deduction);

        EVALUATE(PIUploader."GST Group Type", GST_Group_Type);

        EVALUATE(PIUploader."GST Credit", GST_Credit);

        PIUploader.VALIDATE("Project Code", Project_Code);
        PIUploader.VALIDATE("Department Code", Department_Code);
        PIUploader.VALIDATE("Employee Code", Employee_Code);

        PIUploader.INSERT;
    end;
}

