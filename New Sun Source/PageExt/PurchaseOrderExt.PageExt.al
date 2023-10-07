pageextension 50051 "SSE Purchase Order Ext" extends "Purchase Order"
{
    actions
    {
        addafter("Archive Document")
        {
            action("Terms and Conditions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Terms and Conditions';
                Image = ViewComments;
                RunObject = Page "SSE PO Term Details";
                RunPageLink = "Purchase Order No." = FIELD("No.");
            }
        }
    }
}