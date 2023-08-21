codeunit 50013 "Posting Invoice Process"
{
    trigger OnRun()
    begin
        if SI_Uploader."Invoice Status" = SI_Uploader."Invoice Status"::Posted then
            exit;
        SI_Uploader.Reset();
        SI_Uploader.SetCurrentKey("Sales Invoice No.");
        SI_Uploader.SetRange(Status, SI_Uploader.Status::Created);
        if SI_Uploader.FindSet() then begin
            repeat
                if SI_Uploader."Sales Invoice No." <> ProcessSalesInvNo then begin
                    ProcessSalesInvNo := SI_Uploader."Sales Invoice No.";
                    SI_Uploader2.Reset();
                    SI_Uploader2.SetCurrentKey("Sales Invoice No.");
                    SI_Uploader2.SetRange("Sales Invoice No.", ProcessSalesInvNo);
                    ClearLastError;
                    Clear(PostSalesInvoice);
                    PostSalesInvoice.SetValues(ProcessSalesInvNo);
                    if PostSalesInvoice.run() then begin
                        SI_Uploader2.ModifyAll("Invoice Status", SI_Uploader2."Invoice Status"::Posted);
                        SI_Uploader2.ModifyAll("Posted Invoice No.", PostSalesInvoice.GetPostedInvNo());
                        Commit();
                    end else begin
                        SI_Uploader2.ModifyAll("Invoice Status", SI_Uploader2."Invoice Status"::Error);
                        SI_Uploader2.ModifyAll("Error Text Posting", CopyStr(GetLastErrorText(), 1, 250));
                        Commit();
                    end;
                end;
            until SI_Uploader.Next() = 0;
            Message('Invoices Posted Successfully');
            exit;
        end;
        Message('Invoices Already Posted');
    end;

    var
        ProcessSalesInvNo: Code[20];
        SI_Uploader2: Record "SI Uploader";
        SI_Uploader: Record "SI Uploader";
        PostSalesInvoice: Codeunit "Post Sales Invoices";
}