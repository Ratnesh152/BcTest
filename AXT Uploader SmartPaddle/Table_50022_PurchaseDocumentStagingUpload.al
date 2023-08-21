table 50022 "AXT Purch. Doc. Staging Upload"
{

    Caption = 'Purchase Document Staging Upload';

    fields
    {
        field(1; "Source System"; Enum "AXT Source System")
        {
            Caption = 'Source System';
        }
        field(2; "Company Code"; code[10])
        {
            Caption = 'Company Code';
        }
        field(3; "Vendor No."; code[20])
        {
            Caption = 'Vendor No.';
        }
        field(4; "Purchase Document Type"; Enum "Purchase Document Type")
        {
            Caption = 'Purchase Document Type';
        }
        field(5; "Nature of Transaction"; text[30])
        {
            Caption = 'Nature of Transaction';
        }
        field(6; "Purchase Document No."; code[20])
        {
            Caption = 'Purchase Document No.';
        }
        field(7; "Vendor Inv CMDN No."; code[35])
        {
            Caption = 'Vendor Inv CMDN No.';
        }
        field(8; "Purchase Invoice No."; Code[20])
        {
            Caption = 'Purchase Invoice No.';
        }
        field(9; "Shipment ID"; Integer)
        {
            Caption = 'Shipment ID';
        }
        field(10; "Original Invoice No."; Code[20])
        {
            Caption = 'Original Invoice No.';
        }
        field(11; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(12; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(13; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(14; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
        }
        field(15; "Currency Code"; Code[3])
        {
            Caption = 'Currency Code';
        }
        field(16; "Currency Rate"; Decimal)
        {
            Caption = 'Currency Rate';
        }
        field(17; "Order Address Code"; Code[10])
        {
            Caption = 'Order Address Code';
        }
        field(18; "Invoice Discount Amount"; Decimal)
        {
            Caption = 'Invoice Discount Amount';
        }
        field(19; "Branch Dimension"; Code[20])
        {
            Caption = 'Branch Dimension';
        }
        field(20; "Department Dimension"; Code[20])
        {
            Caption = 'Department Dimension';
        }
        field(21; "Region Dimension"; Code[20])
        {
            Caption = 'Region Dimension';
        }
        field(22; "Comment"; Text[250])
        {
            Caption = 'Comment';
        }
        field(23; "Is Debit Note"; Boolean)
        {
            Caption = 'Is Debit Note';
        }
        field(200; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(201; "Type"; Enum "Purchase Line Type")
        {
            Caption = 'Type';
        }
        field(202; "Product Service No."; Code[20])
        {
            Caption = 'Product Service No.';
        }
        field(203; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(204; "Unit Of Measure"; Code[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(205; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
        }
        field(206; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
        }
        field(207; "TDS Section"; Code[10])
        {
            Caption = 'TDS Section';
        }
        field(208; "GST Group Code"; Code[10])
        {
            Caption = 'GST Group Code';
        }
        field(209; "HSN/SAC Code"; Code[10])
        {
            Caption = 'HSN/SAC Code';
        }
        field(210; "GST Assessable Value"; Decimal)
        {
            Caption = 'GST Assessable Value';
        }
        field(211; "Custom Duty Amount"; Decimal)
        {
            Caption = 'Custom Duty Amount';
        }
        field(212; Exempted; Boolean)
        {
            Caption = 'Exempted';
        }
        field(213; "GST Credit"; Enum "GST Credit")
        {
            Caption = 'GST Credit';
        }
        field(214; "GST Percentage"; Decimal)
        {
            Caption = 'GST Percentage';
        }
        field(215; "CGST Amount"; Decimal)
        {
            Caption = 'CGST Amount';
        }
        field(216; "SGST Amount"; Decimal)
        {
            Caption = 'SGST Amount';
        }
        field(217; "IGST Amount"; Decimal)
        {
            Caption = 'IGST Amount';
        }
        field(218; "Branch Line Dimension"; Code[20])
        {
            Caption = 'Branch Line Dimension';
        }
        field(219; "Department Line Dimension"; Code[20])
        {
            Caption = 'Department Line Dimension';
        }
        field(220; "Region Line Dimension"; Code[20])
        {
            Caption = 'Region Line Dimension';
        }
        field(222; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
        }
        field(223; "Product Service Description"; Text[100])
        {
            Caption = 'Product Service Description';
        }
        field(224; "Amount Excl. GST"; Decimal)
        {
            Caption = 'Amount Excl. GST';
        }
        field(227; "BC Tax Calc. Required"; Boolean)
        {
            Caption = 'BC Tax Calculation Required';
        }
        field(300; "Payment Reference No."; Code[250])
        {
            Caption = 'Payment Reference No.';
        }
        field(301; "Transferred to Int. Staging"; Boolean)
        {
            Caption = 'Transferred to Integration Staging';
            Editable = false;
        }
        field(302; "Batch No."; Code[20])
        {
            Caption = 'Batch No.';
            Editable = false;
        }
        field(303; "Approved"; Boolean)
        {
            Caption = 'Approved';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Source System", "Company Code", "Purchase Document Type", "Purchase Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}