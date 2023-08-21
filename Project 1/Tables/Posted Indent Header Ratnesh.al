table 50001 "Posted Indent Header Ratnesh"
{
    Caption = 'Posted Indent Header Ratnesh';
    DataCaptionFields = "No.", "Created By";
    LookupPageId = "Posted Indent Card Ratnesh";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetSalesSetup();
                    NoSeriesMgt.TestManual(GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
        }
        field(23; "Student No."; Code[20])
        {
            Caption = 'Student No.';
            TableRelation = Student;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            TableRelation = Student.Name;

        }
        field(3; "Name 2"; Text[50])
        {
            Caption = 'Name 2';

        }
        field(4; Address; Text[100])
        {
            Caption = 'Address';

        }
        field(5; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            trigger OnValidate()
            begin
            end;
        }
        field(6; City; Text[30])
        {
            Caption = 'City';
            TableRelation = "Post Code".City;
            trigger OnValidate()
            begin
            end;
        }
        field(7; Contact; Text[100])
        {
            Caption = 'Contact';
            trigger OnValidate()
            begin
            end;
        }
        field(8; "Phone No."; Text[10])
        {
            Caption = 'Phone No.';
            trigger OnValidate()
            begin
            end;
        }
        field(9; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(10; "Department"; enum "Department Ratnesh")
        {
            Caption = 'Department';
        }
        field(11; "Purpose"; Text[40])
        {
            Caption = 'Purpose';
        }
        field(12; Status; Enum "Indent Document Status")
        {
            Editable = false;
            Caption = 'Status';
        }
        field(13; "Created By"; Text[50])
        {
            Caption = 'Created By';
        }
        field(14; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }

        field(15; "Released By"; Text[50])
        {
            Caption = 'Released By';
        }
        field(16; "Released Date"; Date)
        {
            Caption = 'Released Date';
        }
        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; "PreAssigned No."; code[20])
        {
        }
        field(19; "MSME Vendor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "MSME Vendor Certifiate No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Due/Not Due"; Option)
        {
            OptionMembers = Due,"Not Due";
        }
        field(22; "Allow Indent Release"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(25; Country; Text[30])
        {
            Caption = 'Country';

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SelectNoSeriesAllowed: Boolean;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Indent Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Indent Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure AssistEdit(PostedIndentHeader: Record "Posted Indent Header Ratnesh") Result: Boolean
    var
        PostedIndentHeaderRatnesh2: Record "Posted Indent Header Ratnesh";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        with PostedIndentHeaderRatnesh2 do begin
            Copy(Rec);
            GetSalesSetup();
            TestNoSeries();
            if NoSeriesMgt.SelectSeries(GetNoSeriesCode(), PostedIndentHeader."No. Series", "No. Series") then begin
                if ("Student No." = '') then begin
                end;
                NoSeriesMgt.SetSeries("No.");
                if PostedIndentHeaderRatnesh2.Get("No.") then
                    Error("No.");
                Rec := PostedIndentHeader;
                exit(true);
            end;
        end;
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
        IsHandled: Boolean;
    begin
        GetSalesSetup();
        IsHandled := false;
        if IsHandled then
            exit(NoSeriesCode);
        NoSeriesCode := SalesSetup."Posted Indent Nos.";
        exit(NoSeriesMgt.GetNoSeriesWithCheck(NoSeriesCode, SelectNoSeriesAllowed, "No. Series"));
    end;

    local procedure GetSalesSetup()
    begin
        SalesSetup.Get();
    end;

    procedure TestNoSeries()
    var
        IsHandled: Boolean;
    begin
        GetSalesSetup();
        IsHandled := false;
        SalesSetup.TestField("Posted Indent Nos.");
    end;
}
