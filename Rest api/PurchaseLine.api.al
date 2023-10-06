page 50000 "API Purchase Line"
{
    PageType = API;
    APIGroup = 'powerApps';
    APIPublisher = 'alletec';
    APIVersion = 'v3.0';
    EntityCaption = 'purchaseLine';
    EntitySetCaption = 'purchaseLine';
    EntityName = 'purchaseLine';
    EntitySetName = 'purchaseLine';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Purchase Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec."Document No.")
                {
                }
                field(documentType; Rec."Document Type")
                {
                }
                field(no; Rec."No.")
                {
                }
                field(type; Rec.Type)
                {
                }
                field(quantity; Rec.Quantity)
                {
                }
                field(locationCode; Rec."Location Code")
                {
                }
                field(UnitPriceLCY; Rec."Unit Price (LCY)")
                {
                }
            }
        }
    }
}