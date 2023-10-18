tableextension 50102 RatneshCompanyExt extends "Company Information"
{

    fields
    {
        field(50100; "Company Registration No."; code[20])
        {
            DataClassification = CustomerContent;
        }
    }
}