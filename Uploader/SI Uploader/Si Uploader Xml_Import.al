xmlport 50011 "SI Uploader Import"
{
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
                XmlName = 'SIUploader';
                UseTemporary = true;
                textelement(Customer_No)
                {
                }
                textelement(Posting_Date)
                {
                }
                textelement(External_Doc_No)
                {
                }
                textelement(Location_Code)
                {
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
                textelement(Unit_Price)
                {
                }
                textelement(GST_Group_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(HSN_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(GST_Group_Type)
                {
                    MinOccurs = Zero;
                }
                textelement(Department_Code)
                {
                    MinOccurs = Zero;
                }
                textelement(Cost_Center)
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
                    CreateSILines();
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
        SIUploader.RESET;
        SIUploader.SETCURRENTKEY("Document ID");
        IF SIUploader.FINDLAST THEN
            LastDOCID := SIUploader."Document ID";
    end;

    var
        FirstLine: Boolean;
        SIUploader: Record 50021;
        PDate: Date;
        Quantity: Decimal;
        UnitPrice: Decimal;
        SInv: Text;
        LastDOCID: Integer;

    local procedure CreateSILines()
    begin
        SIUploader.INIT;
        SIUploader."Entry ID" := CREATEGUID;
        SIUploader.VALIDATE("Customer No.", Customer_No);

        EVALUATE(PDate, Posting_Date);
        SIUploader.VALIDATE("Posting Date", PDate);

        SIUploader.VALIDATE("External Doccument No.", External_Doc_No);
        if SInv <> Customer_No + External_Doc_No then begin
            SInv := Customer_No + External_Doc_No;
            LastDOCID += 1;
        end;
        SIUploader.VALIDATE("Document ID", LastDOCID);
        SIUploader.VALIDATE(Location, Location_Code);

        EVALUATE(SIUploader.Type, Line_Type);
        SIUploader.VALIDATE("No.", Line_No);
        SIUploader.VALIDATE(Description, Line_Description);
        SIUploader.VALIDATE("Unit Of Measure Code", Unit_Of_Measure_Code);

        EVALUATE(Quantity, Line_Quentity);
        SIUploader.VALIDATE(Quantity, Quantity);

        EVALUATE(UnitPrice, Unit_Price);
        SIUploader.VALIDATE("Unit Price", UnitPrice);
        SIUploader.VALIDATE("GST Group Code", GST_Group_Code);
        SIUploader.VALIDATE("HSN Code", HSN_Code);

        EVALUATE(SIUploader."GST Group Type", GST_Group_Type);
        SIUploader.VALIDATE("Department Code", Department_Code);
        SIUploader.Validate("Cost Center", Cost_Center);
        SIUploader.INSERT;

        SIUploader.TESTFIELD("Customer No.");
        SIUploader.TESTFIELD("Posting Date");
        SIUploader.TESTFIELD(Location);
        SIUploader.TESTFIELD(Type);
        SIUploader.TESTFIELD(Quantity);
        SIUploader.TESTFIELD("Unit Price");
        SIUploader.TESTFIELD("External Doccument No.");
        // SIUploader.TestField("Department Code");
    end;
}

