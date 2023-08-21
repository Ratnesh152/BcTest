xmlport 50008 "PI Uploader"
{
    // version SE1.40

    Direction = Import;
    FieldSeparator = '<TAB>';
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
                UseTemporary = true;
                textelement(Company_Name)
                {
                }
                textelement(Vendor_No)
                {
                }
                textelement(Posting_Date)
                {
                }
                textelement(Document_Date)
                {
                }
                textelement(Due_Date)
                {
                }
                textelement(Vendor_Invoice_No)
                {
                }
                textelement(Location_Code)
                {
                }
                textelement(Structure_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(Link_Path)
                {
                    MinOccurs = Zero;
                }
                textelement(Line_Type)
                {
                }
                textelement(Line_No)
                {
                }
                textelement(Line_Description)
                {
                }
                textelement(Unit_Of_Measure_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(Line_Quentity)
                {
                }
                textelement(Direct_Unit_Cost)
                {
                }
                textelement(Description_2)
                {
                    MinOccurs = Zero;
                }
                textelement(GST_Group_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(HSN_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(TDS_Neature_Of_Deduction)
                {
                    MinOccurs = Zero;
                }
                textelement(GST_Group_Type)
                {
                    MinOccurs = Zero;
                }
                textelement(GST_Credit)
                {
                    MinOccurs = Zero;
                }
                textelement(Project_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(Department_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(Employee_Code)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                begin
                    Integer.DELETEALL;
                    IF FirstLine THEN BEGIN
                        FirstLine := FALSE;
                        currXMLport.SKIP;
                    END;
                    CreatePILines();
                end;
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        MESSAGE('File %1 Uploaded Successfully.', currXMLport.FILENAME);
    end;

    trigger OnPreXmlPort()
    begin
        FirstLine := TRUE;
        PIUploader.RESET;
        PIUploader.SETCURRENTKEY("Document ID");
        IF PIUploader.FINDLAST THEN
            LastDOCID := PIUploader."Document ID";
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
        IF VINV <> Company_Name + Vendor_Invoice_No THEN BEGIN
            VINV := Company_Name + Vendor_Invoice_No;
            LastDOCID := LastDOCID + 1;
        END;
        PIUploader.VALIDATE("Document ID", LastDOCID);

        PIUploader.VALIDATE(Location, Location_Code);
        IF Structure_Code <> '' THEN
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
        PIUploader.TESTFIELD("Company Name");
        PIUploader.TESTFIELD("Vendor No.");
        PIUploader.TESTFIELD("Posting Date");
        PIUploader.TESTFIELD("Document Date");
        PIUploader.TESTFIELD("Due Date");
        PIUploader.TESTFIELD(Location);
        PIUploader.TESTFIELD(Type);
        // PIUploader.TESTFIELD("No.");
        PIUploader.TESTFIELD(Quantity);
        PIUploader.TESTFIELD("Direct Unit Cost Exc Tax");
        PIUploader.TESTFIELD("Vendor Invoice No.");
    end;
}

