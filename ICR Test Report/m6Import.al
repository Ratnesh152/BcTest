xmlport 50002 "Misc Rcpt Entry Staging Ulpoad"
{
    Direction = Import;
    FieldSeparator = '<TAB>';
    UseRequestPage = false;
    Format = VariableText;
    Caption = 'Miscellaneous Receipt Entry Staging Ulpoader';
    FormatEvaluate = Legacy;
    TextEncoding = UTF16;
    schema
    {
        textelement(root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'MiscellaneousReceiptEntryStagingUlpoader';
                UseTemporary = true;
                textelement(Entry_No) { }
                textelement(Source_System) { }
                textelement(Company_Code) { }
                textelement(Receipt_Type) { }
                textelement(Nature_of_Transaction) { }
                textelement(Document_No) { }
                textelement(Account_Type) { }
                textelement(Account_No) { }
                textelement(Posting_Date) { }
                textelement(Currency_Code) { }
                textelement(Amount) { }
                textelement(Bal_Account_Type) { }
                textelement(Bal_Account_No) { }
                textelement(Transaction_Ref_No) { }
                textelement(Payment_Ref_No) { }
                textelement(Reference) { }
                textelement(Branch_Dimension_Code) { }
                textelement(Department_Dimension_Code) { }
                textelement(Narration) { }
                textelement(Currency_Rate) { }
                textelement(Account_Name) { }
                textelement(Bal_Account_Name) { }

                trigger OnBeforeInsertRecord()
                begin
                    Integer.DeleteAll();
                    CreateMiscRecptEntryLines();
                end;
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        Message('File %1 Uploaded Successfully.', currXMLport.Filename);
    end;

    trigger OnPreXmlPort()
    begin
        MiscRecptEntryStaging.Reset();
        MiscRecptEntryStaging.SetCurrentKey("Entry No.");
        if MiscRecptEntryStaging.FindLast() then
            LastEntryNo := MiscRecptEntryStaging."Entry No.";
    end;

    var
        MiscRecptEntryStaging: Record "AXT Mis. Recpt. Entry Staging";
        EntryNo: Integer;
        Amount1: Decimal;
        LastEntryNo: Integer;
        CurrencyRate: Integer;
        FirstLine: Boolean;
        PostingDate: Date;
        ReceiptType: Text;
        MiscReciptEntry: text;
        SourceSystem: Text;

    local procedure CreateMiscRecptEntryLines()
    begin
        MiscRecptEntryStaging.Init();
        if MiscReciptEntry <> Document_No then begin
            MiscReciptEntry := Document_No;
            LastEntryNo += 1;
        end;
        MiscRecptEntryStaging.Validate("Entry No.", LastEntryNo);

        Evaluate(MiscRecptEntryStaging."Source System", Source_System);
        MiscRecptEntryStaging.Validate("Company Code", Company_Code);

        Evaluate(MiscRecptEntryStaging."Receipt Type", Receipt_Type);
        MiscRecptEntryStaging.Validate("Nature of Transaction", Nature_of_Transaction);

        MiscRecptEntryStaging.Validate("Document No.", Document_No);

        Evaluate(MiscRecptEntryStaging."Account Type", Account_Type);
        MiscRecptEntryStaging.Validate("Account No.", Account_No);

        Evaluate(PostingDate, Posting_Date);
        MiscRecptEntryStaging.Validate("Posting Date", PostingDate);

        MiscRecptEntryStaging.Validate("Currency Code", Currency_Code);

        Evaluate(Amount1, Amount);
        MiscRecptEntryStaging.Validate(Amount, Amount1);

        Evaluate(MiscRecptEntryStaging."Bal. Account Type", Bal_Account_Type);

        MiscRecptEntryStaging.Validate("Bal. Account No.", Bal_Account_No);

        MiscRecptEntryStaging.Validate("Transaction Ref. No.", Transaction_Ref_No);

        MiscRecptEntryStaging.Validate("Payment Ref. No.", Payment_Ref_No);

        MiscRecptEntryStaging.Validate(Reference, Reference);

        MiscRecptEntryStaging.Validate("Branch Dimension Code", Branch_Dimension_Code);

        MiscRecptEntryStaging.Validate("Department Dimension Code", Department_Dimension_Code);
        MiscRecptEntryStaging.Validate(Narration, Narration);

        Evaluate(CurrencyRate, Currency_Rate);
        MiscRecptEntryStaging.Validate("Currency Rate", CurrencyRate);

        MiscRecptEntryStaging.Validate("Account Name", Account_Name);

        MiscRecptEntryStaging.Validate("Bal. Account Name", Bal_Account_Name);
        MiscRecptEntryStaging.Insert();
    end;
}