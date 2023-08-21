query 50000 "Customer Balance"
{
    Caption = 'top 5 Customer Balance';
    QueryType = Normal;
    OrderBy = ascending(Amount);
    TopNumberOfRows = 5;
    elements
    {
        dataitem(Customer; "Customer")
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            dataitem(CustLedgerEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                filter(Customer_No; "Customer No.") { }
                column(Amount; Amount)
                {
                    Method = Sum;
                }
                column(Sales__LCY_; "Sales (LCY)")
                {
                    Method = sum;
                }
            }
        }
    }
}
