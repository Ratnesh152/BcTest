tableextension 50001 "User Task Extension" extends "User Task"
{
    fields
    {
        field(50000; "ICRA Reviewer Id"; Code[50])
        {
            Caption = 'Reviewer Id';
        }
        field(50001; "ICRA Reviewed"; Boolean)
        {
            Editable = false;
            Caption = 'Reviewed';
        }
        field(50002; "ICRA Reviewed At"; DateTime)
        {
            Editable = false;
            Caption = 'Reviewed At';
        }
    }

    procedure SetReviewed()
    begin
        "ICRA Reviewed At" := CurrentDateTime;
        "ICRA Reviewed" := true;
    end;
}
