// table 50501 "Goods Receipt Line"
// {
//     // ------------------------------------------------------------------------------------------------
//     // //****HCL Customization START
//     // 
//     // Code        |  Developer  |     Description                                          |Date
//     // HCL TLC 001    ALLE ANSH        Tolerance Customization for G/l                       07-Feb-2019
//     // HCL TLC 002    ALLE ANSH        Get lines where tolerance used is false               23-May-2019

//     DrillDownPageID = "Goods Receipt Lines";
//     LookupPageID = "Goods Receipt Lines";
//     DataClassification = SystemMetadata;
//     Caption = 'Goods Receipt Line';

//     fields
//     {
//         field(1; "Document Type"; enum "GRN Doc Type")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(2; "Document No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(3; "Line No."; Integer)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(4; Type; enum "Purchase Line Type")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(5; "No."; Code[20])
//         {
//             TableRelation = IF (Type = CONST(" ")) "Standard Text" ELSE
//             IF (Type = CONST("G/L Account")) "G/L Account" ELSE
//             IF (Type = CONST(Item)) Item ELSE
//             IF (Type = CONST("Fixed Asset")) "Fixed Asset";
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 Item: Record item;
//             begin
//                 Item.RESET();
//                 IF Item.GET("No.") THEN BEGIN
//                     Description := Item.Description;
//                     "Tolerance %" := Item."Tolerance %";
//                 END;
//             end;
//         }
//         field(6; Description; Text[100])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(7; "Description 2"; Text[50])
//         {
//             Editable = true;
//             DataClassification = SystemMetadata;
//         }
//         field(8; "Unit of Measure Code"; Code[20])
//         {
//             TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No.")) ELSE
//             IF (Type = CONST("G/L Account")) "Unit of Measure".Code ELSE
//             IF (Type = CONST("Fixed Asset")) "Unit of Measure".Code;
//             DataClassification = SystemMetadata;
//         }
//         field(9; Status; enum "FrequencySetup Status")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(10; "Location Code"; Code[20])
//         {
//             TableRelation = Location;
//             DataClassification = SystemMetadata;
//         }
//         field(11; "Purchase Order No."; Code[20])
//         {
//             TableRelation = "Purchase Header"."No." WHERE("Document Type" = FILTER(Order));
//             DataClassification = SystemMetadata;
//         }
//         field(12; "Purchase Order Line No."; Integer)
//         {
//             TableRelation = "Purchase Line"."Line No." WHERE("Document Type" = FILTER(Order), "Document No." = FIELD("Purchase Order No."));
//             DataClassification = SystemMetadata;
//         }
//         field(13; "Pending Order Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Editable = false;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 VALIDATE("Challan Quantity", "Pending Order Quantity");
//                 //VALIDATE("Received Qty" ,"Order Qty");
//                 //VAlidate("Accepted Qty", "Order Qty");
//                 //VALIDATE("Rejected Qty",0);
//             end;
//         }
//         field(14; "Challan Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 // TeststatusOpen;
//                 VALIDATE("Received Quantity", "Challan Quantity");
//                 VALIDATE("Rejected Quantity", 0);

//                 // HCL JEC 001 START
//                 //"Cumulative Qty" := "Challan Quantity" + "Previous Bill Qty";
//                 // HCL JEC 001 STOP
//             end;
//         }
//         field(15; "Received Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 //TeststatusOpen;
//                 //VALIDATE("Accepted Quantity","Received Quantity");
//                 //VALIDATE("Rejected Quantity",0);  // HCL JEC 001 START
//                 VALIDATE("Received Quantity Not Checked", "Received Quantity");
//             end;
//         }
//         field(16; "Accepted Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             MinValue = 0;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             var
//                 Insplocation: Record Location;
//                 GLSetup: Record "General Ledger Setup";
//                 PurchLine: Record "Purchase Line";
//                 TolerenceQty: Decimal;
//             begin
//                 TeststatusOpen();
//                 IF (Type = Type::Item) OR (Type = Type::"G/L Account") THEN BEGIN
//                     GLSetup.GET();

//                     IF "Tolerance %" = 0 THEN BEGIN
//                         IF "Accepted Quantity" > "Pending Order Quantity" THEN
//                             ERROR('Accepted Quantity must be Less than OR Equal to Pending Order Quantity');
//                         IF "Accepted Quantity" > "Received Quantity" THEN
//                             ERROR('Accepted Quantity must be Less than OR Equal to Received Quantity');
//                     END;

//                     // IF "Accepted Quantity" < 0  THEN // HCL JEC 001 START
//                     // ERROR(Text001);  //             // HCL JEC 001 START
//                     PurchLine.RESET();
//                     PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::Order);
//                     PurchLine.SETRANGE("Document No.", "Purchase Order No.");
//                     PurchLine.SETRANGE("Line No.", "Purchase Order Line No.");
//                     IF PurchLine.FIND('-') THEN BEGIN

//                         //"BED Amount" := ROUND(("Accepted Quantity" / PurchLine.Quantity) * PurchLine."BED Amount", GLSetup."Excise Rounding Precision"); //EPC BU
//                         //"Ecess Amount" := ROUND(("Accepted Quantity" / PurchLine.Quantity) * PurchLine."eCess Amount", GLSetup."Excise Rounding Precision");//EPC BU
//                         //"SHE Cess Amount" := ROUND(("Accepted Quantity" / PurchLine.Quantity) * PurchLine."SHE Cess Amount", GLSetup."Excise Rounding Precision");//EPC BU
//                         //"ADC Vat Amount" := ROUND(("Accepted Quantity" / PurchLine.Quantity) * PurchLine."ADC VAT Amount", GLSetup."Excise Rounding Precision");    //EPC BU

//                         IF "Tolerance %" > 0 THEN BEGIN
//                             //TolerenceQty :=  PurchLine.Quantity * "Tolerance %"/100; // HCL TLC 001
//                             TolerenceQty := PurchLine."Original Order Qty" * "Tolerance %" / 100; // HCL TLC 001
//                             "Excess Quantity" := "Accepted Quantity" - "Pending Order Quantity";
//                             IF "Excess Quantity" < 0 THEN
//                                 "Excess Quantity" := 0;
//                             IF "Accepted Quantity" > TolerenceQty + "Pending Order Quantity" THEN
//                                 ERROR('Accepted Quantity %1 must not cross pending order Quantity %2 + Tolerance Quantity %3 i.e %4', "Accepted Quantity", "Pending Order Quantity", TolerenceQty, TolerenceQty + "Pending Order Quantity");
//                         END;

//                         Insplocation.GET(PurchLine."Location Code");
//                         IF Insplocation."Inspection Mandatory" THEN
//                             IF PurchLine."Inspection Location" = PurchLine."Inspection Location"::"Vendor Location" THEN BEGIN
//                                 PurchLine.CALCFIELDS("Inspection Result", "Inspected Quanity");
//                                 IF PurchLine."Inspection Result" = PurchLine."Inspection Result"::Accepted THEN
//                                     IF PurchLine."Inspected Quanity" - PurchLine.GetPostedInspectedQuantity() < "Accepted Quantity" THEN
//                                         ERROR('Inspected Quanity is %1 , Posted Inspected Quanity is %2 Entered Accepeted Quantity is %3', PurchLine."Inspected Quanity",
//                                         PurchLine.GetPostedInspectedQuantity(), "Accepted Quantity");
//                             END;
//                         "Rejected Quantity" := "Received Quantity" - "Accepted Quantity";
//                         IF "Rejected Quantity" < 0 THEN
//                             "Rejected Quantity" := 0;

//                         IF "Parallel Quantity" = 0 THEN BEGIN
//                             "Accepted Quantity Base" := "Qty. Per Unit of Measure" * "Accepted Quantity";
//                             "Rejected Quantity Base" := "Qty. Per Unit of Measure" * "Rejected Quantity";
//                         END ELSE BEGIN
//                             "Accepted Quantity Base" := 0;
//                             "Rejected Quantity Base" := 0;
//                         END;
//                         "Brick Std Con. Quantity" := "Brick Std Cons. Rate" * "Accepted Quantity";
//                         "Cement Std Con. Quantity" := "Cement Std Cons. Rate" * "Accepted Quantity";
//                         "Steel Std Con. Quantity" := "Steel Std Cons. Rate" * "Accepted Quantity";

//                     END;
//                 END;
//                 CalculateDirectUnitCost();

//             end;
//         }
//         field(17; "Rejected Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;
//         }
//         field(23; "Rejection Note No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(24; "Rejection Note Generated"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(25; "Received Quantity Not Checked"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 VALIDATE("Accepted Quantity", "Received Quantity");
//                 VALIDATE("Rejected Quantity", 0);
//             end;
//         }
//         field(26; "Received Quantity Checked"; Decimal)
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
//                 ShowDimensions();
//             end;
//         }
//         field(50000; "BED Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 //RecGH.GET("Document Type", "No.");  //EPC BU
//                 //RecGH.TESTFIELD("Excise Manually")   // EPC BU
//             end;
//         }
//         field(50001; "Enquiry No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50002; "Enquiry Line No."; Integer)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50003; Approved; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50004; "Description 3"; Text[60])
//         {
//             Editable = true;
//             DataClassification = SystemMetadata;
//         }
//         field(50005; "Description 4"; Text[60])
//         {
//             Editable = true;
//             DataClassification = SystemMetadata;
//         }
//         field(50006; "Indent No."; Code[20])
//         {
//             Caption = 'Purch. Req. No.';
//             TableRelation = "Indent Header"."No." WHERE("Document Type" = FILTER(Indent));
//             DataClassification = SystemMetadata;
//         }
//         field(50007; "Indent Line No."; Integer)
//         {
//             Caption = 'Purch. Req. Line No';
//             TableRelation = "Indent Line"."Line No." WHERE("Document Type" = FILTER(Indent), "Document No." = FIELD("Indent No."));
//             DataClassification = SystemMetadata;

//             trigger OnLookup()
//             begin
//             end;
//         }
//         field(50008; "Excise Accounting Type"; enum "itemJournalLine ExcisePostType")
//         {
//             Caption = 'Excise Accounting Type';
//             DataClassification = SystemMetadata;

//         }
//         field(50009; "Capital Item"; Boolean)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50010; "Initiator User ID"; Code[50])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50011; "Parallel Unit of Measure Code"; Code[10])
//         {
//             Caption = 'Parallel Unit of Measure Code';
//             TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No.")) ELSE
//             "Unit of Measure";
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(50012; "Per PUOM Direct Unit Cost"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50013; "Parallel Quantity"; Decimal)
//         {
//             MinValue = 0;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 IF "Parallel Quantity" > "Pending Parallel Quantity" THEN
//                     ERROR('%1 = %2 must not be geater than %3 = %4', FIELDCAPTION("Parallel Quantity"), "Parallel Quantity", FIELDCAPTION("Pending Parallel Quantity"), "Pending Parallel Quantity");

//                 IF "Parallel Quantity" <> 0 THEN
//                     "Qty. Per Unit of Measure" := "Accepted Quantity" / "Parallel Quantity";

//                 VALIDATE("Accepted Quantity", "Parallel Quantity" * "Qty. Per Unit of Measure");
//                 "Received Quantity" := "Accepted Quantity";
//                 "Rejected Quantity" := 0;
//                 IF MODIFY() THEN;
//             end;
//         }
//         field(50014; "Ecess Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 //RecGH.GET("Document Type", "No.");  //EPC BU
//                 //RecGH.TESTFIELD("Excise Manually")  //EPC BU
//             end;
//         }
//         field(50015; "SHE Cess Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 //RecGH.GET("Document Type", "No.");  // EPC BU
//                 //RecGH.TESTFIELD("Excise Manually")  //EPC BU
//             end;
//         }
//         field(50016; "Sent for Approval"; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50017; "Reason for Rejection"; Text[30])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50018; "Tolerance %"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50019; "Excess Quantity"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50020; "Job No."; Code[20])
//         {
//             Editable = false;
//             TableRelation = Job;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(50021; "Qty. Per Unit of Measure"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50022; "Accepted Quantity Base"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 VALIDATE("Accepted Quantity");
//             end;
//         }
//         field(50023; "Rejected Quantity Base"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             DataClassification = SystemMetadata;
//         }
//         field(50024; "Direct Unit Cost"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 CalculateDirectUnitCost();
//             end;
//         }
//         field(50025; "Line Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 CalculateDirectUnitCost();
//             end;
//         }
//         field(50026; "Job Task No."; Code[20])
//         {
//             Editable = false;
//             TableRelation = "Job Task"."Job Task No." WHERE("Job No." = FIELD("Job No."));
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(50027; "Pending Parallel Quantity"; Decimal)
//         {
//             Editable = false;
//             MinValue = 0;
//             DataClassification = SystemMetadata;
//         }
//         field(50028; "Assessable Value"; Decimal)
//         {
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 //RecGH.GET("Document Type", "No.");  //EPC BU
//                 //RecGH.TESTFIELD("Excise Manually")  //EPC BU
//             end;
//         }
//         field(50030; "Shortcut Dimension 1 Code"; Code[20])
//         {
//             CaptionClass = '1,2,1';
//             Caption = 'Shortcut Dimension 1 Code';
//             TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
//             DataClassification = SystemMetadata;

//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
//                 MODIFY();
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
//                 MODIFY();
//             end;
//         }
//         field(50034; Initiator; Code[20])
//         {
//             Description = '//AlleBLk';
//             TableRelation = Employee;
//             DataClassification = SystemMetadata;
//         }
//         field(50035; "Purchase Category"; Code[20])
//         {
//             Caption = 'Purchase Category';
//             DataClassification = SystemMetadata;
//             Description = 'ALLE.DSH HCL';
//             Editable = true;
//             TableRelation = "Purchase Category";
//         }
//         field(50036; "Tolerance Percentage"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50037; "Excess Qty"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             DecimalPlaces = 0 : 5;
//             Description = '//AlleBLk';
//         }
//         field(50038; "Job Code"; Code[20])
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;

//             trigger OnLookup()
//             begin
//             end;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(50039; "Qty per Unit of Measure"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Description = '//AlleBLk';
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50046; "Service Tax Percent-Freight"; Decimal)
//         {
//             AutoFormatType = 2;
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50047; "Service Tax Per Unit-Freight"; Decimal)
//         {
//             AutoFormatType = 2;
//             Description = '//AlleBLk';
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50071; "Blanket Order"; Code[20])
//         {
//             DataClassification = SystemMetadata;
//             Description = 'ALLE.DSH HCL';
//             Editable = false;
//             TableRelation = "Purchase Line"."Document No." WHERE("Document Type" = FILTER("Blanket Order"));
//         }
//         field(50072; "Blanket Line No"; Integer)
//         {
//             DataClassification = SystemMetadata;
//             Description = 'ALLE.DSH HCL';
//             Editable = false;
//             TableRelation = "Purchase Line"."Line No." WHERE("Document Type" = FILTER("Blanket Order"), "Document No." = FIELD("Blanket Order"));
//         }
//         field(50078; "Brick Std Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50079; "Cement Std Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50080; "Brick Actual Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50081; "Cement Actual Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50082; "Total Brick Std Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Brick Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//AlleBLk';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50083; "Total Cement Std Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Cement Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//AlleBLk';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50084; "Total Brick Actual Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Brick Actual Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//AlleBLk';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50085; "Total Cement Actual Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Cement Actual Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//AlleBLk';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50087; "Steel Actual Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50088; "Total Steel Actual Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Steel Actual Cons. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//flowfield';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50089; "Steel Std Cons. Qty"; Decimal)
//         {
//             Description = '//AlleBLk';
//             DataClassification = SystemMetadata;
//         }
//         field(50090; "Total Steel Std Cons. Qty"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Steel Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Description = '//AlleBLk';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50094; "Invoiced Qty"; Decimal)
//         {
//             CalcFormula = Sum("Purch. Rcpt. Line"."Quantity Invoiced" WHERE("Order No." = FIELD("Purchase Order No."), "Order Line No." = FIELD("Purchase Order Line No.")));
//             Description = '//AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50095; "Qty Recd not Invoiced"; Decimal)
//         {
//             CalcFormula = Sum("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced" WHERE("Order No." = FIELD("Purchase Order No."), "Order Line No." = FIELD("Purchase Order Line No."), "Document No." = FIELD("Document No.")));
//             Description = '//AlleBLk';
//             FieldClass = FlowField;
//         }
//         field(50098; "Workflow Approval Status"; enum "Workflow Approval Status")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(50099; "Workflow Sub Document Type"; enum "Workflow Sub Document Type")
//         {
//             DataClassification = SystemMetadata;

//         }
//         field(50100; "Vendor BBU No."; Code[30])
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50101; "Job Planning Description 2"; Text[50])
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50120; "Basic Rate"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50121; "Basic Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50122; "Excise Percent"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50123; "Excise Per Unit"; Decimal)
//         {
//             AutoFormatType = 2;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50124; "Tot Excise Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50125; "Sales Tax %"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50126; "Sales Tax Per Unit"; Decimal)
//         {
//             AutoFormatType = 2;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50127; "Tot Sales Tax Amt"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50128; "Service Tax Percent Freight"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50129; "Service Tax Per Unit Freight"; Decimal)
//         {
//             AutoFormatType = 2;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50130; "Tot Service Tax Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50131; "Entry Tax / Octroi Per Unit"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50132; "Entry Tax / Octroi Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50133; "Insurance Rate"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50134; "Insurance Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50135; "Packing & Forwarding %"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50136; "Packing & Forwarding Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50137; "Freight Rate"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50138; "Freight Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50139; "Other Rate"; Decimal)
//         {
//             AutoFormatType = 2;
//             DataClassification = SystemMetadata;
//         }
//         field(50140; "Other Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50142; "Packing & Forwarding per Unit"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50143; "Entry Tax/Octroi %"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50144; "Installation & Comm. Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50145; "Installation & Comm. Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50146; "Service Tax on Inst. & Comm %"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50147; "ServiceTax-Inst.Comm per unit"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50148; "ServiceTax-Inst.Comm Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50149; "Bank Charges/DD Commision Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50150; "Bank Charges/DD Commision Amt"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50151; "Inspection Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50152; "Inspection Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50153; "Other Rate 2"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50154; "Other Amount 2"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50155; "Weight Per Unit"; Decimal)
//         {
//             DecimalPlaces = 0 : 5;
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50156; "Weight Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50157; "Posting Date"; Date)
//         {
//             CalcFormula = Lookup("Goods Receipt Header"."Posting Date" WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(50158; "Creation Date"; Date)
//         {
//             CalcFormula = Lookup("Goods Receipt Header"."Creation Date" WHERE("Document Type" = FIELD("Document Type"), "No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(50159; "Brick Std Cons. Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50160; "Cement Std Cons. Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50161; "Brick Std Con. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50162; "Cement Std Con. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50163; "Brick Actual Con. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50164; "Cement Actual Con. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50165; "Total Brick Std Con. Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Brick Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50166; "Total Cement Std Con, Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Cement Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50167; "Total Brick Act. Con. Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Brick Actual Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50168; "Total Cement Act. Con Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Cement Actual Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50169; "Steel Std Cons. Rate"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50170; "Steel Actual Cons. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50171; "Total Steel Act. Con. Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Steel Actual Cons. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;

//         }
//         field(50172; "Steel Std Con. Quantity"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50173; "Total Steel Std Con. Quantity"; Decimal)
//         {
//             CalcFormula = Sum("Goods Receipt Line"."Steel Std Con. Quantity" WHERE("Purchase Order No." = FIELD("Purchase Order No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50174; "Discount %"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50175; "Discount Rate"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50176; "Discount Amount"; Decimal)
//         {
//             Editable = false;
//             DataClassification = SystemMetadata;
//         }
//         field(50177; "Invoiced Quanity"; Decimal)
//         {
//             CalcFormula = Sum("Purch. Rcpt. Line"."Quantity Invoiced" WHERE("Order No." = FIELD("Purchase Order No."), "Order Line No." = FIELD("Purchase Order Line No."), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(50178; "Qty. Rcd. not Invoiced"; Decimal)
//         {
//             CalcFormula = Sum("Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced" WHERE("Order No." = FIELD("Purchase Order No."), "Order Line No." = FIELD("Purchase Order Line No."), "Document No." = FIELD("No.")));
//             FieldClass = FlowField;
//         }
//         field(50179; "Invoiced Value"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50180; "Vendor No."; Code[20])
//         {
//             TableRelation = Vendor;
//             DataClassification = SystemMetadata;
//         }
//         field(50181; "Schedule Line No."; Integer)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50182; "Attached to QC Line No."; Integer)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50184; "ADC Vat Amount"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50185; "Dummy Field"; Code[10])
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50186; Mistake; Boolean)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(50187; "Line Remarks"; Text[150])
//         {
//             Description = 'HCL PMC 001';
//             DataClassification = SystemMetadata;
//         }
//         field(50188; "Previous Bill Qty"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             Description = 'HCL JEC 001';
//             Editable = false;
//         }
//         field(50189; "Cumulative Qty"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             Description = 'HCL JEC 001';
//             Editable = false;
//         }
//         field(50190; "PO Qty"; Decimal)
//         {
//             DataClassification = SystemMetadata;
//             Description = 'HCL JEC 001';
//             Editable = false;
//         }
//         field(50191; "BBU No."; Code[30])
//         {
//             CalcFormula = Lookup("Job Planning Line"."BBU No." WHERE("Job No." = FIELD("Job No."), "Job Task No." = FIELD("Job Task No."), "Line No." = FIELD("Job Planning Line No.")));
//             Description = 'ALLE.DSH HCL';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(50192; "Job Planning Line No."; Integer)
//         {
//             AccessByPermission = TableData Job = R;
//             BlankZero = true;
//             Caption = 'Job Planning Line No.';
//             DataClassification = SystemMetadata;
//             Description = 'ALLE.DSH HCL';
//             Editable = false;

//             trigger OnLookup()
//             begin
//             end;

//             trigger OnValidate()
//             begin
//             end;
//         }
//         field(50193; "Model No."; Text[30])
//         {
//             DataClassification = SystemMetadata;
//             Description = 'EPC2016';
//             Editable = false;
//         }
//         field(50194; Make; Text[30])
//         {
//             DataClassification = SystemMetadata;
//             Description = 'EPC2016';
//         }
//         field(50195; "Variant Code"; Code[10])
//         {
//             Caption = 'Variant Code';
//             DataClassification = SystemMetadata;
//             Editable = false;
//         }
//         field(50196; "Pre RFQ No."; Code[20])
//         {
//             DataClassification = SystemMetadata;
//         }
//     }

//     keys
//     {
//         key(Key1; "Document Type", "Document No.", "Line No.")
//         {
//             Clustered = true;
//             SumIndexFields = "Line Amount", "Basic Amount", "Tot Excise Amount", "Tot Sales Tax Amt", "Tot Service Tax Amount", "Entry Tax / Octroi Amount", "Insurance Amount", "Packing & Forwarding Amount", "Freight Amount", "Other Amount", "Installation & Comm. Amount", "ServiceTax-Inst.Comm Amount", "Bank Charges/DD Commision Amt", "Inspection Amount", "Other Amount 2";
//         }
//         key(Key2; "Purchase Order No.", "Purchase Order Line No.", Status)
//         {
//             SumIndexFields = "Pending Order Quantity", "Accepted Quantity", "Rejected Quantity", "Brick Std Con. Quantity", "Brick Actual Con. Quantity", "Cement Actual Con. Quantity", "Cement Std Con. Quantity", "Steel Std Cons. Rate", "Steel Actual Cons. Quantity", "Steel Std Con. Quantity";
//         }
//         key(Key3; "No.")
//         {
//         }
//         key(Key4; Type, "No.", Status)
//         {
//             SumIndexFields = "Accepted Quantity Base";
//         }
//         key(Key5; "Rejected Quantity")
//         {
//         }
//         key(Key6; "Shortcut Dimension 1 Code", "No.", Status, Approved)
//         {
//         }
//         key(Key7; "Shortcut Dimension 1 Code", "Purchase Order No.", "Vendor No.", Status, Approved)
//         {
//         }
//         key(Key8; "Shortcut Dimension 1 Code", "Document No.", Type, "No.")
//         {
//         }
//         key(Key9; "Purchase Order No.", "No.", "Purchase Order Line No.", Status)
//         {
//         }
//         key(Key10; "Purchase Order No.", "Purchase Order Line No.", "Schedule Line No.", Status)
//         {
//             SumIndexFields = "Accepted Quantity";
//         }
//         key(Key11; "Document No.", "Purchase Order No.", "Vendor No.", Status)
//         {
//         }
//     }

//     fieldgroups
//     {
//     }

//     trigger OnDelete()
//     begin
//         TeststatusOpen();
//     end;

//     trigger OnInsert()
//     begin
//         TeststatusOpen()
//     end;

//     trigger OnModify()
//     begin
//         //TeststatusOpen
//     end;

//     var
//         Item: Record Item;
//         GRNLine: Record "Goods Receipt Line";
//         GRNLine2: Record "Goods Receipt Line";
//         GLSetup: Record "General Ledger Setup";
//         FromPurchHeader: Record "Purchase Header";
//         PG: page "Purch. Invoice Subform";
//         RecGH: Record "Goods Receipt Header";
//         Text50001Lbl: Label 'Only one delivery schedule per purchase line no. %1 can be selected.';
//         Text50002Lbl: Label '%1 is in open mode, please post it first.';
//         QtyOnGRN: Decimal;
//         QtyOnGRN2: Decimal;
//         OldDimSetID: Integer;

//     procedure InsertGRNLines(RecGRN: Record "Goods Receipt Header")
//     var
//         PurchLineL: Record "Purchase Line";
//         Insplocation: Record Location;
//         PurchLineFrm: Page "Purchase Lines";
//     begin

//         RecGH.GET("Document Type", RecGRN."No.");  //ALLE ANSH  DTC
//         FromPurchHeader.GET(FromPurchHeader."Document Type"::Order, RecGRN."Purchase Order No.");
//         FromPurchHeader.TESTFIELD("Shortcut Dimension 1 Code");
//         GLSetup.GET();
//         IF GLSetup."Dimension 2 Code Mandatory" THEN
//             FromPurchHeader.TESTFIELD("Shortcut Dimension 2 Code");
//         FromPurchHeader.TESTFIELD("Dimension Set ID");
//         PurchLineL.FILTERGROUP := 2;
//         PurchLineL.RESET();
//         PurchLineL.SETRANGE("Document Type", PurchLineL."Document Type"::Order);
//         PurchLineL.SETRANGE("Document No.", RecGRN."Purchase Order No.");
//         PurchLineL.SETRANGE(Blocked, FALSE);
//         PurchLineL.SETRANGE("Order Address Code", RecGH."Order Address Code");//ALLE ANSH  DTC
//         PurchLineL.SETRANGE("Package Item", FALSE);//ALLE ANSH  NTPC
//         PurchLineL.SETRANGE("Tollerence Used", FALSE);  // HCL TLC 002

//         PurchLineL.FILTERGROUP := 0;
//         IF PurchLineL.FIND('-') THEN
//             REPEAT
//                 Insplocation.GET(PurchLineL."Location Code");
//                 IF Insplocation."Inspection Mandatory" THEN BEGIN
//                     PurchLineL.CALCFIELDS("Inspection Result", "Inspected Quanity");
//                     IF PurchLineL."Inspection Location" = PurchLineL."Inspection Location"::"Vendor Location" THEN BEGIN
//                         IF PurchLineL."Inspection Result" = PurchLineL."Inspection Result"::Accepted THEN
//                             IF (PurchLineL.Quantity - PurchLineL."Quantity Received" > 0) AND (PurchLineL."Inspected Quanity" - PurchLineL.GetPostedInspectedQuantity() > 0) THEN
//                                 PurchLineL.MARK(TRUE);
//                     END ELSE
//                         IF (PurchLineL.Quantity - PurchLineL."Quantity Received" > 0) THEN
//                             PurchLineL.MARK(TRUE);
//                 END
//                 ELSE
//                     IF PurchLineL.Quantity > 0 THEN BEGIN // HCL JEC 001
//                         IF (PurchLineL.Quantity - PurchLineL."Quantity Received" > 0) THEN
//                             PurchLineL.MARK(TRUE);
//                     END ELSE  // HCL JEC 001
//                         IF (PurchLineL.Quantity - PurchLineL."Quantity Received" < 0) THEN// HCL JEC 001
//                             PurchLineL.MARK(TRUE);// HCL JEC 001
//             UNTIL PurchLineL.NEXT() = 0;

//         PurchLineL.MARKEDONLY(TRUE);


//         IF PurchLineL.FIND('-') THEN BEGIN
//             CLEAR(PurchLineFrm);
//             PurchLineFrm.SETTABLEVIEW(PurchLineL);
//             PurchLineFrm.LOOKUPMODE := TRUE;
//             PurchLineFrm.SetGRNHeader(RecGRN);
//             PurchLineFrm.SetGRNMode(TRUE);
//             PurchLineFrm.RUNMODAL();
//         END;

//         "Shortcut Dimension 1 Code" := FromPurchHeader."Shortcut Dimension 1 Code";
//         IF FromPurchHeader."Shortcut Dimension 2 Code" <> '' THEN
//             "Shortcut Dimension 2 Code" := FromPurchHeader."Shortcut Dimension 2 Code";

//     end;


//     procedure FillGRNLines(var PurchLineL: Record "Purchase Line"; recGRN: Record "Goods Receipt Header")
//     begin

//         PurchLineL.SETRANGE("Document Type", PurchLineL."Document Type"::Order);
//         PurchLineL.SETRANGE("Document No.", recGRN."Purchase Order No.");
//         IF PurchLineL.FIND('-') THEN
//             REPEAT
//                 GRNLine.LOCKTABLE();
//                 GRNLine.INIT();
//                 GRNLine."Document Type" := recGRN."Document Type";
//                 GRNLine."Document No." := recGRN."No.";
//                 GRNLine."Line No." := PurchLineL."Line No.";
//                 GRNLine.Type := PurchLineL.Type;
//                 GRNLine."No." := PurchLineL."No.";
//                 GRNLine."Job No." := PurchLineL."Job Master Code";
//                 GRNLine."Pre RFQ No." := PurchLineL."Pre RFQ No.";
//                 IF PurchLineL.Type = PurchLineL.Type::Item THEN BEGIN
//                     Item.RESET();
//                     IF Item.GET(GRNLine."No.") THEN
//                         GRNLine."Tolerance %" := Item."Tolerance %";
//                 END;
//                 // HCL TLC 001 START
//                 IF PurchLineL.Type = PurchLineL.Type::"G/L Account" THEN
//                     IF PurchLineL."Tolerance %" <> 0 THEN
//                         GRNLine."Tolerance %" := PurchLineL."Tolerance %";
//                 // HCL TLC 001 STOP

//                 // HCL JEC 001 START
//                 GRNLine."PO Qty" := PurchLineL.Quantity;
//                 GRNLine."Previous Bill Qty" := PurchLineL."Quantity Received";
//                 // HCL JEC 001 STOP

//                 GRNLine.Description := PurchLineL.Description;
//                 GRNLine."Description 2" := PurchLineL."Description 2";
//                 GRNLine."Description 3" := PurchLineL."Description 3";
//                 GRNLine."Description 4" := PurchLineL."Description 4";
//                 GRNLine."Unit of Measure Code" := PurchLineL."Unit of Measure Code";
//                 GRNLine.Status := recGRN.Status;
//                 GRNLine."Location Code" := PurchLineL."Location Code";
//                 GRNLine."Purchase Order No." := PurchLineL."Document No.";
//                 GRNLine."Purchase Order Line No." := PurchLineL."Line No.";
//                 GRNLine."Qty. Per Unit of Measure" := PurchLineL."Qty. per Unit of Measure";
//                 GRNLine."Job No." := PurchLineL."Job No.";
//                 GRNLine."Job Task No." := PurchLineL."Job Task No.";
//                 GRNLine."Job Planning Line No." := PurchLineL."Job Planning Line No.";//ALLE.DSH HCL
//                 GRNLine."Enquiry No." := PurchLineL."Enquiry No.";
//                 GRNLine."Enquiry Line No." := PurchLineL."Enquiry Line No.";
//                 GRNLine."Indent No." := PurchLineL."Indent No.";
//                 GRNLine."Indent Line No." := PurchLineL."Indent Line No.";
//                 GRNLine.VALIDATE("Direct Unit Cost", PurchLineL."Direct Unit Cost");
//                 // ALLE.DSH HCL START
//                 GRNLine."Purchase Category" := PurchLineL."Purchase Category";
//                 GRNLine.Make := PurchLineL.Make;
//                 GRNLine."Model No." := PurchLineL."Model No.";
//                 GRNLine."Variant Code" := PurchLineL."Variant Code";
//                 GRNLine."Blanket Order" := PurchLineL."Blanket Order No.";
//                 GRNLine."Blanket Line No" := PurchLineL."Blanket Order Line No.";
//                 // ALLE.DSH  STOP
//                 GRNLine."Line Remarks" := PurchLineL."Line Remarks";
//                 QtyOnGRN := 0;
//                 QtyOnGRN2 := 0;
//                 GRNLine2.RESET();
//                 GRNLine2.SETCURRENTKEY("Purchase Order No.", "Purchase Order Line No.", Status);
//                 GRNLine2.SETRANGE("Purchase Order No.", PurchLineL."Document No.");
//                 GRNLine2.SETRANGE("Purchase Order Line No.", PurchLineL."Line No.");
//                 GRNLine2.SETRANGE(Status, GRNLine2.Status::Open);
//                 IF GRNLine2.FIND('-') THEN
//                     REPEAT
//                         QtyOnGRN := QtyOnGRN + GRNLine2."Accepted Quantity";
//                         QtyOnGRN2 := QtyOnGRN2 + GRNLine2."Parallel Quantity";
//                     UNTIL GRNLine2.NEXT() = 0;
//                 IF PurchLineL.Quantity > 0 THEN BEGIN // HCL JEC 001
//                     IF (PurchLineL.Quantity - (PurchLineL."Quantity Received" + QtyOnGRN)) < 0 THEN
//                         ERROR(Text50002Lbl, GRNLine2."Document No.");
//                 END ELSE  // HCL JEC 001
//                     IF (PurchLineL.Quantity - (PurchLineL."Quantity Received" + QtyOnGRN)) > 0 THEN// HCL JEC 001
//                         ERROR(Text50002Lbl, GRNLine2."Document No.");// HCL JEC 001
//                 GRNLine.VALIDATE("Pending Order Quantity", PurchLineL.Quantity - (PurchLineL."Quantity Received" + QtyOnGRN));
//                 GRNLine.VALIDATE("Pending Parallel Quantity", PurchLineL."Parallel Quantity" - (PurchLineL."Parallel Quantity Received" + QtyOnGRN2));
//                 GRNLine."Parallel Quantity" := GRNLine."Pending Parallel Quantity";

//                 GRNLine."Vendor No." := PurchLineL."Buy-from Vendor No.";
//                 GRNLine."Shortcut Dimension 1 Code" := PurchLineL."Shortcut Dimension 1 Code";
//                 GRNLine."Shortcut Dimension 2 Code" := PurchLineL."Shortcut Dimension 2 Code";
//                 GRNLine."Dimension Set ID" := PurchLineL."Dimension Set ID";//AlleAish310521
//                                                                             //GRNLine."Excise Accounting Type" := PurchLineL."Excise Accounting Type";
//                                                                             //GRNLine."Capital Item" := PurchLineL."Capital Item";
//                 GRNLine."Parallel Unit of Measure Code" := PurchLineL."Parallel Unit of Measure Code";
//                 GRNLine."Per PUOM Direct Unit Cost" := PurchLineL."Per PUOM Direct Unit Cost";
//                 //GRNLine."Assessable Value" := PurchLineL."Assessable Value";
//                 GRNLine."Initiator User ID" := recGRN."Initiator User ID";

//                 GRNLine.INSERT();
//                 // ALLE AKUL ADD 030123
//                 OnAfterInsertGRNLineFromPOLine(GRNLine, PurchLineL);
//             UNTIL PurchLineL.NEXT() = 0;
//     END;



//     procedure CalculateDirectUnitCost()
//     begin
//         "Basic Amount" := "Basic Rate" * "Accepted Quantity";
//         "Discount Amount" := "Discount Rate" * "Accepted Quantity";
//         "Packing & Forwarding Amount" := "Packing & Forwarding per Unit" * "Accepted Quantity";
//         "Tot Excise Amount" := "Excise Per Unit" * "Accepted Quantity";
//         "Tot Sales Tax Amt" := "Sales Tax Per Unit" * "Accepted Quantity";
//         "Entry Tax / Octroi Amount" := "Entry Tax / Octroi Per Unit" * "Accepted Quantity";
//         "Freight Amount" := "Freight Rate" * "Accepted Quantity";
//         "Tot Service Tax Amount" := "Service Tax Per Unit Freight" * "Accepted Quantity";
//         "Insurance Amount" := "Insurance Rate" * "Accepted Quantity";
//         "Installation & Comm. Amount" := "Installation & Comm. Rate" * "Accepted Quantity";
//         "ServiceTax-Inst.Comm Amount" := "ServiceTax-Inst.Comm per unit" * "Accepted Quantity";
//         "Bank Charges/DD Commision Amt" := "Bank Charges/DD Commision Rate" * "Accepted Quantity";
//         "Inspection Amount" := "Inspection Rate" * "Accepted Quantity";
//         "Other Amount" := "Other Rate" * "Accepted Quantity";
//         "Other Amount 2" := "Other Rate 2" * "Accepted Quantity";
//         "Line Amount" := "Direct Unit Cost" * "Accepted Quantity";
//     end;


//     procedure ShowDimensions()
//     var
//         DimMgtExt: Codeunit DimensionManagementExt;
//     begin
//         //TESTFIELD("No.");
//         //TESTFIELD("Line No.");
//         //TESTFIELD("Shortcut Dimension 1 Code");
//         GLSetup.GET();
//         IF GLSetup."Dimension 2 Code Mandatory" THEN
//             FromPurchHeader.TESTFIELD("Shortcut Dimension 2 Code");
//         TESTFIELD("Shortcut Dimension 2 Code");
//         TESTFIELD("Dimension Set ID");

//         OldDimSetID := "Dimension Set ID";

//         "Dimension Set ID" :=
//           DimMgtExt.EditDimensionSet2(
//             "Dimension Set ID", STRSUBSTNO('%1 %2 %3', "Document Type", "No.", "Line No."),
//             "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

//         IF OldDimSetID <> "Dimension Set ID" THEN
//             MODIFY();
//     end;


//     procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
//     begin
//         //    DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
//     end;


//     procedure InsertGRNLinesfromSchedule(RecGRN: Record "Goods Receipt Header")
//     var
//         PurchScheduleLine: Record "Purch. Delivery Schedule";
//         PurchScheduleForm: Page "Purchase Delivery List Form";
//     begin

//         PurchScheduleLine.FILTERGROUP := 2;
//         PurchScheduleLine.RESET();
//         PurchScheduleLine.SETRANGE("Document Type", PurchScheduleLine."Document Type"::Order);
//         PurchScheduleLine.SETRANGE("Document No.", RecGRN."Purchase Order No.");
//         PurchScheduleLine.SETFILTER("Remaining Quantity", '<>%1', 0);
//         PurchScheduleLine.FILTERGROUP := 0;
//         IF PurchScheduleLine.FINDFIRST() THEN
//             REPEAT
//                 PurchScheduleLine.MARK(TRUE);
//             UNTIL PurchScheduleLine.NEXT() = 0;

//         PurchScheduleLine.MARKEDONLY(TRUE);

//         IF PurchScheduleLine.FINDFIRST() THEN BEGIN
//             CLEAR(PurchScheduleForm);
//             PurchScheduleForm.SETTABLEVIEW(PurchScheduleLine);
//             PurchScheduleForm.LOOKUPMODE := TRUE;
//             PurchScheduleForm.SetGRNHeader(RecGRN);
//             PurchScheduleForm.SetGRNMode(TRUE);
//             PurchScheduleForm.RUNMODAL();
//         END;

//         FromPurchHeader.RESET();
//         FromPurchHeader.SETRANGE("Document Type", PurchScheduleLine."Document Type"::Order);
//         FromPurchHeader.SETFILTER("No.", RecGRN."Purchase Order No.");
//         FromPurchHeader.FINDFIRST();
//         "Shortcut Dimension 1 Code" := FromPurchHeader."Shortcut Dimension 1 Code";
//         IF FromPurchHeader."Shortcut Dimension 2 Code" <> '' THEN
//             "Shortcut Dimension 2 Code" := FromPurchHeader."Shortcut Dimension 2 Code";
//     END;



//     procedure FillGRNLinesFromSchedule(var PurchScheduleLine: Record "Purch. Delivery Schedule"; RecGRN: Record "Goods Receipt Header")
//     var
//         ResetGRNLine: Record "Goods Receipt Line";
//         SchedulePurchLine: Record "Purchase Line";
//         LineNo: Integer;
//     begin
//         ResetGRNLine.RESET();
//         ResetGRNLine.SETRANGE("Document Type", "Document Type");
//         ResetGRNLine.SETRANGE("Document No.", RecGRN."No.");
//         IF ResetGRNLine.FINDFIRST() THEN
//             ResetGRNLine.DELETEALL();

//         LineNo := 10000;


//         PurchScheduleLine.SETRANGE("Document Type", PurchScheduleLine."Document Type"::Order);
//         PurchScheduleLine.SETRANGE("Document No.", RecGRN."Purchase Order No.");
//         IF PurchScheduleLine.FINDSET() THEN
//             REPEAT
//                 SchedulePurchLine.GET(PurchScheduleLine."Document Type",
//                   PurchScheduleLine."Document No.", PurchScheduleLine."Document Line No.");
//                 GRNLine.LOCKTABLE();
//                 GRNLine.INIT();
//                 GRNLine."Document Type" := RecGRN."Document Type";
//                 GRNLine."Document No." := RecGRN."No.";
//                 GRNLine."Line No." := LineNo;
//                 GRNLine.Type := PurchScheduleLine.Type;
//                 GRNLine."No." := PurchScheduleLine."No.";
//                 GRNLine."Job No." := SchedulePurchLine."Job No.";
//                 IF SchedulePurchLine.Type = SchedulePurchLine.Type::Item THEN
//                     IF Item.GET(GRNLine."No.") THEN
//                         GRNLine."Tolerance %" := Item."Tolerance %";
//                 GRNLine.Description := SchedulePurchLine.Description;
//                 GRNLine."Description 2" := SchedulePurchLine."Description 2";
//                 GRNLine."Description 3" := SchedulePurchLine."Description 3";
//                 GRNLine."Description 4" := SchedulePurchLine."Description 4";
//                 GRNLine."Unit of Measure Code" := SchedulePurchLine."Unit of Measure Code";
//                 GRNLine.Status := RecGRN.Status;
//                 GRNLine."Location Code" := SchedulePurchLine."Location Code";
//                 GRNLine."Purchase Order No." := SchedulePurchLine."Document No.";
//                 GRNLine."Purchase Order Line No." := SchedulePurchLine."Line No.";
//                 GRNLine."Qty. Per Unit of Measure" := SchedulePurchLine."Qty. per Unit of Measure";
//                 GRNLine.VALIDATE("Direct Unit Cost", SchedulePurchLine."Direct Unit Cost");

//                 //    GRNLine."Schedule Line No." := PurchScheduleLine."Line No.";

//                 QtyOnGRN := 0;

//                 GRNLine2.RESET();
//                 GRNLine2.SETRANGE("Document Type", GRNLine."Document Type");
//                 GRNLine2.SETRANGE(GRNLine2."Document No.", GRNLine."Document No.");
//                 GRNLine2.SETFILTER("Line No.", '<>%1', GRNLine."Line No.");
//                 GRNLine2.SETRANGE("Purchase Order No.", SchedulePurchLine."Document No.");
//                 GRNLine2.SETRANGE("Purchase Order Line No.", SchedulePurchLine."Line No.");
//                 IF GRNLine2.FIND('-') THEN
//                     ERROR(Text50001Lbl, SchedulePurchLine."Line No.");

//                 GRNLine2.RESET();
//                 GRNLine2.SETCURRENTKEY("Purchase Order No.", "Purchase Order Line No.", Status);
//                 GRNLine2.SETRANGE("Purchase Order No.", SchedulePurchLine."Document No.");
//                 GRNLine2.SETRANGE("Purchase Order Line No.", SchedulePurchLine."Line No.");
//                 //GRNLine2.SETRANGE("Schedule Line No.", PurchScheduleLine."Line No.");
//                 GRNLine2.SETRANGE(Status, GRNLine2.Status::Open);
//                 IF GRNLine2.FIND('-') THEN
//                     REPEAT
//                         QtyOnGRN := QtyOnGRN + GRNLine2."Accepted Quantity";
//                     UNTIL GRNLine2.NEXT() = 0;

//                 //GRNLine.VALIDATE("Pending Order Quantity", PurchScheduleLine."Remaining Quantity" - QtyOnGRN);

//                 GRNLine."Vendor No." := SchedulePurchLine."Buy-from Vendor No.";
//                 GRNLine."Shortcut Dimension 1 Code" := SchedulePurchLine."Shortcut Dimension 1 Code";
//                 GRNLine."Shortcut Dimension 2 Code" := SchedulePurchLine."Shortcut Dimension 2 Code";

//                 GRNLine."Initiator User ID" := RecGRN."Initiator User ID";
//                 GRNLine.INSERT();
//                 LineNo := LineNo + 10000;
//             UNTIL PurchScheduleLine.NEXT() = 0;
//     END;



//     procedure TeststatusOpen()
//     var
//         GRNHead: Record "Goods Receipt Header";
//     begin
//         GRNHead.GET("Document Type", "Document No.");
//         GRNHead.TestStatusOpen();
//     end;

//     /*
//         procedure IfManualExciseExists(): Boolean
//         var
//             StrOrderLineDet: Record "Structure Order Line Details";
//         begin
//             StrOrderLineDet.RESET;
//             StrOrderLineDet.SETRANGE(Type, StrOrderLineDet.Type::Purchase);
//             StrOrderLineDet.SETRANGE("Document Type", StrOrderLineDet."Document Type"::Order);
//             StrOrderLineDet.SETRANGE("Document No.", "Purchase Order No.");
//             StrOrderLineDet.SETRANGE("Tax/Charge Type", StrOrderLineDet."Tax/Charge Type"::Excise);
//             StrOrderLineDet.SETRANGE("Manually Changed", TRUE);
//             IF StrOrderLineDet.FINDFIRST THEN
//                 EXIT(TRUE);
//         end;

//     */
//     procedure ItemDescripion(): Text[225]
//     begin
//         EXIT(Description + ' ' + "Description 2" + ' ' + "Description 3" + ' ' + "Description 4")
//     end;

//     // ALLE AKUL ADD 030123
//     [IntegrationEvent(false, false)]
//     local procedure OnAfterInsertGRNLineFromPOLine(var GRNLine: Record "Goods Receipt Line"; var POLine: Record "Purchase Line")
//     begin
//     end;

//     procedure ShowDimensions2()
//     var
//         DimMgt: Codeunit DimensionManagement;
//     begin
//         DimMgt.ShowDimensionSet("Dimension Set ID", STRSUBSTNO('%1 %2', TABLECAPTION, "No."));
//     end;
// }

