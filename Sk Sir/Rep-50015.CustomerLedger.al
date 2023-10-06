report 50015 "Customer Ledger"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Sk Sir/customerLedger.rdl';
    Caption = 'Customer Ledger';
    dataset
    {
        dataitem("Customer"; "Customer")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Customer Posting Group";
            column(EnrollmentNo_Customer; Customer."No.")
            {
            }
            column(PhoneNo_Customer; Customer."Phone No.")
            {
            }
            column(Customer_Posting_Group; "Customer Posting Group")
            {
            }
            column(Name_Customer; Customer.Name)
            {
            }
            column(Name_CityCUst; Customer.City)
            {
            }
            column(OpeningAmount; OpeningAmount)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(Name; CompInfo.Name)
            {
            }
            column(CompInfoAddress; CompInfo.Address)
            {
            }
            column(CompInfoAddress2; CompInfo."Address 2")
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(Currency_Code; CurrencyCode)
            {
            }
            column(ABC; ABC)
            {
            }
            column(ABC1; ABC1)
            {
            }
            column(GlobalDimension1Code_Customer; Customer."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Customer; Customer."Global Dimension 2 Code")
            {
            }
            column(ChequeDate; ChequeDate)
            {

            }
            column(ChequeNo; ChequeNo)
            {

            }
            column(State_Code; '')
            {

            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Posting Date")
                                    ORDER(Ascending);
                RequestFilterFields = "Global Dimension 1 Code";
                column(Enroll; "Cust. Ledger Entry"."Customer No.")
                {
                }
                column(Entry_No_; "Entry No.")
                {
                }
                column(External_Document_No_; "External Document No.")
                {
                }
                column(Postingdate; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(DueDate; "Cust. Ledger Entry"."Due Date")
                {
                }
                column(DocumentType; "Cust. Ledger Entry"."Document Type")
                {
                }
                column(Description; Description)
                {

                }
                column(DocumentNo; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(CurrencyCode; "Cust. Ledger Entry"."Currency Code")
                {
                }
                column(DebitAmount; "Cust. Ledger Entry"."Debit Amount")
                {
                }
                column(CreditAmount; "Cust. Ledger Entry"."Credit Amount")
                {
                }
                column(DAmt; DAmt)
                { }
                column(CAmt; CAmt)
                { }
                column(DAmt_; DAmt2)
                { }
                column(CAmt_; CAmt2)
                { }
                column(Currencycode1; Currencycode1)
                {
                }
                column(RemainingAmt; RemainingAmt)
                {
                }
                column(RefInvno; RefInvno)
                { }
                column(RemainingAmt1; RemainingAmt1)
                {
                }
                column(Branch; Branch)
                { }
                column(EntityCode_; EntityCode)
                {

                }
                column(SourceDesc2_; SourceDesc2)
                { }
                column(Source_Code; "Source Code")
                {

                }
                column(Seller_State_Code; '')
                {

                }
                column(External_Document_No_Item; "External Document No.")
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = field("Document No.");
                    column(DescriptionItem; Description)
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                    column(Unit_of_Measure; "Unit of Measure")

                    {

                    }
                    column(Unit_Cost; "Unit Cost")
                    {

                    }


                }
                trigger OnAfterGetRecord()
                begin

                    DimensionSetEntry.RESET;
                    DimensionSetEntry.SETRANGE("Dimension Set ID", "Cust. Ledger Entry"."Dimension Set ID");
                    IF DimensionSetEntry.FINDSET THEN
                        REPEAT
                            DimensionSetEntry.CALCFIELDS("Dimension Value Name");

                            IF DimensionSetEntry."Dimension Code" = 'BRANCH' THEN
                                Branch := DimensionSetEntry."Dimension Value Name";
                            IF DimensionSetEntry."Dimension Code" = 'ENTITY' THEN
                                EntityCode := DimensionSetEntry."Dimension Value Name";
                        UNTIL DimensionSetEntry.NEXT = 0;

                    if ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo") or ("Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::Payment) then begin
                        RecCLE.Reset();
                        RecCLE.SetRange("Entry No.", "Cust. Ledger Entry"."Closed by Entry No.");
                        if RecCLE.FindFirst() then
                            RefInvno := RecCLE."Document No."
                        else
                            RefInvno := '';
                    end else
                        RefInvno := '';
                    SourceDesc2 := '';

                    if "Cust. Ledger Entry"."Journal Templ. Name" <> '' Then begin
                        GenJournalTemplate.Reset();
                        GenJournalTemplate.SetRange(Name, "Cust. Ledger Entry"."Journal Templ. Name");
                        if GenJournalTemplate.FindFirst() then begin
                            SourceDesc2 := GenJournalTemplate.Description
                        end;
                    end else begin
                        SourceDesc2 := Format("Cust. Ledger Entry"."Document Type");
                        // RecSourceCode.Get("Source Code");
                        // SourceDesc2 := CopyStr(RecSourceCode.Description, 1, MaxStrLen(SourceDesc2));
                    end;

                    ChequeNo := '';
                    ChequeDate := 0D;
                    BankAccountledgerentry.RESET;
                    BankAccountledgerentry.SETCURRENTKEY("Document No.", "Posting Date");
                    BankAccountledgerentry.SETRANGE("Document No.", "Document No.");
                    // BankAccountledgerentry.SETFILTER("Cheque No.", '<>%1', '');
                    // IF BankAccountledgerentry.FINDFIRST THEN BEGIN
                    //     ChequeNo := BankAccountledgerentry."Cheque No.";
                    //     ChequeDate := BankAccountledgerentry."Cheque Date";
                    // END;

                    "Cust. Ledger Entry".CALCFIELDS("Debit Amount");
                    "Cust. Ledger Entry".CALCFIELDS("Credit Amount");
                    CAmt2 := 0;
                    DAmt2 := 0;

                    CAmt2 := "Cust. Ledger Entry"."Credit Amount";

                    if "Cust. Ledger Entry"."Document Type" = "Cust. Ledger Entry"."Document Type"::"Credit Memo" then
                        CAmt2 := "Cust. Ledger Entry"."Debit Amount"
                    else
                        DAmt2 := "Cust. Ledger Entry"."Debit Amount";



                    RemainingAmt := RemainingAmt + (RemainingAmt1 + "Debit Amount" - "Credit Amount");
                    RemainingAmt1 := 0;

                    IF RemainingAmt < 0 THEN
                        ABC1 := 'Cr'
                    ELSE
                        IF RemainingAmt > 0 THEN
                            ABC1 := 'Dr';

                    IF "Cust. Ledger Entry"."Currency Code" = '' THEN
                        Currencycode1 := 'INR'
                    ELSE
                        Currencycode1 := "Cust. Ledger Entry"."Currency Code";

                    Description := '';

                    IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                        SalesCommentLine.Reset();
                        SalesCommentLine.SetRange("No.", "Document No.");
                        IF SalesCommentLine.FindSet() THEN
                            repeat
                                Description += SalesCommentLine.Comment + ' ';
                            Until SalesCommentLine.Next = 0;
                    END ELSE
                        IF "Document Type" = "Document Type"::Payment THEN begin
                            PostedNarration.Reset();
                            PostedNarration.SetRange("Document No.", "Document No.");
                            IF PostedNarration.FindSet() THEN
                                repeat
                                    Description += PostedNarration.Narration + ' ';
                                UNTIL PostedNarration.NEXT = 0;
                        End;
                end;

                trigger OnPreDataItem()
                begin
                    "Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Posting Date", '%1..%2', StartDate, EndDate);
                    IF CurrencyCode = 'USD' THEN
                        "Cust. Ledger Entry".SETRANGE("Currency Code", 'USD')
                    ELSE
                        "Cust. Ledger Entry".SETFILTER("Currency Code", '%1|%2', 'INR', '');

                    RemainingAmt1 := OpeningAmount;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                OpeningAmount := 0;
                RemainingAmt := 0;
                RemainingAmt1 := 0;

                //Opening
                RecCLE.Reset();
                RecCLE.SETRANGE(RecCLE."Customer No.", Customer."No.");
                RecCLE.SETRANGE(RecCLE."Posting Date", 0D, StartDate - 1);
                if BranchFilter <> '' then
                    RecCLE.SetRange("Global Dimension 1 Code", BranchFilter);
                IF RecCLE.findfirst() THEN
                    REPEAT
                        RecCLE.CALCFIELDS(Amount);
                        OpeningAmount := OpeningAmount + RecCLE.Amount;
                    UNTIL RecCLE.Next() = 0;

                IF OpeningAmount < 0 THEN
                    ABC := 'Cr'
                ELSE
                    IF OpeningAmount > 0 THEN
                        ABC := 'Dr';


                // IF RecCLE."Currency Code" = '' THEN
                //     Currencycode1 := 'INR'
                // ELSE
                //     Currencycode1 := RecCLE."Currency Code";
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get();
                FiscalYear := Date2DMY(EndDate,3)
                
            end;
        }
    }

    requestpage
    {
        // SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Start Date must have a value';
                        Caption = 'Start Date';
                    }
                    field("End Date"; EndDate)
                    {
                        ApplicationArea = All;
                        ToolTip = 'End Date must have a value';
                        Caption = 'End Date';
                    }

                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }
    trigger OnPreReport()
    begin
        BranchFilter := "Cust. Ledger Entry".GETFILTER("Global Dimension 1 Code");
    end;

    var
        BranchFilter: Code[20];
        RecCLE: Record "Cust. Ledger Entry";
        CompInfo: Record "Company Information";
        BankAccountledgerentry: Record 271;
        CourseName: Text[150];
        OpeningAmount: Decimal;
        StartDate: Date;
        ChequeNo: Code[20];
        ChequeDate: Date;
        FiscalYear: Integer;
        EndDate: Date;
        RemainingAmt: Decimal;
        RemainingAmt1: Decimal;
        DAmt, DAmt2 : Decimal;
        CAmt, CAmt2 : Decimal;

        ABC: Text[10];
        CurrencyCode: Code[10];
        ABC1: Text[10];
        Currencycode1: Text;
        DimensionSetEntry: Record "Dimension Set Entry";
        Branch, EntityCode : Code[50];
        RefInvno: Code[50];
        GenJournalTemplate: Record "Gen. Journal Template";
        RecSourceCode: Record "Source Code";
        SourceDesc2: Text[50];
        SalesCommentLine: Record 44;
        PostedNarration: Record 18933;


}

