pageextension 50101 ReportLayoutSelectionEXT extends "Report Layout Selection"
{
    actions
    {
        addbefore(RunReport)
        {
            action(ExportReport)
            {
                Caption = 'Export Report';
                Image = Export;
                PromotedCategory = Report;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    ReportParameters: text;
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                    OStream: OutStream;
                    SelectedExportType: Integer;
                    ExportType: Label 'PDF';
                    StrMenuMsg: Label 'Please choose one of the export types:';
                begin
                    Clear(ReportParameters);
                    Clear(OStream);
                    Clear(SelectedExportType);
                    SelectedExportType := StrMenu(ExportType, 2, StrMenuMsg); //Defualt format is Excel
                    if SelectedExportType = 0 then
                        exit;
                    ReportParameters := Report.RunRequestPage(Rec."Report ID");
                    TempBlob.CreateOutStream(OStream);
                    case SelectedExportType of
                        1: //Pdf
                            begin
                                Report.SaveAs(Rec."Report ID", ReportParameters, ReportFormat::Pdf, OStream);
                                FileManagement.BLOBExport(TempBlob, Format(Rec."Report ID") + '_' + Rec."Report Name" + '_' + Format(CURRENTDATETIME, 0, '<Day,2><Month,2><Year4><Hours24><Minutes,2><Seconds,2>') + '.pdf', true);
                            end;
                    end;
                end;
            }
        }
    }
}