// codeunit 50201 "SMTP Mail GH"
// {
//     Permissions = TableData 50301 = r;

//     trigger OnRun()
//     begin
//     end;

//     var
//         SMTPMailSetup: Record 50301;
//         // Mail: DotNet SmtpMessage;
//         Mail: DotNet 'smtpmsg';

//         Text002: Label 'Attachment %1 does not exist or can not be accessed from the program.';
//         Text003: Label 'The SMTP mail system returned the following error: "%1".';
//         SendResult: Text;

//     procedure CreateMessage(SenderName: Text; SenderAddress: Text; Recipients: Text; Subject: Text; Body: Text; HtmlFormatted: Boolean)
//     begin
//         IF Recipients <> '' THEN
//             CheckValidEmailAddresses(Recipients);
//         CheckValidEmailAddresses(SenderAddress);
//         SMTPMailSetup.GET;
//         SMTPMailSetup.TESTFIELD("SMTP Server");
//         IF NOT ISNULL(Mail) THEN BEGIN
//             Mail.Dispose;
//             CLEAR(Mail);
//         END;
//         SendResult := '';
//         Mail := Mail.SmtpMessage;
//         Mail.FromName := SenderName;
//         Mail.FromAddress := SenderAddress;
//         Mail."To" := Recipients;
//         Mail.Subject := Subject;
//         Mail.Body := Body;
//         Mail.HtmlFormatted := HtmlFormatted;
//     end;

//     procedure TrySend(): Boolean
//     begin
//         SendResult := '';
//         WITH SMTPMailSetup DO
//             SendResult :=
//               Mail.Send(
//                 "SMTP Server",
//                 "SMTP Server Port",
//                 Authentication <> Authentication::Anonymous,
//                 "User ID",
//                 Password,
//                 "Secure Connection");
//         Mail.Dispose;
//         CLEAR(Mail);

//         EXIT(SendResult = '');
//     end;

//     procedure Send()
//     begin
//         IF NOT TrySend THEN
//             ERROR(Text003, SendResult);
//     end;

//     procedure AddRecipients(Recipients: Text)
//     var
//         Result: Text;
//     begin
//         CheckValidEmailAddresses(Recipients);
//         Result := Mail.AddRecipients(Recipients);
//         IF Result <> '' THEN
//             ERROR(Text003, Result);
//     end;

//     procedure AddCC(Recipients: Text)
//     var
//         Result: Text;
//     begin
//         CheckValidEmailAddresses(Recipients);
//         Result := Mail.AddCC(Recipients);
//         IF Result <> '' THEN
//             ERROR(Text003, Result);
//     end;

//     procedure AddBCC(Recipients: Text)
//     var
//         Result: Text;
//     begin
//         CheckValidEmailAddresses(Recipients);
//         Result := Mail.AddBCC(Recipients);
//         IF Result <> '' THEN
//             ERROR(Text003, Result);
//     end;

//     procedure AppendBody(BodyPart: Text)
//     var
//         Result: Text;
//     begin
//         Result := Mail.AppendBody(BodyPart);
//         IF Result <> '' THEN
//             ERROR(Text003, Result);
//     end;

//     procedure AddAttachment(Attachment: Text; FileName: Text)
//     var
//         FileManagement: Codeunit 419;
//         Result: Text;
//     begin
//         IF Attachment = '' THEN
//             EXIT;
//         IF NOT EXISTS(Attachment) THEN
//             ERROR(Text002, Attachment);

//         FileName := FileManagement.StripNotsupportChrInFileName(FileName);
//         FileName := DELCHR(FileName, '=', ';'); // Used for splitting multiple file names in Mail .NET component

//         Result := Mail.AddAttachmentWithName(Attachment, FileName);

//         IF Result <> '' THEN
//             ERROR(Text003, Result);
//     end;

//     procedure AddAttachmentStream(AttachmentStream: InStream; AttachmentName: Text)
//     var
//         FileManagement: Codeunit "File Management";
//     begin
//         AttachmentName := FileManagement.StripNotsupportChrInFileName(AttachmentName);

//         Mail.AddAttachment(AttachmentStream, AttachmentName);
//     end;

//     procedure CheckValidEmailAddresses(Recipients: Text)
//     var
//         MailManagement: Codeunit 9520;
//     begin
//         MailManagement.CheckValidEmailAddresses(Recipients);
//     end;

//     procedure GetLastSendMailErrorText(): Text
//     begin
//         EXIT(SendResult);
//     end;

//     procedure GetSMTPMessage(var SMTPMessage: DotNet SmtpMessage)
//     begin
//         SMTPMessage := Mail;
//     end;

//     procedure IsEnabled(): Boolean
//     begin
//         IF SMTPMailSetup.FIND THEN
//             EXIT(NOT (SMTPMailSetup."SMTP Server" = ''));

//         EXIT(FALSE);
//     end;

//     procedure ApplyOffice365Smtp(var SMTPMailSetupConfig: Record 50301)
//     begin
//         // This might be changed by the Microsoft Office 365 team.
//         // Current source: http://technet.microsoft.com/library/dn554323.aspx
//         SMTPMailSetupConfig."SMTP Server" := 'smtp.office365.com';
//         SMTPMailSetupConfig."SMTP Server Port" := 587;
//         SMTPMailSetupConfig.Authentication := SMTPMailSetupConfig.Authentication::Basic;
//         SMTPMailSetupConfig."Secure Connection" := TRUE;
//     end;

//     [EventSubscriber(ObjectType::Table, 1400, 'OnRegisterServiceConnection', '', false, false)]
//     procedure HandleSMTPRegisterServiceConnection(var ServiceConnection: Record "1400")
//     var
//         SMTPMailSetup: Record 50301;
//         RecRef: RecordRef;
//     begin
//         IF NOT SMTPMailSetup.GET THEN BEGIN
//             IF NOT SMTPMailSetup.WRITEPERMISSION THEN
//                 EXIT;
//             SMTPMailSetup.INIT;
//             SMTPMailSetup.INSERT;
//         END;

//         RecRef.GETTABLE(SMTPMailSetup);

//         ServiceConnection.Status := ServiceConnection.Status::Enabled;
//         IF SMTPMailSetup."SMTP Server" = '' THEN
//             ServiceConnection.Status := ServiceConnection.Status::Disabled;

//         WITH SMTPMailSetup DO
//             ServiceConnection.InsertServiceConnection(
//               ServiceConnection, RecRef.RECORDID, TABLECAPTION, '', PAGE::"SMTP Mail Setup");
//     end;

//     procedure GetBody(): Text
//     begin
//         EXIT(Mail.Body);
//     end;
// }

