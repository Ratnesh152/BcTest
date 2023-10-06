codeunit 50000 API_RequestHandlerCodeunit
{
    trigger OnRun()
    begin
    end;

    procedure GetResponse(requestURL: Text; erroMsg: Text): Text
    var
        httpClient: HttpClient;
        httpResponseMsg: HttpResponseMessage;
        httpRequestMsg: HttpRequestMessage;
        response: Text;
    // recWebServiceLog: Record "Api Web Service";
    // cuCommon: Codeunit CommonCodeunit;
    begin
        erroMsg := '';
        // cuCommon.InsertWebServiceLog('', '', requestURL, recWebServiceLog);
        if not httpClient.Get(requestURL, httpResponseMsg) then begin
            erroMsg := 'The call to webservice is failed';
        end;

        if not httpResponseMsg.IsSuccessStatusCode then begin
            erroMsg += '\The request call returned an error message. \Detail: \Status Code: ' +
                   Format(httpResponseMsg.HttpStatusCode) + '\Description: ' + httpResponseMsg.ReasonPhrase;
        end;

        httpResponseMsg.Content.ReadAs(response);
        // cuCommon.UpdateWebServiceLog(recWebServiceLog);
        exit(response);
    end;
}