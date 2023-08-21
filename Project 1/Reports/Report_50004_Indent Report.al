report 50004 "Indent Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Project 1/Reports/Report_50004_Indent Report.rdl';
    Caption = 'Indent Report';
    UseRequestPage = true;
    dataset
    {
        dataitem("Indent Header Ratnesh"; "Indent Header Ratnesh")
        {
            DataItemTableView = sorting("No.");
            // RequestFilterFields = "No.", "Student No.";
            column(No_; "No.")
            {
            }
            column(Customer_No_; "Student No.")
            {
            }
            column(Released_By; "Released By")
            {
            }
            column(Created_By; "Created By")
            {
            }
            column(Released_Date; "Released Date")
            {
            }
            column(Department; Department)
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(Status; Status)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Address; Company.Address)
            {
            }
            column(Company_Address_2; Company."Address 2")
            {
            }
            column(Company_City; Company.City)
            {
            }
            column(Company_Cotact_Person; Company."Contact Person")
            {
            }
            column(Company_Email; Company."E-Mail")
            {
            }
            column(Company_Phone_No; Company."Phone No.")
            {
            }
            column(MSME_Vendor; "MSME Vendor")
            {
            }
            column(Company_GST_Restration_No; Company."Registration No.")
            {
            }
            column(Due_Not_Due; "Due/Not Due")
            {
            }
            column(DateToday; DateToday)
            {
            }
            column(Creation_Date; "Creation Date")
            {
            }
            column(AmountInWords; AmountInWords)
            {
            }
            dataitem("Indent Line Ratnesh"; "Indent Line Ratnesh")
            {
                DataItemLink = "Document No." = field("No.");
                column(Item_No_; "Item No.")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Amount; Amount)
                {
                }
                column(Total_Amount; "Total Amount")
                {
                }
                column(ShowTotal; ShowTotal)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                trigger OnPreDataItem()
                begin
                    TotalAmount := 0;
                end;

                trigger OnAfterGetRecord()
                begin
                    TotalAmount += Round(Quantity * Amount, 0.01, '>');

                    RepCheck.InitTextVariable();
                    RepCheck.FormatNoText(NoText, TotalAmount, "Indent Header Ratnesh"."Currency Code");
                    AmountInWords := UpperCase(NoText[1] + ' ' + NoText[2]);
                end;
            }
            trigger OnPreDataItem()
            begin
                Company.get();
            end;

            trigger OnAfterGetRecord()
            begin
                Duedate := 0D;
                if "Creation Date" > System.Today then
                    "Indent Header Ratnesh"."Due/Not Due" := "Indent Header Ratnesh"."Due/Not Due"::Due
                else
                    "Indent Header Ratnesh"."Due/Not Due" := "Indent Header Ratnesh"."Due/Not Due"::"Not Due";

            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field("Indent No"; ReqNo)
                    {
                        Editable = true;
                        ApplicationArea = All;
                    }
                    field("Student No."; StudNo)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        trigger OnOpenPage()
        var
            IndentHeader: Record "Indent Header Ratnesh";
        begin
            SetValues(IndentHeader);
        end;
    }
    trigger OnInitReport()
    begin

    end;

    trigger OnPreReport()
    begin
        glsetup.Get();
    end;

    trigger OnPostReport()
    begin

    end;

    var
        Company: Record "Company Information";
        ShowTotal: Boolean;
        glsetup: Record "General Ledger Setup";
        AmountInWords: Text;
        ReqNo: Code[20];
        RepCheck: Report "Check Report";
        NoText: array[2] of Text;
        vendorName: Text;
        PuchInvHeader: Record "Purch. Inv. Header";
        DateToday: Date;
        Duedate: date;
        TotalAmount: Decimal;
        Check: Decimal;
        StudNo: Code[20];
        PostedIndentReport: Label 'Posted Indent Report';
        IndentReport: Label 'Indent Report';

    procedure SetValues(var IndentHeader: Record "Indent Header Ratnesh")
    begin
        ReqNo := IndentHeader."No.";
        StudNo := IndentHeader."Student No."
    end;
}