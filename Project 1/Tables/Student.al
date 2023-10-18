table 50004 Student
{
    Caption = 'Student';
    DataCaptionFields = "No.", Name;
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
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
        }
        field(6; City; Text[30])
        {
            Caption = 'City';
            TableRelation = "Post Code".City;
        }
        field(7; Contact; Text[100])
        {
            Caption = 'Contact';
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            trigger OnValidate()
            var
                // char: DotNet Char;
                i: Integer;
            begin
                for i := 1 to StrLen("Phone No.") do
                    // if Char("Phone No."[i]) then
                    FieldError("Phone No.", PhoneNoCannotContainLettersErr);
            end;
        }
        field(9; "Resistration No."; Text[50])
        {
            Caption = 'Resistration No.';
        }
        field(10; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(11; Picture; Blob)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Removed;
            SubType = Bitmap;
            ObsoleteTag = '19.0';
        }
        field(12; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(13; Country; Text[30])
        {
            Caption = 'Country';

        }
        field(14; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                ValidateEmail();
            end;
        }
        field(15; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
        }
        field(16; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(17; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(18; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, City, "Post Code", "Phone No.")
        {
        }
    }
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PhoneNoCannotContainLettersErr: Label 'Phone No. cannot contains words';

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Student Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Student Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure AssistEdit1(xRecStudent: Record Student): Boolean
    var
        Stud: Record Student;
    begin
        Stud := Rec;
        SalesSetup.Get();
        SalesSetup.TestField("Student Nos.");
        if NoSeriesMgt.SelectSeries(SalesSetup."Student Nos.", xRecStudent."No. Series", Stud."No. Series") then begin
            NoSeriesMgt.SetSeries(Stud."No.");
            Rec := Stud;
            exit(true);
        end;
    end;

    local procedure TestNoSeries()
    var
        Student: Record Student;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        if "No." <> xRec."No." then
            if not Student.Get(Rec."No.") then begin
                SalesSetup.Get();
                NoSeriesMgt.TestManual(SalesSetup."Student Nos.");
                "No. Series" := '';
            end;
    end;

    local procedure ValidateEmail()
    var
        MailManagement: Codeunit "Mail Management";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;
        if "E-Mail" = '' then
            exit;
        MailManagement.CheckValidEmailAddresses("E-Mail");
    end;

    procedure LookupStudent(var Student: Record Student): Boolean
    var
        CustomerLookup: Page "Customer Lookup";
        Result: Boolean;
    begin
        CustomerLookup.SetTableView(Student);
        CustomerLookup.SetRecord(Student);
        CustomerLookup.LookupMode := true;
        Result := CustomerLookup.RunModal() = ACTION::LookupOK;
        if Result then
            CustomerLookup.GetRecord(Student)
        else
            Clear(Student);

        exit(Result);
    end;
}
