codeunit 50100 "XPE Import Mgt."
{
    Permissions = TableData "Data Exch." = rimd;

    trigger OnRun()
    begin
    end;

    var
        FileMgt: Codeunit "File Management";
        ImportTransCap: Label 'Select File for Import';
        FileFilterTxt: Label 'Text Files(*.txt;*.csv)|*.txt;*.csv';
        FileFilterExtensionTxt: Label 'txt,csv', Locked = true;
        ProcessingSetupErr: Label 'You must specify either a reading/writing XMLport or a reading/writing codeunit.';

    procedure SelectAndImportDataToGL(var GenJournalLine: Record "Gen. Journal Line"; DataExchDefCode: Code[20])
    var
        TempBlob: Codeunit "Temp Blob";
        FileName: Text;
    begin
        FileName := FileMgt.BLOBImportWithFilter(TempBlob, ImportTransCap, '', FileFilterTxt, FileFilterExtensionTxt);
        if FileName <> '' then
            ImportDataToGL(GenJournalLine, FileName, TempBlob, DataExchDefCode);
    end;

    procedure ImportDataToGL(GenJournalLine: Record "Gen. Journal Line"; FileName: Text; TempBlob: Codeunit "Temp Blob"; DataExchDefCode: Code[20])
    var
        GenJournalLineTemplate: Record "Gen. Journal Line";
        DataExch: Record "Data Exch.";
        DataExchDef: Record "Data Exch. Def";
    begin
        DataExchDef.Get(DataExchDefCode);
        if (DataExchDef."Reading/Writing XMLport" <> 0) = (DataExchDef."Reading/Writing Codeunit" <> 0) then
            Error(ProcessingSetupErr);

        PrepareGenJournalLine(GenJournalLineTemplate, GenJournalLine);
        CreateDataExch(DataExch, FileName, TempBlob, DataExchDefCode);
        ImportFile(DataExch);
        MapDataToGenJournalLine(DataExch, GenJournalLineTemplate);
    end;

    local procedure CreateDataExch(var DataExch: Record "Data Exch."; FileName: Text; TempBlob: Codeunit "Temp Blob"; DataExchDefCode: Code[20])
    var
        Source: InStream;
    begin
        TempBlob.CreateInStream(Source);
        DataExch.InsertRec(CopyStr(FileName, 1, MaxStrLen(DataExch."File Name")), Source, DataExchDefCode);
    end;

    local procedure ImportFile(DataExch: Record "Data Exch.")
    var
        DataExchDef: Record "Data Exch. Def";
        Source: InStream;
    begin
        DataExch."File Content".CreateInStream(Source);
        DataExch.SetRange("Entry No.", DataExch."Entry No.");
        DataExchDef.Get(DataExch."Data Exch. Def Code");
        if DataExchDef."Reading/Writing XMLport" <> 0 then
            XMLPORT.Import(DataExchDef."Reading/Writing XMLport", Source, DataExch)
        else
            if DataExchDef."Reading/Writing Codeunit" <> 0 then
                CODEUNIT.Run(DataExchDef."Reading/Writing Codeunit", DataExch);
    end;

    local procedure MapDataToGenJournalLine(DataExch: Record "Data Exch."; GenJournalLineTemplate: Record "Gen. Journal Line")
    var
        ProcessDataExch: Codeunit "Process Data Exch.";
        RecRef: RecordRef;
    begin
        RecRef.GetTable(GenJournalLineTemplate);
        ProcessDataExch.ProcessAllLinesColumnMapping(DataExch, RecRef);
    end;

    local procedure PrepareGenJournalLine(var GenJournalLineTemplate: Record "Gen. Journal Line"; GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLineTemplate."Journal Template Name" := GenJournalLine."Journal Template Name";
        GenJournalLineTemplate."Journal Batch Name" := GenJournalLine."Journal Batch Name";
        GenJournalLineTemplate.SetUpNewLine(GenJournalLine, GenJournalLine."Balance (LCY)", true);
        GenJournalLineTemplate."Account Type" := GenJournalLineTemplate."Account Type"::"G/L Account";

        GenJournalLine.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
        if GenJournalLine.FindLast then begin
            GenJournalLineTemplate."Line No." := GenJournalLine."Line No.";
            GenJournalLineTemplate."Document No." := IncStr(GenJournalLine."Document No.");
        end else
            GenJournalLineTemplate."Document No." := GenJournalLine."Document No.";
    end;
}