page 50017 "Purchase Invoice Upload Rat"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    // RefreshOnActivate = true;
    PageType = List;
    SourceTable = "PI Uploader Rat";
    SourceTableView = SORTING("Document ID") ORDER(Ascending);
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document ID"; rec."Document ID")
                {
                }
                field("Vendor No."; rec."Vendor No.")
                {
                }
                field("Posting Date"; rec."Posting Date")
                {
                }
                field("Document Date"; rec."Document Date")
                {
                }
                field("Due Date"; rec."Due Date")
                {
                }
                field("Vendor Invoice No."; rec."Vendor Invoice No.")
                {
                }
                field(Location; rec.Location)
                {
                }
                field(Status; rec.Status)
                {
                }
                field("Error Text"; rec."Error Text")
                {
                }
                field("Purchase Invoice No."; rec."Purchase Invoice No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(ExporTemplate)
                {
                    ApplicationArea = ALl;
                    Caption = 'Export Template';
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = XMLport "PI Uplod-Export Template Rat";
                }
                action(ImportInvoiceLines)
                {
                    ApplicationArea = ALl;
                    Caption = 'Import';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = XMLport "PI Uploader Rat";
                    trigger OnAction()
                    begin
                        // if Rec."Vendor Invoice No." = xRec."Vendor Invoice No." then
                        //     Error(Rec."Vendor Invoice No.");
                        // CurrPage.Update();
                    end;
                }
                action(CreateInvoicesAllCompany)
                {
                    ApplicationArea = ALl;
                    Caption = 'Create Invoices - All Company';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        PIUploader: Record "PI Uploader Rat";
                        ProcessPICreatonRequest: Codeunit "Process PI CreatonRequest Rat";
                    begin
                        ProcessPICreatonRequest.CompanyWisePICreationRequest;
                    end;
                }
                action(CreateInvoiceCurrCompany)
                {
                    ApplicationArea = ALl;
                    Caption = 'Create Invoices -Current Company';
                    // Visible = false; 
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Process PI CreatonRequest Rat");
                    end;
                }
                action(CreateLocation)
                {
                    ApplicationArea = All;
                    Caption = 'Create Location';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        Codeunit.Run(Codeunit::CreateLocation1);
                    end;
                }
            }
        }
    }

}

