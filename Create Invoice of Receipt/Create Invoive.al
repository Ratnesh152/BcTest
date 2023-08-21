// procedure CreatePurchaseInvoics(var ComissionLine: Record "Commission Line")

//     var

//         ComissionHeader: Record "Commission Header";

//         ComissionLineRec: Record "Commission Line";

//         ComissionLine1: Record "Commission Line";

//         SalesPrsonCode: Code[20];

//         TotalComissionRec: Decimal;

//         PurchaseHeader: Record "Purchase Header";

//         PurchaseLine: Record "Purchase Line";

//         PurchaseLine1: Record "Purchase Line";

//         SalesPerson: Record "Salesperson/Purchaser";

//         SalesInvoiceLine: Record "Sales Invoice Line";

//         SalesInvoiceHeader: Record "Sales Invoice Header";

//         PurchasePost: Codeunit "Purch.-Post";

//         ComissionHeaderArchive: Record "Commission Header Archive";

//         ComissionLineArchive: Record "Commission Line Archive";

//         totalcount: Integer;

//         ComissionLineCount: Integer;

//         PostPurchInvoice: Codeunit PostPurchaseInvoice;

//         VendorNoCode: Code[20];

//         Location: Record Location;

//     begin

//         TotalComissionRec := 0;

//         totalcount := 0;

//         Clear(SalesPrsonCode);

//         Clear(VendorNoCode);

//         ComissionLine.SetCurrentKey("SalsPerson Code", "Vendor No.");

//         if ComissionLine.FindSet() then begin

//             repeat

//                 if (SalesPrsonCode <> ComissionLine."SalsPerson Code") or (VendorNoCode <> ComissionLine."Vendor No.") then begin

//                     //Message(Format(ComissionLine."SalsPerson Code"));

//                     TotalComissionRec += ComissionLine."Total Commission";

//                     //totalcount += 1;

//                     //purchase .insert

//                     PurchaseHeader.Init();

//                     PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Invoice;

//                     PurchaseHeader."No." := '';

//                     PurchaseHeader.Insert(true);

//                     if SalesPerson.Get(ComissionLine."SalsPerson Code") then;

//                     SalesPerson.TestField("Bill to Vendor No."); //Added SV 17042023

//                     SalesPerson.TestField("G/L Code");//Added SV 17042023

//                     PurchaseHeader.Validate("Buy-from Vendor No.", SalesPerson."Bill to Vendor No.");

//                     PurchaseHeader."Commission Order NO." := ComissionLine."No.";

//                     Location.Reset();

//                     Location.SetRange("Commission Loc", true);

//                     if Location.FindFirst() then

//                         PurchaseHeader.Validate("Location Code", Location.Code)

//                     else

//                         Error('Commission Loc must be true on Location');

//                     //PurchaseHeader.Validate("Location Code", 'PANKIFAC');

//                     //PurchaseHeader."Vendor Invoice No." := ComissionLine."No.";

//                     PurchaseHeader."Document Date" := Today;

//                     PurchaseHeader."Posting Date" := Today;

//                     PurchaseHeader.Modify();

//                     //SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");

//                     //  SalesInvoiceLine.SetRange("Document Type", Rec."Document Type");

//                     //if SalesInvoiceLine.FindSet() then

//                     //  repeat

//                     PurchaseLine.Init();

//                     PurchaseLine."Document No." := PurchaseHeader."No.";

//                     PurchaseLine."Document Type" := PurchaseHeader."Document Type";

//                     PurchaseLine."Line No." := 10000;

//                     PurchaseLine.Insert();

//                     PurchaseLine.Type := PurchaseLine.Type::"G/L Account";

//                     PurchaseLine.Validate("No.", SalesPerson."G/L Code");

//                     //PurchaseLine.Description := SalesInvoiceLine.Description;

//                     //PurchaseLine.Validate("Location Code", PurchaseHeader."Location Code");

//                     PurchaseLine.Validate(Quantity, 1);

//                     PurchaseLine.Validate("Qty. to Receive", 1);

//                     PurchaseLine.Validate("Direct Unit Cost", ComissionLine."Total Commission");

//                     //PurchaseLine.Validate("GST Group Code", SalesInvoiceLine."GST Group Code");

//                     //PurchaseLine.Validate("HSN/SAC Code", SalesInvoiceLine."HSN/SAC Code");

//                     PurchaseLine.Modify();

//  

//                     //Modify Sales Invoice Line

//                     SalesInvoiceLine.Reset();

//                     SalesInvoiceLine.SetRange("Document No.", ComissionLine."Sales Invoice");

//                     SalesInvoiceLine.SetRange("No.", ComissionLine."Item No.");

//                     SalesInvoiceLine.SetRange("Line No.", ComissionLine."Sales Line No.");

//                     if SalesInvoiceLine.FindFirst() then begin

//                         SalesInvoiceLine."Purchase Order Created" := true;

//                         SalesInvoiceLine."Purchase Order No." := PurchaseLine."Document No.";

//                         SalesInvoiceLine.Modify();

//                     end;

//                     //Modify Sales Invoice Line

//                     //Modify Comission Line

//                     ComissionLine.Created := true;

//                     ComissionLine."Purchase Order No" := PurchaseHeader."No.";

//                     ComissionLine.Modify();

//                     //Modify Comission Line

//                 end else begin
//                     PurchaseLine.Validate("Direct Unit Cost", PurchaseLine."Direct Unit Cost" + ComissionLine."Total Commission");

//                     PurchaseLine.Modify();
//                     SalesInvoiceLine.Reset();

//                     SalesInvoiceLine.SetRange("Document No.", ComissionLine."Sales Invoice");

//                     SalesInvoiceLine.SetRange("No.", ComissionLine."Item No.");

//                     SalesInvoiceLine.SetRange("Line No.", ComissionLine."Sales Line No.");

//                     if SalesInvoiceLine.FindFirst() then begin

//                         SalesInvoiceLine."Purchase Order Created" := true;

//                         SalesInvoiceLine."Purchase Order No." := PurchaseLine."Document No.";

//                         SalesInvoiceLine.Modify();
//                     end;

//                     ComissionLine.Created := true;

//                     ComissionLine."Purchase Order No" := PurchaseHeader."No.";

//                     ComissionLine.Modify();
//                 end;
//                 SalesPrsonCode := ComissionLine."SalsPerson Code";

//                 VendorNoCode := ComissionLine."Vendor No.";

//             until ComissionLine.Next() = 0;
//             //Move to Archive
//             ComissionHeader.Reset();
//             ComissionHeader.SetRange("No Series", ComissionLine."No.");
//             if ComissionHeader.FindFirst() then begin
//                 ComissionHeaderArchive.Reset();
//                 ComissionHeaderArchive.SetRange("No Series", ComissionHeader."No Series");
//                 if not ComissionHeaderArchive.FindFirst() then begin

//                     ComissionHeaderArchive.Init();

//                     ComissionHeaderArchive.TransferFields(ComissionHeader);

//                     ComissionHeaderArchive.Insert();
//                 end;
//             end;
//             ComissionLine1.Reset();

//             ComissionLine1.SetRange(ComissionLine1."No.", ComissionLine."No.");

//             ComissionLine1.SetRange(Created, true);

//             if ComissionLine1.FindSet() then

//                 repeat

//                     ComissionLineArchive.Init();

//                     ComissionLineArchive.TransferFields(ComissionLine1);

//                     ComissionLineArchive.Insert();

//                 until ComissionLine1.Next() = 0;

//             //Delete Code

//             ComissionLine1.Reset();

//             ComissionLine1.SetRange(ComissionLine1."No.", ComissionLine."No.");

//             //ComissionLine1.SetRange(Posted, true);

//             if ComissionLine1.FindSet() then

//                 ComissionLine1.DeleteAll();

//  

//             ComissionHeader.Reset();

//             ComissionHeader.SetRange("No Series", ComissionLine."No.");

//             if ComissionHeader.FindFirst() then begin

//                 if ComissionHeader.FindFirst() then

//                     ComissionHeader.Delete();
//             end;
//             //Delete Code

//             //MOve to Archive

//         end;