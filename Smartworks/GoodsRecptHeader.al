// table 50500 "Goods Receipt Header"
// {
//     //DataCaptionFields = "Workflow Sub Document Type", "No.";
//     DrillDownPageID = "Goods Receipt List_";
//     LookupPageID = "Goods Receipt List_";
//     DataClassification = SystemMetadata;
//     Caption = 'Goods Receipt Header';

//     fields
//     {
//         field(1; "Document Type"; enum "GRN Doc Type")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(2; "No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(3; "Posting Date"; Date)
//         {
//             Editable = true;
//             DataClassification = SystemMetadata;
//         }
//         field(4; "Sub Document Type"; enum "GRN Sub Type")
//         {
//             Description = 'X';
//             DataClassification = SystemMetadata;

//         }
//         field(5; "GRN No. Series"; Code[20])
//         {
//             TableRelation = "No. Series";
//             DataClassification = SystemMetadata;
//         }
//         field(6; "Gate Entry No."; Code[20])
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 GRNLines: Record "Goods Receipt Line";
//             begin
//                 IF ("Gate Entry No." <> '') AND ("Purchase Order No." = '') THEN
//                     ERROR('You cannot enter Gate Entry No Manually. PO No is blank');

//                 IF ("Gate Entry No." <> '') AND ("Purchase Order No." <> '') THEN BEGIN
//                     GRNLines.RESET();
//                     GRNLines.SETRANGE("Document No.", "No.");
//                     IF GRNLines.FIND('-') THEN
//                         IF "Purchase Order No." <> GRNLines."Purchase Order No." THEN  //EPC BU
//                             REPEAT
//                                 GRNLines.DELETE(TRUE);
//                                 ERROR('Delete Lines Manually because PO No in lines is different from what has been selected');
//                             UNTIL GRNLines.NEXT() = 0;
//                 END;
//             end;
//         }
//         field(7; "Gate Entry Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(8; Status; enum "FrequencySetup Status")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(9; "Location Code"; Code[20])
//         {
//             Editable = false;
//             TableRelation = Location;
//             DataClassification = SystemMetadata;

//         }
//         field(10; "Buy-from Vendor No."; Code[20])
//         {
//             TableRelation = Vendor;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 Vendor: Record Vendor;
//             begin
//                 Vendor.RESET();

//                 IF Vendor.GET("Buy-from Vendor No.") THEN
//                     "Buy-from Vendor Name" := Vendor.Name
//                 ELSE
//                     "Buy-from Vendor Name" := '';

//             end;
//         }
//         field(11; "Purchase Order No."; Code[20])
//         {

//             TableRelation = IF ("Workflow Sub Document Type" = FILTER(Regular)) "Purchase Header"."No." WHERE("Document Type" = FILTER(Order), Status = FILTER(Released), "Order Status" = FILTER(' '), "Buy-from Vendor No." = FIELD("Buy-from Vendor No."), "Order Type" = FILTER("Normal Order"), "Responsibility Center" = FIELD("Responsibility Center"), "Order Status" = FILTER(<> "Foreclose Initiated"), "Workflow Sub Document Type" = FILTER("Regular")) ELSE
//             IF ("Workflow Sub Document Type" = FILTER("Direct")) "Purchase Header"."No." WHERE("Document Type" = FILTER(Order), Status = FILTER(Released), "Order Status" = FILTER(' '), "Buy-from Vendor No." = FIELD("Buy-from Vendor No."), "Order Type" = FILTER("Normal Order"), "Responsibility Center" = FIELD("Responsibility Center"), "Order Status" = FILTER(<> "Foreclose Initiated"), "Workflow Sub Document Type" = FILTER("Direct" | "Indent")) ELSE
//             IF ("Workflow Sub Document Type" = FILTER(WorkOrder)) "Purchase Header"."No." WHERE("Document Type" = FILTER(Order), Status = FILTER(Released), "Order Status" = FILTER(' '), "Buy-from Vendor No." = FIELD("Buy-from Vendor No."), "Workflow Sub Document Type" = FILTER(WorkOrder), "Responsibility Center" = FIELD("Responsibility Center"));
//             DataClassification = SystemMetadata;


//             trigger OnValidate()
//             var

//                 Vendor: Record Vendor;
//                 PurchHeader: Record "Purchase Header";
//                 GRNLines: Record "Goods Receipt Line";
//             begin
//                 Vendor.GET("Buy-from Vendor No.");


//                 "Job No." := '';
//                 PurchHeader.RESET();
//                 PurchHeader.SETRANGE("Document Type", PurchHeader."Document Type"::Order);
//                 PurchHeader.SETFILTER(PurchHeader."No.", '%1', "Purchase Order No.");
//                 IF PurchHeader.FIND('-') THEN BEGIN

//                     "Buy-from Vendor No." := PurchHeader."Buy-from Vendor No.";
//                     "Shortcut Dimension 2 Code" := PurchHeader."Shortcut Dimension 2 Code";
//                     validate("Job No.", PurchHeader."Job No.");
//                     "Location Code" := PurchHeader."Location Code";
//                     Trading := PurchHeader.Trading;
//                     Remarks := PurchHeader."Reference No."; //HCL
//                     "Purchase Category" := PurchHeader."Purchase Category";//ALLE.DSH HCL
//                     "Shortcut Dimension 1 Code" := PurchHeader."Shortcut Dimension 1 Code";//ALLE.DSH HCL
//                     "Dimension Set ID" := PurchHeader."Dimension Set ID";//AlleAish270521
//                     "Order Address Code" := PurchHeader."Order Address Code";
//                     "Pre RFQ No." := PurchHeader."Pre RFQ No.";

//                 END;
//                 VALIDATE("Buy-from Vendor No.");

//                 GRNLines.RESET();
//                 GRNLines.SETRANGE("Document No.", "No.");
//                 IF GRNLines.FIND('-') THEN
//                     ;
//                 /*
// IF "Purchase Order No." <> GRNLines."Purchase Order No." THEN
// REPEAT
//    ERROR('Delete Lines Manually because PO No in lines is different from what has been selected');
//    GRNLines.DELETE(TRUE);
// UNTIL GRNLines.NEXT = 0;
// */
//             end;
//         }
//         field(12; "Form 59A No"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//             //This property is currently not supported
//             //TestTableRelation = false;
//             //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
//             //ValidateTableRelation = false;

//             trigger OnLookup()
//             begin
//                 /*
//                 recTranOrder.RESET;
//                 recTranOrder.SETRANGE(recTranOrder."Vendor / Customer Ref.", "Buy-from Vendor No.");
//                 recTranOrder.SETRANGE(recTranOrder."PO / SO No.", "Purchase Order No.");
//                 // recTranOrder.SETFILTER(recTranOrder.Used,'No');
//                 IF recTranOrder.FIND('-') THEN BEGIN
//                     IF PAGE.RUNMODAL(0, recTranOrder) = ACTION::LookupOK THEN BEGIN
//                         "Form 59A No" := recTranOrder."Form No.";
//                     END;
//                 END;
//                 */
//             end;
//         }
//         field(13; "Vendor Shippment No."; Code[20])
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 GRNHeader: Record "Goods Receipt Header";
//                 Text50000Err: TextConst ENU = 'Challan no. already exists for the vendor %1.',
//                 ENN = 'Challan no. already exists for the vendor %1.';
//             begin
//                 TESTFIELD("Purchase Order No.");
//                 GRNHeader.RESET();
//                 GRNHeader.SETRANGE("Buy-from Vendor No.", "Buy-from Vendor No.");
//                 GRNHeader.SETRANGE("Purchase Order No.", "Purchase Order No.");
//                 IF GRNHeader.FINDSET() THEN
//                     REPEAT
//                         IF "Vendor Shippment No." <> xRec."Vendor Shippment No." THEN
//                             IF GRNHeader."Vendor Shippment No." = "Vendor Shippment No." THEN
//                                 ERROR(Text50000Err, Rec."Buy-from Vendor No.");
//                     UNTIL GRNHeader.NEXT() = 0;
//             end;
//         }
//         field(14; "Vendor Shippment Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(15; "Invoice No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(16; "Invoice Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(17; "CN/RR/LR No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(18; "CN/RR/LR Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(19; "Mode of Transport"; enum "PurchCrMemoHdr Modeoftrans")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(20; "Vehicle No."; Text[30])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(21; Remarks; Text[200])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(22; "Reason for Rejection"; Text[100])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(23; "Rejection Note No."; Code[20])
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(24; "Document Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(25; "Job No."; Code[20])
//         {
//             Editable = false;
//             TableRelation = Job."No.";
//             DataClassification = SystemMetadata;
//         }
//         field(26; "Receiving Time"; Time)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(480; "Dimension Set ID"; Integer)
//         {
//             Caption = 'Dimension Set ID';
//             Editable = false;
//             TableRelation = "Dimension Set Entry";
//             DataClassification = SystemMetadata;

//             trigger OnLookup()
//             begin
//                 //ShowDocDim;
//             end;
//         }
//         field(50000; "Qty. Rcd. Not Invoiced"; Decimal)
//         {
//             CalcFormula = Sum("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced" WHERE("Document No." = FIELD("No."), "Location Code" = FIELD("Location Code"), "Order No." = FIELD("Purchase Order No."), "Buy-from Vendor No." = FIELD("Buy-from Vendor No.")));
//             FieldClass = FlowField;
//         }
//         field(50001; "Responsibility Center"; Code[10])
//         {
//             Editable = true;
//             TableRelation = "Responsibility Center";
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 UserMgt: Codeunit "User Setup Management";
//             begin

//                 IF NOT UserMgt.CheckRespCenter(1, "Responsibility Center") THEN
//                     ERROR(
//                       Text028Lbl,
//                        RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter());
//                 IF ResponsibilityCenter.GET("Responsibility Center") THEN
//                     IF ResponsibilityCenter."Location Code" <> '' THEN
//                         VALIDATE("Location Code", "Responsibility Center");

//             end;
//         }
//         field(50002; "Excise Manually"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50006; "Blanket Order Exists"; Boolean)
//         {
//             Caption = 'Blanket Order Exists';
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50007; Trading; Boolean)
//         {
//             Caption = 'Trading';
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50010; "Initiator User ID"; Code[50])
//         {
//             TableRelation = User."User Name";
//             DataClassification = SystemMetadata;
//         }
//         field(50017; "Creation Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50018; "Creation Time"; Time)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50021; "Buy-from Vendor Name"; Text[60])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50022; "Rejection No. Series"; Code[20])
//         {
//             TableRelation = "No. Series";
//             DataClassification = SystemMetadata;
//         }
//         field(50023; "Posted GRN No. Series"; Code[20])
//         {
//             TableRelation = "No. Series";
//             DataClassification = SystemMetadata;
//         }
//         field(50024; "Posted GRN No."; Code[20])
//         {
//             CalcFormula = Lookup("Purch. Rcpt. Header"."No." WHERE("Un Posted GRN No." = FIELD("No.")));
//             FieldClass = FlowField;
//             TableRelation = "Purch. Rcpt. Header";
//         }
//         field(50025; "Commercial Invoice No"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50026; "Bill Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50027; "Sent to Payment Tracking"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50028; "Material Despatched Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50029; "Total GRN Value"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Line Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(50030; "Shortcut Dimension 1 Code"; Code[20])
//         {
//             CaptionClass = '1,2,1';
//             Caption = 'Shortcut Dimension 1 Code';
//             Editable = false;
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
//             DataClassification = SystemMetadata;

//             trigger OnLookup()
//             var
//                 CustomFunctions: Codeunit "Custom Functions";
//             begin
//                 CustomFunctions.SetConditionForCostCenter("Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");//ALLE.DSH HCL
//             end;

//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
//             end;
//         }
//         field(50031; "Shortcut Dimension 2 Code"; Code[20])
//         {
//             CaptionClass = '1,2,2';
//             Caption = 'Shortcut Dimension 2 Code';
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
//             end;
//         }
//         field(50035; "Purchase Category"; Code[20])
//         {
//             Caption = 'Purchase Category';
//             DataClassification = SystemMetadata;
//             Description = 'ALLE.DSH HCL';
//             Editable = true;
//             TableRelation = "Purchase Category";
//         }
//         field(50098; "Workflow Approval Status"; enum "Workflow Approval Status")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(50099; "Workflow Sub Document Type"; Enum "Workflow Sub Document Type")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(50102; "Manufacturer Certificate Recd"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50103; "Third Party Certificate Recd"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50105; "Internal Certificate Recd"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50106; "Way Bill No."; Text[30])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50109; Initiator; Code[20])
//         {
//             Description = 'AlleBLk';
//             TableRelation = User;
//             DataClassification = SystemMetadata;
//         }
//         field(50112; "Vendor name"; Text[60])
//         {
//             Description = 'AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50125; "MDCC No."; Code[20])
//         {
//             Description = 'Alle SH for linking MDCC with LRN (only informative)';
//             TableRelation = "Inspection Document"."Document No." WHERE("PO No." = FIELD("Purchase Order No."));
//             DataClassification = SystemMetadata;
//         }
//         field(50129; "Tot Service tax -Freight"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Tot Service Tax Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             Description = 'Alle VK Field Added on the Blanket Order for Order Value';
//             FieldClass = FlowField;

//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Service tax amount")-xRec."Total Service tax amount";
//             end;
//         }
//         field(50135; "Intallation & Comm Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Installation & Comm. Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             Description = 'AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50136; "Service Tax-Install & Comm Amt"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."ServiceTax-Inst.Comm Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             Description = 'AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50137; "Bank Charges/DD Comm. Amt"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Bank Charges/DD Commision Amt" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             Description = 'AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50138; "Other 2 Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Other Amount 2" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             Description = 'AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50139; "Order Address Code"; Code[10])
//         {
//             Description = 'ALLE ANSH NTPC';
//             TableRelation = "Order Address".Code WHERE("Vendor No." = FIELD("Buy-from Vendor No."));
//             DataClassification = SystemMetadata;
//         }
//         field(50140; "Vendor Invoice No."; Code[20])
//         {
//             Description = 'ALLE ANSH NTPC';
//             DataClassification = SystemMetadata;
//         }
//         field(50141; "Vendor Invoice Date"; Date)
//         {
//             Description = 'ALLE ANSH NTPC';
//             DataClassification = SystemMetadata;
//         }
//         field(50142; Mistake; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50143; "Actual Receipt Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50144; "Reference No."; Text[150])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50145; "Tollerence Used"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//             Description = 'HCL TLC 001';
//             Editable = false;
//         }
//         field(50146; "Pre RFQ No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70000; "Total Base Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Basic Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;

//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Base Amount")-xRec."Total Base Amount";
//             end;
//         }
//         field(70001; "Total Excise Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             //FieldClass = FlowField;
//             //CalcFormula = Sum("Goods Receipt Line"."Tot Excise Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));


//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Excise amount")-xRec."Total Excise amount";
//             end;
//         }
//         field(70002; "Total Sales Tax amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             //CalcFormula = Sum("Goods Receipt Line"."Tot Sales Tax Amt" WHERE(Document Type=FIELD(Document Type),Document No.=FIELD(No.)));
//             // FieldClass = FlowField;

//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Sales tax amount")-xRec."Total Sales tax amount";
//             end;
//         }
//         field(70003; "Total Service Tax Freight"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             // CalcFormula = Sum("Goods Receipt Line"."Tot Service Tax Amount" WHERE(Document Type=FIELD(Document Type),Document No.=FIELD(No.)));
//             // FieldClass = FlowField;

//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Service tax amount")-xRec."Total Service tax amount";
//             end;
//         }
//         field(70004; "Total Other Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             //CalcFormula = Sum("Goods Receipt Line"."Other Amount" WHERE("Document Type"=FIELD("Document Type"),"Document No."=FIELD("No.")));
//             //FieldClass = FlowField;

//             trigger OnValidate()
//             begin
//                 //"Total Order Value" := ("Total Order Value" + Rec."Total Other tax/duties amount")-xRec."Total Other tax/duties amount";
//             end;
//         }
//         field(70005; "Total Entry Tax/Octroi Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             //CalcFormula = Sum("Goods Receipt Line"."Entry Tax / Octroi Amount" WHERE("Document Type"=FIELD("Document Type"),"Document No."=FIELD("No.")));
//             //FieldClass = FlowField;
//         }
//         field(70006; "Total Insurance Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             //CalcFormula = Sum("Goods Receipt Line"."Insurance Amount" WHERE("Document Type=FIELD(Document Type"),"Document No."=FIELD("No.")));
//             //FieldClass = FlowField;
//         }
//         field(70007; "Total Packing & For Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Packing & Forwarding Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70008; "Total Freight Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Freight Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70010; "Intallation & Com. Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Installation & Comm. Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70011; "Service Tax Insl. & Com Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."ServiceTax-Inst.Comm Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70012; "Bank Charges / DD Comm. Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Bank Charges/DD Commision Amt" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70013; "Others 2 Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Other Amount 2" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70014; "Inspection Amount"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Inspection Amount" WHERE("Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(70015; "MRC Invoice No -20%"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70016; "Ref Mat. Comm Inv No"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70017; "Ref Mat. MRC Invoice No-20%"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70018; "Shipping Agent Code"; Code[10])
//         {
//             Caption = 'Shipping Agent Code';
//             TableRelation = "Shipping Agent";
//             DataClassification = SystemMetadata;
//         }
//         field(70019; "Transporter Name"; Text[50])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70020; "Commercial Invoice Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70021; "MRC Invoice Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70022; "Sales Tax Not Applicable"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70023; "Sent for Payment Tracking Date"; Date)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(70024; "Sent for Payment Tracking Time"; Time)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(80000; "Quality Certificate No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(80001; "Invoice Reference No."; Code[20])
//         {
//             Caption = 'Ref.No.';
//             DataClassification = SystemMetadata;
//         }
//         field(80002; "Cost is Zero"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//     }

//     keys
//     {
//         key(Key1; "Document Type", "No.")
//         {
//             Clustered = true;
//         }
//         key(Key2; "Purchase Order No.", "Creation Date")
//         {
//         }
//         key(Key3; "No.", "Creation Date")
//         {
//         }
//         key(Key4; "Buy-from Vendor Name", "Creation Date")
//         {
//         }
//         key(Key5; "Gate Entry No.")
//         {
//         }
//         key(Key6; "Shortcut Dimension 1 Code")
//         {
//         }
//         key(Key7; "Initiator User ID", "Shortcut Dimension 1 Code", "Document Type", "Workflow Sub Document Type", Status)
//         {
//         }
//         key(Key8; "Shortcut Dimension 1 Code", "Posting Date", "Buy-from Vendor No.", Status, "Workflow Approval Status")
//         {
//         }
//         key(Key9; "Vendor Shippment No.")
//         {
//         }
//         key(Key10; "Workflow Sub Document Type", "Shortcut Dimension 1 Code", "No.")
//         {
//         }
//         key(Key11; "Document Type", "Vendor Shippment No.", "No.", Status)
//         {
//         }
//         key(Key12; "No.", Status)
//         {
//         }
//         key(Key13; "Initiator User ID", "Responsibility Center", "Document Type")
//         {
//         }
//         key(Key14; "Document Type", "Workflow Sub Document Type", "Initiator User ID", "Responsibility Center", "Workflow Approval Status")
//         {
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnDelete()
//     begin

//         CheckApproval();
//         //TESTFIELD("Sent for Approval",FALSE);

//         IF NOT UserMgt.CheckRespCenter(1, "Responsibility Center") THEN
//             ERROR(
//               Text023Lbl,
//               RespCenter.TABLECAPTION, UserMgt.GetPurchasesFilter());

//         //TESTFIELD(Approved,FALSE);
//         TESTFIELD(Status, Status::Open);
//         TestStatusOpen();

//         GRNLines.RESET();
//         GRNLines.SETRANGE("Document Type", "Document Type");
//         GRNLines.SETRANGE("Document No.", "No.");
//         IF GRNLines.FIND('-') THEN
//             GRNLines.DELETEALL(TRUE);
//     end;

//     trigger OnInsert()
//     begin
//         CheckApproval();
//         "Initiator User ID" := USERID;
//         "Creation Date" := TODAY;
//         "Creation Time" := TIME;
//         // HCL RCC 001 START
//         /*
//         "Responsibility Center" := UserMgt.GetRespCenter(1,"Responsibility Center");
//         VALIDATE("Location Code",UserSetupMgt.GetLocation(1,"Location Code","Responsibility Center"));
//         VALIDATE("Job No.",UserSetupMgt.GetJob("Responsibility Center"));
//         */
//         // HCL RCC 001 STOP

//         IF "No." = '' THEN BEGIN
//             TestNoSeries();
//             NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."GRN No. Series", WORKDATE(), "No.", "GRN No. Series");
//             "Posted GRN No. Series" := "GRN No. Series";
//         END;

//         "Posting Date" := WORKDATE();
//         "Document Date" := WORKDATE();

//         /*
//         //CheckApproval;
//         "Responsibility Center" := UserMgt.GetRespCenter(1,"Responsibility Center");
//         "Initiator User ID" := USERID;
//         //IF "Assigned User ID" = '' THEN
//         //  "Assigned User ID" := DocumentManagment.GetAssignedUserID(
//         //    TranstionType::"Purchase Receipt",1,"Sub Document Type",'','',"Initiator User ID","Responsibility Center",FALSE);
//         VALIDATE("Location Code",UserSetupMgt.GetLocation(1,"Location Code","Responsibility Center"));
//         VALIDATE("Job No.",UserSetupMgt.GetJob("Responsibility Center"));
//         RecUserSetup.RESET;
//         RecUserSetup.SETRANGE("User ID","Initiator User ID");
//         IF RecUserSetup.FIND('-') THEN BEGIN
//           RecRespCenter.RESET;
//           RecRespCenter.SETRANGE(Code,RecUserSetup."Purchase Resp. Ctr. Filter");
//           IF RecRespCenter.FIND('-') THEN BEGIN
//             "Shortcut Dimension 1 Code" := RecRespCenter."Global Dimension 1 Code";
//             "Responsibility Center" := RecRespCenter.Code;
//              "Location Code" := RecRespCenter."Location Code";
//           END;
//         END;
//         */
//         "Initiator User ID" := USERID;
//         "Creation Date" := TODAY;
//         "Creation Time" := TIME;
//         // HCL RCC 001 START

//         "Responsibility Center" := UserMgt.GetRespCenter(1, "Responsibility Center");
//         ResponsibilityCenter.GET("Responsibility Center");
//         "Shortcut Dimension 1 Code" := ResponsibilityCenter."Global Dimension 1 Code";
//         ResponsibilityCenter.TESTFIELD("Global Dimension 2 Code");
//         "Shortcut Dimension 2 Code" := ResponsibilityCenter."Global Dimension 2 Code";

//         IF ResponsibilityCenter."Location Code" <> '' THEN
//             VALIDATE("Location Code", ResponsibilityCenter."Location Code");
//         IF ResponsibilityCenter."Job No." <> '' THEN
//             VALIDATE("Job No.", ResponsibilityCenter."Job No.");

//         // HCL RCC 001 STOP

//     end;

//     trigger OnModify()
//     begin
//         VALIDATE("Shortcut Dimension 1 Code");
//         VALIDATE("Shortcut Dimension 2 Code");
//         //TestStatusOpen;
//     end;

//     var
//         GRNLines: Record "Goods Receipt Line";
//         GateEntryLine: Record "Gate Entry Line";
//         RecUserSetup: Record "User Setup";
//         PurchSetup: Record "Purchases & Payables Setup";
//         RespCenter: Record "Responsibility Center";
//         WorkflowDocTypeSetup: Record "Workflow Doc. Type Setup";
//         PurchaseHeader2: Record "Purchase Header";
//         ResponsibilityCenter: Record "Responsibility Center";
//         ClientMgmt: Codeunit "Client Management";
//         Text051Lbl: Label 'You may have changed a dimension.\\Do you want to update the lines?';
//         Text023Lbl: Label 'You cannot delete this document. Your identification is set up to process from %1 %2 only.';
//         Text028Lbl: Label 'Your identification is set up to process from %1 %2 only.';
//         StatusCheckSuspended: Boolean;
//         OldDimSetID: Integer;


//     procedure TestNoSeries()
//     var
//         Location: Record Location;
//     begin
//         PurchSetup.GET();
//         RecUserSetup.GET(USERID);
//         TESTFIELD("Workflow Sub Document Type");

//         IF RespCenter.GET(RecUserSetup."Purchase Resp. Ctr. Filter") THEN BEGIN
//             IF NOT RespCenter."General Project" THEN //BEGIN//Abhishek
//                 IF RespCenter."Location Code" <> '' THEN// ALLE.DSH HCL
//                     Location.GET(RespCenter.Code);
//             Case "Workflow Sub Document Type" OF
//                 "Workflow Sub Document Type"::Regular:
//                     IF Location."Trading Location" THEN
//                         RespCenter.TESTFIELD("GRN Nos. Trading")
//                     ELSE
//                         RespCenter.TESTFIELD("Goods Receipt Nos.");
//                 "Workflow Sub Document Type"::Direct:
//                     IF RespCenter.Trading THEN
//                         RespCenter.TESTFIELD("GRN Nos. Direct Trading")
//                     ELSE
//                         RespCenter.TESTFIELD("GRN No. Series Direct");
//                 "Workflow Sub Document Type"::WorkOrder:
//                     IF Location."Trading Location" THEN
//                         RespCenter.TESTFIELD("SRN Nos. Trading")
//                     ELSE
//                         RespCenter.TESTFIELD("SRN Nos.");
//             end;
//             //END;//Abhishek
//         END ELSE
//             PurchSetup.TESTFIELD("Posted Receipt Nos.");
//     end;


//     procedure GetNoSeriesCode(): Code[10]
//     var
//         Location: Record Location;
//     begin
//         PurchSetup.GET();
//         RecUserSetup.GET(USERID);
//         TESTFIELD("Workflow Sub Document Type");

//         IF RespCenter.GET(RecUserSetup."Purchase Resp. Ctr. Filter") THEN BEGIN
//             IF NOT RespCenter."General Project" THEN//BEGIN//Abhishek
//                 IF Location.GET(RespCenter.Code) THEN;
//             Case "Workflow Sub Document Type" OF
//                 "Workflow Sub Document Type"::Regular:
//                     IF Location."Trading Location" THEN
//                         EXIT(RespCenter."GRN Nos. Trading")
//                     ELSE
//                         EXIT(RespCenter."Goods Receipt Nos.");
//                 "Workflow Sub Document Type"::Direct:
//                     IF RespCenter.Trading THEN
//                         EXIT(RespCenter."GRN Nos. Direct Trading")
//                     ELSE
//                         EXIT(RespCenter."GRN No. Series Direct");
//                 "Workflow Sub Document Type"::WorkOrder:
//                     IF Location."Trading Location" THEN
//                         EXIT(RespCenter."SRN Nos. Trading")
//                     ELSE
//                         EXIT(RespCenter."SRN Nos.");
//                 //END;//Abhishek
//                 ELSE
//                     EXIT(PurchSetup."Posted Receipt Nos.")
//             end;
//         end;
//     end;

//     procedure PopulateNumber()
//     begin
//         PurchSetup.GET();
//         RecUserSetup.GET(USERID);

//         TESTFIELD("Workflow Sub Document Type");
//         IF "No." = '' THEN BEGIN
//             IF "Document Type" = "Document Type"::GRN THEN //BEGIN
//                 IF RespCenter.GET(RecUserSetup."Purchase Resp. Ctr. Filter") THEN BEGIN
//                     Case "Workflow Sub Document Type" OF
//                         "Workflow Sub Document Type"::Regular:
//                             BEGIN
//                                 //Regular
//                                 RespCenter.TESTFIELD("Goods Receipt Nos.");
//                                 NoSeriesMgt.InitSeries(RespCenter."Goods Receipt Nos.", xRec."GRN No. Series", WORKDATE(), "No.", "GRN No. Series");
//                             END;
//                         "Workflow Sub Document Type"::Direct:
//                             BEGIN
//                                 //Direct
//                                 RespCenter.TESTFIELD("GRN No. Series Direct");
//                                 NoSeriesMgt.InitSeries(RespCenter."GRN No. Series Direct", xRec."GRN No. Series", WORKDATE(), "No.", "GRN No. Series");
//                             END;
//                         "Workflow Sub Document Type"::WorkOrder:
//                             BEGIN
//                                 //JES
//                                 RespCenter.TESTFIELD("SRN Nos.");
//                                 NoSeriesMgt.InitSeries(RespCenter."SRN Nos.", xRec."GRN No. Series", WORKDATE(), "No.", "GRN No. Series");
//                             END;
//                     end;
//                 end ELSE
//                     NoSeriesMgt.InitSeries(PurchSetup."Posted Receipt Nos.", xRec."GRN No. Series", WORKDATE(), "No.", "GRN No. Series");

//             "Posted GRN No. Series" := "GRN No. Series";

//             // END;
//             "Posting Date" := WORKDATE();
//             "Document Date" := WORKDATE();
//         END;
//     end;


//     procedure GetDiscountAmt(var pDiscountAmt: Decimal)
//     var
//         vGRNLine: Record "Goods Receipt Line";
//     begin
//         pDiscountAmt := 0;
//         vGRNLine.RESET();
//         vGRNLine.SETRANGE("Document Type", "Document Type");
//         vGRNLine.SETRANGE("Document No.", "No.");
//         vGRNLine.SETFILTER("Discount Amount", '<>0');
//         IF vGRNLine.FIND('-') THEN
//             REPEAT
//                 pDiscountAmt := pDiscountAmt + vGRNLine."Discount Amount";
//             UNTIL vGRNLine.NEXT() = 0;
//     end;


//     procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
//     begin
//         OldDimSetID := "Dimension Set ID";
//         DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
//         IF "No." <> '' THEN
//             MODIFY();

//         IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
//             MODIFY();
//             IF GRNLinesExist() THEN
//                 UpdateAllLineDim("Dimension Set ID", OldDimSetID);
//         END;
//     end;


//     procedure ShowDocDim()
//     var
//         DimMgtExt: Codeunit DimensionManagementExt;
//         OldDimSetID: Integer;
//     begin
//         TESTFIELD("Shortcut Dimension 1 Code");
//         IF ClientMgmt.Dimension2CodeMandatory() THEN
//             TESTFIELD("Shortcut Dimension 2 Code");
//         TESTFIELD("Dimension Set ID");

//         OldDimSetID := "Dimension Set ID";

//         "Dimension Set ID" :=
//         DimMgtExt.EditDimensionSet2(
//         "Dimension Set ID", STRSUBSTNO('%1 %2', "Document Type", "No."),
//         "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

//         IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
//             MODIFY();
//             IF GRNLinesExist() THEN
//                 UpdateAllLineDim("Dimension Set ID", OldDimSetID);
//         END;
//     end;


//     procedure GRNLinesExist(): Boolean
//     begin
//         GRNLines.RESET();
//         GRNLines.SETRANGE("Document Type", "Document Type");
//         GRNLines.SETRANGE("No.", "No.");
//         EXIT(GRNLines.FINDFIRST());
//     end;

//     local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
//     var
//         NewDimSetID: Integer;
//     begin

//         IF NewParentDimSetID = OldParentDimSetID THEN
//             EXIT;
//         IF NOT CONFIRM(Text051Lbl) THEN
//             EXIT;

//         GRNLines.RESET();
//         GRNLines.SETRANGE("Document Type", "Document Type");
//         GRNLines.SETRANGE("No.", "No.");
//         GRNLines.LOCKTABLE();
//         IF GRNLines.FIND('-') THEN
//             REPEAT

//                 NewDimSetID := DimMgt.GetDeltaDimSetID(GRNLines."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
//                 IF GRNLines."Dimension Set ID" <> NewDimSetID THEN BEGIN
//                     GRNLines."Dimension Set ID" := NewDimSetID;
//                     DimMgt.UpdateGlobalDimFromDimSetID(
//                       GRNLines."Dimension Set ID", GRNLines."Shortcut Dimension 1 Code", GRNLines."Shortcut Dimension 2 Code");
//                     GRNLines.MODIFY();
//                 END;

//             UNTIL GRNLines.NEXT() = 0;
//     end;


//     procedure ShowDocument()
//     var
//         NewDocTrack: Record "New Document Tracking";
//         NewDocTrackFrm: Page "New Document Trackings";
//     begin
//         NewDocTrack.SETRANGE("Table ID", DATABASE::"Goods Receipt Header");
//         NewDocTrack.SETRANGE("Document Type", "Document Type");
//         NewDocTrack.SETRANGE("Document No.", "No.");
//         NewDocTrack.SETRANGE("Line No.", 0);
//         NewDocTrackFrm.SETTABLEVIEW(NewDocTrack);
//         NewDocTrackFrm.RUNMODAL();
//         GET("Document Type", "No.");
//     end;


//     procedure SetSecurityFilterOnRespCenter()
//     var
//         UserSetup: Record "User Setup";
//     begin
//         UserSetup.GET(USERID);
//         IF NOT UserSetup."Access To All Resp. Center" THEN
//             IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
//                 FILTERGROUP(2);
//                 SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter());
//                 FILTERGROUP(0);
//             END;
//     end;


//     procedure CheckApproval()
//     begin
//     end;


//     procedure Navigate()
//     var
//         NavigateForm: Page Navigate;
//     begin
//         NavigateForm.SetDoc("Posting Date", "No.");
//         NavigateForm.RUN();
//     end;


//     procedure CheckBeforeRelease()
//     var
//         DimSetEntry: Record "Dimension Set Entry";
//         GLSetup: Record "General Ledger Setup";
//     begin
//         IF "Purchase Order No." <> '' THEN BEGIN
//             PurchaseHeader2.GET(PurchaseHeader2."Document Type"::Order, "Purchase Order No.");
//             //PurchaseHeader2.TESTFIELD(Status,PurchaseHeader2.Status::Released);\
//             IF (PurchaseHeader2."Order Address Code" = '') AND ("Order Address Code" <> '') THEN
//                 ERROR('Order address code is blank in order no %1', PurchaseHeader2."No.");

//         END;
//         IF NOT "Cost is Zero" THEN BEGIN
//             CALCFIELDS("Total GRN Value");// "Total Excise Amount", "Total Sales Tax amount");
//             TESTFIELD("Total GRN Value");
//         END;
//         TESTFIELD("Posting Date");

//         IF WorkflowDocTypeSetup.GET(6, 1, "Workflow Sub Document Type") THEN
//             IF WorkflowDocTypeSetup."Gate Entry Required" THEN BEGIN
//                 TESTFIELD("Gate Entry No.");
//                 GateEntryLine.GET(GateEntryLine."Entry Type"::Inward, "Gate Entry No.", "Purchase Order No.");
//             END;

//         GRNLines.RESET();
//         GRNLines.SETRANGE("Document Type", "Document Type");
//         GRNLines.SETRANGE("Document No.", "No.");
//         GRNLines.FINDFIRST();
//         REPEAT
//             GRNLines.TESTFIELD("Accepted Quantity");
//         UNTIL GRNLines.NEXT() = 0;

//         GLSetup.GET();
//         DimSetEntry.RESET();
//         DimSetEntry.SETRANGE("Dimension Set ID", "Dimension Set ID");
//         DimSetEntry.SETRANGE("Dimension Code", GLSetup."Global Dimension 1 Code");
//         IF DimSetEntry.ISEMPTY THEN
//             ERROR('Dimension %1 not specified.', GLSetup."Global Dimension 1 Code");

//         IF NOT ClientMgmt.Dimension2CodeMandatory() THEN
//             EXIT;
//         DimSetEntry.RESET();
//         DimSetEntry.SETRANGE("Dimension Set ID", "Dimension Set ID");
//         DimSetEntry.SETRANGE("Dimension Code", GLSetup."Global Dimension 2 Code");
//         IF DimSetEntry.ISEMPTY THEN
//             ERROR('Dimension %1 not specified.', GLSetup."Global Dimension 2 Code");
//     end;


//     procedure SuspendStatusCheck(Suspend: Boolean)
//     begin
//         StatusCheckSuspended := Suspend;
//     end;


//     procedure TestStatusOpen()
//     begin
//         IF StatusCheckSuspended THEN
//             EXIT;
//         TESTFIELD("Workflow Approval Status", "Workflow Approval Status"::Open);
//     end;

//     [IntegrationEvent(TRUE, false)]

//     procedure OnCheckPurchasePostRestrictions()
//     begin
//     end;

//     [IntegrationEvent(TRUE, false)]

//     procedure OnCheckPurchaseReleaseRestrictions()
//     begin
//     end;


//     procedure ShowDimensions()
//     begin
//         DimMgt.ShowDimensionSet("Dimension Set ID", STRSUBSTNO('%1 %2', TABLECAPTION, "No."));
//     end;

//     var
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         DimMgt: Codeunit DimensionManagement;
//         UserMgt: Codeunit "User Setup Management";



// }

