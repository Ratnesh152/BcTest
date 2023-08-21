table 50003 "SCM_Uploader Table"
{
    Caption = 'SCM_Uploader Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Source System"; Code[10])
        {
            Caption = 'Source System';
            DataClassification = ToBeClassified;
        }
        field(2; "Company Code"; Code[10])
        {
            Caption = 'Company Code';
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Sale Document Type"; Text[15])
        {
            Caption = 'Sale Document Type';
            DataClassification = ToBeClassified;
        }
        field(5; "Is Debit Note"; Boolean)
        {
            Caption = 'Is Debit Note';
            DataClassification = ToBeClassified;
        }
        field(6; "Sales Document No."; Text[20])
        {
            Caption = 'Sales Document No.';
            DataClassification = ToBeClassified;
        }
        field(7; "Ship To Address"; Text[50])
        {
            Caption = 'Ship To Address';
            DataClassification = ToBeClassified;
        }
        field(8; "Ship To Address 2"; Text[50])
        {
            Caption = 'Ship To Address 2';
            DataClassification = ToBeClassified;
        }
        field(9; "Ship To City"; Text[30])
        {
            Caption = 'Ship To City';
            DataClassification = ToBeClassified;
        }
        field(10; "Ship To Post Code"; Code[20])
        {
            Caption = 'Ship To Post Code';
            DataClassification = ToBeClassified;
        }
        field(11; "Ship To State Code"; Code[10])
        {
            Caption = 'Ship To State Code';
            DataClassification = ToBeClassified;
        }
        field(12; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(13; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(14; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
        }
        field(15; "Bill to Export No"; Code[20])
        {
            Caption = 'Bill to Export No';
            DataClassification = ToBeClassified;
        }
        field(16; "Bill to Export Date"; Date)
        {
            Caption = 'Bill to Export Date';
            DataClassification = ToBeClassified;
        }
        field(17; "GST Without Payment Of Duty"; Boolean)
        {
            Caption = 'GST Without Payment Of Duty';
            DataClassification = ToBeClassified;
        }
        field(18; "Branch Dimension"; Code[20])
        {
            Caption = 'Branch Dimension';
            DataClassification = ToBeClassified;
        }
        field(19; "Department Dimension"; Code[20])
        {
            Caption = 'Department Dimension';
            DataClassification = ToBeClassified;
        }
        field(20; "Region Dimension"; Code[20])
        {
            Caption = 'Region Dimension';
            DataClassification = ToBeClassified;
        }
        field(21; "Original Inv No."; Code[20])
        {
            Caption = 'Original Inv No.';
            DataClassification = ToBeClassified;
        }
        field(22; "Shipment Id"; Code[10])
        {
            Caption = 'Shipment Id';
            DataClassification = ToBeClassified;
        }
        field(23; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(24; "Type"; Text[20])
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(25; "Product Service No."; Code[20])
        {
            Caption = 'Product Service No.';
            DataClassification = ToBeClassified;
        }
        field(26; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(27; "Unit Of Measure"; Text[10])
        {
            Caption = 'Unit Of Measure';
            DataClassification = ToBeClassified;
        }
        field(28; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(29; "Amount Excl. GST"; Decimal)
        {
            Caption = 'Amount Excl. GST';
            DataClassification = ToBeClassified;
        }
        field(30; "GST Percentage"; Decimal)
        {
            Caption = 'GST Percentage';
            DataClassification = ToBeClassified;
        }
        field(31; "CGST Amount"; Decimal)
        {
            Caption = 'CGST Amount';
            DataClassification = ToBeClassified;
        }
        field(32; "SGST Amount"; Decimal)
        {
            Caption = 'SGST Amount';
            DataClassification = ToBeClassified;
        }
        field(33; "IGST Amount"; Decimal)
        {
            Caption = 'IGST Amount';
            DataClassification = ToBeClassified;
        }
        field(34; "HSN/SAC Code"; Code[10])
        {
            Caption = 'HSN/SAC Code';
            DataClassification = ToBeClassified;
        }
        field(35; "GST Group Code"; Code[10])
        {
            Caption = 'GST Group Code';
            DataClassification = ToBeClassified;
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
