pageextension 50005 "User Task Extension" extends "User Task Card"
{
    layout
    {
        addafter("Percent Complete")
        {
            field("Reviewer Id"; Rec."ICRA Reviewer Id")
            {
                Editable = EditableReviewer;
                ApplicationArea = All;
            }
            field(Reviewed; Rec."ICRA Reviewed")
            {
                ApplicationArea = All;
            }
            field("Reviewed At"; Rec."ICRA Reviewed At")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Recurrence)
        {
            action("Mark Reviewed")
            {
                Caption = 'Mark Reviewed';
                ApplicationArea = All;
                Promoted = true;
                Enabled = Reviewd_At;
                Image = Completed;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.SetReviewed();
                    CurrPage.Update(true);
                end;
            }
        }
        modify("Mark Completed")
        {
            trigger OnAfterAction()
            begin
                if Rec."Percent Complete" = 100 then
                    EditableReviewer := false;
            end;
        }
    }
    trigger OnAfterGetRecord()
    begin
        Reviewd_At := isReviewed();
        EditableReviewer := ReviewerIdEditable();
    end;

    trigger OnOpenPage()
    begin
        if rec."Percent Complete" <> 100 then
            EditableReviewer := true;
    end;

    var
        Reviewd_At: Boolean;
        EditableReviewer: Boolean;

    procedure IsReviewed(): Boolean
    begin
        if rec."ICRA Reviewed" then
            exit(false);
        if (rec."Percent Complete" = 100) and (rec."ICRA Reviewer Id" <> '') then
            exit(true)
        else
            exit(false);
    end;

    procedure ReviewerIdEditable(): Boolean
    begin
        if rec."Percent Complete" = 100 then
            exit(false)
        else
            exit(true);
    end;
}