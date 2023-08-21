codeunit 50003 "Post Indent Document"
{
    TableNo = "Indent Header Ratnesh";
    Permissions = tabledata "Indent Line Ratnesh" = rmid,
    tabledata "Posted Indent Header Ratnesh" = rmid,
    tabledata "Posted Indent Line Ratnesh" = rmid;

    trigger OnRun()
    var
        IndentHeaderRatnesh: Record "Indent Header Ratnesh";
        LineCount: Integer;
        TempIndentLineRatnesh: Record "Indent Line Ratnesh" temporary;
    begin
        IndentHeaderRatnesh := rec;
        LineCount := 0;
        OnAfterPostIndent(IndentHeaderRatnesh, PostedIndentHdrNo, TempIndentLineRatnesh);
        OnAfterPostIndentDoc(Rec, PostedIndentHdrNo."No.")
    end;

    var
        PostedIndentHdrNo: Record "Posted Indent Header Ratnesh";
        TempIndentLineRatnesh: Record "Indent Line Ratnesh" temporary;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostIndent(var IndentHeaderRatnesh: Record "Indent Header Ratnesh"; PostedIndentHdrNo: Record "Posted Indent Header Ratnesh"; var TempIndentLineRatnesh: Record "Indent Line Ratnesh" temporary)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterPostIndentDoc(var IndentHeaderRatnesh: Record "Indent Header Ratnesh"; SalesInvHdrNo: Code[20])
    begin
    end;
}