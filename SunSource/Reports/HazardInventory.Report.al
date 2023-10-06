report 50006 "Hazard Inventory Activity"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './SunSource/Reports/HazardInventory.Report.rdl';
    DefaultLayout = RDLC;
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Hazard Invountry"; "Hazard Inventory")
        {
            column(Activity; Activity)
            {
            }
            column(Add__Control___Recovery_Method; "Add. Control & Recovery Method")
            {
            }
            column(Assessment_of_Control_Effectiv; "Assessment of Control Effectiv")
            {
            }
            column(Existing_Control___Rec_Measure; "Existing Control & Rec Measure")
            {
            }
            column(Hazard; Hazard)
            {
            }
            column(Initial_Risk_Rating; "Initial Risk Rating")
            {
            }
            column(Risk_Group_Who_Might_be_Harmed; "Risk Group Who Might be Harmed")
            {
            }
            column(Risk___Exposure_Rating; "Risk / Exposure Rating")
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
}