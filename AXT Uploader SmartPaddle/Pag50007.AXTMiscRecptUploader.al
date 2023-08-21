page 50007 "AXT Misc Recpt Uploader"
{
    ApplicationArea = All;
    Caption = 'AXT Misc Recpt Uploader';
    PageType = List;
    SourceTable = "AXT Mis. Recpt. Entry Staging";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;
    SourceTableView = sorting("Entry No.") order(ascending);
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Source System"; Rec."Source System")
                {
                }
                field("Company Code"; Rec."Company Code")
                {
                }
                field("Receipt Type"; Rec."Receipt Type")
                {
                }
                field("Nature of Transaction"; Rec."Nature of Transaction")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Transaction Ref. No."; Rec."Transaction Ref. No.")
                {
                }
                field("Payment Ref. No."; Rec."Payment Ref. No.")
                {
                }
                field(Reference; Rec.Reference)
                {
                }
                field("Branch Dimension Code"; Rec."Branch Dimension Code")
                {
                }
                field("Region Dimension Code"; Rec."Region Dimension Code")
                {
                }
                field("Department Dimension Code"; Rec."Department Dimension Code")
                {
                }
                field(Narration; Rec.Narration)
                {
                }
                field("Operation Status"; Rec."Operation Status")
                {
                }
                field(Stage; Rec.Stage)
                {
                }
                field("Error Message"; Rec."Error Message")
                {
                }
                field("Currency Rate"; Rec."Currency Rate")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Bal. Account Name"; Rec."Bal. Account Name")
                {
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Export)
            {
                ApplicationArea = All;
                Image = Export;
                Caption = 'Export';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = xmlport "Misc Receipt Entry Export";
            }
            action(Import)
            {
                ApplicationArea = All;
                Image = Import;
                Caption = 'Import';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = xmlport "Misc Rcpt Entry Staging Ulpoad";
            }
            // action("Export 1")
            // {
            //     ApplicationArea = All;
            //     Image = Export;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = xmlport 50014;
            // }
            // action("Import 1")
            // {
            //     ApplicationArea = All;
            //     Image = Import;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = xmlport 50002;
            // }
        }
    }
}
