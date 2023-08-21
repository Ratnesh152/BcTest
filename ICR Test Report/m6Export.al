xmlport 50014 "Misc Repceipt Entry Export"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    format = VariableText;
    FileName = 'Misc Receipt Entry.csv';
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    UseRequestPage = false;
    schema
    {
        tableelement(Integer; Integer)
        {
            XmlName = 'MiscReceiptEntryExport';
            SourceTableView = sorting(Number) order(ascending) where(Number = filter(1));
            textelement(Entry_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Entry_No := 'Entry No.';
                end;
            }
            textelement(Source_System)
            {
                trigger OnBeforePassVariable()
                begin
                    Source_System := 'Source System';
                end;
            }
            textelement(Company_Code)
            {
                trigger OnBeforePassVariable()
                begin
                    Company_Code := 'Company Code';
                end;
            }
            textelement(Receipt_Type)
            {
                trigger OnBeforePassVariable()
                begin
                    Receipt_Type := 'Receipt Type';
                end;
            }
            textelement(Nature_of_Transaction)
            {
                trigger OnBeforePassVariable()
                begin
                    Nature_of_Transaction := 'Nature of Transaction';
                end;
            }
            textelement(Document_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Document_No := 'Document No.'
                end;
            }
            textelement(Account_Type)
            {
                trigger OnBeforePassVariable()
                begin
                    Account_Type := 'Account Type';
                end;
            }
            textelement(Account_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Account_No := 'Account No.';
                end;
            }
            textelement(Posting_Date)
            {
                trigger OnBeforePassVariable()
                begin
                    Posting_Date := 'Posting Date';
                end;
            }
            textelement(Currency_Code)
            {
                trigger OnBeforePassVariable()
                begin
                    Currency_Code := 'Currency Code';
                end;
            }
            textelement(Amount)
            {
                trigger OnBeforePassVariable()
                begin
                    Amount := 'Amount';
                end;
            }
            textelement(Bal_Account_Type)
            {
                trigger OnBeforePassVariable()
                begin
                    Bal_Account_Type := 'Bal. Account Type';
                end;
            }
            textelement(Bal_Account_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Bal_Account_No := 'Bal. Account No.';
                end;
            }
            textelement(Transaction_Ref_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Transaction_Ref_No := 'Transaction Ref. No.';
                end;
            }
            textelement(Payment_Ref_No)
            {
                trigger OnBeforePassVariable()
                begin
                    Payment_Ref_No := 'Payment Ref. No.';
                end;
            }
            textelement(Reference)
            {
                trigger OnBeforePassVariable()
                begin
                    Reference := 'Reference';
                end;
            }
            textelement(Branch_Dimension_Code)
            {
                trigger OnBeforePassVariable()
                begin
                    Branch_Dimension_Code := 'Branch Dimension Code';
                end;
            }
            textelement(Department_Dimension_Code)
            {
                trigger OnBeforePassVariable()
                begin
                    Department_Dimension_Code := 'Department Dimension Code';
                end;
            }
            textelement(Narration)
            {
                trigger OnBeforePassVariable()
                begin
                    Narration := 'Narration';
                end;
            }
            textelement(Currency_Rate)
            {
                trigger OnBeforePassVariable()
                begin
                    Currency_Rate := 'Currency Rate';
                end;
            }
            textelement(Account_Name)
            {
                trigger OnBeforePassVariable()
                begin
                    Account_Name := 'Account Name';
                end;
            }
            textelement(Bal_Account_Name)
            {
                trigger OnBeforePassVariable()
                begin
                    Bal_Account_Name := 'Bal. Account Name';
                end;
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        Message('File %1 Exported Succesfuly', currXMLport.Filename);
    end;
}
