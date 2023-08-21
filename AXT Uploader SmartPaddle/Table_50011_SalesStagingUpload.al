table 50011 "AXT Sales Staging Upload"
{
    DataClassification = CustomerContent;
    Caption = 'Sales Staging Upload';
    DataPerCompany = false;

    fields
    {
        field(1; "Source System"; Enum "AXT Source System")
        {
            Caption = 'Source System';
            trigger OnValidate()
            begin
                Rec.TestField("Source System");
            end;
        }
        field(2; "Company Code"; Code[10])
        {
            Caption = 'Company Code';
        }
        field(18; "Sales Document Type"; Text[15])
        {
            Caption = 'Sales Document Type';
            trigger OnValidate()
            begin
                if not (("Sales Document Type" = 'Order') or ("Sales Document Type" = 'Invoice') or ("Sales Document Type" = 'Credit Memo')) then
                    Error('Sales Document Type is Wrong. Values are Case Sensitive.');
            end;
        }
        field(19; "Sales Document No."; Code[20])
        {
            Caption = 'Sales Document No.';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(5; "Customer Name2"; Text[50])
        {
            Caption = 'Customer Name2';
        }
        field(6; "Customer Address"; Text[100])
        {
            Caption = 'Customer Address';
        }

        field(7; "Customer Address2"; Text[50])
        {
            Caption = 'Customer Address2';
        }
        field(8; "Customer City"; Text[30])
        {
            Caption = 'Customer City';
        }
        field(9; "Customer State Code"; Code[10])
        {
            Caption = 'Customer State Code';
        }
        field(10; "Customer Post Code"; Code[20])
        {
            Caption = 'Customer Post Code';
        }
        field(11; "Customer Country Code"; Code[10])
        {
            Caption = 'Customer Country Code';
        }
        field(12; "Customer Email"; Text[80])
        {
            Caption = 'Customer Email';
        }
        field(13; "Customer Phone No."; Text[30])
        {
            Caption = 'Customer Phone No.';
        }
        field(14; "Customer P.A.N. No."; Code[20])
        {
            Caption = 'Customer P.A.N. No.';
        }
        field(15; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
        }
        field(16; "Customer GST Registration No."; Code[15])
        {
            Caption = 'Customer GST Registration No.';
        }
        field(17; "GST Customer Type"; enum "GST Customer Type")
        {
            Caption = 'GST Customer Type';
        }
        field(20; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }
        field(21; "Ship-to Address2"; Text[50])
        {
            Caption = 'Ship-to Address2';
        }
        field(22; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
        }
        field(23; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
        }
        field(24; "Ship-to State Code"; Code[20])
        {
            Caption = 'Ship-to State Code';
        }
        field(25; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(26; "Location Code"; Code[10])
        {

            Caption = 'Location Code';
        }
        field(27; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
        }
        field(28; "POS Out of India"; Boolean)
        {
            Caption = 'POS Out of India';
        }
        field(29; "Bill of Export No."; Code[20])
        {
            Caption = 'Bill of Export No.';
        }
        field(30; "Bill of Export Date"; Date)
        {
            Caption = 'Bill of Export Date';
        }
        field(31; "GST without Payment of Duty"; Boolean)
        {
            Caption = 'GST without Payment of Duty';
        }
        field(32; "Branch Dimension Code"; Code[20])
        {
            Caption = 'Branch Dimension Code';
        }
        field(33; "Business Line Dimension Code"; Code[20])
        {
            Caption = 'Business Line Dimension Code';
        }
        field(34; "Department Dimension Code"; Code[20])
        {
            Caption = 'Department Dimension Code';
        }
        field(35; "Sales Stream Dimension Code"; Code[20])
        {
            Caption = 'Sales Stream Dimension Code';
        }
        field(36; "Geography Dimension Code"; Code[20])
        {
            Caption = 'Geography Dimension Code';
        }
        field(41; "Region Dimension Code"; Code[20])
        {
            Caption = 'Region Dimension Code';
        }
        //Line
        field(42; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(43; "Type"; enum Type)
        {
            Caption = 'Type';
        }
        field(44; "Product Service No."; Code[20])
        {
            Caption = 'Product Service No.';
        }
        field(45; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
        }
        field(46; "Unit of Measure"; Code[10])
        {
            Caption = 'Unit of Measure';
        }
        field(47; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(48; "Amount Excl. GST"; Decimal)
        {
            Caption = 'Amount Excl. GST';
        }
        field(49; "GST %"; Decimal)
        {
            Caption = 'GST %';
        }
        field(50; "CGST Amount"; Decimal)
        {
            Caption = 'CGST Amount';
        }
        field(51; "SGST Amount"; Decimal)
        {
            Caption = 'SGST Amount';
        }
        field(52; "IGST Amount"; Decimal)
        {
            Caption = 'IGST Amount';
        }
        field(53; "HSN SAC Code"; Code[20])
        {
            Caption = 'HSN SAC Code';
        }
        field(54; "GST Group Code"; Code[20])
        {
            Caption = 'GST Group Code';
        }
        field(55; "Transferred to Int. Staging"; Boolean)
        {
            Caption = 'Transferred to Integration Staging';
            Editable = false;
        }
        field(56; "Is Debit Note"; Boolean)
        {
            Caption = 'Is Debit Note';
        }
        field(57; "Original Inv. No."; Code[20])
        {
            Caption = 'Original Inv. No.';
        }
        field(58; "Shipment id"; Integer)
        {
            Caption = 'Shipment id';
        }
        field(59; "Currency Exchange Rate"; Decimal)
        {
            Caption = 'Currency Exchange Rate';
        }
        field(60; "Sales Invoice No."; Code[20])
        {
            Caption = 'Sales Invoice No.';
        }
        field(100; "Batch No."; Code[20])
        {
            Caption = 'Batch No.';
            Editable = false;
        }
        field(101; "Approved"; Boolean)
        {
            Caption = 'Approved';
            Editable = false;
        }
        field(50200; "Purchase Reference"; Text[100])
        {
            Caption = 'Purchase Reference';
        }
        field(50201; "Purchase Document Date"; Date)
        {
            Caption = 'Purchase Document Date';
        }
    }

    keys
    {
        key(PK; "Source System", "Company Code", "Sales Document Type", "Sales Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}