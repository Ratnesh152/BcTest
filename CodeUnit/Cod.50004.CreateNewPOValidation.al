// codeunit 55004 "Create New PO Validation"
// {


//     trigger OnRun()
//     begin
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Sales Invoice Header", 'OnBeforeEmailRecords', '', false, false)]
//     local procedure OnBeforeEmailRecords(DocTxt: Text; var IsHandled: Boolean; var ReportSelections: Report "Sale Invoice IN GST Test"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var ShowDialog: Boolean)
//     begin

//     end;
// }