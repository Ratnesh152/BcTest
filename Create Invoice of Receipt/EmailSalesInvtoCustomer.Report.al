// report 50404 "Email Sales Inv. To Customer"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     Permissions = tabledata "Sales Invoice Header" = RM;
//     ProcessingOnly = true;
//     // DefaultRenderingLayout = LayoutName;

//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {
//             RequestFilterFields = "No.", "IRN Hash";
//             // DataItemTableView = where("EMail Sent" = filter(false));
//             trigger OnAfterGetRecord()
//             begin
//                 Clear(RecRef);
//                 RecRef.Open(112);
//                 if RecRef.Get("Sales Invoice Header".RecordId) then begin
//                     // AXTGenNotifMgmt.HandleEvent('SENDSALESINVTOCUSTOMER', RecRef);
//                     // "Sales Invoice Header"."EMail Sent" := true;
//                     "Sales Invoice Header".Modify();
//                 end;

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

//     var
//         RecRef: RecordRef;
//     // AXTGenNotifMgmt: Codeunit "AXT Generic Notification Mgmt.";
// }