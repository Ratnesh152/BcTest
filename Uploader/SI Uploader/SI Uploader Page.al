// page 50021 "SI Uploader"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = "SI Uploader";
//     // DeleteAllowed = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     RefreshOnActivate = true;
//     SourceTableView = sorting("Document ID") order(ascending);
//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Document ID"; Rec."Document ID")
//                 {
//                 }
//                 field("Customer No."; Rec."Customer No.")
//                 {
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                 }
//                 field("External Doccument No."; Rec."External Doccument No.")
//                 {
//                 }
//                 field("No."; Rec."No.")
//                 {
//                 }
//                 field(Description; Rec.Description)
//                 {
//                 }
//                 field(Type; Rec.Type)
//                 {
//                 }
//                 field(Quantity; Rec.Quantity)
//                 {
//                 }
//                 field(Location; Rec.Location)
//                 {
//                 }
//                 field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
//                 {
//                 }
//                 field("Unit Price"; Rec."Unit Price")
//                 {
//                 }
//                 field("GST Group Type"; Rec."GST Group Type")
//                 {
//                 }
//                 field("HSN Code"; rec."HSN Code")
//                 {
//                 }
//                 field("GST Group Code"; Rec."GST Group Code")
//                 {
//                 }
//                 field("Department Code"; rec."Department Code")
//                 {
//                 }
//                 field("Cost Center"; Rec."Cost Center")
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     Caption = 'Invoice Status';
//                 }
//                 field("Invoice Status"; Rec."Invoice Status")
//                 {
//                     Caption = 'Posting Status';
//                 }
//                 field("Error Text"; Rec."Error Text")
//                 {
//                     Caption = 'Invoice Creation Error';
//                 }
//                 field("Error Text Posting"; Rec."Error Text Posting")
//                 {
//                     Caption = 'Invoice Posting Error';
//                 }
//                 field("Sales Invoice No."; Rec."Sales Invoice No.")
//                 {
//                     ApplicationArea = all;
//                     LookupPageId = "Sales Invoice";
//                 }
//                 field("Posted Invoice No."; Rec."Posted Invoice No.")
//                 {
//                 }
//                 field("User ID"; Rec."User ID")
//                 {
//                     Editable = false;
//                     trigger OnValidate()
//                     begin
//                         Rec."User ID" := UserId;
//                     end;
//                 }

//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(Export_SI_Uploader)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Export SI Uploader';
//                 Image = Export;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = xmlport "SI Uploader Export";
//             }
//             action(Import_SI_Uploader)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Import SI Uploader';
//                 Image = Import;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = xmlport "SI Uploader Import";
//             }
//             action(CreateInvoice)
//             {
//                 ApplicationArea = all;
//                 Caption = 'Create Sales Invoice';
//                 Image = CreateDocument;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 RunObject = codeunit "Process SI CreationRequest";
//             }
//             action("Post Invoice")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Post Invoice';
//                 Image = Post;
//                 Promoted = true;
//                 PromotedCategory = New;
//                 RunObject = codeunit "Posting Invoice Process";
//             }

//         }
//     }
// }