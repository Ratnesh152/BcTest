report 50099 CleanData
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Permissions = tabledata "G/L Entry" = D,
                    tabledata "Value Entry" = D,
                    tabledata "Item Ledger Entry" = D,
                    tabledata "Detailed GST Ledger Entry" = D,
                    tabledata "Vendor Ledger Entry" = D,
                    tabledata "Detailed Vendor Ledg. Entry" = D,
                    tabledata "Purch. Inv. Header" = D,
                    tabledata "Job Ledger Entry" = D,
                    tabledata "Item Application Entry" = D,
                    tabledata "Purch. Rcpt. Line" = D,
                    tabledata "Purch. Rcpt. Header" = D,
                    tabledata "Purch. Inv. Line" = D,
                    tabledata "Dimension Set Entry" = D,
                    tabledata "GST Ledger Entry" = D,
                    tabledata "G/L - Item Ledger Relation" = D,
                    tabledata "Item Register" = D,
                    tabledata "G/L Register" = D,
                    tabledata "Dimension Set Tree Node" = D,
                    tabledata "Posted Approval Entry" = D,
                    tabledata "Notification Entry" = D,
                    tabledata "Change Log Entry" = D,
                    tabledata "Item Variant" = D,
                    tabledata "Job Planning Line" = D,
                    tabledata "Purchase Line" = D,
                    // tabledata "Job Master" = D,
                    tabledata "Customer" = D,
                    tabledata "Cust. Ledger Entry" = D,
                    // tabledata "Goods Receipt Header" = D,
                    // tabledata "Indent Line" = D,
                    tabledata "FA Ledger Entry" = D,
                    tabledata "Detailed Cust. Ledg. Entry" = D,
                    tabledata "Sales Line" = D,
                    tabledata "Sales Header" = D,
                    // tabledata "Goods Receipt Line" = D,
                    tabledata "VAT Entry" = D,
                    tabledata "Purchase Header" = D,
                    tabledata "Sales Invoice Header" = D,
                    // tabledata "Gate Pass Header" = D,
                    tabledata "TDS Entry" = D,
                    tabledata "Fixed Asset" = D,
                    tabledata "Sales Cr.Memo Header" = D,
                    tabledata "Analysis View Entry" = D,
                    // tabledata "Indent Line Archive" = D,
                    // tabledata "Indent Header Archive" = D,
                    // tabledata "Gate Pass Line" = D,
                    // tabledata "Indent Header" = D,
                    tabledata "Purch. Cr. Memo Hdr." = D,
                    tabledata "Job" = D,
                    tabledata "Sales Cr.Memo Line" = D,
                    tabledata "Sales Invoice Line" = D,
                    tabledata "Transfer Line" = D,
                    tabledata "Bank Account Ledger Entry" = D,
                    tabledata "Item Journal Line" = D,
                    tabledata "Gen. Journal Line" = D,
                    tabledata "Job Task" = D,
                    tabledata "Employee" = D,
                    tabledata "Purchase Line Archive" = D,
                    tabledata "Job Queue Entry" = D,
                    tabledata "Phys. Inventory Ledger Entry" = D,
                    tabledata "Purch. Cr. Memo Line" = D,
                    tabledata "Location" = D,
                    // tabledata "Award Note" = D,
                    // tabledata "Enquiry Line" = D,
                    // tabledata "Terms" = D,
                    // tabledata "Enquiry Header" = D,
                    tabledata "Posted Narration" = D,
                    tabledata "GST Reconcilation Line" = D,
                    tabledata "Detailed GST Entry Buffer" = D,
                    tabledata "Post Value Entry to G/L" = D,
                    tabledata "FA Register" = D,
                    tabledata "Purchase Header Archive" = D,
                    tabledata "Job Register" = D,
                    tabledata "Detailed GST Ledger Entry Info" = D,
                    tabledata "Avg. Cost Adjmt. Entry Point" = D,
                    tabledata "Transfer Receipt Line" = D,
                    tabledata "Transfer Receipt Header" = D,
                    tabledata "Transfer Shipment Line" = D,
                    tabledata "Transfer Shipment Header" = D,
                    tabledata "Posted Approval Comment Line" = D,
                    tabledata "User Time Register" = D,
                    // tabledata "Capitalization Ledger Entry" = D,
                    // tabledata "FA Buffer" = D,
                    // tabledata "Agreement Archive Line" = D,
                    // tabledata "Agreement Archive Header" = D,
                    // tabledata "Centre Budget Archive" = D,
                    // tabledata "Agreement Line" = D,
                    // tabledata "Agreement Header" = D,
                    // tabledata "Centre Budget" = D,
                    tabledata "Transfer Header" = D,
                    tabledata "Responsibility Center" = D,
                    tabledata "FA Journal Line" = D,
                    tabledata "Bank Account Statement Line" = D,
                    tabledata "Bank Account Statement" = D,
                    tabledata "G/L Entry - VAT Entry Link" = D,
                    tabledata "Error Message" = D,
                    tabledata "Error Message Register" = D,
                    tabledata "Email Outbox" = D,
                    tabledata "Job Queue Log Entry" = D,
                    tabledata "Workflow Step Instance Archive" = D,
                    tabledata "Workflow Step Argument Archive" = D,
                    tabledata "Approval Entry" = D,
                    // tabledata "AXT Notification Log Entry" = D,
                    tabledata "Job Task Dimension" = D,
                    // tabledata "Purch. Delivery Schedule" = D,
                    // tabledata "Extended Description" = D,
                    tabledata "Sent Email" = D,
                    // tabledata "Payment Terms Line Purchase" = D,
                    tabledata "My Notifications" = D,
                    // tabledata "Project Budget at Task" = D,
                    tabledata "Sales Cr. Memo Entity Buffer" = D,
                    tabledata "Sent Notification Entry" = D,
                    tabledata "Approval Comment Line" = D,
                    // tabledata "Master RFQ Line" = D,
                    // tabledata "AXT SP Files" = D,
                    // tabledata "Purchase Price SW" = D,
                    // tabledata "Client Billing Detail" = D,
                    tabledata "Main Asset Component" = D,
                    tabledata "Restricted Record" = D,
                    tabledata "Job Planning Line Invoice" = D,
                    // tabledata "Quote Term" = D,
                    // tabledata "Invoice Head" = D,
                    tabledata "GST Tracking Entry" = D,
                    tabledata "GST Recon. Mapping" = D,
                    tabledata "GST Reconcilation" = D,
                    tabledata "Reference Invoice No." = D,
                    tabledata "Job Entry No." = D;


    dataset
    {

        dataitem(TabInfo;
        AllObj)
        {
            RequestFilterFields = "Object ID";
            DataItemTableView = where("Object Type" = filter(Table));
            trigger OnAfterGetRecord()
            begin
                RecRef.OPEN(TabInfo."Object ID");
                RecRef.DELETEALL(False);
                RecRef.CLOSE;
            end;
        }
    }
    trigger OnPreReport()
    begin


        if TabInfo.GetFilter("Object ID") = '' then
            Error('Please Enter Table No.');
    end;

    trigger OnPostReport()
    begin
        Message('Data Deleted.');
    end;

    var
        RecRef: RecordRef;
}