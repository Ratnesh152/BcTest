// pageextension 55003 hjshak extends "Posted Sales Invoice"
// {
//     actions
//     {
//         addafter(SendCustom)
//         {
//             action(EmailTest)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Test Email';
//                 Image = Email;
//                 ToolTip = 'Prepare to email the document. The Send Email window opens prefilled with the customer''s email address so you can add or edit information.';

//                 trigger OnAction()
//                 begin
//                     SalesInvHeader3 := Rec;
//                     CurrPage.SetTableView(SalesInvHeader3);
//                     EmailRecordsTest(SalesInvHeader3, true);
//                 end;
//             }
//             action("MyTestReport")
//             {
//                 ApplicationArea = All;
//                 Promoted = true;
//                 Image = Print;
//                 Caption = 'My Test Report';
//                 PromotedCategory = Category6;
//                 trigger OnAction()
//                 var
//                     salesInvheader1: Record "Sales Invoice Header";
//                     MyTestReport: Report "Sale Invoice IN GST Test";
//                 begin
//                     salesInvheader1.Reset();
//                     salesInvheader1.SetRange("No.", Rec."No.");
//                     MyTestReport.SetTableView(salesInvheader1);
//                     MyTestReport.Run();
//                 end;
//             }
//             action(sendEmail)
//             {
//                 ApplicationArea = All;
//                 Promoted = true;
//                 trigger OnAction();
//                 begin
//                     SendEMail();
//                 end;
//             }
//         }
//     }

//     var
//         SalesInvHeader3: Record "Sales Invoice Header";
//         SalesInvoiceHeader: Record "Sales Invoice Header";

//     procedure EmailRecordsTest(var SalesInvHeader2: Record "Sales Invoice Header"; ShowDialog: Boolean)
//     var
//         DocumentSendingProfile: Record "Document Sending Profile";
//         DummyReportSelections: Record "Report Selections";
//         ReportDistributionMgt: Codeunit "Report Distribution Management";
//         DocumentTypeTxt: Text[50];
//         IsHandled: Boolean;
//     begin
//         DocumentTypeTxt := ReportDistributionMgt.GetFullDocumentTypeText(Rec);

//         IsHandled := false;
//         if not IsHandled then
//             TrySendToEMailTest(DummyReportSelections.Usage::"S.Invoice".AsInteger(), Rec, SalesInvHeader2.FieldNo("No."), DocumentTypeTxt, SalesInvHeader2.FieldNo("Bill-to Customer No."), ShowDialog);
//     end;

//     procedure TrySendToEMailTest(ReportUsage: Integer; RecordVariant: Variant; DocumentNoFieldNo: Integer; DocName: Text[150]; CustomerFieldNo: Integer; ShowDialog: Boolean)
//     var
//         Handled: Boolean;
//         IsCustomer: Boolean;
//         DocumentSendingProfile1: Record "Document Sending Profile";
//     begin
//         IsCustomer := true;
//         if Handled then
//             exit;

//         if ShowDialog then
//             DocumentSendingProfile1."E-Mail" := DocumentSendingProfile1."E-Mail"::"Yes (Prompt for Settings)"
//         else
//             DocumentSendingProfile1."E-Mail" := DocumentSendingProfile1."E-Mail"::"Yes (Use Default Settings)";

//         DocumentSendingProfile1."E-Mail Attachment" := DocumentSendingProfile1."E-Mail Attachment"::PDF;
//     end;

//     procedure SendEasiestEMail()
//     var
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//     begin
//         EmailMessage.Create('', 'This is the subject', 'This is the body');
//         Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//     end;

//     procedure SendEmailWithAttachment()
//     var
//         ReportExample: Report "Standard Sales - Invoice";
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         TempBlob: Codeunit "Temp Blob";
//         InStr: Instream;
//         OutStr: OutStream;
//         ReportParameters: Text;
//     begin
//         ReportParameters := ReportExample.RunRequestPage();
//         TempBlob.CreateOutStream(OutStr);
//         Report.SaveAs(Report::"Standard Sales - Invoice", ReportParameters, ReportFormat::Pdf, OutStr);
//         TempBlob.CreateInStream(InStr);

//         EmailMessage.Create('your email goes here', 'This is the subject', 'This is the body');
//         EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
//         Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//     end;

//     procedure SendEmailWithPreviewWindow()
//     var
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//     begin
//         EmailMessage.Create('your email goes here', 'This is the subject', 'This is the body');
//         Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
//     end;

//     procedure SendEmailWithPreviewWindowHtmlFormatBody()
//     var
//         Customer: Record Customer;
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         Body: Text;
//     begin
//         Customer.FindFirst();
//         Customer.CalcFields(Balance);
//         Body := '<h3>TO MESSRS: ' + Customer.Name + '</h3>ATT : ACCOUNTING DEPARTMENT </br> </h3> <hr></br>Your current balance with us is:</br></br><strong>' + format(Customer.Balance) + '</strong></br></br><hr></br>Best regards,</br></br>Financial Department</br></br>Spain</br> <img src="https://businesscentralgeek.com/wp-content/uploads/2022/06/Imagen3.jpg" />';

//         EmailMessage.Create('your email goes here', 'This is the subject', Body, true);
//         Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
//     end;

//     procedure SendEMail()
//     var
//         Email: Codeunit Email;
//         EmailMessage: Codeunit "Email Message";
//         Cancelled: Boolean;
//         MailSent: Boolean;
//         Selection: Integer;
//         OptionsLbl: Label 'Send,Open Preview';
//         ListTo: List of [Text];
//     begin
//         Selection := Dialog.StrMenu(OptionsLbl);
//         ListTo.Add('your email goes here');
//         EmailMessage.Create(ListTo, 'This is the subject', 'This is the body', true);
//         Cancelled := false;
//         if Selection = 1 then
//             MailSent := Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
//         if Selection = 2 then begin

//             MailSent := Email.OpenInEditorModally(
//                 EmailMessage, Enum::"Email Scenario"::Default) = Enum::"Email Action"::Sent;
//             Cancelled := not MailSent;
//         end;

//         if (Selection <> 0) and not MailSent and not Cancelled then
//             Error(GetLastErrorText());
//     end;
// }