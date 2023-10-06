page 50500 JP_Users
{
    Caption = 'Json Placeholder Users';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = JP_Users;
    // CardPageId = "JP User Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(UUID; rec.UUID)
                {
                    ApplicationArea = All;
                }
                field(id; rec.id)
                {
                    ApplicationArea = All;
                }
                field(name; rec.name)
                {
                    ApplicationArea = All;
                }
                field(username; rec.username)
                {
                    ApplicationArea = All;
                }
                field(email; rec.email)
                {
                    ApplicationArea = All;
                }
                field(street; rec.street)
                {
                    ApplicationArea = All;
                }
                field(suite; rec.suite)
                {
                    ApplicationArea = All;
                }
                field(city; rec.city)
                {
                    ApplicationArea = All;
                }
                field(zipcode; rec.zipcode)
                {
                    ApplicationArea = All;
                }
                field(lat; rec.lat)
                {
                    ApplicationArea = All;
                }
                field(lng; rec.lng)
                {
                    ApplicationArea = All;
                }
                field(phone; rec.phone)
                {
                    ApplicationArea = All;
                }
                field(website; rec.website)
                {
                    ApplicationArea = All;
                }
                field(companyName; Rec.companyName)
                {
                    ApplicationArea = All;
                }
                field(companyCatchPhrase; rec.companyCatchPhrase)
                {
                    ApplicationArea = All;
                }
                field(companyBS; rec.companyBS)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetUsersFromAPI)
            {
                ApplicationArea = All;
                Caption = 'Get Users From API';

                trigger OnAction();
                var
                    apiCodeunit: Codeunit API_RequestHandlerCodeunit;
                    response: Text;
                    errorMsg: Text;
                    apiResponseHandler: Codeunit API_ResponseHandlerCodeunit;
                begin
                    response := apiCodeunit.GetResponse('https://jsonplaceholder.typicode.com/users', errorMsg);
                    if errorMsg <> '' then
                        Error(errorMsg)
                    else
                        Message('Your API Call Response: \' + response);

                    if response <> '' then begin
                        if apiResponseHandler.UsersInfoFromResponse(response) then
                            Message('Records inserted Successfully!');
                    end;
                end;
            }
        }
    }
}