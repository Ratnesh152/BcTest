report 50025 "Purchase Inv. Pending Approval"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/PurchaseInvPendingApproval.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                ORDER(Ascending)
                                WHERE("Document Type" = FILTER(Invoice));
            RequestFilterFields = "No.", "Buy-from Vendor No.";
            column(Document_No_; "Purchase Header"."No.")
            {
            }
            column(Vendor_Code; "Purchase Header"."Pay-to Vendor No.")
            {
            }
            column(Vendor_Name; "Purchase Header"."Pay-to Name")
            {
            }
            column(Vendor_Inv_No; "Purchase Header"."Vendor Invoice No.")
            {
            }
            column(Invoice_Date; "Purchase Header"."Document Date")
            {
            }
            column(Posting_Date; "Purchase Header"."Posting Date")
            {
            }
            column(LocationCode; "Purchase Header"."Location Code")
            {
            }
            column(VendorGSTRegNo; "Purchase Header"."Vendor GST Reg. No.")
            {
            }
            column(LocationGSTRegNo; "Purchase Header"."Location GST Reg. No.")
            {
            }
            column(PaymentMethodCode; "Purchase Header"."Payment Method Code")
            {
            }
            column(Status_; "Purchase Header".Status)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(Type_PurchaseLine;
                "Purchase Line".Type)
                {
                }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(Description_PurchaseLine; "Purchase Line".Description)
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(GSTBaseAmount_PurchaseLine; '')
                {
                }
                column(GST_PurchaseLine; '')
                {
                }
                column(GSTGroupCode_PurchaseLine; "Purchase Line"."GST Group Code")
                {
                }
                column(GSTGroupType_PurchaseLine; "Purchase Line"."GST Group Type")
                {
                }
                column(GST_Group_Type; "Purchase Line"."GST Group Type")
                {
                }
                column(TDSNatureofDeduction_PurchaseLine; '')
                {
                }
                column(TDSAmount_PurchaseLine; '')
                {
                }
                column(TDS_PurchaseLine; '')
                {
                }
                column(GSTCredit_PurchaseLine; "Purchase Line"."GST Credit")
                {
                }
                column(Today; Today)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    Today := DT2Date(System.CurrentDateTime)
                end;

            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Dept_Code: Code[20];
        Employee_Code: Code[20];
        Today: Date;
        AirLine_Booking_ID: Code[20];
}

