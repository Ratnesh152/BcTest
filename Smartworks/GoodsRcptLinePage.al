// page 50500 "Goods Receipt Lines"
// {
//     AutoSplitKey = true;
//     Editable = false;
//     InsertAllowed = false;
//     PageType = List;
//     SourceTable = "Goods Receipt Line";
//     UsageCategory = Lists;
//     ApplicationArea = all;
//     Caption = 'Goods Receipt Lines';
//     layout
//     {
//         area(content)
//         {
//             repeater(Control1000000000)
//             {
//                 ShowCaption = false;
//                 field("Purchase Order No."; Rec."Purchase Order No.")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Purchase Order No. field.';
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Document No. field.';
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Type field.';
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the No. field.';
//                 }
//                 field("Job No."; Rec."Job No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Job No. field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field("Description 2"; Rec."Description 2")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                     ToolTip = 'Specifies the value of the Description 2 field.';
//                 }
//                 field("Description 3"; Rec."Description 3")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Description 3 field.';
//                 }
//                 field("Description 4"; Rec."Description 4")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Description 4 field.';
//                 }

//                 field("Unit of Measure Code"; Rec."Unit of Measure Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Unit of Measure Code field.';
//                 }
//                 field("Location Code"; Rec."Location Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Location Code field.';
//                 }
//                 field("Purchase Order Line No."; Rec."Purchase Order Line No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Purchase Order Line No. field.';
//                 }
//                 field("Pending Order Quantity"; Rec."Pending Order Quantity")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Pending Order Quantity field.';
//                 }
//                 field("Challan Quantity"; Rec."Challan Quantity")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Challan Quantity field.';
//                 }
//                 field("Received Quantity"; Rec."Received Quantity")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                     ToolTip = 'Specifies the value of the Received Quantity field.';

//                     trigger OnValidate()
//                     begin
//                         ReceivedQtyOnAfterValidate();
//                     end;
//                 }
//                 field("Accepted Quantity"; Rec."Accepted Quantity")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Accepted Quantity field.';
//                 }
//                 field("Rejected Quantity"; Rec."Rejected Quantity")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Rejected Quantity field.';
//                 }
//                 field("Direct Unit Cost"; Rec."Direct Unit Cost")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Direct Unit Cost field.';
//                 }
//                 field("Line Amount"; Rec."Line Amount")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                     ToolTip = 'Specifies the value of the Line Amount field.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     local procedure ReceivedQtyOnAfterValidate()
//     begin
//         CurrPage.UPDATE();
//     end;
// }

