page 50010 "Items API Page"
{
    PageType = API;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Item;
    EntityCaption = 'Items';
    EntityName = 'Items';
    EntitySetName = 'Items';
    EntitySetCaption = 'Items';
    DelayedInsert = true;
    APIGroup = 'powerApps';
    APIPublisher = 'alletec';
    APIVersion = 'v3.0';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Item Description';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
            }
        }
    }
}