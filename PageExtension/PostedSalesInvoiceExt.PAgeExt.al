// pageextension 50000 PostedSalesInvoiveExt extends "Posted Sales Invoice"
// {
//     actions
//     {
//         addafter(Print)
//         {
//             action("Print Custom Report")
//             {
//                 trigger OnAction()
//                 var
//                     IsHandled: Boolean;
//                 begin
//                     SalesInvHeader := Rec;
//                     CurrPage.SetSelectionFilter(SalesInvHeader);
//                     IsHandled := false;
//                     if not IsHandled then
//                         SalesInvHeader.PrintRecords(true);
//                 end;
//             }
//         }
//     }

//     var
//         SalesInvHeader: Record "Sales Invoice Header";
// }