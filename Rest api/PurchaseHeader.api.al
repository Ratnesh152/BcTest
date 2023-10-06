page 50300 "API Purchase Header"
{
    PageType = API;
    APIGroup = 'powerApps';
    APIPublisher = 'alletec';
    APIVersion = 'v3.0';
    EntityCaption = 'purchaseHeader';
    EntitySetCaption = 'purchaseHeaders';
    EntityName = 'purchaseHeader';
    EntitySetName = 'purchaseHeadera';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(no; Rec."No.")
                {
                }
                field(documentType; Rec."Document Type")
                {
                }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")
                {
                }
                field(postingDate; Rec."Posting Date")
                {
                }
                field(documentDate; Rec."Document Date")
                {
                }
                field(dueDate; Rec."Due Date")
                {
                }
                field(locationCode; Rec."Location Code")
                {
                }
            }
        }
    }

}