page 50008 "Vendors API Page"
{
    PageType = API;
    ApplicationArea = All;
    APIGroup = 'powerApps';
    APIPublisher = 'alletec';
    APIVersion = 'v3.0';
    EntityCaption = 'vendors';
    EntityName = 'vendors';
    EntitySetCaption = 'vendors';
    EntitySetName = 'vendors';
    DelayedInsert = true;
    UsageCategory = Administration;
    SourceTable = Vendor;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(no; Rec."No.")
                {
                    Caption = 'Vendor No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Vendor Name';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
            }
        }
    }
}