table 50006 "Approval Entries"
{
    DataClassification = CustomerContent;
    // ALLE DK AM :: New Table restore the document wise Approval entries.


    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = 'Purchase Requisition,Purchase Order,Purchase Invoice,Purchase Credit Memo,Advance Payment Request,Employee Expense,Guest House Expense';
            OptionMembers = "Purchase Requisition","Purchase Order","Purchase Invoice","Purchase Credit Memo","Advance Payment Request","Employee Expense","Guest House Expense";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; Sequence; Integer)
        {
            Editable = false;
            MinValue = 1;
        }
        field(4; "Approver Type"; Option)
        {
            Editable = false;
            OptionCaption = 'HOD,Accounts,Management,Admin/Site Incharge,CEO-1';
            OptionMembers = HOD,Accounts,Management,"Admin/Site Incharge","CEO-1";
        }
        field(5; "Approver Code"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            trigger OnValidate()
            begin
                TESTFIELD("Send for Approval", FALSE);
                /*ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE("Document Type","Document Type");
                ApprovalEntries.SETRANGE("Document No.","Document No.");
                ApprovalEntries.SETFILTER(Sequence,'<%1',Sequence);
                ApprovalEntries.SETRANGE("Send for Approval",FALSE);
                IF ApprovalEntries.FINDFIRST THEN BEGIN
                  ApprovalEntries.TESTFIELD("Send for Approval");
                END;*/

            end;
        }
        field(6; Approved; Boolean)
        {
            Editable = true;
        }
        field(7; "Approved By"; Code[50])
        {
            Editable = false;
        }
        field(8; "Approved Date_Time"; DateTime)
        {
            Editable = false;
        }
        field(9; "Send for Approval ID"; Code[50])
        {
            Editable = false;
        }
        field(10; "Send for approval Date_Time"; DateTime)
        {
            Editable = false;
        }
        field(11; "Send for Approval"; Boolean)
        {
            Editable = false;
        }
        field(12; "E-Mail Notification"; Boolean)
        {
        }
        field(13; "E-Mail Notification Status"; Option)
        {
            OptionCaption = ' ,Pending,Failed,Success';
            OptionMembers = " ",Pending,Failed,Success;
        }
        field(14; "E-Mail Error Message"; Text[200])
        {
            Editable = false;
        }
        field(15; "Approver Comments"; Text[50])
        {
        }
        field(16; Select; Boolean)
        {
        }
        field(17; RTCURL; Text[250])
        {
        }
        field(18; RTCURL1; Text[250])
        {
        }
        field(20; "Approval Limit"; Decimal)
        {
            Description = 'SE1.43';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", Sequence)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApprovalEntries: Record "Approval Entries";
        PurchaseHeader: Record "Purchase Header";
}