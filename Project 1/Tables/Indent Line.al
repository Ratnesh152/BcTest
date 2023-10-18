table 50107 "Indent Line Ratnesh"
{
    Caption = 'Indent Line Ratnesh';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Item No."; Code[20])
        {
            TableRelation = Item;
            trigger OnValidate()
            begin
                GetLineDetalis();
            end;
        }
        field(4; "Description"; Text[100])
        {
        }
        field(5; Quantity; Decimal)
        {
            trigger OnValidate()
            begin
            end;
        }
        field(8; Amount; Decimal)
        {
        }
        field(9; "Total Amount"; Decimal)
        {
        }
        field(10; "Discount Percent"; Decimal)
        {
            trigger OnValidate()
            begin
                "Discount Amount" := CalcDiscount(Amount, "Discount Percent")
            end;
        }
        field(12; "Total Indent Amount"; Decimal)
        {
            Editable = false;
            trigger OnValidate()
            begin
                rec."Total Indent Amount" := Rec."Total Amount";
            end;
        }
        field(13; "Discount Amount"; Decimal)
        {
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    // procedure GetTotallAmount()

    // begin
    //     "Total Amount" := Quantity * Amount;
    // end;

    procedure CalcDiscount(Value1: Decimal; Value2: Decimal): Decimal
    var
        discountAmount: Decimal;
    begin
        discountAmount := (Value1 * Value2) / 100;
        exit(discountAmount);
    end;

    procedure GetLineDetalis()
    var
        item: Record Item;
    begin
        item.Reset();
        if item.Get("Item No.") then begin
            Description := item.Description;
            Amount := item."Unit Cost";
        end;
    end;
}