page 52008 "Student Card"
{
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Student;
    RefreshOnActivate = true;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Importance = Standard;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit1(xrec) then
                            CurrPage.Update();
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Name field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Phone No. field.';

                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                    ExtendedDatatype = EMail;
                }
            }
            group(Address1)
            {
                Caption = 'Address Details';
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
                field("Resistration No."; Rec."Resistration No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Resistration No. field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                // field(Picture; Rec.Picture)
                // {
                //     ApplicationArea = all;
                //     ToolTip = 'Specifies the value of the Picture field.';
                // }
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
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    Visible = false;
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Image field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                    ExtendedDatatype = PhoneNo;
                }
            }
        }
    }
}
