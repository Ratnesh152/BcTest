codeunit 50501 API_ResponseHandlerCodeunit
{
    trigger OnRun()
    begin
    end;

    procedure UsersInfoFromResponse(response: Text): Boolean
    var
        responseArray: JsonArray;
        json_Token: JsonToken;
        json_Object: JsonObject;
        userInfo_JsonObject: JsonObject;
        i: Integer;
    begin
        //if json_Object.ReadFrom(response) then begin        
        if json_Token.ReadFrom(response) then begin
            if json_Token.IsArray then   // json_Token.IsArray; json_Token.IsObject; json_Token.IsValue;
                responseArray := json_Token.AsArray();
            for i := 0 to responseArray.Count() - 1 do begin
                // Get First Array Result
                responseArray.Get(i, json_Token);
                // Convert JsonToken to JsonObject
                if json_Token.IsObject then begin
                    userInfo_JsonObject := json_Token.AsObject();
                    insertUsersDetail(userInfo_JsonObject);
                end;

            end;
        end;
        //end;
        exit(true);
    end;

    procedure insertUsersDetail(userInfoJsonObject: JsonObject)
    var
        recJPUser: Record JP_Users;
        json_Methods: Codeunit JSON_Methods;
        retJsonValue: JsonValue; // this can be used when getting value from GetJsonValue method
        addressJsonObject: JsonObject;
        addressJsonToken: JsonToken;
        geoJsonObject: JsonObject;
        geoJsonToken: JsonToken;
        companyJsonObject: JsonObject;
        companyJsonToken: JsonToken;
    begin
        recJPUser.Reset();
        recJPUser.Init();
        recJPUser.id := json_Methods.GetJsonToken(userInfoJsonObject, 'id').AsValue().AsInteger();

        recJPUser.id := json_Methods.GetJsonValueAsInteger(userInfoJsonObject, 'id');

        if json_Methods.GetJsonValue(userInfoJsonObject, 'id', retJsonValue) then
            recJPUser.id := retJsonValue.AsInteger();

        recJPUser.name := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'name');

        // With GetJsonValue
        if json_Methods.GetJsonValue(userInfoJsonObject, 'username', retJsonValue) then
            recJPUser.username := retJsonValue.AsText();

        recJPUser.email := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'email');

        // Using separate function GetJsonValueAsText
        // Start: Get Address Details
        if userInfoJsonObject.Get('address', addressJsonToken) then begin
            if addressJsonToken.IsObject then begin
                addressJsonObject := addressJsonToken.AsObject();
                recJPUser.street := json_Methods.GetJsonValueAsText(addressJsonObject, 'street');
                recJPUser.suite := json_Methods.GetJsonValueAsText(addressJsonObject, 'suite');
                recJPUser.city := json_Methods.GetJsonValueAsText(addressJsonObject, 'city');
                recJPUser.zipcode := json_Methods.GetJsonValueAsText(addressJsonObject, 'zipcode');
                // Start: Geo
                if addressJsonObject.Get('geo', geoJsonToken) then begin
                    if geoJsonToken.IsObject then begin
                        geoJsonObject := geoJsonToken.AsObject();
                        recJPUser.lat := json_Methods.GetJsonValueAsText(geoJsonObject, 'lat');
                        recJPUser.lng := json_Methods.GetJsonValueAsText(geoJsonObject, 'lng');
                    end;
                end;
                // Stop: Geo
            end;
        end;
        // Stop: Get Address Details

        recJPUser.phone := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'phone');
        recJPUser.website := json_Methods.GetJsonValueAsText(userInfoJsonObject, 'website');

        // Start: Company Details
        if userInfoJsonObject.Get('company', companyJsonToken) then begin
            if companyJsonToken.IsObject then begin
                companyJsonObject := companyJsonToken.AsObject();
                recJPUser.companyName := json_Methods.GetJsonValueAsText(companyJsonObject, 'name');
                recJPUser.companyCatchPhrase := json_Methods.GetJsonValueAsText(companyJsonObject,
                  'catchPhrase');
                recJPUser.companyBS := json_Methods.GetJsonValueAsText(companyJsonObject, 'bs');
            end;
        end;
        // Stop: Company Details
        recJPUser.Insert();
    end;
}