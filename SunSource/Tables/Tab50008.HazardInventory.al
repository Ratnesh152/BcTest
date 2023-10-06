table 50008 "Hazard Inventory"
{
    fields
    {
        field(3; Activity; Enum "Hazard Inventory Activity")
        {
            DataClassification = ToBeClassified;
        }
        field(4; Hazard; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Risk Group Who Might be Harmed"; Text[500])
        {
            Caption = 'At risk group who might be harmed';
            DataClassification = ToBeClassified;
        }
        field(6; "Existing Control & Rec Measure"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Assessment of Control Effectiv"; Option)
        {
            OptionMembers = Yes,No;
            DataClassification = ToBeClassified;
        }
        field(8; "Initial Risk Rating"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Tolerable,"Intolerable";
        }
        field(9; "Add. Control & Recovery Method"; Text[1000])
        {
            Caption = 'Additional Controls and recovery measures';
            DataClassification = ToBeClassified;
        }
        field(10; "Risk / Exposure Rating"; Option)
        {
            OptionMembers = Acceptable,"Not Acceptable";
            DataClassification = ToBeClassified;
        }
    }
}