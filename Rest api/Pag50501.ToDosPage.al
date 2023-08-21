page 50501 ToDosPage
{
    ApplicationArea = All;
    Caption = 'ToDosPage';
    PageType = List;
    SourceTable = TodosTable;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(UUID; Rec.UUID)
                {
                    ToolTip = 'Specifies the value of the UUID field.';
                }
                field(UserId; Rec.UserId)
                {
                    ToolTip = 'Specifies the value of the UserId field.';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Completed; Rec.Completed)
                {
                    ToolTip = 'Specifies the value of the Completed field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(GetToDos)
            {
                ApplicationArea = All;
                Caption = 'Get Todos from API';
                trigger OnAction()
                var
                    myInt: Integer;
                    http_client: HttpClient;
                    http_Responding: HttpResponseMessage;
                    response: Text;
                begin
                    http_client.Get('https://jsonplaceholder.typicode.com/todos', http_Responding);
                    http_Responding.Content.ReadAs(response);
                    GetToDosfromAPI(response);
                end;
            }
        }
    }
    procedure GetToDosfromAPI(response: Text)
    var
        json_Token: JsonToken;// container for well form json data default value is null
        json_Value: JsonValue;// container for well form json data default value is null
        json_Object: JsonObject; //{}
        json_Array: JsonArray; //[]
        i: Integer;
        Value_Jtoken: JsonToken;
        recTodos: Record TodosTable;
        todosID: Integer;
    begin
        // recTodos.Reset();
        // if recTodos.FindFirst() then
        //     todosID := Rec.UserId + 1
        // else
        //     todosID := 1;
        if json_Token.ReadFrom(response) then begin
            if json_Token.IsArray then begin
                json_Array := json_Token.AsArray();

                for i := 0 to json_Array.Count - 1 do begin
                    json_Array.Get(i, json_Token);

                    if json_Token.IsObject then begin
                        json_Object := json_Token.AsObject();

                        if json_Object.Get('userId', Value_Jtoken) then begin
                            if Value_Jtoken.IsValue then begin
                                Message(json_Token.AsValue().AsText())
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

    procedure GetResultJsonValues(jObj: JsonObject; KeyName: Text; jValue: JsonValue): Boolean
    var
        json_Token: JsonToken;
    begin
        if not jObj.Get(KeyName, json_Token) then exit;
        jValue := json_Token.AsValue();
        exit(true);
    end;
}
