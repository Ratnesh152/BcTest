pageextension 50073 CashPaymentVoucher extends "Cash Payment Voucher"
{
    layout
    {
        // modify("Posting Type")
        // {
        //     Visible = true;
        //     trigger OnAfterValidate()
        //     begin
        //         if Rec."Posting Type" = Rec."Posting Type"::Running then
        //             Events.ValidateShortcutDimValues('POSTINGTYPE', 'RUNNING', Rec."Dimension Set ID");
        //         if Rec."Posting Type" = Rec."Posting Type"::Advance then
        //             Events.ValidateShortcutDimValues('POSTINGTYPE', 'ADVANCE', Rec."Dimension Set ID");
        //     end;
        // }
        modify("Document No.")
        {
            Visible = true;
        }
        modify("Document Type")
        {
            Visible = true;
        }
        modify("Account Type")
        {
            Visible = true;
        }
        modify("Posting Date")
        {
            Visible = true;
        }
        modify("Bal. Account Type")
        {
            Visible = true;
        }
        modify("Bal. Account No.")
        {
            Visible = true;
        }
        modify(Comment)
        {
            Visible = true;
        }
        modify("Shortcut Dimension 1 Code")
        {
            visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            visible = true;
        }
        modify(ShortcutDimCode3)
        {
            visible = true;
        }
        modify(ShortcutDimCode4)
        {
            visible = true;
        }
        modify(ShortcutDimCode5)
        {
            visible = true;
        }
        modify(ShortcutDimCode8)
        {
            visible = true;
        }
        modify("Cheque Date")
        {
            visible = false;
        }
        modify("Cheque No.")
        {
            Visible = false;
        }
        modify("Bank Payment Type")
        {
            Visible = false;
        }
        modify("Check Printed")
        {
            Visible = false;
        }
        modify("Nature of Remittance")
        {
            Visible = false;
        }
        modify("Act Applicable")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = false;
        }
        modify("EU 3-Party Trade")
        {
            Visible = false;
        }
        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("TCS Nature of Collection")
        {
            Visible = false;
        }
        modify("T.C.A.N. No.") { Visible = false; }

        modify(Amount)
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        // modify("Workflow Sub Document Type")
        // {
        //     Visible = false;
        // }
        // modify("Workflow Approval Status")
        // {
        //     Visible = false;
        // }
        modify("Bal. Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Bal. Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        // modify("Transaction Type")
        // {
        //     Visible = false;
        // }
        modify(AccountName)
        {
            Visible = false;
        }
        // modify("Branch / HO Entry")
        // {
        //     Visible = false;
        // }
        // modify("Payment Method Code")
        // {
        //     Visible = false;
        // }
        modify("Deferral Code")
        {
            Visible = false;
        }
        // modify("Job No.")
        // {
        //     Visible = false;
        // }
        // modify("Job Task No.")
        // {
        //     Visible = false;
        // }
        // modify("Job Quantity")
        // {
        //     Visible = false;
        // }
        // modify("Provisional Bill")
        // {
        //     Visible = false;
        // }
        modify(Correction)
        {
            Visible = false;
        }
        // modify("Employee Advance Type")
        // {
        //     Visible = false;
        // }
        modify("GST on Advance Payment")
        {
            visible = not IsSimplePage;
        }
        modify("GST Group Code")
        {
            visible = not IsSimplePage;
        }
        modify("GST TDS/GST TCS")
        {
            visible = not IsSimplePage;
        }
        modify("GST TDS/TCS Base Amount")
        {
            visible = not IsSimplePage;
        }
        modify("GST TCS State Code")
        {
            visible = not IsSimplePage;
        }
        modify("TDS Section Code")
        {
            visible = not IsSimplePage;
        }
        modify("T.A.N. No.")
        {
            visible = not IsSimplePage;
        }
        modify("HSN/SAC Code")
        {
            visible = not IsSimplePage;
        }
        modify("Applies-to Doc. Type")
        {
            Visible = not IsSimplePage;
        }
        modify("Applies-to Doc. No.")
        {
            Visible = not IsSimplePage;
        }

        // addafter("Document No.")
        // {
        //     field("Party Type"; Rec."Party Type")
        //     {
        //         ApplicationArea = All;
        //         Visible = IsSimplePage;
        //     }
        // }
        // addafter("Party Type")
        // {
        //     field("Party Code"; Rec."Party Code")
        //     {
        //         ApplicationArea = All;
        //         Visible = IsSimplePage;
        //     }
        // }
        movefirst(Control1; "Posting Date")
        moveafter("Document Type"; "Document No.")
        // moveafter("Party Code"; "Account Type")
        moveafter("Account Type"; "Account No.")
        moveafter("Account No."; Description)
        moveafter(Description; "Location Code")
        moveafter("Location Code"; "Debit Amount")
        moveafter("Debit Amount"; "Credit Amount")
        moveafter("Credit Amount"; "Bal. Account Type")
        moveafter("Bal. Account Type"; "Bal. Account No.")
        // moveafter("Bal. Account No."; "Ref. Document Type")
        // moveafter("Ref. Document Type"; "Reference Document No.")
        // moveafter("Reference Document No."; Comment)
        moveafter(Comment; "Shortcut Dimension 2 Code")
        moveafter("Shortcut Dimension 2 Code"; "Shortcut Dimension 1 Code")
        moveafter("Shortcut Dimension 1 Code"; ShortcutDimCode3)
        moveafter(ShortcutDimCode3; ShortcutDimCode4)
        moveafter(ShortcutDimCode4; ShortcutDimCode5)
        moveafter(ShortcutDimCode5; ShortcutDimCode8)
        // moveafter(ShortcutDimCode8; "Responsibility Center")
        // moveafter("Responsibility Center"; "GST on Advance Payment")
        moveafter("GST on Advance Payment"; "GST Group Code")
        moveafter("GST Group Code"; "HSN/SAC Code")
        moveafter("HSN/SAC Code"; "GST TDS/GST TCS")
        moveafter("GST TDS/GST TCS"; "GST TCS State Code")
        moveafter("GST TCS State Code"; "GST TDS/TCS Base Amount")
        moveafter("GST TDS/TCS Base Amount"; "TDS Section Code")
        moveafter("TDS Section Code"; "T.A.N. No.")

        addafter("Location Code")
        {
            // field("Order Address Code"; Rec."Order Address Code")
            // {
            //     ApplicationArea = all;
            // }
        }
        // addafter("Reference Document No.")
        // {
        //     field("Milestone Code"; Rec."Milestone Code")
        //     {
        //         ApplicationArea = all;
        //     }
        // }
        moveafter("T.A.N. No."; "Applies-to Doc. Type")
        moveafter("Applies-to Doc. Type"; "Applies-to Doc. No.")
    }
    actions
    {
        modify(PostAndPrint)
        {
            Visible = false;
        }
        modify(ClassicView)
        {
            Visible = false;
        }
        modify(SimpleView)
        {
            Visible = false;
        }
        addfirst(Page)
        {
            action("show full details")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show More Columns';
                Image = SetupColumns;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'View all available fields. Fields not frequently used are currently hidden.';
                Visible = IsSimplePage;
                trigger OnAction()
                begin
                    // set journal preference for this page to be NOT simple mode (classic mode)
                    CurrPage.Close();
                    GenJnlManagement.SetJournalSimplePageModePreference(false, Page::"Cash Payment Voucher");
                    GenJnlManagement.SetLastViewedJournalBatchName(Page::"Cash Payment Voucher", CurrentJnlBatchName);
                    Page.Run(Page::"Cash Payment Voucher");
                    CurrPage.Update();
                end;
            }
            action("show less")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show Fewer Columns';
                Image = SetupList;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Hide fields that are not frequently used.';
                Visible = not IsSimplePage;
                trigger OnAction()
                begin
                    // set journal preference for this page to be simple mode
                    CurrPage.Close();
                    GenJnlManagement.SetJournalSimplePageModePreference(true, Page::"Cash Payment Voucher");
                    GenJnlManagement.SetLastViewedJournalBatchName(Page::"cash Payment Voucher", CurrentJnlBatchName);
                    Page.Run(Page::"Cash Payment Voucher");
                    CurrPage.Update();
                end;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // Rec.Validate("Posting Type", Rec."Posting Type"::Running);
        // Events.ValidateShortcutDimValues('POSTINGTYPE', 'RUNNING', Rec."Dimension Set ID");
    end;

    trigger OnAfterGetcurrRecord()
    var
        ClientTypeManagementLocal: Codeunit "Client Type Management";
    begin
        TotalBalanceVisible := true;
        BalanceVisible := true;
        AmountVisible := true;
        // Get simple / classic mode for this page except when called from a webservices (SOAP or ODATA)
        if ClientTypeManagementLocal.GetCurrentClientType() in [ClientType::SOAP, ClientType::OData, ClientType::ODataV4]
        then
            IsSimplePage := false
        else
            IsSimplePage := GenJnlManagement.GetJournalSimplePageModePreference(Page::"Cash Payment Voucher");
        GeneralLedgerSetup.Get();
        //SetJobQueueVisibility();
    end;

    var
        // Events: Codeunit Events;
        myInt: Integer;
        IsSimplePage: Boolean;
        GenJnlManagement: Codeunit GenJnlManagement;
        CurrentJnlBatchName: Code[20];
        TotalBalanceVisible: Boolean;
        BalanceVisible: Boolean;
        AmountVisible: Boolean;
        GeneralLedgerSetup: Record "General Ledger Setup";
        GenJouLine: Record "Gen. Journal Line";


}