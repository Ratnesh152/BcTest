// pageextension 50002 "ICRAFixedAssetCardExt" extends "Fixed Asset Card"
// {
//     layout
//     {
//         modify("No.")
//         {
//             trigger OnAfterValidate()
//             begin
//                 ValidateFAFields(rec."No.");
//             end;
//         }
//         modify(Description)
//         {
//             trigger OnAfterValidate()
//             begin
//                 ValidateFAFields(rec."No.");
//             end;
//         }
//     }
//     procedure ValidateFAFields(var FA_No: Code[20])
//     var
//         UserSetup: Record "User Setup";
//     begin
//         if not FALedgerEntriesExist(FA_No) then begin
//             exit;
//         end;
//         if UserSetup.Get(UserId) then
//             UserSetup.TestField("Allow FA Edit", true);
//     end;

//     procedure FALedgerEntriesExist(var FA_No: Code[20]): Boolean
//     var
//         FALedgerEntries: Record "FA Ledger Entry";
//     begin
//         FALedgerEntries.Reset();
//         FALedgerEntries.SetRange("FA No.", Rec."No.");
//         exit(FALedgerEntries.FindSet());
//     end;
// }