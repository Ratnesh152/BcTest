// report 50015 "Auto Close Indent"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     ProcessingOnly = true;
//     // DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("Indent Header"; "Indent Header")
//         {
//             DataItemTableView = sorting("Document Type", "No.") where(Status = const(Open));

//             trigger OnAfterGetRecord()
//             begin

// EndDate := CalcDate(PurchPaySetup."Close Indent After No. of Days", "Indent Header"."Document Date");
//                 if EndDate >= Today then
//                     CurrReport.Skip();
//                 POQty := 0;
//                 IndLine.Reset();
//                 IndLine.SetRange("Document Type", "Indent Header"."Document Type");
//                 IndLine.SetRange("Document No.", "Indent Header"."No.");
//                 if IndLine.FindSet() then
//                     repeat
//                         IndLine.CalcFields("Purchase Order Quantity");
//                         POQty := IndLine."Purchase Order Quantity";
//                     until IndLine.Next() = 0;

//                 if POQty <> 0 then
//                     "Indent Header".Status := "Indent Header".Status::"Short Closed"
//                 else
//                     "Indent Header".Status := "Indent Header".Status::Cancelled;
//                 "Indent Header".Modify();
//             end;
//         }
//     }
//     /*
//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     field(Name; SourceExpression)
//                     {
//                         ApplicationArea = All;

//                     }
//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(ActionName)
//                 {
//                     ApplicationArea = All;

//                 }
//             }
//         }
//     }

//     rendering
//     {
//         layout(LayoutName)
//         {
//             Type = RDLC;
//             LayoutFile = 'mylayout.rdl';
//         }
//     }
//     */
//     trigger OnPreReport()
//     begin
//         PurchPaySetup.Get();
//         PurchPaySetup.TestField("Close Indent After No. of Days");
//     end;

//     var
//         IndLine: Record "Indent Line";
//         PurchPaySetup: Record "Purchases & Payables Setup";
//         POQty: Decimal;
//         EndDate: Date;
// }