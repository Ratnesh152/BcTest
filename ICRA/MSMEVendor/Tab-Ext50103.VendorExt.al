tableextension 50103 MSMEVendorExt extends Vendor
{
    fields
    {
        field(50100; "MSME Vendor"; Boolean)
        {
            Caption = 'MSME Vendor';
            DataClassification = CustomerContent;
        }
        field(50101; "MSME Vendor Certifiate No."; Code[30])
        {
            Caption = 'MSME Vendor Certifiate No.';
            DataClassification = CustomerContent;
        }
        field(50102; "ABS 206"; Boolean)
        {
            Caption = 'ABS 206';
            DataClassification = CustomerContent;
        }
        field(50103; "ITR Acknowledge No. 1"; Text[30])
        {
            Caption = 'ITR Acknowledge No. 1';
            DataClassification = CustomerContent;
        }
        field(50104; "ITR Acknowledge No. 2"; Text[30])
        {
            Caption = 'ITR Acknowledge No. 2';
            DataClassification = CustomerContent;
        }
    }
}