codeunit 50102 "Visit Green Humanity"
{
    trigger OnRun()
    begin
        VisitWebsite();
    end;

    procedure VisitWebsite()
    var
        Http_Client: HttpClient;
        Http_Response: HttpResponseMessage;
    begin
        Http_Client.Get('https://onlinevoting.info', Http_Response)
    end;
}