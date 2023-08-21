Codeunit 50007 "Process PI CreatonRequest"
{
    trigger OnRun();
    var
        PIUploader: Record 50020;
    BEGIN
        PIUploader.RESET;
        PIUploader.SETCURRENTKEY("Document ID");
        PIUploader.SETRANGE("Company Name", COMPANYNAME);
        PIUploader.SETRANGE(Status, PIUploader.Status::Pending);
        IF PIUploader.FINDSET THEN
            REPEAT
                IF PIUploader."Document ID" <> Process_DocID THEN BEGIN
                    Process_DocID := PIUploader."Document ID";
                    PIUploader2.RESET;
                    PIUploader2.SETCURRENTKEY("Document ID");
                    PIUploader2.SETRANGE("Document ID", Process_DocID);
                    CLEARLASTERROR;
                    CLEAR(CreatePurchaseInvoice);
                    CreatePurchaseInvoice.SetValues(Process_DocID);
                    IF CreatePurchaseInvoice.RUN() THEN BEGIN
                        PIUploader2.MODIFYALL(Status, PIUploader2.Status::Created);
                        PIUploader2.MODIFYALL("Purchase Invoice No.", CreatePurchaseInvoice.GetInvoiceNo);
                        COMMIT;
                    END ELSE BEGIN
                        PIUploader2.MODIFYALL(Status, PIUploader2.Status::Error);
                        PIUploader2.MODIFYALL("Error Text", COPYSTR(GETLASTERRORTEXT, 1, 250));
                        COMMIT;
                    END;
                END;
            UNTIL PIUploader.NEXT = 0;
    END;

    VAR
        PIUploader: Record 50020;
        Process_DocID: Integer;
        CreatePurchaseInvoice: Codeunit 50008;
        PIUploader2: Record 50020;

    PROCEDURE CompanyWisePICreationRequest();
    VAR
        PurchInvUpload: Record 50020;
        Companies: Record 2000000006;
        SessionID: Integer;
    BEGIN
        Companies.RESET;
        IF Companies.FINDSET THEN
            REPEAT
                PurchInvUpload.RESET;
                PurchInvUpload.SETCURRENTKEY("Document ID");
                PurchInvUpload.SETRANGE("Company Name", Companies.Name);
                PurchInvUpload.SETRANGE(Status, PurchInvUpload.Status::Pending);
                IF NOT PurchInvUpload.ISEMPTY THEN BEGIN
                    IF Companies.Name = COMPANYNAME THEN
                        CODEUNIT.RUN(50007)
                    else
                        IF NOT STARTSESSION(SessionID, CODEUNIT::"Process PI CreatonRequest", Companies.Name) THEN
                            MESSAGE('PI Creation session issue for company %1', Companies.Name);
                END;
            UNTIL Companies.NEXT = 0;
        MESSAGE('Process Scheduled successfully for Purchase Invoice Creation');
    END;
}
