page 50002 "Enquiary Card"
{
    Caption = 'Enquiary Card';
    PageType = Document;
    SourceTable = "Enquairy Header";
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Expected Date"; Rec."Expected Date")
                {
                    ToolTip = 'Specifies the value of the Expected Date field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
            }
            part(EnquiaryLine; "Enquairy Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Purchase Order")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Rejected then
                        CreatePurchaseOrder(Rec);
                end;
            }
        }
    }
    procedure CreatePurchaseOrder(var EnquiaryHeader: Record "Enquairy Header")
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.Validate("Document Type", EnquiaryHeader."Document Type"::Order);
        PurchaseHeader.Validate("No.", EnquiaryHeader."No.");
        PurchaseHeader.Validate("Buy-from Vendor No.", EnquiaryHeader."Vendor No.");
        PurchaseHeader.Insert();
        Message(PurchaseHeader."No.");
        PurchaseHeader.Modify(true);
    end;


}
