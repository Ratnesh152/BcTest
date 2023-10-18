table 50007 "Enquairy Line"
{
    Caption = 'Enquairy Line';
    DataClassification = CustomerContent;
    DataPerCompany = false;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; Type; Enum "Purchase Line Type")
        {
            Caption = 'Type';
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = const("G/L Account")) "G/L Account"
            ELSE
            IF (Type = const("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = const("Charge (Item)")) "Item Charge"
            ELSE
            IF (Type = const(Item)) Item
            else
            if (Type = const(Resource)) Resource;
            ValidateTableRelation = false;
            trigger OnValidate()
            begin
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
            TableRelation = IF (Type = CONST("G/L Account")) "G/L Account".Name
            ELSE
            IF (Type = CONST(Item)) Item.Description
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset".Description
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge".Description
            else
            if (Type = CONST(Resource)) Resource.Name;
            ValidateTableRelation = false;

        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(6; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(7; "Total Cost"; Decimal)
        {
            Caption = 'Total Cost';
        }
        field(8; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
