codeunit 50004 "Create New PO Validation"
{
    TableNo = "Indent Header Ratnesh";

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::"Indent Card Ratnesh", 'OnNewRecordEvent', '', true, true)]
    local procedure POUserValidation(var Rec: Record "Indent Header Ratnesh"; var xRec: Record "Indent Header Ratnesh"; BelowxRec: Boolean)
    begin
    end;
}