table 50003 "SCM_Uploader Table"
{
    Caption = 'SCM_Uploader Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Source System"; Code[10])
        {
            Caption = 'Source System';
        }
        field(2; "Company Code"; Code[10])
        {
            Caption = 'Company Code';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; "Sale Document Type"; Text[15])
        {
            Caption = 'Sale Document Type';
        }
        field(5; "Is Debit Note"; Boolean)
        {
            Caption = 'Is Debit Note';
        }
        field(6; "Sales Document No."; Text[20])
        {
            Caption = 'Sales Document No.';
        }
        field(7; "Ship To Address"; Text[50])
        {
            Caption = 'Ship To Address';
        }
        field(8; "Ship To Address 2"; Text[50])
        {
            Caption = 'Ship To Address 2';
        }
        field(9; "Ship To City"; Text[30])
        {
            Caption = 'Ship To City';
        }
        field(10; "Ship To Post Code"; Code[20])
        {
            Caption = 'Ship To Post Code';
        }
        field(11; "Ship To State Code"; Code[10])
        {
            Caption = 'Ship To State Code';
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(13; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(14; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
        }
        field(15; "Bill to Export No"; Code[20])
        {
            Caption = 'Bill to Export No';
        }
        field(16; "Bill to Export Date"; Date)
        {
            Caption = 'Bill to Export Date';
        }
        field(17; "GST Without Payment Of Duty"; Boolean)
        {
            Caption = 'GST Without Payment Of Duty';
        }
        field(18; "Branch Dimension"; Code[20])
        {
            Caption = 'Branch Dimension';
        }
        field(19; "Department Dimension"; Code[20])
        {
            Caption = 'Department Dimension';
        }
        field(20; "Region Dimension"; Code[20])
        {
            Caption = 'Region Dimension';
        }
        field(21; "Original Inv No."; Code[20])
        {
            Caption = 'Original Inv No.';
        }
        field(22; "Shipment Id"; Code[10])
        {
            Caption = 'Shipment Id';
        }
        field(23; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(24; "Type"; Text[20])
        {
            Caption = 'Type';
        }
        field(25; "Product Service No."; Code[20])
        {
            Caption = 'Product Service No.';
        }
        field(26; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
        }
        field(27; "Unit Of Measure"; Text[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(28; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(29; "Amount Excl. GST"; Decimal)
        {
            Caption = 'Amount Excl. GST';
        }
        field(30; "GST Percentage"; Decimal)
        {
            Caption = 'GST Percentage';
        }
        field(31; "CGST Amount"; Decimal)
        {
            Caption = 'CGST Amount';
        }
        field(32; "SGST Amount"; Decimal)
        {
            Caption = 'SGST Amount';
        }
        field(33; "IGST Amount"; Decimal)
        {
            Caption = 'IGST Amount';
        }
        field(34; "HSN/SAC Code"; Code[10])
        {
            Caption = 'HSN/SAC Code';
        }
        field(35; "GST Group Code"; Code[10])
        {
            Caption = 'GST Group Code';
        }
    }
    keys
    {
        key(PK; "Source System")
        {
            Clustered = true;
        }
    }
}
