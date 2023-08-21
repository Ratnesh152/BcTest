page 50061 "Purchase Invoice Upload"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    ApplicationArea = All;
    PageType = List;
    SourceTable = 50020;
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
                field("Company Name"; rec."Company Name")
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
                field(Structure; rec.Structure)
                {
                }
                field("Link Path"; rec."Link Path")
                {
                }
                field(Type; rec.Type)
                {
                }
                field("No."; rec."No.")
                {
                }
                field(Description; rec.Description)
                {
                }
                field("Unit Of Measure Code"; rec."Unit Of Measure Code")
                {
                }
                field(Quantity; rec.Quantity)
                {
                }
                field("Direct Unit Cost Exc Tax"; rec."Direct Unit Cost Exc Tax")
                {
                }
                field("Description 2"; rec."Description 2")
                {
                }
                field("GST Group Code"; rec."GST Group Code")
                {
                }
                field("HSN Code"; rec."HSN Code")
                {
                }
                field("TDS Nature Of Deduction"; rec."TDS Nature Of Deduction")
                {
                }
                field("GST Group Type"; rec."GST Group Type")
                {
                }
                field("GST Credit"; rec."GST Credit")
                {
                }
                field("Project Code"; rec."Project Code")
                {
                }
                field("Department Code"; rec."Department Code")
                {
                }
                field("Employee Code"; rec."Employee Code")
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
                    RunObject = XMLport 50009;
                }
                action(ImportInvoiceLines)
                {
                    ApplicationArea = ALl;
                    Caption = 'Import';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = XMLport 50008;
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
                        PIUploader: Record 50020;
                        ProcessPICreatonRequest: Codeunit "Process PI CreatonRequest";
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
                        CODEUNIT.RUN(CODEUNIT::"Process PI CreatonRequest");
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

