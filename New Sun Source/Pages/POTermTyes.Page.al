page 50051 "SSE Term Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SSE Term Type";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Po Term Type Code"; Rec."Po Term Type Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}