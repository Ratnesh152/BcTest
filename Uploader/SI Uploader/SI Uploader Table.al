table 50021 "SI Uploader"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry Id"; Guid)
        {
        }
        field(2; "Customer No."; Code[20])
        {
            TableRelation = "Customer";
        }
        field(3; "Posting Date"; Date)
        {
        }
        field(4; "External Doccument No."; code[35])
        {
            Editable = false;
        }
        field(5; Location; Code[10])
        {
            trigger OnValidate()
            var
                Locations: Record 14;
                CreateLocation: Codeunit CreateLocation1;
            begin
                IF NOT Locations.GET(Location) THEN begin
                    ERROR('Location Code %1 does not exist', Location);
                end;
            end;
        }
        field(6; Type; Option)
        {
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge(Item)";
        }
        field(7; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account" WHERE("Direct Posting" = CONST(true),
                                                                                   "Account Type" = CONST(Posting),
                                                                                   Blocked = CONST(false))
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge(Item)")) "Item Charge";
        }
        field(8; Description; Text[50])
        {
        }
        field(9; "Unit Of Measure Code"; Code[10])
        {
            TableRelation = IF (Type = CONST(Item),
                                "No." = FILTER(<> '')) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(10; Quantity; Decimal)
        {
        }
        field(11; "Unit Price"; Decimal)
        {
        }
        field(12; "GST Group Code"; Code[20])
        {
            TableRelation = "GST Group";
        }
        field(13; "HSN Code"; Code[8])
        {
            TableRelation = "HSN/SAC".Code WHERE("GST Group Code" = FIELD("GST Group Code"));
        }
        field(14; "GST Group Type"; Option)
        {
            OptionMembers = Goods,Service;
        }
        field(15; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(16; Status; Option)
        {
            OptionMembers = Pending,Created,Error;
        }
        field(17; "Document ID"; Integer)
        {
        }
        field(18; "Error Text"; Text[250])
        {
        }
        field(19; "Sales Invoice No."; Code[20])
        {
        }
        field(20; "Cost Center"; code[20])
        {
        }
        field(21; "Invoice Status"; Option)
        {
            OptionMembers = " ",Pending,Error,Posted;
        }
        field(22; "Posted Invoice No."; Code[20])
        {
        }
        field(23; "Error Text Posting"; Text[250])
        {
        }
        field(24; "User ID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry Id")
        {
            Clustered = true;
        }
        key(Key2; "Document ID")
        {
        }
    }
}