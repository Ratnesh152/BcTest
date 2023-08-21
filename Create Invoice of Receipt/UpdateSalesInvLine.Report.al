// report 50006 "Update Sales Invoice Line"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     // DefaultRenderingLayout = LayoutName;
//     Permissions = tabledata "Sales Invoice Line" = RM;
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(SalesInvoiceLine; "Sales Invoice Line")
//         {
//             RequestFilterFields = "Document No.";

//             trigger OnAfterGetRecord()
//             begin
//                 SalesInvoiceLine."GST Place of Supply" := SalesInvoiceLine."GST Place of Supply"::"Ship-to Address";
//                 SalesInvoiceLine.Modify();
//             end;
//         }

//     }
//     trigger OnPostReport()
//     begin
//         Message('Data Updated....');
//     end;
//     /*
//         requestpage
//         {
//             layout
//             {
//                 area(Content)
//                 {
//                     group(GroupName)
//                     {
//                         field(Name; SourceExpression)
//                         {
//                             ApplicationArea = All;

//                         }
//                     }
//                 }
//             }

//             actions
//             {
//                 area(processing)
//                 {
//                     action(ActionName)
//                     {
//                         ApplicationArea = All;

//                     }
//                 }
//             }
//         }

//         rendering
//         {
//             layout(LayoutName)
//             {
//                 Type = RDLC;
//                 LayoutFile = 'mylayout.rdl';
//             }
//         }
//     */
//     var
//         myInt: Integer;
// }