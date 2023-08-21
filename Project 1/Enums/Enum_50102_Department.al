enum 50110 "Department Ratnesh"
{
    Extensible = true;

    value(0; Production)
    {
    }
    value(1; HR)
    {
    }
    value(2; IT)
    {
    }
    value(3; CRM)
    {
    }
}
//  action("Post Invoice")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Post Invoice';
//                 Image = Post;
//                 Promoted = true;
//                 PromotedCategory = New;
//                 trigger OnAction()
//                 var
//                     PostInvoice: Codeunit "Create Sales Invoices";
//                     Siuploader: Record "SI Uploader";
//                 begin
//                     CurrPage.SetSelectionFilter(Siuploader);
//                     Siuploader.MarkedOnly(true);
//                     PostInvoice.PostInvoice(Siuploader);
//                 end;
//             }
//  procedure PostInvoice(var SIUploader: Record "SI Uploader")
//     var
//         SalesHeader: Record "Sales Header";
//         SI_Uploader: Record "SI Uploader";
//         salesReleaseDoc: Codeunit "Release Sales Document";
//         salesPost: Codeunit "Sales-Post";
//     begin
//         if not Confirm('do you want to post Invoice ?', true) then
//             exit;
//   SIUploader.SetRange(Status, SI_Uploader.Status::Created);
//         if SIUploader.FindSet() then begin
//             repeat
//                 SalesHeader.Reset();
//                 SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
//                 SalesHeader.SetRange("No.", SIUploader."Sales Invoice No.");
//                 if SalesHeader.FindFirst() then begin
//                     Clear(salesReleaseDoc);
//                     Clear(salesPost);
//                     salesReleaseDoc.ReleaseSalesHeader(SalesHeader, false);
//                     salesPost.Run(SalesHeader);
//                 end;
//                 SIUploader.Status := SIUploader.Status::Posted;
//                 SIUploader.Modify();
//             until SIUploader.Next() = 0;
//             Message('hello');
//         end;