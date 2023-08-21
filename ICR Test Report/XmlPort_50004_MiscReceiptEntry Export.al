xmlport 50004 "Misc Receipt Entry Export"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    FileName = 'Misc Receipt Entry.csv';
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(AXTMisRecptEntryStaging; "AXT Mis. Recpt. Entry Staging")
            {
                fieldelement(EntryNo; AXTMisRecptEntryStaging."Entry No.")
                {
                }
                fieldelement(SourceSystem; AXTMisRecptEntryStaging."Source System")
                {
                }
                fieldelement(CompanyCode; AXTMisRecptEntryStaging."Company Code")
                {
                }
                fieldelement(ReceiptType; AXTMisRecptEntryStaging."Receipt Type")
                {
                }
                fieldelement(NatureofTransaction; AXTMisRecptEntryStaging."Nature of Transaction")
                {
                }
                fieldelement(DocumentNo; AXTMisRecptEntryStaging."Document No.")
                {
                }
                fieldelement(AccountType; AXTMisRecptEntryStaging."Account Type")
                {
                }
                fieldelement(AccountNo; AXTMisRecptEntryStaging."Account No.")
                {
                }
                fieldelement(PostingDate; AXTMisRecptEntryStaging."Posting Date")
                {
                }
                fieldelement(CurrencyCode; AXTMisRecptEntryStaging."Currency Code")
                {
                }
                fieldelement(Amount; AXTMisRecptEntryStaging.Amount)
                {
                }
                fieldelement(BalAccountType; AXTMisRecptEntryStaging."Bal. Account Type")
                {
                }
                fieldelement(BalAccountNo; AXTMisRecptEntryStaging."Bal. Account No.")
                {
                }
                fieldelement(TransactionRefNo; AXTMisRecptEntryStaging."Transaction Ref. No.")
                {
                }
                fieldelement(PaymentRefNo; AXTMisRecptEntryStaging."Payment Ref. No.")
                {
                }
                fieldelement(Reference; AXTMisRecptEntryStaging.Reference)
                {
                }
                fieldelement(BranchDimensionCode; AXTMisRecptEntryStaging."Branch Dimension Code")
                {
                }
                fieldelement(RegionDimensionCode; AXTMisRecptEntryStaging."Region Dimension Code")
                {
                }
                fieldelement(DepartmentDimensionCode; AXTMisRecptEntryStaging."Department Dimension Code")
                {
                }
                fieldelement(Narration; AXTMisRecptEntryStaging.Narration)
                {
                }
                fieldelement(OperationStatus; AXTMisRecptEntryStaging."Operation Status")
                {
                }
                fieldelement(Stage; AXTMisRecptEntryStaging.Stage)
                {
                }
                fieldelement(ErrorMessage; AXTMisRecptEntryStaging."Error Message")
                {
                }
                fieldelement(CurrencyRate; AXTMisRecptEntryStaging."Currency Rate")
                {
                }
                fieldelement(AccountName; AXTMisRecptEntryStaging."Account Name")
                {
                }
                fieldelement(BalAccountName; AXTMisRecptEntryStaging."Bal. Account Name")
                {
                }
            }
        }
    }
    trigger OnPostXmlPort()

    begin
        Message('File %1 Exported Successfully', currXMLport.Filename);
    end;
}