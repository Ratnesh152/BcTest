table 50008 "Hazard Inventory"
{
    DataClassification = CustomerContent;
    fields
    {
        field(3; Activity; Enum "Hazard Inventory Activity")
        {
        }
        field(4; Hazard; Text[500])
        {
        }
        field(5; "Risk Group Who Might be Harmed"; Text[500])
        {
            Caption = 'At risk group who might be harmed';
        }
        field(6; "Existing Control & Rec Measure"; Text[500])
        {
        }
        field(7; "Assessment of Control Effectiv"; Option)
        {
            OptionMembers = Yes,No;
        }
        field(8; "Initial Risk Rating"; option)
        {
            OptionMembers = Tolerable,"Intolerable";
        }
        field(9; "Add. Control & Recovery Method"; Text[1000])
        {
            Caption = 'Additional Controls and recovery measures';
        }
        field(10; "Risk / Exposure Rating"; Option)
        {
            OptionMembers = Acceptable,"Not Acceptable";
        }
    }
}