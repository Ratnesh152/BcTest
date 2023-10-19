xmlport 50000 "PI Uplod-Export Template Rat"
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
        PIUploader: Record "PI Uploader Rat";
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
        PIUploader.INSERT;
    end;
}

