codeunit 50009 CreateLocation1
{
    trigger OnRun()
    begin
    end;

    procedure CreateLocation(var location2: code[10])
    var
        Location1: Record Location;
        PIUploader: Record 50020;
    begin
        Location1.Init();
        Location1.Code := location2;
        Location1.Insert();
    end;
}