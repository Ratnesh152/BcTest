// codeunit 50020 "Indent Report CodeUnit"
// {
//     trigger OnRun()
//     begin

//     end;

//     var
//         SelectedCustomLayoutCode: Code[20];


//     procedure PrintProformaSalesInvoice(IndentHeader: Record "Indent Header Ratnesh")
//     var
//         ReportSelections: Record "Report Selections";
//         IsPrinted: Boolean;
//         f: Record "Sales Invoice Header";
//     begin
//         IndentHeader.SetRecFilter();
//         if IsPrinted then
//             exit;
//         ReportSelections.PrintForCust(ReportSelections.Usage::"Pro Forma S. Invoice", IndentHeader, IndentHeader.FieldNo("Student No."));
//     end;

//     procedure PrintForCust(ReportUsage: Enum "Report Selection Usage"; RecordVariant: Variant; CustomerNoFieldNo: Integer)
//     var
//         Handled: Boolean;
//     begin
//         if Handled then
//             exit;
//         PrintWithDialogForCust(ReportUsage, RecordVariant, true, CustomerNoFieldNo);
//     end;

//     procedure PrintWithDialogForCust(ReportUsage: Enum "Report Selection Usage"; RecordVariant: Variant; IsGUI: Boolean; CustomerNoFieldNo: Integer)
//     var
//         Handled: Boolean;
//     begin
//         if Handled then
//             exit;

//         PrintDocumentsWithCheckDialogCommon(
//           ReportUsage, RecordVariant, IsGUI, CustomerNoFieldNo, false, DATABASE::Customer);
//     end;

//     local procedure PrintDocumentsWithCheckDialogCommon(ReportUsage: Enum "Report Selection Usage"; RecordVariant: Variant; IsGUI: Boolean; AccountNoFieldNo: Integer; WithCheck: Boolean; TableNo: Integer)
//     var
//         TempReportSelections: Record "Report Selections" temporary;
//         TempNameValueBuffer: Record "Name/Value Buffer" temporary;
//         RecRef: RecordRef;
//         RecRefToPrint: RecordRef;
//         RecVarToPrint: Variant;
//         AccountNoFilter: Text;
//         IsHandled: Boolean;
//     begin
//         RecRef.GetTable(RecordVariant);
//         GetUniqueAccountNos(TempNameValueBuffer, RecRef, AccountNoFieldNo);
//         SelectTempReportSelectionsToPrint(TempReportSelections, TempNameValueBuffer, WithCheck, ReportUsage, TableNo);
//         if TempReportSelections.FindSet() then
//             repeat
//                 if TempReportSelections."Custom Report Layout Code" <> '' then
//                     ReportLayoutSelection.SetTempLayoutSelected(TempReportSelections."Custom Report Layout Code")
//                 else
//                     ReportLayoutSelection.SetTempLayoutSelected('');

//                 TempNameValueBuffer.FindSet();
//                 AccountNoFilter := GetAccountNoFilterForCustomReportLayout(TempReportSelections, TempNameValueBuffer, TableNo);
//                 GetFilteredRecordRef(RecRefToPrint, RecRef, AccountNoFieldNo, AccountNoFilter);
//                 RecVarToPrint := RecRefToPrint;

//                 IsHandled := false;
//                 if not IsHandled then
//                     REPORT.RunModal(TempReportSelections."Report ID", IsGUI, false, RecVarToPrint);
//                 ReportLayoutSelection.SetTempLayoutSelected('');
//             until TempReportSelections.Next() = 0;
//     end;

//     procedure SelectTempReportSelectionsToPrint(var TempReportSelections: Record "Report Selections" temporary; var TempNameValueBuffer: Record "Name/Value Buffer" temporary; WithCheck: Boolean; ReportUsage: Enum "Report Selection Usage"; TableNo: Integer)
//     var
//         TempReportSelectionsAccount: Record "Report Selections" temporary;
//         AccountNo: Code[20];
//         LastSequence: Code[10];
//     begin
//         if TempNameValueBuffer.FindSet() then
//             repeat
//                 AccountNo := CopyStr(TempNameValueBuffer.Name, 1, MaxStrLen(AccountNo));
//                 TempReportSelectionsAccount.Reset();
//                 TempReportSelectionsAccount.DeleteAll();
//                 SelectTempReportSelections(TempReportSelectionsAccount, AccountNo, WithCheck, ReportUsage, TableNo);
//                 if TempReportSelectionsAccount.FindSet() then
//                     repeat
//                         LastSequence := GetLastSequenceNo(TempReportSelections, ReportUsage);
//                         if not HasReportWithUsage(TempReportSelections, ReportUsage, TempReportSelectionsAccount."Report ID") then begin
//                             TempReportSelections := TempReportSelectionsAccount;
//                             if LastSequence = '' then
//                                 TempReportSelections.Sequence := '1'
//                             else
//                                 TempReportSelections.Sequence := IncStr(LastSequence);
//                             TempReportSelections.Insert();
//                         end;
//                     until TempReportSelectionsAccount.Next() = 0;
//             until TempNameValueBuffer.Next() = 0;
//     end;

//     procedure SetTempLayoutSelected(NewTempSelectedLayoutCode: Code[20])
//     var
//         DesignTimeReportSelection: Codeunit "Design-time Report Selection";
//     begin
//         DesignTimeReportSelection.SetSelectedCustomLayout(NewTempSelectedLayoutCode);
//     end;

//     procedure SetSelectedCustomLayout(NewCustomLayoutCode: Code[20])
//     begin
//         SelectedCustomLayoutCode := NewCustomLayoutCode;
//     end;
// }