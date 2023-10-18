table 50501 TodosTable
{
    Caption = ' Jason Placeholder ToDos';
    DataClassification = CustomerContent;
    fields
    {
        field(1; UUID; Integer)
        {
            AutoIncrement = true;
        }
        field(2; UserId; Integer)
        {
        }
        field(3; Title; Text[100])
        {
        }
        field(4; Completed; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; UUID, UserId)
        {
            Clustered = true;
        }
    }
}