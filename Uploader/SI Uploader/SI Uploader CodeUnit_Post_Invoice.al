codeunit 50012 "Post Sales Invoices"
{
    trigger OnRun()
    begin
        PostInvoice();
    end;

    var
        PostedSalesInvNo: Code[20];
        SalesInvNo: Code[20];

    procedure SetValues(SalesInv_No: Code[20])
    begin
        SalesInvNo := SalesInv_No;
    end;

    procedure PostInvoice()
    var
        SalesHeader: Record "Sales Header";
        SI_Uploader: Record "SI Uploader";
        SalesPost: Codeunit "Sales-Post";
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        SI_Uploader.Reset();
        SI_Uploader.SetCurrentKey("Sales Invoice No.");
        SI_Uploader.SetRange("Sales Invoice No.", SalesInvNo);
        SI_Uploader.SetRange(Status, SI_Uploader.Status::Created);
        if SI_Uploader.FindFirst() then begin
            SalesHeader.Reset();
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
            SalesHeader.SetRange("No.", SI_Uploader."Sales Invoice No.");
            if SalesHeader.FindFirst() then begin
                Clear(SalesPost);
                SalesPost.Run(SalesHeader);
                SalesInvHeader.Reset();
                SalesInvHeader.SetRange("No.", SalesHeader."No.");
            end;
            SI_Uploader.ModifyAll("Invoice Status", SI_Uploader."Invoice Status"::Posted);
        end;
    end;

    procedure GetPostedInvNo(): Code[20];
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        SalesInvHeader.Reset();
        SalesInvHeader.SetRange("Pre-Assigned No.", SalesInvNo);
        if SalesInvHeader.FindLast() then begin
            PostedSalesInvNo := SalesInvHeader."No.";
        end;
        exit(PostedSalesInvNo);
    end;
}