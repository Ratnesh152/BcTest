Codeunit 50001 "Create Purchase Invoice Rat"
{
    trigger OnRun();
    BEGIN
        CreateInvoice;
    END;

    VAR
        DocumentID: Integer;
        PurchInvNo: Code[20];

    PROCEDURE SetValues(_DocumentID: Integer);
    BEGIN
        DocumentID := _DocumentID;
    END;

    LOCAL PROCEDURE CreateInvoice();
    VAR
        PurchHeader: Record "Purchase Header";
        PIUploaderRat: Record "PI Uploader Rat";
        LineNo: Integer;
    BEGIN
        PIUploaderRat.RESET;
        PIUploaderRat.SETCURRENTKEY("Document ID");
        PIUploaderRat.SETRANGE("Document ID", DocumentID);
        PIUploaderRat.SETRANGE(Status, PIUploaderRat.Status::Pending);
        IF PIUploaderRat.FINDSET THEN BEGIN
            CreateHeader(PurchHeader, PIUploaderRat);
        END ELSE
            ERROR('Document ID %1 does not exist in Pending status', DocumentID);
    END;

    LOCAL PROCEDURE CreateHeader(VAR PI_Header: Record "Purchase Header"; VAR PIUploaderRat: Record "PI Uploader Rat");
    VAR
    BEGIN
        PI_Header.RESET;
        PI_Header.VALIDATE("Document Type", PI_Header."Document Type"::Invoice);
        PI_Header.INSERT(TRUE);
        PurchInvNo := PI_Header."No.";
        PI_Header.VALIDATE("Buy-from Vendor No.", PIUploaderRat."Vendor No.");
        PI_Header.VALIDATE("Posting Date", PIUploaderRat."Posting Date");
        PI_Header.VALIDATE("Document Date", PIUploaderRat."Document Date");
        PI_Header.VALIDATE("Due Date", PIUploaderRat."Due Date");
        PI_Header.VALIDATE("Vendor Invoice No.", PIUploaderRat."Vendor Invoice No.");
        PI_Header.VALIDATE("Location Code", PIUploaderRat.Location);
        PI_Header.MODIFY(TRUE);
    END;

    PROCEDURE GetInvoiceNo(): Code[20];
    BEGIN
        EXIT(PurchInvNo);
    END;
}