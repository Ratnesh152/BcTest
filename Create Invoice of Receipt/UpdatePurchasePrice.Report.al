report 50012 "Update Purchase Price"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    // DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order), Status = const(Open));
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                DataItemLinkReference = "Purchase Header";
                DataItemLink = "Document No." = field("No.");

                trigger OnAfterGetRecord()
                begin
                    if "Purchase Line".Type = "Purchase Line".Type::Item then begin
                        // PurchPriceMgmt.GetPurchasePrice("Purchase Line");
                        "Purchase Line".Modify();
                    end;
                    // if "Purchase Line"."Job Master Code" <> '' then begin
                    //     PurchPriceMgmt.GetPurchasePriceService("Purchase Line");
                    //     "Purchase Line".Modify();
                    // end;
                end;
            }

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
    trigger OnPostReport()
    begin
        Message('Price Updated..');
    end;

    var
        myInt: Integer;
    // PurchPriceMgmt: Codeunit "Purchase Price Mgmt.";
}