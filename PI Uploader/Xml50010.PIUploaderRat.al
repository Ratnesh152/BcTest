xmlport 50010 "PI Uploader Rat"
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
    var
        PIUploaderRat: Record "PI Uploader Rat";
    begin
        FirstLine := TRUE;
        PIUploaderRat.RESET;
        PIUploaderRat.SETCURRENTKEY("Document ID");
        IF PIUploaderRat.FINDLAST THEN
            LastDOCID := PIUploaderRat."Document ID";
        if Vendor_Invoice_No = PIUploaderRat."Vendor Invoice No." then
            Error(Vendor_Invoice_No);
    end;

    var
        FirstLine: Boolean;
        PIUploaderRat: Record "PI Uploader Rat";
        PDate: Date;
        DDate: Date;
        DueDate: Date;
        Qty: Decimal;
        UCost: Decimal;
        VINV: Text;
        LastDOCID: Integer;

    local procedure CreatePILines()
    begin
        PIUploaderRat.INIT;
        PIUploaderRat."Entry ID" := CREATEGUID;
        PIUploaderRat.VALIDATE("Vendor No.", Vendor_No);

        EVALUATE(PDate, Posting_Date);
        PIUploaderRat.VALIDATE("Posting Date", PDate);

        EVALUATE(DDate, Document_Date);
        PIUploaderRat.VALIDATE("Document Date", DDate);

        EVALUATE(DueDate, Due_Date);
        PIUploaderRat.VALIDATE("Due Date", DueDate);

        PIUploaderRat.VALIDATE("Vendor Invoice No.", Vendor_Invoice_No);
        IF VINV <> Vendor_Invoice_No THEN BEGIN
            VINV := Vendor_Invoice_No;
            LastDOCID := LastDOCID + 1;
        END;
        PIUploaderRat.VALIDATE("Document ID", LastDOCID);

        PIUploaderRat.VALIDATE(Location, Location_Code);
        PIUploaderRat.INSERT;
        PIUploaderRat.TESTFIELD("Vendor No.");
        PIUploaderRat.TESTFIELD("Posting Date");
        PIUploaderRat.TESTFIELD("Document Date");
        PIUploaderRat.TESTFIELD("Due Date");
        PIUploaderRat.TESTFIELD(Location);
        PIUploaderRat.TESTFIELD("Vendor Invoice No.");
    end;
}

