// pageextension 50003 "FA Depriciation Book Line" extends "FA Depreciation Books Subform"
// {
//     layout
//     {
//         modify("Declining-Balance %")
//         {
//             trigger OnAfterValidate()
//             // var
//             //     FixAssetCard: Page "Fixed Asset Card";
//             begin
//                 // FixAssetCard.ValidateFAFields(Rec."FA No.");
//                 ValidateFAFields(Rec."FA No.");
//             end;
//         }
//     }
//     procedure ValidateFAFields(var FA_No: Code[20])
//     var
//         UserSetup: Record "User Setup";
//     begin
//         if not FALedgerEntriesExist(FA_No) then begin
//             // Message('hello1');
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
//         FALedgerEntries.SetRange("FA No.", Rec."FA No.");
//         exit(FALedgerEntries.FindSet());
//     end;
// }
