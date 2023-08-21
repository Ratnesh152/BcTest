page 50006 "SCM Uploader Page"
{
    ApplicationArea = All;
    Caption = 'Scm Uploader Page';
    PageType = List;
    Editable = false;
    ModifyAllowed = false;
    SourceTable = "SCM_Uploader Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Source System"; Rec."Source System")
                {
                    ToolTip = 'Specifies the value of the Source System field.';
                }
                field("Company Code"; Rec."Company Code")
                {
                    ToolTip = 'Specifies the value of the Company Code field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Sale Document Type"; Rec."Sale Document Type")
                {
                    ToolTip = 'Specifies the value of the Sale Document Type field.';
                }
                field("Is Debit Note"; Rec."Is Debit Note")
                {
                    ToolTip = 'Specifies the value of the Is Debit Note field.';
                }
                field("Sales Document No."; Rec."Sales Document No.")
                {
                    ToolTip = 'Specifies the value of the Sales Document No. field.';
                }
                field("Ship To Address"; Rec."Ship To Address")
                {
                    ToolTip = 'Specifies the value of the Ship To Address field.';
                }
                field("Ship To Address 2"; Rec."Ship To Address 2")
                {
                    ToolTip = 'Specifies the value of the Ship To Address 2 field.';
                }
                field("Ship To City"; Rec."Ship To City")
                {
                    ToolTip = 'Specifies the value of the Ship To City field.';
                }
                field("Ship To Post Code"; Rec."Ship To Post Code")
                {
                    ToolTip = 'Specifies the value of the Ship To Post Code field.';
                }
                field("Ship To State Code"; Rec."Ship To State Code")
                {
                    ToolTip = 'Specifies the value of the Ship To State Code field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Bill to Export No"; Rec."Bill to Export No")
                {
                    ToolTip = 'Specifies the value of the Bill to Export No field.';
                }
                field("Bill to Export Date"; Rec."Bill to Export Date")
                {
                    ToolTip = 'Specifies the value of the Bill to Export Date field.';
                }
                field("GST Without Payment Of Duty"; Rec."GST Without Payment Of Duty")
                {
                    ToolTip = 'Specifies the value of the GST Without Payment Of Duty field.';
                }
                field("Branch Dimension"; Rec."Branch Dimension")
                {
                    ToolTip = 'Specifies the value of the Branch Dimension field.';
                }
                field("Department Dimension"; Rec."Department Dimension")
                {
                    ToolTip = 'Specifies the value of the Department Dimension field.';
                }
                field("Region Dimension"; Rec."Region Dimension")
                {
                    ToolTip = 'Specifies the value of the Region Dimension field.';
                }
                field("Original Inv No."; Rec."Original Inv No.")
                {
                    ToolTip = 'Specifies the value of the Original Inv No. field.';
                }
                field("Shipment Id"; Rec."Shipment Id")
                {
                    ToolTip = 'Specifies the value of the Shipment Id field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Product Service No."; Rec."Product Service No.")
                {
                    ToolTip = 'Specifies the value of the Product Service No. field.';
                }
                field("Quantity "; Rec."Quantity")
                {
                    ToolTip = 'Specifies the value of the Quantity  field.';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit Of Measure field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Amount Excl. GST"; Rec."Amount Excl. GST")
                {
                    ToolTip = 'Specifies the value of the Amount Excl. GST field.';
                }
                field("GST Percentage"; Rec."GST Percentage")
                {
                    ToolTip = 'Specifies the value of the GST Percentage field.';
                }
                field("CGST Amount"; Rec."CGST Amount")
                {
                    ToolTip = 'Specifies the value of the CGST Amount field.';
                }
                field("SGST Amount"; Rec."SGST Amount")
                {
                    ToolTip = 'Specifies the value of the SGST Amount field.';
                }
                field("IGST Amount"; Rec."IGST Amount")
                {
                    ToolTip = 'Specifies the value of the IGST Amount field.';
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                    ToolTip = 'Specifies the value of the HSN/SAC Code field.';
                }
                field("GST Group Code"; Rec."GST Group Code")
                {
                    ToolTip = 'Specifies the value of the GST Group Code field.';
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
                Caption = 'Export';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = xmlport "SCM Uploader Export";
            }
        }
    }
}
