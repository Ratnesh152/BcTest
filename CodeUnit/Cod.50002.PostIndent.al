codeunit 50002 "Post Indent"
{
    trigger OnRun();
    begin
        CreatePostedIndent();
    end;

    local procedure CreatePostedIndent()
    var
        PostedIndentHeader: Record "Posted Indent Header Ratnesh";
        IndentHeaderRatnesh: Record "Indent Header Ratnesh";
        LineNo: Integer;
    begin
        IndentHeaderRatnesh.Reset();
        IndentHeaderRatnesh.SetRange("No.", PostedIndentHeader."No.");
        if IndentHeaderRatnesh.FindSet() then begin
            CreatePostedIndentHeader(IndentHeaderRatnesh, PostedIndentHeader);
            LineNo := 0;
            repeat
                LineNo += 10000;
            // CreatePostedIndentLine(IndentLineRatnesh, PostedIndentHeader, LineNo);
            until IndentHeaderRatnesh.Next() = 0;
        end;
    end;

    local procedure CreatePostedIndentHeader(var IndentHeaderRatnesh: Record "Indent Header Ratnesh"; var PostedIndentHeader: Record "Posted Indent Header Ratnesh")
    begin
        PostedIndentHeader.Reset();
        PostedIndentHeader.Validate("No.", IndentHeaderRatnesh."No.");
        PostedIndentHeader.Insert();
        Message('hello 1');
        PostedIndentHeader.Validate("Student No.", IndentHeaderRatnesh."Student No.");
        PostedIndentHeader.Validate("Created By", IndentHeaderRatnesh."Created By");
        PostedIndentHeader.Validate("Released By", IndentHeaderRatnesh."Released By");
        PostedIndentHeader.Validate(Department, IndentHeaderRatnesh.Department);
        PostedIndentHeader.Validate(Purpose, IndentHeaderRatnesh.Purpose);
        PostedIndentHeader.Modify(true);
    end;

    local procedure CreatePostedIndentLine(var IndentLineRatnesh: Record "Indent line Ratnesh"; var PostedIndentLine: Record "Posted Indent Line Ratnesh"; var LineNo: Integer)
    var
    // PostedIndentLine: Record "Posted Indent Line Ratnesh";
    begin
        PostedIndentLine.Init();
        // PostedIndentLine.Validate("No.", IndentHeaderRatnesh."No.");
        PostedIndentLine.Validate("Line No.", LineNo);
        PostedIndentLine.Insert(true);
        // PostedIndentLine.Validate("No.", I);

    end;
}