// codeunit 50115 MyCodeunit
// {
//     trigger OnRun()
//     begin
//         Create_Invoice();
//     end;

//     procedure Create_Invoice()
//     var
//         PurchaseHeader: Record "Purchase Header";
//         PurchRecptLine: Record "Purch. Rcpt. Line";
//         LineNo: Integer;
//     begin
//         Message('hello 0');
//         createPurchaseHeader(PurchaseHeader, rec);
//         Message('hello 1');
//         LineNo := 0;
//         PurchRecptLine.Reset();
//         PurchRecptLine.SetRange("Document No.", rec."No.");
//         if PurchRecptLine.FindSet() then
//             repeat
//                 Message('hello 2');
//                 LineNo += 10000;
//                 CreatePurchaseLine(PurchaseHeader, PurchRecptLine, LineNo);
//             until PurchRecptLine.Next() = 0;
//     end;

//     procedure createPurchaseHeader(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header")
//     var
//         NoSeriesManagement: Codeunit NoSeriesManagement;
//         PurchPaysetup: Record "Purchases & Payables Setup";
//     begin
//         PurchaseHeader.Reset();
//         PurchaseHeader.Validate("Document Type", PurchaseHeader."Document Type"::Invoice);
//         PurchaseHeader."No." := NoSeriesManagement.GetNextNo(PurchPaysetup."Invoice Nos.", TODAY, TRUE);
//         PurchaseHeader.Insert();
//         Message('Purch Header %1', PurchaseHeader."No.");
//         PurchaseHeader.Validate("Pay-to Vendor No.", PurchRcptHeader."Pay-to Vendor No.");
//         PurchaseHeader.Validate("Location Code", PurchRcptHeader."Location Code");
//         PurchaseHeader.Modify();
//     end;

//     procedure CreatePurchaseLine(var PurchaseHeader: Record "Purchase Header"; var PurchRcptline: Record "Purch. Rcpt. Line"; LineNo: Integer)
//     var
//         PurchaseLine: Record "Purchase Line";
//     begin
//         PurchaseLine.Reset();
//         PurchaseLine.Validate("Document Type", PurchaseHeader."Document Type");
//         PurchaseLine.Validate("Document No.", PurchaseHeader."No.");
//         PurchaseLine.Validate("Line No.", LineNo);
//         PurchaseLine.Insert(true);
//         PurchaseLine.Validate(Type, PurchRcptline.Type);
//         PurchaseLine.Validate("No.", PurchRcptline."No.");
//         PurchaseLine.Validate("Location Code", PurchRcptline."Location Code");
//         PurchaseLine.Validate(Description, PurchRcptline.Description);
//         PurchaseLine.Validate("Unit of Measure Code", PurchRcptline."Unit of Measure Code");
//         PurchaseLine.Validate(Quantity, PurchRcptline.Quantity);
//         PurchaseLine.Modify(true);
//     end;
// }