table 50501 TodosTable
{
    Caption = ' Jason Placeholder ToDos';
    fields
    {
        field(1; UUID; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; UserId; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Title; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Completed; Boolean)
        {
            DataClassification = ToBeClassified;
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