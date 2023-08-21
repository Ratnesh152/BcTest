pageextension 50106 PostedpurRecpt extends 136
{
    actions
    {
        addafter("&Print")
        {
            action(CreateInvoice)
            {
                AccessByPermission = TableData "Purch. Rcpt. Header" = R;
                ApplicationArea = All;
                Caption = 'Create Invoice';
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                    PurchRecptLine: Record "Purch. Rcpt. Line";
                    PurchaseLine: Record "Purchase Line";
                    LineNo: Integer;
                begin
                    createPurchaseHeader(PurchaseHeader, rec);
                    PurchRecptLine.Reset();
                    PurchRecptLine.SetRange("Document No.", Rec."No.");
                    if PurchRecptLine.FindSet() then begin
                        Message(rec."No.");
                        LineNo := 0;
                        repeat
                            LineNo += 10000;
                            CreatePurchaseLine(PurchaseHeader, PurchRecptLine, LineNo);
                        until PurchRecptLine.Next() = 0;
                    end;
                    Message('Invoice created Successfully');

                end;
            }
        }
    }
    var
        SuppressTotals: Boolean;
        PurchInvNo: code[20];
        PurchInvSubform: Record "Purchase Line";

    protected var
        DocumentTotals: Codeunit "Document Totals";
        VATAmount: Decimal;
        TotalPurchaseLine: Record "Purchase Line";

    procedure CreateInvoice()
    var
        PurchaseRecptHeader: Record "Purch. Rcpt. Header";
        PurchRecptLine: Record "Purch. Rcpt. Line";
        LineNo: Integer;
    begin

    end;

    procedure createPurchaseHeader(var PurchaseHeader: Record "Purchase Header"; var PurchRecptHeader: Record "Purch. Rcpt. Header")
    begin
        PurchaseHeader.Reset();
        PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::Invoice);
        PurchaseHeader.Insert(true);
        PurchInvNo := PurchaseHeader."No.";
        PurchaseHeader.Validate("Buy-from Vendor No.", PurchRecptHeader."Buy-from Vendor No.");
        PurchaseHeader.Validate("Location Code", PurchRecptHeader."Location Code");
        PurchaseHeader.Modify(true);
    end;

    procedure CreatePurchaseLine(var PurchaseHeader: Record "Purchase Header"; var PurchRcptline: Record "Purch. Rcpt. Line"; LineNo: Integer)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Init();
        PurchaseLine.Validate("Document Type", PurchaseLine."Document Type"::Invoice);
        PurchaseLine.Validate("Document No.", PurchaseHeader."No.");
        PurchaseLine.Validate("Line No.", LineNo);
        PurchaseLine.Insert(true);
        PurchaseLine.Validate(Type, PurchRcptline.Type);
        PurchaseLine.Validate("No.", PurchRcptline."No.");
        PurchaseLine.Validate("Location Code", PurchRcptline."Location Code");
        PurchaseLine.Validate(Description, PurchRcptline.Description);
        PurchaseLine.Validate("Unit of Measure Code", PurchRcptline."Unit of Measure Code");
        PurchaseLine.Validate(Quantity, PurchRcptline.Quantity);
        PurchaseLine.Validate("Unit Cost", PurchRcptline."Unit Cost");
        PurchaseLine.Modify(true);
    end;

}