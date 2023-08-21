report 50010 "Update Sales Cr Memo"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    // DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Document Type" = filter("Credit Memo"));



            trigger OnAfterGetRecord()
            begin
                // Customer.get("Sales Header"."Sell-to Customer No.");
                // Customer.TestField("Payment Method Code");

                RespCenter.Get("Sales Header"."Shortcut Dimension 2 Code");
                // RespCenter.TestField("Posted Sales Credit Memo Nos.");

                // "Sales Header"."Payment Method Code" := Customer."Payment Method Code";
                // "Sales Header"."Responsibility Center" := "Sales Header"."Shortcut Dimension 2 Code";
                // "Sales Header".Validate("Posting No. Series", RespCenter."Posted Sales Credit Memo Nos.");
                "Sales Header".Modify();

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
    var
        Customer: Record Customer;
        RespCenter: Record "Responsibility Center";
        HSNCode: Code[20];
}