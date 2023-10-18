tableextension 50052 "Purchase Hearder Extn" extends "Purchase Header"
{
    fields
    {
        field(50051; "AXT Workflow Sub Document Type"; enum "AXT Workflow Sub Document Type")
        {
            Description = 'EPC2016';
            Editable = true;
            DataClassification = SystemMetadata;
            Caption = 'Workflow Sub Document Type';
            trigger OnValidate()
            begin
                IF "AXT Workflow Sub Document Type" = "AXT Workflow Sub Document Type"::WorkOrder THEN
                    "AXT Order Type" := "AXT Order Type"::"Service Order"
            end;
        }
        field(50052; "AXT Order Type"; enum "AXT Purchase Header Order Type")
        {
            Description = 'EPC2016';
            DataClassification = SystemMetadata;
            Caption = 'Order Type';
        }
    }

    var
        myInt: Integer;
}