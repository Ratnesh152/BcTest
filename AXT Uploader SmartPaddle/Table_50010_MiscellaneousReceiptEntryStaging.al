table 50010 "AXT Mis. Recpt. Entry Staging"
{
    DataClassification = CustomerContent;
    DataPerCompany = false;
    Caption = 'Miscellaneous Receipt Entry Staging';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; "Source System"; enum "AXT Source System")
        {
            Caption = 'Source System';
        }
        field(3; "Company Code"; Code[10])
        {
            Caption = 'Company Code';
            trigger OnValidate()
            begin

            end;
        }
        field(4; "Receipt Type"; Enum "AXT Receipt Type")
        {
            Caption = 'Receipt Type';
        }
        field(5; "Nature of Transaction"; Text[30])
        {
            Caption = 'Nature of Transaction';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            trigger OnValidate()
            begin

            end;
        }
        field(7; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
        }
        field(8; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            trigger OnValidate()
            var

            begin

            end;
        }
        field(9; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(10; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
        }
        field(11; "Amount"; Decimal)
        {
            Caption = 'Amount';
        }
        field(12; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal. Account Type';
        }
        field(13; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            trigger OnValidate()
            var
            begin

            end;
        }
        field(14; "Transaction Ref. No."; Code[35])
        {
            Caption = 'Transaction Ref. No.';
        }
        field(15; "Payment Ref. No."; Code[35])
        {
            Caption = 'Payment Ref. No.';
        }
        field(16; "Reference"; Code[20])
        {
            Caption = 'Reference';
        }
        field(17; "Branch Dimension Code"; Code[20])
        {
            Caption = 'Branch Dimension Code';
        }
        field(18; "Region Dimension Code"; Code[20])
        {
            Caption = 'Region Dimension Code';
        }
        field(19; "Department Dimension Code"; Code[20])
        {
            Caption = 'Department Dimension Code';
        }
        field(20; "Narration"; Text[250])
        {
            Caption = 'Narration';
        }
        field(21; "Operation Status"; Enum "AXT Operation Status")
        {
            Caption = 'Operation Status';
        }
        field(22; "Stage"; Enum "AXT Stage")
        {
            Caption = 'Stage';
        }
        field(23; "Error Message"; Text[1000])
        {
            Caption = 'Error Message';
        }
        field(24; "Currency Rate"; Integer)
        {
            Caption = 'Currency Rate';
            trigger OnValidate()
            var

            begin

            end;
        }
        field(25; "Account Name"; Text[100])
        {
            Caption = 'Account Name';
        }
        field(26; "Bal. Account Name"; Text[100])
        {
            Caption = 'Bal. Account Name';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        GLSetup: Record "General Ledger Setup";
        LocalCurrencyError: Label '%1 is a local currency for the system. Please send blank value in case of local Currency transaction.';
        BankAccount: Record "Bank Account";
        Customer: Record "Customer";
        GLAccount: Record "G/L Account";
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        ICPartner: Record "IC Partner";
        Employee: Record Employee;
    begin
        Rec.TestField("Company Code", CompanyName);
        Rec.TestField("Document No.");
        GLSetup.get();
        if GLSetup."LCY Code" = Rec."Currency Code" then
            Error(LocalCurrencyError, Rec."Currency Code");
        rec.TestField("Bal. Account No.");
        case Rec."Bal. Account Type" of
            rec."Bal. Account Type"::"Bank Account":
                BankAccount.get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::Customer:
                Customer.get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::"G/L Account":
                GLAccount.get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::Vendor:
                Vendor.get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::"Fixed Asset":
                FixedAsset.Get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::"IC Partner":
                ICPartner.Get(Rec."Bal. Account No.");

            Rec."Bal. Account Type"::Employee:
                Employee.Get(Rec."Bal. Account No.");
        end;
        rec.TestField("Account No.");
        case Rec."Account Type" of
            rec."Account Type"::"Bank Account":
                BankAccount.get(Rec."Account No.");

            Rec."Account Type"::Customer:
                Customer.get(Rec."Account No.");

            Rec."Account Type"::"G/L Account":
                GLAccount.get(Rec."Account No.");

            Rec."Account Type"::Vendor:
                Vendor.get(Rec."Account No.");

            Rec."Account Type"::"Fixed Asset":
                FixedAsset.Get(Rec."Account No.");

            Rec."Account Type"::"IC Partner":
                ICPartner.Get(Rec."Account No.");

            Rec."Account Type"::Employee:
                Employee.Get(Rec."Account No.");
        end;
    end;
}