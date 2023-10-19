table 50009 "Old Item"
{
    Caption = 'Old Item';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; Description; Text[600])
        {
            Caption = 'Description';
        }
        field(3; "Inventory Posting Group"; Text[30])
        {
            Caption = 'Inventory Posting Group';
        }
        field(4; "Product Group"; Text[30])
        {
            Caption = 'Product Group';
        }
        field(5; "Product Sub Group"; Text[30])
        {
            Caption = 'Product Sub Group';
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Released;
        }
        field(7; "SSE Item Description"; Text[600])
        {
            Caption = 'SSE Item Description';
        }
        field(8; UOM; Code[10])
        {
            Caption = 'UOM';
            TableRelation = "Unit of Measure";
        }
        field(9; "Project Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

            // trigger OnValidate()
            // begin
            //     ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            // end;
        }
        field(10; "Project Name"; Text[50])
        {
            Caption = 'Project Name';
        }
        field(11; "SPV Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2), Blocked = CONST(false));
            // trigger OnValidate()
            // begin
            //     ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            // end;
        }
        field(12; "SPV Name"; Text[50])
        {
            Caption = 'SPV Name';
        }
        field(13; "Warrenty Start date"; Date)
        {
            Caption = 'Warrenty Start date';
        }
        field(14; "Warrenty Expire Date"; Date)
        {
            Caption = 'Warrenty Expire Date';
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
    procedure GetDimNames()
    var
        DimValue: Record "Dimension Value";
    begin
        DimValue.Reset();
        if DimValue.Get("Item No.") then begin
            "Project Name" := DimValue.Name;
        end;
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        if Usersetup.Get(UserId) then
            // if Usersetup."Allow Old Item Edit" = false then
                Error('%1 user is not allowed to Edit Items List', UserId);
    end;
}
