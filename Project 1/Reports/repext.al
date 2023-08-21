reportextension 50100 RepExt extends "Standard Sales - Invoice"
{
    dataset
    {
        addafter(Line)
        {
            dataitem("Sales Line"; "Sales Line")
            {

            }
        }

    }

    requestpage
    {
        // Add changes to the requestpage here
    }
}