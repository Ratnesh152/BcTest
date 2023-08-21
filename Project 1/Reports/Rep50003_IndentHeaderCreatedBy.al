report 50033 "Indent Header Created By"
{
    ApplicationArea = All;
    Caption = 'Indent Header Created By';
    UsageCategory = Administration;
    ProcessingOnly = true;
    dataset
    {
        dataitem(IndentHeaderRatnesh; "Indent Header Ratnesh")
        {
            trigger OnPreDataItem()
            begin
                Clear(IndentHeaderRatnesh);
                Clear(counter);
                if not ReplaceExisting then
                    IndentHeaderRatnesh.SetRange("Created By");
            end;

            trigger OnAfterGetRecord()
            begin
                if IndentHeader.Get(IndentHeaderRatnesh."No.") then begin
                    IndentHeader."Created By" := Name2Apply;
                    IndentHeader.Modify();
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message(' Hits, %1', counter);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Name2Apply; Name2Apply)
                    {
                        ApplicationArea = All;
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var
        ReplaceExisting: Boolean;
        Name2Apply: Text;
        counter: Integer;
        IndentHeader: Record "Indent Header Ratnesh";
}
