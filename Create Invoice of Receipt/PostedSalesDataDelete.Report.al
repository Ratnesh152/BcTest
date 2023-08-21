report 59005 "Posted Sales Data Delete"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata "Sales Invoice Line" = M,
                  tabledata "G/L Entry" = M,
                  tabledata "VAT Entry" = M,
                  tabledata "Cust. Ledger Entry" = M,
                  tabledata "Detailed Cust. Ledg. Entry" = M,
                  tabledata "GST Ledger Entry" = M,
                  tabledata "Detailed GST Ledger Entry" = M,
                  tabledata "Tax Transaction Value" = M;

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            RequestFilterFields = "Document No.";

            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemTableView = sorting("Document No.", "Posting Date");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "G/L Entry".Amount := 0;
                    "G/L Entry".Quantity := 0;
                    "G/L Entry"."VAT Amount" := 0;
                    "G/L Entry"."Debit Amount" := 0;
                    "G/L Entry"."Credit Amount" := 0;
                    "G/L Entry".Modify();
                end;
            }
            dataitem("VAT Entry"; "VAT Entry")
            {
                DataItemTableView = sorting("Document No.", "Posting Date");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "VAT Entry".Base := 0;
                    "VAT Entry".Amount := 0;
                    "VAT Entry"."Base Before Pmt. Disc." := 0;
                    "VAT Entry".Modify();
                end;
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemTableView = sorting("Document No.");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "Cust. Ledger Entry"."Sales (LCY)" := 0;
                    "Cust. Ledger Entry"."Profit (LCY)" := 0;
                    "Cust. Ledger Entry".Modify();
                end;
            }
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemTableView = sorting("Document No.", "Document Type", "Posting Date");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "Detailed Cust. Ledg. Entry".Amount := 0;
                    "Detailed Cust. Ledg. Entry"."Amount (LCY)" := 0;
                    "Detailed Cust. Ledg. Entry"."Debit Amount" := 0;
                    "Detailed Cust. Ledg. Entry"."Credit Amount" := 0;
                    "Detailed Cust. Ledg. Entry"."Debit Amount (LCY)" := 0;
                    "Detailed Cust. Ledg. Entry"."Credit Amount (LCY)" := 0;
                    "Detailed Cust. Ledg. Entry".Modify();
                end;

            }
            dataitem("GST Ledger Entry"; "GST Ledger Entry")
            {
                DataItemTableView = sorting("Entry No.");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "GST Ledger Entry"."GST Base Amount" := 0;
                    "GST Ledger Entry"."GST Amount" := 0;
                    "GST Ledger Entry".Modify();
                end;
            }
            dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
            {
                DataItemTableView = sorting("Document No.", "HSN/SAC Code");
                DataItemLink = "Document No." = field("Document No.");
                trigger OnAfterGetRecord()
                begin
                    "Detailed GST Ledger Entry"."GST Base Amount" := 0;
                    "Detailed GST Ledger Entry"."GST %" := 0;
                    "Detailed GST Ledger Entry"."GST Amount" := 0;
                    "Detailed GST Ledger Entry".Quantity := 0;
                    "Detailed GST Ledger Entry"."Remaining Base Amount" := 0;
                    "Detailed GST Ledger Entry"."Remaining GST Amount" := 0;
                    "Detailed GST Ledger Entry"."Remaining Quantity" := 0;
                    "Detailed GST Ledger Entry".Modify();
                end;
            }

            dataitem("Tax Transaction Value"; "Tax Transaction Value")
            {
                DataItemTableView = sorting("Tax Record ID", "Tax Type");

                trigger OnPreDataItem()
                begin
                    "Tax Transaction Value".SetRange("Tax Record ID", "Sales Invoice Line".RecordId);
                end;

                trigger OnAfterGetRecord()
                begin
                    "Tax Transaction Value".Amount := 0;
                    "Tax Transaction Value"."Amount (LCY)" := 0;
                    "Tax Transaction Value".Modify();
                end;
            }
            trigger OnAfterGetRecord()
            begin
                "Sales Invoice Line".Quantity := 0;
                "Sales Invoice Line"."Unit Price" := 0;
                "Sales Invoice Line"."Unit Cost (LCY)" := 0;
                "Sales Invoice Line"."VAT %" := 0;
                "Sales Invoice Line"."Line Discount %" := 0;
                "Sales Invoice Line"."Line Discount Amount" := 0;
                "Sales Invoice Line".Amount := 0;
                "Sales Invoice Line"."Amount Including VAT" := 0;
                "Sales Invoice Line"."VAT Base Amount" := 0;
                "Sales Invoice Line"."Line Amount" := 0;
                "Sales Invoice Line".Modify();
            end;
        }

    }

    /*    
        requestpage
        {
            layout
            {
                area(Content)
                {
                    group(GroupName)
                    {
                        field(Name; SourceExpression)
                        {
                            ApplicationArea = All;

                        }
                    }
                }
            }

            actions
            {
                area(processing)
                {
                    action(ActionName)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        rendering
        {
            layout(LayoutName)
            {
                Type = RDLC;
                LayoutFile = 'mylayout.rdl';
            }
        }
      */

    trigger OnPreReport()
    begin
        if "Sales Invoice Line".GetFilter("Document No.") = '' then
            Error('Please Enter Document No.');
    end;

    trigger OnPostReport()
    begin
        Message('Data Updated.....');
    end;

    var
        myInt: Integer;
}