codeunit 50011 "Create Sales Invoices"
{
    trigger OnRun()
    begin
        Create_Invoice();
    end;

    var
        DocumentID: Integer;
        SalesInvNo: Code[20];

    procedure SetValues(Document_ID: Integer)
    begin
        DocumentID := Document_ID;
    end;

    local procedure Create_Invoice()
    var
        SalesHeader: Record "Sales Header";
        SIUploader: Record "SI Uploader";
        LineNo: Integer;
    begin
        SIUploader.Reset();
        SIUploader.SetCurrentKey("Document ID");
        SIUploader.SetRange("Document ID", DocumentID);
        SIUploader.SetRange(Status, SIUploader.Status::Pending);
        if SIUploader.FindSet() then begin
            Create_Sales_Header(SalesHeader, SIUploader);
            LineNo := 0;
            repeat
                LineNo += 10000;
                Create_Sales_Line(SalesHeader, SIUploader, LineNo);
            until SIUploader.Next() = 0;
        end;
    end;

    local procedure Create_Sales_Header(var SI_Header: Record "Sales Header"; var SIUploader: Record "SI Uploader")
    begin
        SI_Header.Reset();
        SI_Header.Validate("Document Type", SI_Header."Document Type"::Invoice);
        SI_Header.Insert(true);
        SalesInvNo := SI_Header."No.";
        SI_Header.Validate("Sell-to Customer No.", SIUploader."Customer No.");
        SI_Header.Validate("Posting Date", SIUploader."Posting Date");
        SI_Header.Validate("External Document No.", SIUploader."External Doccument No.");
        SI_Header.Validate("Location Code", SIUploader.Location);
        SI_Header.Modify(true);
        SI_Header."Dimension Set ID" := GetDimensionSetID(SIUploader, SI_Header."Dimension Set ID");
        SI_Header.Modify();
    end;

    local procedure Create_Sales_Line(var SI_Header: Record "Sales Header"; var SI_Uploader: Record "SI Uploader"; LineNo: Integer)
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Init();
        SalesLine.Validate("Document Type", SI_Header."Document Type");
        SalesLine.Validate("Document No.", SI_Header."No.");
        SalesLine.Validate("Line No.", LineNo);
        SalesLine.Insert(true);
        SalesLine.Validate(Type, SI_Uploader.Type);
        SalesLine.Validate("No.", SI_Uploader."No.");
        SalesLine.Validate("Location Code", SI_Uploader.Location);
        IF SI_Uploader.Description <> '' then
            SalesLine.VALIDATE(Description, SI_Uploader.Description);
        SalesLine.Validate("Unit of Measure Code", SI_Uploader."Unit Of Measure Code");
        SalesLine.Validate(Quantity, SI_Uploader.Quantity);
        SalesLine.Validate("Unit Price", SI_Uploader."Unit Price");
        SalesLine.Modify(true);
        // IF SI_Uploader."GST Group Code" <> '' then
        //     SalesLine.VALIDATE("GST Group Code", SI_Uploader."GST Group Code");
        // SalesLine.VALIDATE("GST Group Type", SI_Uploader."GST Group Type");
        // IF SI_Uploader."HSN Code" <> '' then
        //     SalesLine.VALIDATE("HSN/SAC Code", SI_Uploader."HSN Code");
        SalesLine."Dimension Set ID" := GetDimensionSetID(SI_Uploader, SalesLine."Dimension Set ID");
        SalesLine.Modify(true);
    end;

    local procedure GetDimensionSetID(var SIUploader: Record "SI Uploader"; ExistingDimSetID: Integer): Integer
    var
        DimMgmt: Codeunit DimensionManagement;
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        DimValue: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        if ExistingDimSetID <> 0 then
            DimMgmt.GetDimensionSet(TempDimSetEntry, ExistingDimSetID);
        if SIUploader."Department Code" <> '' then begin
            TempDimSetEntry.Reset();
            TempDimSetEntry.SetRange("Dimension Code", GLSetup."Shortcut Dimension 1 Code");
            if TempDimSetEntry.FindFirst() then
                TempDimSetEntry.Delete();
            TempDimSetEntry.Reset();
            TempDimSetEntry.Init();
            DimValue.Get(GLSetup."Shortcut Dimension 1 Code", SIUploader."Department Code");
            TempDimSetEntry.Validate("Dimension Code", DimValue."Dimension Code");
            TempDimSetEntry.Validate("Dimension Value Code", DimValue.Code);
            TempDimSetEntry.Insert();
        end;
        exit(DimMgmt.GetDimensionSetID(TempDimSetEntry));
    end;

    procedure GetSalesInvNo(): Code[20]
    begin
        exit(SalesInvNo);
    end;
}