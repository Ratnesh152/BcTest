// report 50302 "Posted Purchase Voucher"
// {
//     Caption = 'Posted Purchase Voucher';
//     UsageCategory = ReportsAndAnalysis;
//     DefaultLayout = RDLC;
//     RDLCLayout = './Reports/Posted Purchase Voucher.rdl';
//     ApplicationArea = All;
//     PreviewMode = Normal;
//     dataset
//     {
//         dataitem("G/L Entry"; "G/L Entry")
//         {
//             DataItemTableView = SORTING("Document No.", "G/L Account No.") ORDER(Descending);
//             RequestFilterFields = "Posting Date", "Document No.";
//             column(ExtDocNo_GLEntry; "External Document No.")
//             {
//             }
//             column(Comment; Comment)
//             {
//             }
//             column(DocumentDate_GLEntry; "Document Date")
//             {
//             }
//             column(VendorName; Vendor.Name)
//             {
//             }
//             column(VendorAddress; VendorAddress)
//             {
//             }
//             column(VendRegNo; VendRegNo)
//             {
//             }
//             column(DepDim; DepDim)
//             {
//             }
//             column(EmpDim; EmpDim)
//             {
//             }
//             column(GeoDim; GeoDim)
//             {
//             }
//             column(BranchDim; BranchDim)
//             {
//             }
//             column(BLDim; BLDim)
//             {
//             }
//             column(VoucherSourceDesc; SourceDesc + ' Voucher')
//             {
//             }
//             column(DocumentNo_GLEntry; "Document No.")
//             {
//             }
//             column(PostingDateFormatted; 'Date: ' + FORMAT("Posting Date"))
//             {
//             }
//             column(CompanyInformationAddress; CompanyInformation.Address + ' ' + CompanyInformation."Address 2" + '  ' + CompanyInformation.City)
//             {
//             }
//             column(CompanyInformationName; CompanyInformation.Name)
//             {
//             }
//             column(CompRegNo; CompRegNo)
//             {
//             }
//             column(CreditAmount_GLEntry; "Credit Amount")
//             {
//             }
//             column(DebitAmount_GLEntry; "Debit Amount")
//             {
//             }
//             column(DrText; DrText)
//             {
//             }
//             column(GLAccName; GLAccName)
//             {
//             }
//             column(CrText; CrText)
//             {
//             }
//             column(DebitAmountTotal; DebitAmountTotal)
//             {
//             }
//             column(CreditAmountTotal; CreditAmountTotal)
//             {
//             }
//             column(ChequeDetail; 'Cheque No: ' + ChequeNo + '  Dated: ' + FORMAT(ChequeDate))
//             {
//             }
//             column(ChequeNo; ChequeNo)
//             {
//             }
//             column(ChequeDate; ChequeDate)
//             {
//             }
//             column(RsNumberText1NumberText2; 'Rs. ' + NumberText[1] + ' ' + NumberText[2])
//             {
//             }
//             column(EntryNo_GLEntry; "Entry No.")
//             {
//             }
//             column(PostingDate_GLEntry; "Posting Date")
//             {
//             }
//             column(TransactionNo_GLEntry; "Transaction No.")
//             {
//             }
//             column(VoucherNoCaption; VoucherNoCaptionLbl)
//             {
//             }
//             column(CreditAmountCaption; CreditAmountCaptionLbl)
//             {
//             }
//             column(DebitAmountCaption; DebitAmountCaptionLbl)
//             {
//             }
//             column(ParticularsCaption; ParticularsCaptionLbl)
//             {
//             }
//             column(AmountInWordsCaption; AmountInWordsCaptionLbl)
//             {
//             }
//             column(PreparedByCaption; PreparedByCaptionLbl)
//             {
//             }
//             column(CheckedByCaption; CheckedByCaptionLbl)
//             {
//             }
//             column(ApprovedByCaption; ApprovedByCaptionLbl)
//             {
//             }
//             column(SourceCode_GLEntry; "Source Code")
//             {
//             }
//             column(LocationAdd; LocationAdd[1] + ' ' + LocationAdd[2] + ' ' + LocationAdd[3] + ' ' + LocationAdd[4])
//             {
//             }
//             column(VendorOrderAdd; VendorOrderAdd[1] + ' ' + VendorOrderAdd[2] + ' ' + VendorOrderAdd[3] + ' ' + VendorOrderAdd[4])
//             {
//             }
//             column(ShowHideLocationAddress; ShowHideLocationAddress)
//             {
//             }
//             column(ShowHideOrederAddress; ShowHideOrederAddress)
//             {
//             }
//             dataitem(LineNarration; "Posted Narration")
//             {
//                 DataItemLink = "Transaction No." = FIELD("Transaction No."),
//                                "Entry No." = FIELD("Entry No.");
//                 DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.");
//                 column(Narration_LineNarration; Narration)
//                 {
//                 }
//                 column(PrintLineNarration; PrintLineNarration)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF PrintLineNarration THEN BEGIN
//                         PageLoop := PageLoop - 1;
//                         LinesPrinted := LinesPrinted + 1;
//                     END;
//                 end;
//             }
//             dataitem(Integer; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 column(IntegerOccurcesCaption; IntegerOccurcesCaptionLbl)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     PageLoop := PageLoop - 1;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
//                     GLEntry.ASCENDING(FALSE);
//                     GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
//                     GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
//                     GLEntry.FINDLAST;
//                     IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
//                         CurrReport.BREAK;

//                     SETRANGE(Number, 1, PageLoop)
//                 end;
//             }
//             dataitem(PostedNarration1; "Posted Narration")
//             {
//                 DataItemLink = "Transaction No." = FIELD("Transaction No.");
//                 DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.")
//                                     WHERE("Entry No." = FILTER(0));
//                 column(Narration_PostedNarration1; Narration)
//                 {
//                 }
//                 column(NarrationCaption; NarrationCaptionLbl)
//                 {
//                 }

//                 trigger OnPreDataItem()
//                 begin
//                     GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
//                     GLEntry.ASCENDING(FALSE);
//                     GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
//                     GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
//                     GLEntry.FINDLAST;
//                     IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
//                         CurrReport.BREAK;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 DimensionSetEntry: Record "Dimension Set Entry";
//                 // eCommerceSetup: Record "AXT eCommerce Setup";
//                 GLAccount: Record "G/L Account";
//                 PurchCommentLine: Record "Purch. Comment Line";
//             begin
//                 // eCommerceSetup.get;
//                 GLAccName := FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");
//                 IF Amount < 0 THEN BEGIN
//                     CrText := 'To';
//                     DrText := '';
//                 END ELSE BEGIN
//                     CrText := '';
//                     DrText := 'Dr';
//                 END;

//                 SourceDesc := '';
//                 IF "Source Code" <> '' THEN BEGIN
//                     SourceCode.GET("Source Code");
//                     SourceDesc := SourceCode.Description;
//                 END;

//                 PageLoop := PageLoop - 1;
//                 LinesPrinted := LinesPrinted + 1;

//                 ChequeNo := '';
//                 ChequeDate := 0D;
//                 IF ("Source No." <> '') AND ("Source Type" = "Source Type"::"Bank Account") THEN BEGIN
//                     IF BankAccLedgEntry.GET("Entry No.") THEN BEGIN
//                         // ChequeNo := BankAccLedgEntry."Cheque No.";
//                         // ChequeDate := BankAccLedgEntry."Cheque Date";
//                     END;
//                 END;

//                 IF (ChequeNo <> '') AND (ChequeDate <> 0D) THEN BEGIN
//                     PageLoop := PageLoop - 1;
//                     LinesPrinted := LinesPrinted + 1;
//                 END;
//                 IF PostingDate <> "Posting Date" THEN BEGIN
//                     PostingDate := "Posting Date";
//                     TotalDebitAmt := 0;
//                 END;
//                 IF DocumentNo <> "Document No." THEN BEGIN
//                     DocumentNo := "Document No.";
//                     TotalDebitAmt := 0;
//                 END;

//                 IF PostingDate = "Posting Date" THEN BEGIN
//                     InitTextVariable;
//                     TotalDebitAmt += "Debit Amount";
//                     FormatNoText(NumberText, ABS(TotalDebitAmt), '');
//                     PageLoop := NUMLines;
//                     LinesPrinted := 0;
//                 END;
//                 IF (PrePostingDate <> "Posting Date") OR (PreDocumentNo <> "Document No.") THEN BEGIN
//                     DebitAmountTotal := 0;
//                     CreditAmountTotal := 0;
//                     PrePostingDate := "Posting Date";
//                     PreDocumentNo := "Document No.";
//                 END;

//                 DebitAmountTotal := DebitAmountTotal + "Debit Amount";
//                 CreditAmountTotal := CreditAmountTotal + "Credit Amount";

//                 VendorLedgerEntry2.reset;
//                 VendorLedgerEntry2.SetRange("Document No.", "G/L Entry"."Document No.");
//                 if VendorLedgerEntry2.FindSet() then begin
//                     Vendor.get(VendorLedgerEntry2."Vendor No.");
//                     // VendorAddress := Vendor.Address + ' ' + Vendor."Address 2" + ' ' + Vendor.City + ' ' +
//                     //                  Vendor."Post Code" + '' + Vendor."State Code" + ' ' + Vendor."Country/Region Code";
//                     // if Vendor."GST Registration No." <> '' then
//                     //     VendRegNo := Vendor."GST Registration No."
//                     // else
//                         // VendRegNo := Vendor."VAT Registration No.";
//                 end;
//                 DepDim := '';
//                 EmpDim := '';
//                 GeoDim := '';
//                 BranchDim := '';
//                 BLDim := '';
//                 GLAccount.get("G/L Entry"."G/L Account No.");
//                 if GLAccount."Income/Balance" = GLAccount."Income/Balance"::"Income Statement" then begin
//                     DimensionSetEntry.Reset();
//                     DimensionSetEntry.SetRange("Dimension Set ID", "G/L Entry"."Dimension Set ID");
//                     if DimensionSetEntry.FindSet() then
//                         repeat
//                         // if eCommerceSetup."Dimension Value 1" = DimensionSetEntry."Dimension Code" then
//                         //     BranchDim := DimensionSetEntry."Dimension Value Code"; //
//                         // if eCommerceSetup."Dimension Value 2" = DimensionSetEntry."Dimension Code" then
//                         //     BLDim := DimensionSetEntry."Dimension Value Code";
//                         // if eCommerceSetup."Dimension Value 3" = DimensionSetEntry."Dimension Code" then
//                         //     DepDim := DimensionSetEntry."Dimension Value Code"; //
//                         // if eCommerceSetup."Dimension Value 5" = DimensionSetEntry."Dimension Code" then
//                         //     GeoDim := DimensionSetEntry."Dimension Value Code"; //
//                         // if 'EMPLOYEE' = DimensionSetEntry."Dimension Code" then
//                         //     EmpDim := DimensionSetEntry."Dimension Value Code";
//                         until DimensionSetEntry.next = 0;
//                 end;
//                 PurchCommentLine.Reset();
//                 PurchCommentLine.SetRange("Document Type", PurchCommentLine."Document Type"::"Posted Invoice");
//                 PurchCommentLine.SetRange("No.", "G/L Entry"."Document No.");
//                 if PurchCommentLine.FindSet() then
//                     repeat
//                         Comment := Comment + ' ' + PurchCommentLine.Comment;
//                     until PurchCommentLine.next = 0;
//                 PurchaseInvHeader.Reset();
//                 PurchaseInvHeader.SetRange("No.", "Document No.");
//                 if PurchaseInvHeader.FindSet() then begin
//                     Location.Reset();
//                     Location.SetRange(Code, PurchaseInvHeader."Location Code");
//                     if Location.FindSet() then begin
//                         LocationAdd[1] := Location.Address;
//                         LocationAdd[2] := Location."Address 2";
//                         LocationAdd[3] := Location.City;
//                         LocationAdd[4] := Location."Post Code";
//                         ShowHideLocationAddress := true;
//                     end;
//                     OrderAddress.Reset();
//                     OrderAddress.SetRange(Code, PurchaseInvHeader."Order Address Code");
//                     if OrderAddress.FindSet() then begin
//                         VendorOrderAdd[1] := OrderAddress.Address;
//                         VendorOrderAdd[2] := OrderAddress."Address 2";
//                         VendorOrderAdd[3] := OrderAddress.City;
//                         VendorOrderAdd[4] := OrderAddress."Post Code";
//                         ShowHideOrederAddress := true;
//                     end;
//                 end;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 NUMLines := 13;
//                 PageLoop := NUMLines;
//                 LinesPrinted := 0;
//                 DebitAmountTotal := 0;
//                 CreditAmountTotal := 0;
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     field(PrintLineNarration; PrintLineNarration)
//                     {
//                         ApplicationArea = all;
//                         Caption = 'PrintLineNarration';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInformation.GET;
//         if CompanyInformation."GST Registration No." <> '' then
//             CompRegNo := CompanyInformation."GST Registration No."
//         else
//             CompRegNo := CompanyInformation."VAT Registration No.";
//     end;

//     var
//         CompanyInformation: Record "Company Information";
//         SourceCode: Record "Source Code";
//         GLEntry: Record "G/L Entry";
//         BankAccLedgEntry: Record "Bank Account Ledger Entry";
//         GLAccName: Text;
//         SourceDesc: Text;
//         CrText: Text[2];
//         DrText: Text[2];
//         NumberText: array[2] of Text[80];
//         PageLoop: Integer;
//         LinesPrinted: Integer;
//         NUMLines: Integer;
//         ChequeNo: Code[50];
//         ChequeDate: Date;
//         Text16526: Label 'ZERO';
//         Text16527: Label 'HUNDRED';
//         Text16528: Label 'AND';
//         Text16529: Label '%1 results in a written number that is too long.';
//         Text16532: Label 'ONE';
//         Text16533: Label 'TWO';
//         Text16534: Label 'THREE';
//         Text16535: Label 'FOUR';
//         Text16536: Label 'FIVE';
//         Text16537: Label 'SIX';
//         Text16538: Label 'SEVEN';
//         Text16539: Label 'EIGHT';
//         Text16540: Label 'NINE';
//         Text16541: Label 'TEN';
//         Text16542: Label 'ELEVEN';
//         Text16543: Label 'TWELVE';
//         Text16544: Label 'THIRTEEN';
//         Text16545: Label 'FOURTEEN';
//         Text16546: Label 'FIFTEEN';
//         Text16547: Label 'SIXTEEN';
//         Text16548: Label 'SEVENTEEN';
//         Text16549: Label 'EIGHTEEN';
//         Text16550: Label 'NINETEEN';
//         Text16551: Label 'TWENTY';
//         Text16552: Label 'THIRTY';
//         Text16553: Label 'FORTY';
//         Text16554: Label 'FIFTY';
//         Text16555: Label 'SIXTY';
//         Text16556: Label 'SEVENTY';
//         Text16557: Label 'EIGHTY';
//         Text16558: Label 'NINETY';
//         Text16559: Label 'THOUSAND';
//         Text16560: Label 'MILLION';
//         Text16561: Label 'BILLION';
//         Text16562: Label 'LAKH';
//         Text16563: Label 'CRORE';
//         OnesText: array[20] of Text[30];
//         TensText: array[10] of Text[30];
//         ExponentText: array[5] of Text[30];
//         PrintLineNarration: Boolean;
//         PostingDate: Date;
//         TotalDebitAmt: Decimal;
//         DocumentNo: Code[20];
//         DebitAmountTotal: Decimal;
//         CreditAmountTotal: Decimal;
//         PrePostingDate: Date;
//         PreDocumentNo: Code[50];
//         VoucherNoCaptionLbl: Label 'Voucher No. :';
//         CreditAmountCaptionLbl: Label 'Credit Amount';
//         DebitAmountCaptionLbl: Label 'Debit Amount';
//         ParticularsCaptionLbl: Label 'Particulars';
//         AmountInWordsCaptionLbl: Label 'Amount (in words):';
//         PreparedByCaptionLbl: Label 'Prepared by:';
//         CheckedByCaptionLbl: Label 'Checked by:';
//         ApprovedByCaptionLbl: Label 'Approved by:';
//         IntegerOccurcesCaptionLbl: Label 'IntegerOccurces';
//         NarrationCaptionLbl: Label 'Narration :';
//         VendorName: Text[100];
//         VendorAddress: Text[1024];
//         Vendor: Record Vendor;
//         VendorLedgerEntry2: Record "Vendor Ledger Entry";
//         VendRegNo: Code[36];
//         CompRegNo: Code[36];
//         GeoDim: Code[20];
//         DepDim: Code[20];
//         BranchDim: Code[20];
//         BLDim: Code[20];
//         EmpDim: Code[20];
//         Comment: text;
//         Location: Record Location;
//         LocationAdd: array[5] of text;
//         PurchaseInvHeader: Record "Purch. Inv. Header";
//         OrderAddress: Record "Order Address";
//         VendorOrderAdd: array[5] of Text;
//         ShowHideOrederAddress: Boolean;
//         ShowHideLocationAddress: Boolean;

//     procedure FindGLAccName("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]): Text[50]
//     var
//         AccName: Text;
//         VendLedgerEntry: Record "Vendor Ledger Entry";
//         Vend: Record Vendor;
//         CustLedgerEntry: Record "Cust. Ledger Entry";
//         Cust: Record Customer;
//         BankLedgerEntry: Record "Bank Account Ledger Entry";
//         Bank: Record "Bank Account";
//         GLAccount: Record "G/L Account";
//     begin
//         IF "Source Type" = "Source Type"::Vendor THEN
//             IF VendLedgerEntry.GET("Entry No.") THEN
//                 IF IsGSTDocument(VendLedgerEntry."Document Type", VendLedgerEntry."Document No.") THEN BEGIN
//                     GLAccount.GET("G/L Account No.");
//                     AccName := GLAccount.Name;
//                 END ELSE BEGIN
//                     Vend.GET("Source No.");
//                     AccName := Vend.Name;
//                 END
//             ELSE BEGIN
//                 GLAccount.GET("G/L Account No.");
//                 AccName := GLAccount.Name;
//             END
//         ELSE
//             IF "Source Type" = "Source Type"::Customer THEN
//                 IF CustLedgerEntry.GET("Entry No.") THEN
//                     IF IsGSTDocument(CustLedgerEntry."Document Type", CustLedgerEntry."Document No.") THEN BEGIN
//                         GLAccount.GET("G/L Account No.");
//                         AccName := GLAccount.Name;
//                     END ELSE BEGIN
//                         Cust.GET("Source No.");
//                         AccName := Cust.Name;
//                     END
//                 ELSE BEGIN
//                     GLAccount.GET("G/L Account No.");
//                     AccName := GLAccount.Name;
//                 END
//             ELSE
//                 IF "Source Type" = "Source Type"::"Bank Account" THEN
//                     IF BankLedgerEntry.GET("Entry No.") THEN BEGIN
//                         Bank.GET("Source No.");
//                         AccName := Bank.Name;
//                     END ELSE BEGIN
//                         GLAccount.GET("G/L Account No.");
//                         AccName := GLAccount.Name;
//                     END
//                 ELSE BEGIN
//                     GLAccount.GET("G/L Account No.");
//                     AccName := GLAccount.Name;
//                 END;

//         IF "Source Type" = "Source Type"::" " THEN BEGIN
//             GLAccount.GET("G/L Account No.");
//             AccName := GLAccount.Name;
//         END;

//         EXIT(AccName);
//     end;

//     procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
//     var
//         PrintExponent: Boolean;
//         Ones: Integer;
//         Tens: Integer;
//         Hundreds: Integer;
//         Exponent: Integer;
//         NoTextIndex: Integer;
//         Currency: Record Currency;
//         TensDec: Integer;
//         OnesDec: Integer;
//     begin
//         CLEAR(NoText);
//         NoTextIndex := 1;
//         NoText[1] := '';

//         IF No < 1 THEN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526)
//         ELSE BEGIN
//             FOR Exponent := 4 DOWNTO 1 DO BEGIN
//                 PrintExponent := FALSE;
//                 IF No > 99999 THEN BEGIN
//                     Ones := No DIV (POWER(100, Exponent - 1) * 10);
//                     Hundreds := 0;
//                 END ELSE BEGIN
//                     Ones := No DIV POWER(1000, Exponent - 1);
//                     Hundreds := Ones DIV 100;
//                 END;
//                 Tens := (Ones MOD 100) DIV 10;
//                 Ones := Ones MOD 10;
//                 IF Hundreds > 0 THEN BEGIN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, Text16527);
//                 END;
//                 IF Tens >= 2 THEN BEGIN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
//                     IF Ones > 0 THEN
//                         AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
//                 END ELSE
//                     IF (Tens * 10 + Ones) > 0 THEN
//                         AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
//                 IF PrintExponent AND (Exponent > 1) THEN
//                     AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
//                 IF No > 99999 THEN
//                     No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(100, Exponent - 1) * 10
//                 ELSE
//                     No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
//             END;
//         END;

//         IF CurrencyCode <> '' THEN BEGIN
//             Currency.GET(CurrencyCode);
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Currency.Symbol);
//         END ELSE
//             AddToNoText(NoText, NoTextIndex, PrintExponent, 'RUPEES');

//         AddToNoText(NoText, NoTextIndex, PrintExponent, Text16528);

//         TensDec := ((No * 100) MOD 100) DIV 10;
//         OnesDec := (No * 100) MOD 10;
//         IF TensDec >= 2 THEN BEGIN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
//             IF OnesDec > 0 THEN
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
//         END ELSE
//             IF (TensDec * 10 + OnesDec) > 0 THEN
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
//             ELSE
//                 AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526);
//         IF (CurrencyCode <> '') THEN
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + Currency.Symbol + ' ONLY')
//         ELSE
//             AddToNoText(NoText, NoTextIndex, PrintExponent, ' PAISA ONLY');
//     end;

//     local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
//     begin
//         PrintExponent := TRUE;

//         WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
//             NoTextIndex := NoTextIndex + 1;
//             IF NoTextIndex > ARRAYLEN(NoText) THEN
//                 ERROR(Text16529, AddText);
//         END;

//         NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
//     end;

//     procedure InitTextVariable()
//     begin
//         OnesText[1] := Text16532;
//         OnesText[2] := Text16533;
//         OnesText[3] := Text16534;
//         OnesText[4] := Text16535;
//         OnesText[5] := Text16536;
//         OnesText[6] := Text16537;
//         OnesText[7] := Text16538;
//         OnesText[8] := Text16539;
//         OnesText[9] := Text16540;
//         OnesText[10] := Text16541;
//         OnesText[11] := Text16542;
//         OnesText[12] := Text16543;
//         OnesText[13] := Text16544;
//         OnesText[14] := Text16545;
//         OnesText[15] := Text16546;
//         OnesText[16] := Text16547;
//         OnesText[17] := Text16548;
//         OnesText[18] := Text16549;
//         OnesText[19] := Text16550;

//         TensText[1] := '';
//         TensText[2] := Text16551;
//         TensText[3] := Text16552;
//         TensText[4] := Text16553;
//         TensText[5] := Text16554;
//         TensText[6] := Text16555;
//         TensText[7] := Text16556;
//         TensText[8] := Text16557;
//         TensText[9] := Text16558;

//         ExponentText[1] := '';
//         ExponentText[2] := Text16559;
//         ExponentText[3] := Text16562;
//         ExponentText[4] := Text16563;
//     end;

//     procedure IsGSTDocument(DocumentType: Option; DocumentNo: Code[20]): Boolean
//     var
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
//     begin
//         DetailedGSTLedgerEntry.SETRANGE("Document No.", DocumentNo);
//         IF DetailedGSTLedgerEntry.FINDFIRST THEN
//             EXIT(TRUE);
//         DetailedGSTLedgerEntry.SETRANGE("Document No.");
//         DetailedGSTLedgerEntry.SETRANGE("Entry Type", DetailedGSTLedgerEntry."Entry Type"::Application);
//         DetailedGSTLedgerEntry.SETRANGE("Application Doc. Type", DocumentType);
//         DetailedGSTLedgerEntry.SETRANGE("Application Doc. No", DocumentNo);
//         IF NOT DetailedGSTLedgerEntry.ISEMPTY THEN
//             EXIT(TRUE);
//         EXIT(FALSE);
//     end;
// }

