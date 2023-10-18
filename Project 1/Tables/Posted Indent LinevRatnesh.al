table 50002 "Posted Indent Line Ratnesh"
{
    Caption = 'Posted Indent Line Ratnesh';
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

        }
        field(12; "Total Indent Amount"; Decimal)
        {
            Editable = false;

        }
        field(13; "Discount Amount"; Decimal)
        {
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    procedure GetTotallAmount(Value1: Decimal; value2: Decimal): Decimal
    var
        TotallAmount: Decimal;
    begin
        TotallAmount := Value1 * value2;
        exit(TotallAmount);
    end;
}
