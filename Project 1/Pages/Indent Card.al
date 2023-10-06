// /// <summary>
// /// Page Indent Card Ratnesh (ID 50103).
// /// </summary>
// page 50103 "Indent Card Ratnesh"
// {
//     Caption = 'Indent Card';
//     PageType = Document;
//     SourceTable = "Indent Header Ratnesh";
//     RefreshOnActivate = true;
//     AboutTitle = 'Indent Header Details Ratnesh';
//     DataCaptionFields = "No.", Name;
//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     Visible = false;
//                     trigger OnAssistEdit()
//                     begin
//                         rec.AssistEdit(Rec);
//                     end;
//                 }
//                 field("Student No."; Rec."Student No.")
//                 {
//                     ShowMandatory = true;
//                     ApplicationArea = All;
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Name 2"; Rec."Name 2")
//                 {
//                     Importance = Additional;
//                     ApplicationArea = All;
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     Importance = Additional;
//                     ApplicationArea = All;
//                 }
//                 group("Address & Contact Details")
//                 {
//                     field(Address; Rec.Address)
//                     {
//                         ApplicationArea = all;
//                         ToolTip = 'Specifies the value of the Address field.';

//                     }
//                     field("Address 2"; Rec."Address 2")
//                     {

//                         ApplicationArea = all;
//                         ToolTip = 'Specifies the value of the Address 2 field.';
//                     }
//                     field(City; Rec.City)
//                     {
//                         ApplicationArea = all;
//                         ToolTip = 'Specifies the value of the City field.';
//                     }
//                     field("Post Code"; Rec."Post Code")
//                     {
//                         ApplicationArea = all;
//                         ToolTip = 'Specifies the value of the Post Code field.';
//                     }
//                     field(Country; Rec.Country)
//                     {
//                         ApplicationArea = all;
//                         ToolTip = 'Specifies the value of the Country field.';
//                     }
//                 }
//                 field(Department; Rec.Department)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Purpose; Rec.Purpose)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Released By"; Rec."Released By")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Released Date"; Rec."Released Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Allow Indent Release"; Rec."Allow Indent Release")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("MSME Vendor"; Rec."MSME Vendor")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("MSME Vendor Certifiate No."; Rec."MSME Vendor Certifiate No.")
//                 {
//                     ApplicationArea = All;
//                     ShowMandatory = true;
//                     NotBlank = true;
//                     trigger OnValidate()
//                     var
//                         IndentHeaderRatnesh: Record "Indent Header Ratnesh";
//                     begin
//                         IndentHeaderRatnesh.Reset();
//                         IndentHeaderRatnesh.SetRange("No.", IndentHeaderRatnesh."No.");
//                         if IndentHeaderRatnesh.FindFirst() then
//                             if IndentHeaderRatnesh."MSME Vendor" = true then
//                                 IndentHeaderRatnesh.TestField("MSME Vendor Certifiate No.");
//                         // MSMEVendorAllow();
//                     end;
//                 }
//                 field("Due/Not Due"; Rec."Due/Not Due")
//                 {
//                     ApplicationArea = all;
//                     trigger OnValidate()
//                     var
//                         IndentCard: Page "Indent Card Ratnesh";
//                     begin
//                         if Rec."Due/Not Due" = Rec."Due/Not Due"::Due then begin
//                             IndentCard.SetRecord(Rec);
//                             CurrPage.Close();
//                             IndentCard.Editable := false;
//                             IndentCard.Run();
//                             Message('%1', Rec."Due/Not Due");
//                         end;
//                     end;
//                 }

//             }
//             part(IndentLines; "Indent Subform Ratnesh")
//             {
//                 ApplicationArea = All;
//                 SubPageLink = "Document No." = field("No.");
//             }

//             group(AdditionalContentGroup)
//             {

//                 // visible = IsContentVisible;
//                 field(AdditionalField; rec."Additional Field")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Navigation)
//         {
//             group("Indent Report")
//             {
//                 action("Indent Reoprt")
//                 {
//                     ApplicationArea = All;
//                     Image = PrintReport;
//                     Promoted = true;
//                     PromotedCategory = Report;
//                     trigger OnAction()
//                     var
//                     // IndentReportCodeUnit: Codeunit "Indent Report CodeUnit";
//                     begin
//                         // IndentReportCodeUnit.IndentReportSetFilter(Rec);
//                         Report.Run(50004);
//                     end;
//                 }
//             }
//             group(Release)
//             {
//                 Caption = 'Release';
//                 Image = ReleaseDoc;
//                 action("Re&lease")
//                 {
//                     ApplicationArea = All;
//                     Promoted = true;
//                     Caption = 'Release';
//                     Image = ReleaseDoc;
//                     Enabled = rec.Status <> rec.Status::Released;
//                     PromotedCategory = Process;
//                     trigger OnAction()
//                     var
//                         UserSetup: Record "User Setup";
//                         IndentLine: Record "Indent Line Ratnesh";
//                     begin
//                         UserSetup.Reset();
//                         UserSetup.SetRange("User ID", UserId);
//                         if UserSetup.FindFirst() then begin
//                             if UserSetup."New PO Creation" = true then begin
//                                 rec.Status := Rec.Status::Released;
//                                 rec.Modify();
//                             end else
//                                 Message('Please Allow %1 to Release in User Setup', UserId);
//                         end;
//                     end;
//                 }
//                 action(Open)
//                 {
//                     ApplicationArea = All;
//                     Promoted = true;
//                     Caption = 'Reopen';
//                     Image = ReOpen;
//                     Enabled = Rec.Status <> Rec.Status::Open;
//                     PromotedCategory = Process;
//                     trigger OnAction()
//                     var
//                         UserSetup: Record "User Setup";
//                         IndentLine: Record "Indent Line Ratnesh";
//                     begin
//                         UserSetup.Reset();
//                         UserSetup.SetRange("User ID", UserId);
//                         if UserSetup.FindFirst() then begin
//                             if UserSetup."New PO Creation" = true then begin
//                                 rec.Status := Rec.Status::Open;
//                                 rec.Modify();
//                             end else
//                                 Message('Please Allow %1 to Open in User Setup', UserId);
//                         end;
//                     end;
//                 }
//             }
//             group("Post/Send")
//             {
//                 action(Post)
//                 {
//                     ApplicationArea = All;
//                     Image = PostOrder;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     trigger OnAction()
//                     var
//                         PostedIndentHeader: Record "Posted Indent Header Ratnesh";
//                     begin
//                         PostIndentHeader(PostedIndentHeader, Rec);
//                     end;
//                 }
//             }
//             group(SendMail)
//             {
//                 Caption = 'Send Mail';

//                 action("Send Mail")
//                 {
//                     ApplicationArea = All;
//                     trigger OnAction()
//                     begin
//                         SendMailBody();
//                     end;
//                 }
//             }
//         }
//         area(Processing)
//         {
//             action("Show More")
//             {
//                 trigger OnAction()
//                 begin
//                     IsContentVisible := true;
//                 end;
//             }

//             // Button for Show Less action
//             action("Show Less")
//             {
//                 trigger OnAction()
//                 begin
//                     IsContentVisible := false;
//                 end;
//             }
//         }
//     }
//     // trigger OnNewRecord(): PageEditable
//     // begin

//     // end;

//     var
//         OpenPostedSalesInvQst: Label 'The invoice is posted as number %1 and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';
//         DocumentIsPosted: Boolean;
//         Text002: Label 'hello';
//         Indentcard: Record "Indent Header Ratnesh";
//         IsContentVisible: Boolean;
//         PageEditable: Boolean;

//     procedure PostIndentHeader(PostedIindentHeaderRatnesh: Record "Posted Indent Header Ratnesh"; var IndentHeaderRatnesh: Record "Indent Header Ratnesh")
//     begin
//         PostedIindentHeaderRatnesh.Reset();
//         PostedIindentHeaderRatnesh.Validate("Student No.", IndentHeaderRatnesh."Student No.");
//         PostedIindentHeaderRatnesh.Validate(Name, IndentHeaderRatnesh.Name);
//         PostedIindentHeaderRatnesh.Validate(Address, IndentHeaderRatnesh.Address);
//         PostedIindentHeaderRatnesh.Validate("Address 2", IndentHeaderRatnesh."Address 2");
//         PostedIindentHeaderRatnesh.Insert(true);

//         Message(' posted indent header no %1', PostedIindentHeaderRatnesh."Student No.");
//         PostedIindentHeaderRatnesh.Modify(true);
//     end;

//     procedure SendMailBody()
//     var
//         a: Text;
//         EmailAccounts: Record "Email Account";
//         Email: Codeunit Email;
//         UserSetup: Record "User Setup";
//         BodyMessage: Text;
//         Receptants: List of [text];
//         PurchHeader: Record "Purchase Header";
//         CompanyInfo: Record "Company Information";
//         EmailMessage: codeunit "Email Message";
//         AddBodyMEssage: Text;
//     begin
//         // Receptants.add(UserSetup."E-Mail");
//         // EmailAccounts.Reset();
//         // EmailAccounts.SetFilter(Connector, 'SMTP');
//         // if EmailAccounts.FindLast() then;
//         UserSetup.Reset();
//         UserSetup.SetFilter("E-Mail", '<>%1', '');
//         if UserSetup.FindFirst() then begin
//             Message('hello');
//             Clear(BodyMessage);
//             Clear(AddBodyMEssage);
//             Clear(Receptants);
//             BodyMessage := 'Dear User, <br><br>Purpose.<br><br>';
//             BodyMessage += '<br><br><hr> This is a system generated mail. Please do reply to mail.<hr>';
//             AddBodyMEssage := StrSubstNo(BodyMessage);
//             EmailMessage.Create(UserSetup."E-Mail", 'hello', AddBodyMEssage, true);
//             Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//         end;
//     end;

//     procedure SendNewMail()
//     var
//         Email: Codeunit Email;
//         PurchHeader: Record "Purchase Header";
//         CompanyInfo: Record "Company Information";
//         EmailMessage: codeunit "Email Message";
//     begin
//         Message('email');
//         EmailMessage.Create('Ratneshchaudhary@onlinevoting.info', 'Test', 'hello');
//         Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//     end;

//     procedure PostedIndentLine(var PostedIndentLineRatnesh: Record "Posted Indent Line Ratnesh"; var IndendHeaderRatnesh: Record "Indent Header Ratnesh")
//     var
//         IndentLineRatnesh: Record "Indent Line Ratnesh";
//         LineNo: Integer;
//     begin
//         IndentLineRatnesh.Reset();
//         IndentLineRatnesh.SetRange("Document No.", IndendHeaderRatnesh."No.");
//         if IndentLineRatnesh.FindLast() then
//             LineNo := IndentLineRatnesh."Line No." + 10000
//         else
//             LineNo := 10000;
//         IndentLineRatnesh.Init();
//         IndentLineRatnesh."Line No." := LineNo;
//         IndentLineRatnesh.Validate("Document No.", IndendHeaderRatnesh."No.");
//         IndentLineRatnesh.Insert();
//         IndentLineRatnesh.Validate("Item No.", PostedIndentLineRatnesh."Item No.");
//         IndentLineRatnesh.Validate(Quantity, PostedIndentLineRatnesh.Quantity);
//         IndentLineRatnesh.Description := PostedIndentLineRatnesh.Description;
//         IndentLineRatnesh.Quantity := PostedIndentLineRatnesh.Quantity;
//         IndentLineRatnesh.Amount := PostedIndentLineRatnesh.Amount;
//         IndentLineRatnesh."Total Amount" := PostedIndentLineRatnesh."Total Amount";
//         IndentLineRatnesh.Modify();
//     end;
// }