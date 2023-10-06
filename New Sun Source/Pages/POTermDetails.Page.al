page 50052 "SSE PO Term Details"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SSE PO Term Details";
    AutoSplitKey = true;
    DataCaptionFields = "Purchase Order No.";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("PO Term Type Code"; Rec."PO Term Type Code")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Term Details"; Rec."Term Details")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Copy Terms From PO")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                    TargetTermsDetails, SourceTermsDetils : Record "SSE PO Term Details";
                    SourcePoNo, TargetPoNo : code[20];
                begin
                    if (PurchaseHeader.get(PurchaseHeader."Document Type"::Order, Rec."Purchase Order No.")) and (PurchaseHeader.Status = PurchaseHeader.Status::Released) then
                        PurchaseHeader.FieldError(Status);
                    TargetPoNo := Rec."Purchase Order No.";
                    PurchaseHeader.Reset();
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."Document Type"::Order);
                    if Page.RunModal(0, PurchaseHeader) = Action::LookupOK then begin
                        SourcePoNo := PurchaseHeader."No.";
                        TargetTermsDetails.Reset();
                        TargetTermsDetails.SetRange("Purchase Order No.", TargetPoNo);
                        TargetTermsDetails.DeleteAll();

                        SourceTermsDetils.Reset();
                        SourceTermsDetils.SetRange("Purchase Order No.", SourcePoNo);
                        if SourceTermsDetils.FindSet() then
                            repeat
                                TargetTermsDetails.Init();
                                TargetTermsDetails.TransferFields(SourceTermsDetils);
                                TargetTermsDetails."Purchase Order No." := TargetPoNo;
                                TargetTermsDetails.Insert(true);
                            until SourceTermsDetils.Next() = 0;
                    end;
                end;
            }
        }
    }
    trigger OnOpenPage()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        if (PurchaseHeader.get(PurchaseHeader."Document Type"::Order, Rec."Purchase Order No.")) and (PurchaseHeader.Status = PurchaseHeader.Status::Released) then begin
            CurrPage.Editable(false);
        end;
    end;
}