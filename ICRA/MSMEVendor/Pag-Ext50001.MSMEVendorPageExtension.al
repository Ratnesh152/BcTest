pageextension 50001 "MSME Vendor Page Extension" extends "Vendor Card"
{
    layout
    {
        addafter(Address)
        {
            field("MSME Vendor"; Rec."MSME Vendor")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if rec."MSME Vendor" = true then
                        rec.TestField("MSME Vendor Certifiate No.");
                end;
            }
            field("MSME Vendor Certifiate No."; Rec."MSME Vendor Certifiate No.")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    rec.TestField("MSME Vendor", false);
                end;
            }
            field("ABS 206"; Rec."ABS 206")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if rec."ABS 206" = true then begin
                        rec.TestField("ITR Acknowledge No. 1");
                        rec.TestField("ITR Acknowledge No. 2");
                    end;
                end;
            }
            field("ITR Acknowledge No. 1"; Rec."ITR Acknowledge No. 1")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.TestField("ABS 206", false);
                end;
            }
            field("ITR Acknowledge No. 2"; Rec."ITR Acknowledge No. 2")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.TestField("ABS 206", false);
                end;
            }
        }
    }
}
