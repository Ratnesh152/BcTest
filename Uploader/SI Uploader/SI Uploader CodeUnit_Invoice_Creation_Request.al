codeunit 50010 "Process SI CreationRequest"
{
    trigger OnRun()
    var
        SI_Uploader: Record "SI Uploader";
    begin
        SIUploader.RESET;
        SIUploader.SETCURRENTKEY("Document ID");
        SIUploader.SETRANGE(Status, SIUploader.Status::Pending);
        IF SIUploader.FINDSET THEN begin
            REPEAT
                IF SIUploader."Document ID" <> Process_DocID THEN BEGIN
                    Process_DocID := SIUploader."Document ID";
                    SIUploader2.RESET;
                    SIUploader2.SETCURRENTKEY("Document ID");
                    SIUploader2.SETRANGE("Document ID", Process_DocID);
                    CLEARLASTERROR;
                    CLEAR(CreateSalesInvoice);
                    CreateSalesInvoice.setvalues(Process_DocID);
                    IF CreateSalesInvoice.RUN() THEN BEGIN
                        SIUploader2.MODIFYALL(Status, SIUploader2.Status::Created);
                        SIUploader2.ModifyAll("Invoice Status", SIUploader2."Invoice Status"::Pending);
                        SIUploader2.MODIFYALL("Sales Invoice No.", CreateSalesInvoice.GetSalesInvNo());
                        COMMIT;
                    END ELSE BEGIN
                        SIUploader2.MODIFYALL(Status, SIUploader2.Status::Error);
                        SIUploader2.MODIFYALL("Error Text", COPYSTR(GETLASTERRORTEXT, 1, 250));
                        COMMIT;
                    END;
                END;
            UNTIL SIUploader.NEXT = 0;
            Message('Invoice Created Successfully');
            exit;
        end;
        Message('Invoice Already Created');
    end;

    var
        SIUploader: Record 50021;
        Process_DocID: Integer;
        CreateSalesInvoice: Codeunit 50011;
        SIUploader2: Record "SI Uploader";
}