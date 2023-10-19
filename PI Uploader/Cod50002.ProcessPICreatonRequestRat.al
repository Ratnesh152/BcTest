Codeunit 50002 "Process PI CreatonRequest Rat"
{
    trigger OnRun();
    var
        PIUploader: Record "PI Uploader Rat";
    BEGIN
        PIUploader.RESET;
        PIUploader.SETCURRENTKEY("Document ID");
        PIUploader.SETRANGE(Status, PIUploader.Status::Pending);
        IF PIUploader.FINDSET THEN
            REPEAT
                IF PIUploader."Document ID" <> Process_DocID THEN BEGIN
                    Process_DocID := PIUploader."Document ID";
                    PIUploaderRat2.RESET;
                    PIUploaderRat2.SETCURRENTKEY("Document ID");
                    PIUploaderRat2.SETRANGE("Document ID", Process_DocID);
                    CLEARLASTERROR;
                    CLEAR(CreatePurchaseInvoiceRat);
                    CreatePurchaseInvoiceRat.SetValues(Process_DocID);
                    IF CreatePurchaseInvoiceRat.RUN() THEN BEGIN
                        PIUploaderRat2.MODIFYALL(Status, PIUploaderRat2.Status::Created);
                        PIUploaderRat2.MODIFYALL("Purchase Invoice No.", CreatePurchaseInvoiceRat.GetInvoiceNo);
                        COMMIT;
                    END ELSE BEGIN
                        PIUploaderRat2.MODIFYALL(Status, PIUploaderRat2.Status::Error);
                        PIUploaderRat2.MODIFYALL("Error Text", COPYSTR(GETLASTERRORTEXT, 1, 250));
                        COMMIT;
                    END;
                END;
            UNTIL PIUploader.NEXT = 0;
    END;

    VAR
        PIUploaderRat: Record "PI Uploader Rat";
        Process_DocID: Integer;
        CreatePurchaseInvoiceRat: Codeunit "Create Purchase Invoice Rat";
        PIUploaderRat2: Record "PI Uploader Rat";

    PROCEDURE CompanyWisePICreationRequest();
    VAR
        PurchInvUpload: Record "PI Uploader Rat";
        Companies: Record 2000000006;
        SessionID: Integer;
    BEGIN
        Companies.RESET;
        IF Companies.FINDSET THEN
            REPEAT
                PurchInvUpload.RESET;
                PurchInvUpload.SETCURRENTKEY("Document ID");
                PurchInvUpload.SETRANGE(Status, PurchInvUpload.Status::Pending);
                IF NOT PurchInvUpload.ISEMPTY THEN BEGIN
                    CODEUNIT.RUN(50002)
                END;
            UNTIL Companies.NEXT = 0;
        MESSAGE('Process Scheduled successfully for Purchase Invoice Creation');
    END;
}
