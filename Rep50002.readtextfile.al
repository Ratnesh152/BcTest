report 50002 "read text file"
{
    ApplicationArea = All;
    Caption = 'read text file';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(TextRead; "Text Read")
        {
            column(Primarykey; "Primary key")
            {
            }
            column(TransId; "Trans Id")
            {
            }
            column(TransDate; "Trans Date")
            {
            }
            column(ValueDate; "Value Date")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(TransferAmount; "Transfer Amount")
            {
            }
            column(TransferCurrency; "Transfer Currency")
            {
            }
            column(Tranfercomment; "Tranfer comment")
            {
            }
            column(ReferenceNumber; "Reference Number")
            {
            }
            column(TransferBalance; "Transfer Balance")
            {
            }
        }
    }
    trigger OnPreReport()
    var
        FileMgt: Codeunit "File Management";
        t: Codeunit 6224;
        tt: Codeunit 6223;
        Instrem: InStream;
        XMLDocumentMgmt: Codeunit "Import XML File to Data Exch.";
    begin

    end;

}
