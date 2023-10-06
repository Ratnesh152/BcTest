// table 50106 "Indent Header Ratnesh"
// {
//     Caption = 'Indent Header Ratnesh';
//     LookupPageId = "Indent Lists Ratnesh";
//     DataCaptionFields = "No.", Name;
//     fields
//     {
//         field(1; "No."; Code[20])
//         {
//             Caption = 'No.';
//             trigger OnValidate()
//             begin
//                 if "No." <> xRec."No." then begin
//                     GetSalesSetup();
//                     TestNoSeries();
//                     NoSeriesMgt.TestManual(GetNoSeriesCode());
//                     "No. Series" := '';
//                 end;
//             end;
//         }
//         field(23; "Student No."; Code[20])
//         {
//             Caption = 'Student No.';
//             TableRelation = Student;
//             NotBlank = true;
//             trigger OnValidate()
//             begin
//                 if "No." = '' then
//                     InitRecord();
//                 GetStudent("Student No.");
//                 AddressandDetials();
//             end;
//         }
//         field(2; Name; Text[100])
//         {
//             Caption = 'Name';
//             TableRelation = Student.Name;
//             ValidateTableRelation = false;
//             trigger OnLookup()
//             var
//                 Student: Record Student;
//             begin
//                 if "Student No." <> '' then
//                     Student.Get("Student No.");
//             end;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(3; "Name 2"; Text[50])
//         {
//             Caption = 'Name 2';
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(4; Address; Text[100])
//         {
//             Caption = 'Address';
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(5; "Address 2"; Text[50])
//         {
//             Caption = 'Address 2';
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(6; City; Text[30])
//         {
//             Caption = 'City';
//             TableRelation = "Post Code".City;
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(7; Contact; Text[100])
//         {
//             Caption = 'Contact';
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(8; "Phone No."; Text[10])
//         {
//             Caption = 'Phone No.';
//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(9; "Location Code"; Code[10])
//         {
//             Caption = 'Location Code';
//         }
//         field(10; "Department"; enum "Department Ratnesh")
//         {
//             Caption = 'Department';
//         }
//         field(11; "Purpose"; Text[40])
//         {
//             Caption = 'Purpose';
//         }
//         field(12; Status; Enum "Indent Document Status")
//         {
//             Editable = false;
//             Caption = 'Status';
//         }
//         field(13; "Created By"; Text[50])
//         {
//             Caption = 'Created By';
//         }
//         field(14; "Creation Date"; Date)
//         {
//             Caption = 'Creation Date';
//         }

//         field(15; "Released By"; Text[50])
//         {
//             Caption = 'Released By';
//         }
//         field(16; "Released Date"; Date)
//         {
//             Caption = 'Released Date';
//         }
//         field(17; "No. Series"; Code[20])
//         {
//             Caption = 'No. Series';
//             Editable = false;
//             TableRelation = "No. Series";
//         }
//         field(18; "PreAssigned No."; code[20])
//         {
//         }
//         field(19; "MSME Vendor"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(20; "MSME Vendor Certifiate No."; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(21; "Due/Not Due"; Option)
//         {
//             OptionMembers = Due,"Not Due";
//         }
//         field(22; "Allow Indent Release"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(24; "Post Code"; Code[20])
//         {
//             Caption = 'Post Code';
//         }
//         field(25; Country; Text[30])
//         {
//             Caption = 'Country';

//         }
//         field(26; "Currency Code"; code[10])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(27; "Additional Field"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//     }
//     keys
//     {
//         key(Key1; "No.")
//         {
//             Clustered = true;
//         }
//     }
//     var
//         SelectNoSeriesAllowed: Boolean;
//         indentHeaderRatnesh: Record "Indent Header Ratnesh";
//         PhoneNoCannotContainLettersErr: Label 'Phone No. cannot contains words';
//         ValidateIndentNo: Boolean;

//     protected var
//         Student: Record student;
//         SalesSetup: Record "Sales & Receivables Setup";
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         IndentHeadeRatnesh: Record "Indent Header Ratnesh";

//     trigger OnInsert()
//     begin
//         if "No." = '' then begin
//             SalesSetup.Get();
//             SalesSetup.TestField("Indent Nos.");
//             NoSeriesMgt.InitSeries(SalesSetup."Indent Nos.", xRec."No. Series", 0D, "No.", "No. Series");
//         end;
//     end;

//     local procedure GetSalesSetup()
//     begin
//         SalesSetup.Get();
//     end;

//     procedure GetNoSeriesCode(): Code[20]
//     var
//         NoSeriesCode: Code[20];
//         IsHandled: Boolean;
//     begin
//         GetSalesSetup();
//         IsHandled := false;
//         if IsHandled then
//             exit(NoSeriesCode);
//         NoSeriesCode := SalesSetup."Indent Nos.";
//         exit(NoSeriesMgt.GetNoSeriesWithCheck(NoSeriesCode, SelectNoSeriesAllowed, "No. Series"));
//     end;

//     procedure AssistEdit(OldIndentHeader: Record "Indent Header Ratnesh") Result: Boolean
//     var
//         IndentHeaderRatnesh2: Record "Indent Header Ratnesh";
//         IsHandled: Boolean;
//     begin
//         IsHandled := false;
//         if IsHandled then
//             exit;

//         IndentHeadeRatnesh.Copy(Rec);
//         GetSalesSetup();
//         IndentHeadeRatnesh.TestNoSeries();
//         if NoSeriesMgt.SelectSeries(IndentHeadeRatnesh.GetNoSeriesCode(), OldIndentHeader."No. Series", IndentHeadeRatnesh."No. Series") then begin
//             if (IndentHeadeRatnesh."Student No." = '') then begin
//             end;
//             NoSeriesMgt.SetSeries(IndentHeadeRatnesh."No.");
//             if IndentHeaderRatnesh2.Get(IndentHeadeRatnesh."No.") then
//                 Error(IndentHeadeRatnesh."No.");
//             Rec := IndentHeadeRatnesh;
//             exit(true);
//         end;
//     end;

//     procedure TestNoSeries()
//     var
//         IsHandled: Boolean;
//     begin
//         GetSalesSetup();
//         IsHandled := false;
//         SalesSetup.TestField("Indent Nos.");
//     end;

//     procedure InitRecord()
//     begin
//         GetSalesSetup();
//         if "Student No." <> '' then
//             GetStudent("Student No.");
//     end;

//     procedure GetStudent(StudNo: Code[20]): Record Student
//     begin
//         if not (StudNo <> '') then begin
//             if StudNo <> Student."No." then begin
//                 Student.Get(StudNo);

//             end
//         end else
//             Clear(student);
//         exit(Student);
//     end;

//     procedure TestStatusOpen()
//     begin
//         TestField(Status, Status::Open);
//     end;

//     procedure AddressandDetials()
//     var
//         Student: Record student;
//     begin
//         Student.Reset();
//         Student.SetRange("No.", Rec."Student No.");
//         if Student.FindSet() then begin
//             Name := Student.Name;
//             "Name 2" := Student."Name 2";
//             Address := Student.Address;
//             "Address 2" := Student."Address 2";
//             "Phone No." := Student."Phone No.";
//             Contact := Student.Contact;
//             City := Student.City;
//         end;
//     end;
// }