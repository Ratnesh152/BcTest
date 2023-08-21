pageextension 50300 BPVExt extends "Bank Payment Voucher"
{
    layout
    {
        movefirst(Control1; "Posting Date")
        moveafter("Posting Date"; "Document Type")
        moveafter("Document Type"; "Document No.")
        moveafter("Document No."; "Account Type")
        moveafter("Account Type"; "Account No.")
        moveafter("Account No."; Description)
        moveafter(Description; "Location Code")
        moveafter("Location Code"; "Ship-to/Order Address Code")
        moveafter("Ship-to/Order Address Code"; "Debit Amount")
        moveafter("Debit Amount"; "Credit Amount")
        moveafter("Credit Amount"; "Bal. Account Type")
        moveafter("Bal. Account Type"; "Bal. Account No.")
        moveafter("Bal. Account No."; Comment)
        moveafter(Comment; "Bank Payment Type")
        moveafter("Bank Payment Type"; "Cheque No.")
        moveafter("Cheque No."; "Cheque Date")
        moveafter("Cheque Date"; "Shortcut Dimension 2 Code")
        moveafter("Shortcut Dimension 2 Code"; "Shortcut Dimension 1 Code")
        moveafter("Shortcut Dimension 1 Code"; ShortcutDimCode3)
        moveafter(ShortcutDimCode3; ShortcutDimCode4)
        moveafter(ShortcutDimCode4; ShortcutDimCode5)
        moveafter(ShortcutDimCode5; ShortcutDimCode8)
        moveafter("GST on Advance Payment"; "GST Group Code")
        moveafter("GST Group Code"; "HSN/SAC Code")
        moveafter("HSN/SAC Code"; "GST TDS/GST TCS")
        moveafter("GST TDS/GST TCS"; "GST TCS State Code")
        moveafter("GST TCS State Code"; "GST TDS/TCS Base Amount")
        // moveafter("GST TDS/TCS Base Amount";)
        // moveafter(;)
        // moveafter(;)
        // moveafter("Location State Code")
        moveafter("Location Code"; "GST Group Type")
        moveafter("GST Group Type"; "Vendor GST Reg. No.")
        moveafter("Vendor GST Reg. No."; "Location GST Reg. No.")
        moveafter("Location GST Reg. No."; "GST Vendor Type")
        modify("Posting Date")
        {
            Visible = true;
        }
    }

}