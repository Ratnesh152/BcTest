table 50017 "Project Log"
{
    Caption = 'Project Log';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(3; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(4; "User Name"; Text[80])
        {
            Caption = 'User Name';
        }
        field(5; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
        }
        field(6; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
        }
        field(7; "Create Date"; Date)
        {
            Caption = 'Create Date';
        }
        field(8; "Crete Time"; Time)
        {
            Caption = 'Crete Time';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure UpdateProjectLog()
    var
        UserSetup: Record "User Setup";
        Users: Record User;
        DimensionValue: Record "Dimension Value";
        Dimensions: Record Dimension;
        ProjectLog: Record "Project Log";
    begin
        UserSetup.Get(UserId);

        Users.Reset();
        Users.SetRange("User Name", UserSetup."User ID");
        if Users.FindSet() then
            Rec."User Name" := Users."Full Name";

        ProjectLog.Init();
        ProjectLog."User ID" := UserSetup."User ID";
        ProjectLog."Department Code" := UserSetup."Department Code";
        ProjectLog."Create Date" := Today;
        ProjectLog."Crete Time" := Time;

        Dimensions.Get('DEPARTMENT');
        if DimensionValue.Get(Dimensions.Code, ProjectLog."Department Code") then;
        ProjectLog."Department Name" := DimensionValue.Name;
        ProjectLog.Insert()
    end;

}
