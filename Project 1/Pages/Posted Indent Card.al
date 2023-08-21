page 52002 "Posted Indent Card Ratnesh"
{
    Caption = 'Posted Indent Card';
    PageType = Document;
    InsertAllowed = false;
    SourceTable = "Posted Indent Header Ratnesh";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Student No."; Rec."Student No.")
                {
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                group("Address & Contact Details")
                {
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the value of the Address field.';

                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the value of the Address 2 field.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the value of the City field.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the value of the Post Code field.';
                    }
                    field(Country; Rec.Country)
                    {
                        ApplicationArea = all;
                        ToolTip = 'Specifies the value of the Country field.';
                    }
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Released By"; Rec."Released By")
                {
                    ApplicationArea = All;
                }
                field("Released Date"; Rec."Released Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Allow Indent Release"; Rec."Allow Indent Release")
                {
                    ApplicationArea = all;
                }
                field("MSME Vendor"; Rec."MSME Vendor")
                {
                    ApplicationArea = All;
                }
                field("MSME Vendor Certifiate No."; Rec."MSME Vendor Certifiate No.")
                {
                    ApplicationArea = All;
                }
                field("Due/Not Due"; Rec."Due/Not Due")
                {
                    ApplicationArea = all;
                }

            }

            part(IndentLines; "Indent Subform Ratnesh")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Post)
            {

            }
        }
    }
}
