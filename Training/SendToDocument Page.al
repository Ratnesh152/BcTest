// page 50108 "IndentCard Ratnesh"
// {
//     Caption = 'Indent Card';
//     PageType = Document;
//     SourceTable = "Indent Header Ratnesh";
//     RefreshOnActivate = true;
//     AboutTitle = 'Indent Header Details Ratnesh';
//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     NotBlank = true;
//                     ShowMandatory = true;
//                 }
//             }
//         }
//     }
//     procedure TransferHeaderCreation(MRF: Record MRFHeader)
//     var
//         MRFLine: Record MRFLine;
//         TransferHead: Record "Transfer Header";
//         TransferHead2: Record "Transfer Header";
//         TransferLine: Record "Transfer Line";
//         Noseries: Codeunit NoSeriesManagement;
//         Test001: Label 'Transfer Order Created Successfully %1';
//         Text002: Label 'Transfer Order is already created';
//         Text003: Label 'Lines added in Transfer Order %1';
//     begin

//         MRFLine.SetRange(MRFLine."MRF Document No.", MRF."MRF No");
//         MRFLINE.SetFilter(Inventory, '>%1', 0);
//         MRFLine.SetRange("TO Created", false);
//         MRF.TestField(MRF."MRF Status", MRF."MRF Status"::Open);
//         MRFLine.SetCurrentKey("From Location");
//         IF MRFLine.FindSet() then begin
//             repeat
//                 TransferHead.SetRange("MRF No.", MRFLine."MRF Document No.");
//                 TransferHead.SetRange("Transfer-from Code", MRFLine."From Location");
//                 if not TransferHead.FindFirst() then begin
//                     TransferHead2.Init();
//                     TransferHead2."No." := Noseries.GetNextNo('T-ORD', Today, true);
//                     TransferHead2.Insert();
//                     TransferHead2."MRF No." := MRFLine."MRF Document No.";
//                     TransferHead2.Validate("Shipment Date", Today);
//                     TransferHead2."Posting Date" := Today;
//                     TransferHead2."Receipt Date" := Today;
//                     TransferHead2.Validate("Transfer-from Code", MRFLine."From Location");
//                     TransferHead2.Validate("Transfer-to Code", MRF."Ship-to-Location");
//                     TransferHead2.Validate("In-Transit Code", 'IN-TRANSIT');
//                     TransferHead2."MRF Date" := MRF."MRF Date";
//                     TransferHead2."Sub Type" := MRF."Sub Type";
//                     TransferHead2."Client Type" := MRF."Client Type";
//                     TransferHead2.Validate("Shortcut Dimension 1 Code", MRF."Shortcut Dimension 1 Code");
//                     TransferHead2.Validate("Shortcut Dimension 2 Code", MRF."Shortcut Dimension 2 Code");
//                     TransferHead2."Site Name2" := MRF."Site Name2";
//                     TransferHead2."Site Address 1" := MRF."Site Address 1";
//                     TransferHead2."Site Address 2" := MRF."Site Address 2";
//                     TransferHead2.Country := MRF.Country;
//                     TransferHead2."City Name" := MRF."City Name";
//                     TransferHead2."Pin Code" := MRF."Pin Code";
//                     TransferHead2."LR/RR No." := MRF."LR No.";
//                     TransferHead2."LR/RR Date" := MRF."LR Date";
//                     TransferHead2."PR No." := MRF."PR No.";
//                     TransferHead2."Installation Payment Received" := MRF."Installation Payment Received";
//                     TransferHead2."No. of Full Gate" := MRF."No. of Full Gate";
//                     TransferHead2."No. of Integration Gate" := MRF."No. of Integration Gate";
//                     TransferHead2."No. of Visitor Gate" := MRF."No. of Visitor Gate";
//                     TransferHead2."Mode of Transport" := MRF."Transporter Name";
//                     TransferHead2."MRF Type" := MRF."MRF Type";
//                     TransferHead2."Sub Type" := MRF."Sub Type";
//                     TransferHead2."Type of Site" := MRF."Type of Site";
//                     TransferHead2."Contact Person" := MRF."Contact Person";
//                     TransferHead2.Validate("Customer No.", MRF."Customer No.");
//                     TransferHead2."Type of Scope" := MRF."Type of Scope";
//                     TransferHead2."Transport Method" := MRF."Transporter Name";
//                     TransferHead2."Contact No." := MRF."Contact No.";
//                     TransferHead2."Contact Person" := MRF."Contact Person";
//                     TransferHead2."Ship-to Employee" := MRF."Ship-to Employee";
//                     TransferHead2."Contract No." := MRF."Contract No.";
//                     TransferHead2.Modify();
//                     TransferLine(MRFLine, TransferHead2);
//                     Message(Test001, TransferHead2."No.");
//                 end
//                 else
//                     TransferLine(MRFLine, TransferHead);
//             //Message(Text003, TransferHead."No.");
//             until MRFLine.Next() = 0;
//             MRF."MRF Status" := MRF."MRF Status"::Closed;
//             //   Message(Test001)
//         end
//         else
//             Message(Text002);
//     end;

//     procedure TransferLine(var MRFLINE: Record MRFLine; var TransfeHead: Record "Transfer Header")
//     var
//         myInt: Record 98;
//         TransferLine: Record "Transfer Line";
//         LineNo: Integer;
//     begin
//         //    TransferLine.Init();
//         TransferLine.Reset();
//         TransferLine.SetRange("Document No.", TransfeHead."No.");
//         MRFLINE.SetFilter(Inventory, '>%1', 0);
//         iF TransferLine.FindLast() then
//             LineNo := TransferLine."Line No." + 10000
//         else
//             LineNo := 10000;
//         TransferLine.Init();
//         TransferLine."Line No." := LineNo;
//         TransferLine.Validate("Document No.", TransfeHead."No.");
//         TransferLine.Insert();
//         TransferLine.Validate("Item No.", MRFLINE."Item No.");
//         TransferLine.Validate(Quantity, MRFLINE."Qty. to Ship");
//         TransferLine."Unit of Measure Code" := MRFLINE."Unit of Measure";
//         TransferLine.Comments := MRFLINE.Comments;
//         TransferLine."Shortcut Dimension 3 Code" := MRFLINE."Shortcut Dimension 3 Code";
//         TransferLine."Shortcut Dimension 4 Code" := MRFLINE."Shortcut Dimension 4 Code";
//         TransferLine."Material Status" := MRFLINE."Material Status";
//         TransferLine."MRF Type" := MRFLINE."Type of Site";
//         TransferLine.Modify();
//         MRFLINE."TO Created" := true;
//         MRFLINE.Modify();
//     end;