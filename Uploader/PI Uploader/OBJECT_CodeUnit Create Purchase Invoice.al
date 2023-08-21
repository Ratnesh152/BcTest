Codeunit 50008 "Create Purchase Invoice"
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
        PurchHeader: Record 38;
        PIUploader: Record 50020;
        LineNo: Integer;
    BEGIN
        PIUploader.RESET;
        PIUploader.SETCURRENTKEY("Document ID");
        PIUploader.SETRANGE("Company Name", COMPANYNAME);
        PIUploader.SETRANGE("Document ID", DocumentID);
        PIUploader.SETRANGE(Status, PIUploader.Status::Pending);
        IF PIUploader.FINDSET THEN BEGIN
            CreateHeader(PurchHeader, PIUploader);
            LineNo := 0;
            REPEAT
                LineNo += 10000;
                CreateLines(PurchHeader, PIUploader, LineNo);
            UNTIL PIUploader.NEXT = 0;
        END ELSE
            ERROR('Document ID %1 does not exist in Pending status', DocumentID);
    END;

    LOCAL PROCEDURE CreateHeader(VAR PI_Header: Record 38; VAR PIUploader: Record 50020);
    VAR
        RecordLink: Record 2000000068;
    BEGIN
        PI_Header.RESET;
        PI_Header.VALIDATE("Document Type", PI_Header."Document Type"::Invoice);
        PI_Header.INSERT(TRUE);
        PurchInvNo := PI_Header."No.";
        PI_Header.VALIDATE("Buy-from Vendor No.", PIUploader."Vendor No.");
        PI_Header.VALIDATE("Posting Date", PIUploader."Posting Date");
        PI_Header.VALIDATE("Document Date", PIUploader."Document Date");
        PI_Header.VALIDATE("Due Date", PIUploader."Due Date");
        PI_Header.VALIDATE("Vendor Invoice No.", PIUploader."Vendor Invoice No.");
        PI_Header.VALIDATE("Location Code", PIUploader.Location);
        // PI_Header.VALIDATE(Structure, PIUploader.Structure);
        PI_Header.MODIFY(TRUE);
        PI_Header."Dimension Set ID" := GetDimensionSetID(PIUploader, PI_Header."Dimension Set ID");
        PI_Header.MODIFY(TRUE);
        RecordLink.INIT;
        RecordLink."Record ID" := PI_Header.RECORDID;
        RecordLink.VALIDATE(Description, 'Attachment');
        RecordLink.VALIDATE(Type, RecordLink.Type::Link);
        RecordLink.VALIDATE(URL1, PIUploader."Link Path");
        RecordLink.VALIDATE(Company, COMPANYNAME);
        RecordLink.VALIDATE("User ID", USERID);
        RecordLink.VALIDATE(Created, CURRENTDATETIME);
        RecordLink.INSERT(TRUE);
    END;

    LOCAL PROCEDURE CreateLines(VAR PI_Header: Record 38; VAR PIUploader: Record 50020; LineNo: Integer);
    VAR
        PurchLine: Record 39;
    BEGIN
        PurchLine.INIT;
        PurchLine.VALIDATE("Document Type", PI_Header."Document Type");
        PurchLine.VALIDATE("Document No.", PI_Header."No.");
        PurchLine.VALIDATE("Line No.", LineNo);
        PurchLine.INSERT(TRUE);
        PurchLine.VALIDATE(Type, PIUploader.Type);
        PurchLine.VALIDATE("No.", PIUploader."No.");
        PurchLine.VALIDATE("Location Code", PIUploader.Location);
        IF PIUploader.Description <> '' THEN
            PurchLine.VALIDATE(Description, PIUploader.Description);
        IF PIUploader."Description 2" <> '' THEN
            PurchLine.VALIDATE("Description 2", PIUploader."Description 2");
        PurchLine.VALIDATE("Unit of Measure Code", PIUploader."Unit Of Measure Code");
        PurchLine.VALIDATE(Quantity, PIUploader.Quantity);
        PurchLine.VALIDATE("Direct Unit Cost", PIUploader."Direct Unit Cost Exc Tax");
        PurchLine.MODIFY(TRUE);
        IF PIUploader."GST Group Code" <> '' THEN
            // PurchLine.VALIDATE("GST Group Code", PIUploader."GST Group Code");
            // PurchLine.VALIDATE("GST Group Type", PIUploader."GST Group Type");
            IF PIUploader."HSN Code" <> '' THEN
                // PurchLine.VALIDATE("HSN/SAC Code", PIUploader."HSN Code");
                // PurchLine.VALIDATE("GST Credit", PIUploader."GST Credit");
                // IF PIUploader."TDS Nature Of Deduction" <> '' THEN
                //     PurchLine.VALIDATE("TDS Nature of Deduction", PIUploader."TDS Nature Of Deduction");
                PurchLine."Dimension Set ID" := GetDimensionSetID(PIUploader, PurchLine."Dimension Set ID");
        PurchLine.MODIFY(TRUE);
    END;

    LOCAL PROCEDURE GetDimensionSetID(VAR PIUploader: Record 50020; ExistingDimSetID: Integer): Integer;
    VAR
        DimMgmt: Codeunit 408;
        TmpDimSetEntry: Record 480 temporary;
        DimValue: Record 349;
        GLSetup: Record 98;
    BEGIN
        GLSetup.GET;
        IF ExistingDimSetID <> 0 THEN
            DimMgmt.GetDimensionSet(TmpDimSetEntry, ExistingDimSetID);
        IF PIUploader."Project Code" <> '' THEN BEGIN
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.SETRANGE("Dimension Code", GLSetup."Shortcut Dimension 1 Code");
            IF TmpDimSetEntry.FINDFIRST THEN
                TmpDimSetEntry.DELETE(TRUE);
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.INIT;
            DimValue.GET(GLSetup."Shortcut Dimension 1 Code", PIUploader."Project Code");
            TmpDimSetEntry.VALIDATE("Dimension Code", DimValue."Dimension Code");
            TmpDimSetEntry.VALIDATE("Dimension Value Code", DimValue.Code);
            TmpDimSetEntry.INSERT(TRUE);
        END;
        IF PIUploader."Department Code" <> '' THEN BEGIN
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.SETRANGE("Dimension Code", GLSetup."Shortcut Dimension 2 Code");
            IF TmpDimSetEntry.FINDFIRST THEN
                TmpDimSetEntry.DELETE(TRUE);
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.INIT;
            DimValue.GET(GLSetup."Shortcut Dimension 2 Code", PIUploader."Department Code");
            TmpDimSetEntry.VALIDATE("Dimension Code", DimValue."Dimension Code");
            TmpDimSetEntry.VALIDATE("Dimension Value Code", DimValue.Code);
            TmpDimSetEntry.INSERT(TRUE);
        END;
        IF PIUploader."Employee Code" <> '' THEN BEGIN
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.SETRANGE("Dimension Code", GLSetup."Shortcut Dimension 3 Code");
            IF TmpDimSetEntry.FINDFIRST THEN
                TmpDimSetEntry.DELETE(TRUE);
            TmpDimSetEntry.RESET;
            TmpDimSetEntry.INIT;
            DimValue.GET(GLSetup."Shortcut Dimension 3 Code", PIUploader."Employee Code");
            TmpDimSetEntry.VALIDATE("Dimension Code", DimValue."Dimension Code");
            TmpDimSetEntry.VALIDATE("Dimension Value Code", DimValue.Code);
            TmpDimSetEntry.INSERT(TRUE);
        END;
        EXIT(DimMgmt.GetDimensionSetID(TmpDimSetEntry));
    END;

    PROCEDURE GetInvoiceNo(): Code[20];
    BEGIN
        EXIT(PurchInvNo);
    END;
}