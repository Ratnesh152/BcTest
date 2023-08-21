// pageextension 50100 MyPageExtension extends "PageName"
// {
//     var
//         IsContentVisible: Boolean;

//         layout
//     {
//         // Add the additional content in this group control
//         group(AdditionalContentGroup)
//         {
//             visible = IsContentVisible;

//         // Content to show/hide
//         field(AdditionalField;
//         "Additional Field")
//             {
//                 // Additional fields or controls...
//             }
//         }

//         // Button for Show More action
//         action("Show More")
//         {
//             trigger OnAction()
//             begin
//                 IsContentVisible := true;
//             end;
//         }

//         // Button for Show Less action
//         action("Show Less")
//         {
//             trigger OnAction()
//             begin
//                 IsContentVisible := false;
//             end;
//         }
//     }
// }
