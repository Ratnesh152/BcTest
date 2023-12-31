table 50020 "PI Uploader"
{
    DataPerCompany = false;
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry ID"; Guid)
        {
        }
        field(2; "Company Name"; Text[50])
        {
            TableRelation = Company;
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; "Document Date"; Date)
        {
        }
        field(6; "Due Date"; Date)
        {
        }
        field(7; "Vendor Invoice No."; Text[35])
        {
        }
        field(8; Location; Code[10])
        {

            trigger OnValidate()
            var
                Locations: Record 14;
            begin
                TESTFIELD("Company Name");
                Locations.CHANGECOMPANY("Company Name");
                IF NOT Locations.GET(Location) THEN
                    ERROR('Location Code %1 does not exist in Company %2', Location, "Company Name");
            end;
        }
        field(9; Structure; Code[10])
        {
            // TableRelation = "Structure Header";
        }
        field(10; "Link Path"; Text[250])
        {
        }
        field(11; Type; Option)
        {
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge(Item)";
        }
        field(12; "No."; Code[20])
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
        field(13; Description; Text[50])
        {
        }
        field(14; "Unit Of Measure Code"; Code[10])
        {
            TableRelation = IF (Type = CONST(Item),
                                "No." = FILTER(<> '')) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }
        field(15; Quantity; Decimal)
        {
        }
        field(16; "Direct Unit Cost Exc Tax"; Decimal)
        {
        }
        field(17; "Description 2"; Text[50])
        {
        }
        field(18; "GST Group Code"; Code[20])
        {
            TableRelation = "GST Group";
        }
        field(19; "HSN Code"; Code[8])
        {
            TableRelation = "HSN/SAC".Code WHERE("GST Group Code" = FIELD("GST Group Code"));
        }
        field(20; "TDS Nature Of Deduction"; Text[10])
        {
            // TableRelation = "TDS Nature Of Remittance";
            // trigger OnValidate()
            // begin
            //     IF "TDS Nature Of Deduction" <> '' THEN BEGIN
            //         NODLines.RESET;
            //         NODLines.SETRANGE(Type, NODLines.Type::Vendor);
            //         NODLines.SETRANGE("No.", "Vendor No.");
            //         NODLines.SETRANGE("NOD/NOC", "TDS Nature Of Deduction");
            //         IF NODLines.ISEMPTY THEN
            //             ERROR('TDS NOD Code %1 does not exist for Vendor No.%2', "TDS Nature Of Deduction", "Vendor No.");
            //     END;
            // end;
        }
        field(21; "GST Group Type"; Option)
        {
            OptionMembers = Goods,Service;
        }
        field(22; "GST Credit"; Option)
        {
            OptionCaption = 'Availment,Non-Availment';
            OptionMembers = Availment,"Non-Availment";
        }
        field(23; "Project Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(24; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(25; "Employee Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
        }
        field(30; "Document ID"; Integer)
        {
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,Created,Error;
        }
        field(36; "Error Text"; Text[250])
        {
        }
        field(37; "Purchase Invoice No."; Code[20])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Entry ID")
        {
        }
        key(Key2; "Document ID")
        {
        }
    }

    fieldgroups
    {
    }

    var
    // NODLines: Record 13785;
}

