// pageextension 50201 PostedPurInvExt extends "Posted Purchase Invoice"
// {
//     actions
//     {

//         addafter(Print)
//         {
//             action("Print Invoice in pdf")
//             {
//                 Caption = 'Print Report in Pdf';
//                 Image = Document;
//                 PromotedCategory = Report;
//                 Promoted = true;
//                 PromotedIsBig = true;
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     ReportParameters: text;
//                     TempBlob: Codeunit "Temp Blob";
//                     FileManagement: Codeunit "File Management";
//                     OStream: OutStream;
//                     SelectedExportType: Integer;
//                     ExportType: Label 'PDF';
//                 begin
//                     Clear(ReportParameters);
//                     Clear(OStream);
//                     Clear(SelectedExportType);
//                     SelectedExportType := StrMenu(ExportType);
//                     ReportParameters := Report.RunRequestPage(406);
//                     TempBlob.CreateOutStream(OStream);
//                     case SelectedExportType of
//                         1:
//                             begin
//                                 Report.SaveAs(406, ReportParameters, ReportFormat::Pdf, OStream);
//                                 FileManagement.BLOBExport(TempBlob, Format(406) + ' ' + 'Order' + ' ' + '.pdf', true);
//                             end;
//                     end;
//                 end;
//             }
//             action("Print Report")
//             {
//                 ApplicationArea = all;
//                 Image = Print;
//                 Promoted = true;
//                 PromotedCategory = Report;
//                 trigger OnAction()
//                 var
//                     ReportParameter: Text;
//                 begin
//                     ReportParameter := Report.RunRequestPage(406);
//                     Report.Print(406, ReportParameter);
//                 end;
//             }
//         }
//     }
// }