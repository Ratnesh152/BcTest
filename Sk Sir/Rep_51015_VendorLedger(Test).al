report 51015 "Vendor Ledger New(Test)"
{
    // //Alle-HB-16oct15-------- GL Entry Details added
    // AlleSS BT10084 27.08.2019--- Added Comments.
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    //RDLCLayout = 'RDL/Rep_51010_VendorLedger(Test).rdl';
    RDLCLayout = 'Sk Sir/VendorLedger1.rdl';
    Caption = 'Vendor Ledger__(Test)';
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            // RequestFilterFields = "No.", Name, "Vendor Posting Group", "Date Filter", "State Code";
            column(Name; CompanyInfo.Name)
            {
            }
            column(Dated; Dated)
            {
            }
            column(PrintDetail; PrintDetail)
            {
            }
            column(refNo; refNo)
            {

            }
            column(PrintNarration; PrintNarration)
            {
            }
            column(OpeCreBalTxt; OpeCreBal)
            {
            }
            column(OpeDeBalTxt; OpeDeBal)
            {
            }
            column(OpenBalDes; OpenBalDes)
            {

            }
            column(ViewAppliedEntries; ViewAppliedEntries)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_VendDateFilter_; STRSUBSTNO(Text000, VendDateFilter))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(ResCen__Country_Region_Code_; ResCen."Country/Region Code")
            {
            }
            column(ResCen_City; ResCen.City)
            {
            }
            column(ResCen__Post_Code_; ResCen."Post Code")
            {
            }
            column(ResCen_State; '')
            {
            }
            column(ResCen__Address_2_; ResCen."Address 2")
            {
            }
            column(ResCen_Address; ResCen.Address)
            {
            }
            column(ResCen_Name; ResCen.Name)
            {
            }
            column(Vendor__No__; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(Address; Address)
            {

            }
            column(Address_2; "Address 2")
            {

            }
            // column(State_Code; "State Code")
            // {

            // }
            column(City; City)
            {

            }
            column(Post_Code; "Post Code")
            {

            }
            column(Vendor__Phone_No__; "Phone No.")
            {
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(DeBal; DeBal)
            {
                AutoFormatType = 1;
            }
            column(CreBal; CreBal)
            {
                AutoFormatType = 1;
            }
            column(BalDes; BalDes)
            {

            }
            column(StartBalAdjLCY; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(VendBalanceLCY; VendBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(DeBal_Control1000000064; DeBal)
            {
                AutoFormatType = 1;
            }
            column(CreBal_Control1000000065; CreBal)
            {
                AutoFormatType = 1;
            }
            column(StartBalAdjLCY_Control65; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(Vendor_Ledger_Entry___Amount__LCY_____Correction___ApplicationRounding; "Vendor Ledger Entry"."Amount (LCY)" + Correction + ApplicationRounding)
            {
                AutoFormatType = 1;
            }
            column(DeBal_Control1000000086; DeBal)
            {
                AutoFormatType = 1;
            }
            column(CreBal_Control1000000087; CreBal)
            {
                AutoFormatType = 1;
            }
            column(DeBal1; DeBal1)
            {
                AutoFormatType = 1;
            }
            column(CreBal1; CreBal1)
            {
                AutoFormatType = 1;
            }
            column(DeBal2; DeBal2)
            {
                AutoFormatType = 1;
            }
            column(CreBal2; CreBal2)
            {
                AutoFormatType = 1;
            }
            column(Vendor_Ledger_Entry___Amount__LCY_____Correction___ApplicationRounding_Control31; "Vendor Ledger Entry"."Amount (LCY)" + Correction + ApplicationRounding)
            {
                AutoFormatType = 1;
            }
            column(StartBalanceLCY___StartBalAdjLCY____Vendor_Ledger_Entry___Amount__LCY_____Correction___ApplicationRounding; StartBalanceLCY + StartBalAdjLCY + "Vendor Ledger Entry"."Amount (LCY)" + Correction + ApplicationRounding)
            {
                AutoFormatType = 1;
            }
            column(DeBal_Control1000000092; DeBal)
            {
                AutoFormatType = 1;
            }
            column(CreBal_Control1000000093; CreBal)
            {
                AutoFormatType = 1;
            }
            column(DeBal_Control1000000094; DeBal)
            {
                AutoFormatType = 1;
            }
            column(CreBal_Control1000000095; CreBal)
            {
                AutoFormatType = 1;
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Vendor_LedgerCaption; Vendor_LedgerCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(Vendor_Ledger_Entry__Credit_Amount_Caption; "Vendor Ledger Entry".FIELDCAPTION("Credit Amount"))
            {
            }
            column(Vendor_Ledger_Entry__Debit_Amount_Caption; "Vendor Ledger Entry".FIELDCAPTION("Debit Amount"))
            {
            }
            column(CheckDateCaption; CheckDateCaptionLbl)
            {
            }
            column(CheckNoCaption; CheckNoCaptionLbl)
            {
            }
            column(Invoice_No_Caption; Invoice_No_CaptionLbl)
            {
            }
            column(NarrationCaption; NarrationCaptionLbl)
            {
            }
            column(Doc__No_Caption; Doc__No_CaptionLbl)
            {
            }
            column(Vendor_Ledger_Entry__Posting_Date_Caption; "Vendor Ledger Entry".FIELDCAPTION("Posting Date"))
            {
            }
            column(Invoice_DateCaption; Invoice_DateCaptionLbl)
            {
            }
            column(Debit_Bal_Caption; Debit_Bal_CaptionLbl)
            {
            }
            column(Credit_Bal_Caption; Credit_Bal_CaptionLbl)
            {
            }
            column(TDS_AmountCaption; TDS_AmountCaptionLbl)
            {
            }
            column(Pre_AsgNoCaption; Pre_AsgNoCaptionLbl)
            {
            }
            column(BalanceCaption_Control1000000025; BalanceCaption_Control1000000025Lbl)
            {
            }
            column(Credit_AmountCaption; Credit_AmountCaptionLbl)
            {
            }
            column(Debit_AmountCaption; Debit_AmountCaptionLbl)
            {
            }
            column(Chq__DateCaption; Chq__DateCaptionLbl)
            {
            }
            column(NarrationCaption_Control1000000041; NarrationCaption_Control1000000041Lbl)
            {
            }
            column(Doc__No_Caption_Control1000000042; Doc__No_Caption_Control1000000042Lbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Invoice_No_Caption_Control1000000044; Invoice_No_Caption_Control1000000044Lbl)
            {
            }
            column(Chq__No_Caption; Chq__No_CaptionLbl)
            {
            }
            column(Invoice_DateCaption_Control1000000052; Invoice_DateCaption_Control1000000052Lbl)
            {
            }
            column(Credit_Bal_Caption_Control1000000056; Credit_Bal_Caption_Control1000000056Lbl)
            {
            }
            column(Debit_Bal_Caption_Control1000000057; Debit_Bal_Caption_Control1000000057Lbl)
            {
            }
            column(TDS_AmountCaption_Control1000000097; TDS_AmountCaption_Control1000000097Lbl)
            {
            }
            column(Pre_AsgNoCaption_Control1000000071; Pre_AsgNoCaption_Control1000000071Lbl)
            {
            }
            column(Vendor__Phone_No__Caption; FIELDCAPTION("Phone No."))
            {
            }
            column(Opening_BalanceCaption; Opening_BalanceCaptionLbl)
            {
            }
            column(Adj__of_Opening_BalanceCaption; Adj__of_Opening_BalanceCaptionLbl)
            {
            }
            column(Total__LCY_Caption; Total__LCY_CaptionLbl)
            {
            }
            column(Total_Adj__of_Opening_BalanceCaption; Total_Adj__of_Opening_BalanceCaptionLbl)
            {
            }
            column(Total__LCY__Before_PeriodCaption; Total__LCY__Before_PeriodCaptionLbl)
            {
            }
            column(Total__LCY__Before_PeriodCaption_Control26; Total__LCY__Before_PeriodCaption_Control26Lbl)
            {
            }
            column(Vendor_Date_Filter; "Date Filter")
            {
            }
            column(Vendor_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Vendor_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(VLECr; VLECr)
            {
            }
            column(VLEDr; VLEDr)
            {
            }
            column(TDSAmt2; TDSAmt)
            {

            }
            // column(entitycode; entitycode)
            // {

            // }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {

                DataItemLink = "Vendor No." = FIELD("No."), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Date Filter" = FIELD("Date Filter");//, "Posting Date" = FIELD("Date Filter"),
                DataItemTableView = SORTING("Vendor No.", "Posting Date");
                RequestFilterFields = "Global Dimension 1 Code";
                column(Source_Code; "Source Code")
                {

                }
                // column(Buyer_State_Code; "Buyer State Code")
                // {

                // }
                column(ExtDoc; "External Document No.")
                {

                }
                column(PayType; PaymentType)
                {
                }

                column(Retention; Retention)
                {
                }
                column(SecDeposit; SecDeposit)
                {
                }
                column(SalComponent; SalComponent)
                {
                }
                column(FY; FY)
                {
                }
                column(Employee; Employee)
                {
                }
                column(Branch; Branch)
                {
                }
                column(CostCenter; CostCenter)
                {
                }
                column(StartBalanceLCY___StartBalAdjLCY____Amount__LCY__; StartBalanceLCY + StartBalAdjLCY + "Amount (LCY)")
                {
                    AutoFormatType = 1;
                }
                column(DeBal_Control1000000068; DeBal)
                {
                    AutoFormatType = 1;
                }
                column(CreBal_Control1000000069; CreBal)
                {
                    AutoFormatType = 1;
                }
                column(BalDesVenLedEn; BalDes)
                {

                }
                column(Vendor_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Vendor_Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(ItemCategoryName; SourceDesc2) //ItemCategoryName)
                {
                }
                column(Vendor_Ledger_Entry__External_Document_No__; "External Document No.")
                {
                }
                column(CheckNo; CheckNo)
                {
                }
                column(CheckDate; CheckDate)
                {
                }
                // column(Vendor_State_Code; "Buyer State Code")
                // {
                // }
                column(Vendor_Ledger_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(Vendor_Ledger_Entry__Credit_Amount_; "Credit Amount")
                {
                }

                column(DrAmt2_; "Vendor Ledger Entry"."Debit Amount (LCY)")// + "Vendor Ledger Entry"."Total TDS Including SHE CESS")
                {

                }
                column(CrAmt2_; "Vendor Ledger Entry"."Credit Amount (LCY)") //+ "Vendor Ledger Entry"."Total TDS Including SHE CESS")
                {

                }
                column(invdoc; invdoc)
                {

                }
                column(DocDate; "Document Date")
                {
                }
                column(DeBal_Control1000000072; DeBal)
                {
                    AutoFormatType = 1;
                }
                column(CreBal_Control1000000073; CreBal)
                {
                    AutoFormatType = 1;
                }
                // column(Vendor_Ledger_Entry__Total_TDS_Including_SHE_CESS_; "Total TDS Including SHE CESS")
                // {
                // }
                column(PreAssNo; PreAssNo)
                {
                    AutoFormatType = 1;
                }
                column(Vendor_Ledger_Entry__Credit_Amount__Control1000000004; "Credit Amount")
                {
                }
                column(Vendor_Ledger_Entry__Debit_Amount__Control1000000005; "Debit Amount")
                {
                }
                column(CheckDate_Control1000000006; CheckDate)
                {
                }
                column(CheckNo_Control1000000007; CheckNo)
                {
                }
                column(Vendor_Ledger_Entry__External_Document_No___Control1000000009; "External Document No.")
                {
                }
                column(ItemCategoryName_Control1000000011; ItemCategoryName)
                {
                }
                column(Vendor_Ledger_Entry__Document_No___Control1000000012; "Document No.")
                {
                }
                column(Vendor_Ledger_Entry__Posting_Date__Control1000000013; "Posting Date")
                {
                }
                column(DocDate_Control1000000054; DocDate)
                {
                }
                column(DeBal_Control1000000074; DeBal)
                {
                    AutoFormatType = 1;
                }
                column(CreBal_Control1000000075; CreBal)
                {
                    AutoFormatType = 1;
                }
                // column(Vendor_Ledger_Entry__Total_TDS_Including_SHE_CESS__Control1000000098; "Total TDS Including SHE CESS")
                // {
                // }
                column(PreAssNo_Control1000000101; PreAssNo)
                {
                    AutoFormatType = 1;
                }
                column(DeBal_Control1000000080; DeBal)
                {
                    AutoFormatType = 1;
                }
                column(CreBal_Control1000000081; CreBal)
                {
                    AutoFormatType = 1;
                }
                column(ContinuedCaption; ContinuedCaptionLbl)
                {
                }
                column(ContinuedCaption_Control46; ContinuedCaption_Control46Lbl)
                {
                }
                column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Vendor_Ledger_Entry_Vendor_No_; "Vendor No.")
                {
                }
                column(Vendor_Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Vendor_Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }
                column(Vendor_Ledger_Entry_Date_Filter; "Date Filter")
                {

                }
                column(entitycode; entitycode)
                {

                }
                column(Branch_; Branch) { }
                column(SourceDesc2; SourceDesc2)
                {

                }
                // column(Location_Code; "Location Code")
                // {

                // }
                column(TotCrAmt; TotCrAmt)
                {
                }
                column(TotDrAmt; TotDrAmt)
                {
                }
                column(Comments; Comments[1] + ' ' + Comments[2] + ' ' + Comments[3] + ' ' + Comments[4] + ' ' + Comments[5])
                {
                }
                column(Narrations; Narration[1] + ' ' + Narration[2] + ' ' + Narration[3] + ' ' + Narration[4] + ' ' + Narration[5] + ' ' + Narration[6] + ' ' + Narration[7] + ' ' + Narration[8])
                {
                }
                column(RefInvNo; RefInvNo)
                {

                }
                column(DeBal11; DeBal11)
                {

                }
                column(skip; skip)
                {

                }
                column(Narra; Narra)
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                //AJAJ

                dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
                {
                    DataItemLink = "Document No." = field("Document No.");
                    DataItemTableView = where("No." = filter(<> '48000710'));
                    //---
                    column(ItemNo_; "No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(UM; "Unit of Measure")
                    {

                    }
                    column(Rate; "Unit Cost")
                    {

                    }
                    column(Quantity; Quantity)
                    {

                    }
                }
                // dataitem("Posted Narration"; "Posted Narration")
                // {
                //     DataItemLink = "Document No." = field("Document No.");
                //     column(PosDocNar; "Document No.")
                //     {

                //     }
                //     column(PosLine_No_; "Line No.")
                //     {

                //     }
                //     column(Narration; Narration)
                //     {

                //     }
                //}
                trigger OnAfterGetRecord()
                var
                    PurchInvHead: Record "Purch. Inv. Header";
                    PurchCrMemoHead: Record "Purch. Cr. Memo Hdr.";
                    PostedNarration: Record "Posted Narration";
                begin
                    PostedNarration.SetRange("Document No.", "Vendor Ledger Entry"."Document No.");
                    PostedNarration.SetRange("Transaction No.", "Vendor Ledger Entry"."Transaction No.");
                    if PostedNarration.FindFirst() then begin
                        Narra := PostedNarration.Narration;
                        Message(Format(PostedNarration.Narration));
                    end;

                    // if "Vendor Ledger Entry"."TDS Section Code" <> '' then begin
                    //     DeBal11 := "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                    // end else begin
                    //     DeBal11 := 0;
                    // end;
                    if "Vendor Ledger Entry"."Debit Amount" + "Vendor Ledger Entry"."Credit Amount" + DeBal11 = 0 then begin
                        skip := true;
                    end else begin
                        skip := false;
                    end;
                    CreBal := 0;
                    DeBal := 0;
                    Clear(BalDes);

                    //Alle-AT Start
                    CostCenter := '';
                    Branch := '';
                    PaymentType := '';
                    Employee := '';
                    FY := '';
                    SalComponent := '';
                    SecDeposit := '';
                    Retention := '';
                    PaymentType := '';

                    //ALLE MY_01-12-22
                    if "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::Invoice then begin
                        PurchInvHead.Reset();
                        PurchInvHead.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                        PurchInvHead.SetRange(Cancelled, true);
                        if PurchInvHead.FindFirst() then
                            CurrReport.Skip();
                    end;

                    if "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::"Credit Memo" then begin
                        PurchCrMemoHead.Reset();
                        PurchCrMemoHead.SetRange("No.", "Vendor Ledger Entry"."Document No.");
                        PurchCrMemoHead.SetRange(Corrective, true);
                        if PurchCrMemoHead.FindFirst() then
                            CurrReport.Skip();
                    end;
                    //ALLE MY_01-12-22

                    //Alle/Shyam/110422
                    if "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::"Credit Memo" then begin
                        VLE2.Reset();
                        VLE2.SetRange("Entry No.", "Vendor Ledger Entry"."Closed by Entry No.");
                        if VLE2.FindFirst() then
                            RefInvNo := VLE2."Document No."
                        else
                            RefInvNo := '';
                    end else
                        RefInvNo := '';
                    DimensionSetEntry.RESET;
                    DimensionSetEntry.SETRANGE("Dimension Set ID", "Vendor Ledger Entry"."Dimension Set ID");
                    IF DimensionSetEntry.FINDSET THEN
                        REPEAT
                            DimensionSetEntry.CALCFIELDS("Dimension Value Name");
                            IF DimensionSetEntry."Dimension Code" = 'COST CENTER' THEN
                                CostCenter := DimensionSetEntry."Dimension Value Name"
                            ELSE
                                IF DimensionSetEntry."Dimension Code" = 'BRANCH' THEN
                                    Branch := DimensionSetEntry."Dimension Value Name"
                                ELSE
                                    IF DimensionSetEntry."Dimension Code" = 'FY' THEN
                                        FY := DimensionSetEntry."Dimension Value Name"
                                    ELSE
                                        IF DimensionSetEntry."Dimension Code" = 'EMPLOYEE' THEN
                                            Employee := DimensionSetEntry."Dimension Value Name"
                                        ELSE
                                            IF DimensionSetEntry."Dimension Code" = 'SALARY COMPONENT' THEN
                                                SalComponent := DimensionSetEntry."Dimension Value Name"
                                            ELSE
                                                IF DimensionSetEntry."Dimension Code" = 'SECURITY DEPOSIT' THEN
                                                    SecDeposit := DimensionSetEntry."Dimension Value Name"
                                                ELSE
                                                    IF DimensionSetEntry."Dimension Code" = 'RETENTION' THEN
                                                        Retention := DimensionSetEntry."Dimension Value Name"
                                                    ELSE
                                                        IF DimensionSetEntry."Dimension Code" = 'PAYMENT TYPE' THEN
                                                            PaymentType := DimensionSetEntry."Dimension Value Name";
                        UNTIL DimensionSetEntry.NEXT = 0;
                    //Alle-AT END

                    begin
                        dimensionValue.Reset();
                        dimensionValue.SetRange(Code, "Vendor Ledger Entry"."Global Dimension 1 Code");
                        if dimensionValue.FindFirst() then begin
                            branch := dimensionValue.Name;
                        end;

                        dimensionValue.Reset();
                        dimensionValue.SetRange(Code, "Vendor Ledger Entry"."Global Dimension 2 Code");
                        if dimensionValue.FindFirst() then begin
                            entityCode := dimensionValue.Name;
                        end;
                        SourceDesc2 := '';
                        if "Vendor Ledger Entry"."Journal Templ. Name" <> '' then begin
                            GenJournalTemplate.Reset();
                            GenJournalTemplate.SetRange(Name, "Vendor Ledger Entry"."Journal Templ. Name");
                            if GenJournalTemplate.FindFirst() then
                                SourceDesc2 := GenJournalTemplate.Description;
                        end else
                            SourceDesc2 := Format("Vendor Ledger Entry"."Document Type"); //"Vendor Ledger Entry"."Source Code";


                        CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");

                        VendLedgEntryExists := TRUE;
                        IF PrintAmountsInLCY THEN BEGIN
                            VendAmount := "Amount (LCY)";
                            VendRemainAmount := "Remaining Amt. (LCY)";
                            VendCurrencyCode := '';
                        END ELSE BEGIN
                            VendAmount := Amount;
                            VendRemainAmount := "Remaining Amount";
                            VendCurrencyCode := "Currency Code";
                        END;
                        VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                        IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                            VendEntryDueDate := 0D
                        ELSE
                            VendEntryDueDate := "Due Date";


                        CheckLedgerEntry.SETRANGE("Document No.", "Document No.");
                        IF CheckLedgerEntry.FIND('-') THEN BEGIN
                            CheckNo := CheckLedgerEntry."Check No.";
                            CheckDate := CheckLedgerEntry."Check Date";
                        END ELSE BEGIN
                            CheckNo := '';
                            CheckDate := 0D;
                        END;

                        IF "Document Type" = "Document Type"::Invoice THEN BEGIN
                            PurchInvLine.SETRANGE("Document No.", "Document No.");
                            PurchInvLine.SETRANGE(Type, PurchInvLine.Type::Item);
                            PurchInvLine.SETFILTER(Quantity, '>%1', 0);
                            IF PurchInvLine.FIND('-') THEN BEGIN
                                IF ItemCategory.GET(PurchInvLine."Item Category Code") THEN BEGIN
                                    IF ItemCategory.Description <> '' THEN BEGIN
                                        ItemCategoryName := ItemCategory.Description;
                                        DocDate := "Vendor Ledger Entry"."Document Date";
                                    END
                                    ELSE BEGIN
                                        ItemCategoryName := ItemCategory.Code;
                                        DocDate := "Vendor Ledger Entry"."Document Date";
                                    END;
                                END ELSE
                                    ItemCategoryName := '';
                            END
                            ELSE
                                ItemCategoryName := "Vendor Ledger Entry".Description;

                        END;

                        IF "Document Type" = "Document Type"::"Credit Memo" THEN BEGIN
                            PurchCrMemoLine.SETRANGE("Document No.", "Document No.");
                            PurchCrMemoLine.SETRANGE(Type, PurchCrMemoLine.Type::Item);
                            PurchCrMemoLine.SETFILTER(Quantity, '>%1', 0);
                            IF PurchCrMemoLine.FIND('-') THEN BEGIN
                                IF ItemCategory.GET(PurchCrMemoLine."Item Category Code") THEN BEGIN
                                    IF ItemCategory.Description <> '' THEN BEGIN
                                        ItemCategoryName := ItemCategory.Description;
                                        DocDate := "Vendor Ledger Entry"."Document Date";
                                    END
                                    ELSE BEGIN
                                        ItemCategoryName := ItemCategory.Code;
                                        DocDate := "Vendor Ledger Entry"."Document Date";
                                    END;
                                END ELSE
                                    ItemCategoryName := '';
                            END
                            ELSE
                                ItemCategoryName := "Vendor Ledger Entry".Description;

                        END;

                        IF "Document Type" <> "Document Type"::Invoice THEN
                            IF "Document Type" <> "Document Type"::"Credit Memo" THEN
                                IF "Document Type" <> "Document Type"::Payment THEN
                                    ItemCategoryName := Description;
                        PurchInvHEader.RESET;
                        PurchInvHEader.SETRANGE("No.", "Vendor Ledger Entry"."Document No.");
                        //PurchInvHEader.SetRange(Cancelled, false);  //*** ALLE MY_01-12-22
                        IF PurchInvHEader.FIND('-') THEN
                            PreAssNo := PurchInvHEader."Pre-Assigned No.";

                        IF ("Document Type" = "Document Type"::Payment) OR (("Document Type" = "Document Type"::" ") OR (Amount > 0)) THEN BEGIN
                            BankAccount.SETRANGE("No.", "Bal. Account No.");
                            IF BankAccount.FIND('-') THEN BEGIN
                                ItemCategoryName := BankAccount.Name;
                                DocDate := 0D;
                            END;
                        END;

                        //Comment SV
                        // IF VendBalanceLCY < 0 THEN
                        //     CreBal := ABS(VendBalanceLCY)
                        // ELSE
                        //     DeBal := ABS(VendBalanceLCY);
                        //Comment SV
                        IF VendBalanceLCY < 0 THEN begin
                            CreBal := ABS(VendBalanceLCY);
                            BalDes := 'Cr.';
                        end ELSE begin
                            DeBal := ABS(VendBalanceLCY);
                            BalDes := 'Dr.';
                        end;

                        //TotDrAmt+="Vendor Ledger Entry"."Debit Amount";
                        //TotCrAmt+="Vendor Ledger Entry"."Credit Amount";

                        //MESSAGE('%1..%2DR',"Debit Amount",TotDrAmt);
                        //MESSAGE('%1..%2CR',"Credit Amount",TotCrAmt);

                        //AlleSS BT10084 27.08.2019---Start
                        i := 1;
                        CLEAR(Comments);
                        PurchCommentLine.RESET;
                        //PurchCommentLine.SETRANGE("Document Type","Document Type");
                        PurchCommentLine.SETRANGE("No.", "Document No.");
                        IF PurchCommentLine.FINDFIRST THEN
                            REPEAT
                                Comments[i] := PurchCommentLine.Comment;
                                i += 1;
                            UNTIL PurchCommentLine.NEXT = 0;

                        j := 1;
                        CLEAR(Narration);
                        PostedNarration.RESET;
                        PostedNarration.SETRANGE("Transaction No.", "Transaction No.");
                        IF PostedNarration.FINDFIRST THEN
                            REPEAT
                                Narration[j] := PostedNarration.Narration;
                                j += 1;
                            UNTIL PostedNarration.NEXT = 0;

                        //AlleSS BT10084 27.08.2019---End
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    VendLedgEntryExists := FALSE;
                    CurrReport.CREATETOTALS(VendAmount, "Amount (LCY)");
                    //SETRANGE("Global Dimension 1 Code",RespCnt.Code);
                end;
            }
            // dataitem("Integer"; "Integer")
            // {
            //     DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            //     column(Vendor_Name_Control27; Vendor.Name)
            //     {
            //     }
            //     column(DeBal_Control1000000082; DeBal)
            //     {
            //         AutoFormatType = 1;
            //     }
            //     column(CreBal_Control1000000083; CreBal)
            //     {
            //         AutoFormatType = 1;
            //     }
            //     column(Vendor_Ledger_Entry___Debit_Amount_; "Vendor Ledger Entry"."Debit Amount")
            //     {
            //     }
            //     column(Vendor_Ledger_Entry___Credit_Amount_; "Vendor Ledger Entry"."Credit Amount")
            //     {
            //     }
            //     column(Vendor_Name_Control1000000046; Vendor.Name)
            //     {
            //     }
            //     column(DeBal_Control1000000084; DeBal)
            //     {
            //         AutoFormatType = 1;
            //     }
            //     column(CreBal_Control1000000085; CreBal)
            //     {
            //         AutoFormatType = 1;
            //     }
            //     column(Vendor_Ledger_Entry___Debit_Amount__Control1000000003; "Vendor Ledger Entry"."Debit Amount")
            //     {
            //     }
            //     column(Vendor_Ledger_Entry___Credit_Amount__Control1000000048; "Vendor Ledger Entry"."Credit Amount")
            //     {
            //     }
            //     column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            //     {
            //     }
            //     column(Closing_BalanceCaption_Control1000000047; Closing_BalanceCaption_Control1000000047Lbl)
            //     {
            //     }
            //     column(Integer_Number; Number)
            //     {
            //     }


            //     trigger OnAfterGetRecord()
            //     begin
            //         ReferenceNo.Reset();
            //         ReferenceNo.SetRange("Document No.", VendorLedgerEntry."Document No.");
            //         if ReferenceNo.FindFirst() then
            //             RefNo := ReferenceNo."Reference Invoice Nos.";
            //         IF NOT VendLedgEntryExists AND ((StartBalanceLCY = 0) OR ExcludeBalanceOnly) THEN BEGIN
            //             StartBalanceLCY := 0;
            //             CurrReport.SKIP;
            //         END;
            //     end;

            //     trigger OnPreDataItem()
            //     begin
            //         //ItemCategoryName:='';
            //     end;
            // }

            trigger OnAfterGetRecord()
            var
                Test: Record "Detailed Vendor Ledg. Entry";
            begin
                TotDrAmt := 0;
                TotCrAmt := 0;

                OpeCreBal := 0;
                OpeDeBal := 0;
                Clear(OpenBalDes);
                StartBalanceLCY := 0;
                StartBalAdjLCY := 0;
                IF VendDateFilter <> '' THEN BEGIN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        // SETRANGE("Global Dimension 1 Filter", "Vendor Ledger Entry".GetFilter("Global Dimension 1 Code"));
                        CALCFIELDS("Net Change (LCY)");
                        StartBalanceLCY := -"Net Change (LCY)";
                    END;

                    SETFILTER("Date Filter", VendDateFilter);
                    CALCFIELDS("Net Change (LCY)");
                    StartBalAdjLCY := -"Net Change (LCY)";
                    VendorLedgerEntry.SETCURRENTKEY("Vendor No.", "Posting Date");
                    VendorLedgerEntry.SETRANGE("Vendor No.", Vendor."No.");
                    VendorLedgerEntry.SETFILTER("Posting Date", VendDateFilter);
                    IF VendorLedgerEntry.FIND('-') THEN
                        REPEAT
                            VendorLedgerEntry.SETFILTER("Date Filter", VendDateFilter);
                            VendorLedgerEntry.CALCFIELDS("Amount (LCY)");
                            StartBalAdjLCY := StartBalAdjLCY - VendorLedgerEntry."Amount (LCY)";
                            Test.SETCURRENTKEY("Vendor Ledger Entry No.", "Entry Type", "Posting Date");
                            Test.SETRANGE("Vendor Ledger Entry No.", VendorLedgerEntry."Entry No.");
                            Test.SETFILTER("Entry Type", '%1|%2',
                              Test."Entry Type"::"Correction of Remaining Amount",
                              Test."Entry Type"::"Appln. Rounding");
                            Test.SETFILTER("Posting Date", VendDateFilter);
                            IF Test.FIND('-') THEN
                                REPEAT
                                    StartBalAdjLCY := StartBalAdjLCY - Test."Amount (LCY)";
                                UNTIL Test.NEXT = 0;
                            Test.RESET;
                        UNTIL VendorLedgerEntry.NEXT = 0;
                END;

                //CurrReport.PRINTONLYIFDETAIL := ExcludeBalanceOnly OR (StartBalanceLCY = 0);
                VendBalanceLCY := StartBalanceLCY + StartBalAdjLCY;
                CreBal := 0;
                DeBal := 0;
                Clear(BalDes);

                //Comment SV
                // IF StartBalanceLCY < 0 THEN
                //     CreBal := ABS(StartBalanceLCY)
                // ELSE
                //     DeBal := ABS(StartBalanceLCY);
                //Comment SV
                IF StartBalanceLCY < 0 THEN begin
                    // if "Vendor Ledger Entry"."TDS Section Code" <> '' then begin
                    //     CreBal := ABS(StartBalanceLCY) + "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                    //     BalDes := 'Cr.'
                    // end else begin
                    CreBal := ABS(StartBalanceLCY);
                    BalDes := 'Cr.'
                    //end;

                end ELSE begin
                    // if "Vendor Ledger Entry"."TDS Section Code" <> '' then begin
                    //     DeBal11 := "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                    //     BalDes := 'Dr.'
                    // end else begin
                    DeBal := ABS(StartBalanceLCY);
                    BalDes := 'Dr.'
                    //  end;

                end;
                //Comment SV
                // IF StartBalanceLCY < 0 THEN
                //     OpeCreBal := ABS(StartBalanceLCY)
                // ELSE
                //     OpeDeBal := ABS(StartBalanceLCY);
                //Comment SV
                IF StartBalanceLCY < 0 THEN begin
                    // if "Vendor Ledger Entry"."TDS Section Code" <> '' then begin
                    //     OpeCreBal := ABS(StartBalanceLCY) + "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                    // end else
                    OpeCreBal := ABS(StartBalanceLCY);
                    if OpeCreBal = 0 then begin
                        OpenBalDes := 'Nil';
                    end else begin
                        OpenBalDes := 'Cr.';
                    end;
                end ELSE begin
                    OpeDeBal := ABS(StartBalanceLCY);
                    if OpeDeBal = 0 then begin
                        OpenBalDes := 'Nil';
                    end else begin
                        OpenBalDes := 'Dr.';
                    end;
                end;

                VLECr := 0;
                VLEDr := 0;
                TDSAmt := 0;

                //Alle-HB-12oct15

                VLE.RESET;
                VLE.SETRANGE("Vendor No.", "No.");
                VLE.SETRANGE("Posting Date", MinDate, MaxDate);
                if branchFilter <> '' then
                    VLE.SETFILTER("Global Dimension 1 Code", branchFilter);
                VLE.SETRANGE("Date Filter", MinDate, MaxDate);
                IF VLE.FINDSET THEN BEGIN
                    REPEAT
                        VLE.CALCFIELDS("Credit Amount");
                        VLE.CALCFIELDS("Debit Amount");
                        VLE.CALCFIELDS("Amount (LCY)");
                        VLEDr += VLE."Debit Amount";
                        if VLE."Document Type" = VLE."Document Type"::"Credit Memo" then
                            VLEDr += VLE."Credit Amount"
                        else
                            VLECr += VLE."Credit Amount";
                        // VLECr += VLE."Credit Amount";

                        // TDSAmt += VLE."Total TDS Including SHE CESS";
                        VLEBalanceLCY += VLE."Amount (LCY)";
                    UNTIL VLE.NEXT = 0;
                    //SV Comment
                    // IF VLEBalanceLCY < 0 THEN
                    //     CreBal := ABS(VLEBalanceLCY)
                    // ELSE
                    //     DeBal := ABS(VLEBalanceLCY);
                    //SV Comment
                    IF VLEBalanceLCY < 0 THEN begin
                        CreBal := ABS(VLEBalanceLCY);
                        BalDes := 'Cr.';
                    end ELSE begin
                        DeBal := ABS(VLEBalanceLCY);
                        BalDes := 'Dr.';
                    end;
                END;

                //Alle-HB-12oct15
            end;
            // end;

            trigger OnPreDataItem()
            begin
                //Vendor.SETRANGE("Responsibility Center",ResCen.Code);
                CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS("Vendor Ledger Entry"."Amount (LCY)", StartBalanceLCY, Correction, ApplicationRounding);
                // IF RespCnt.GET(RespCnt.Code) THEN
                //  gCompaddress := RespCnt.Address + ', '+RespCnt."Address 2" +', '+
                //                          RespCnt.City +' - '+RespCnt."Post Code";
                // ResAdd := ResCen.Address+','+ResCen."Address 2"+','+ResCen.City+'-'+ResCen."Post Code";
                CompanyInfo.Get();
            end;
        }
    }//As

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                field("View Applied Entries"; ViewAppliedEntries)
                {
                    ApplicationArea = All;
                }
                field("Skow Amount in LCY"; PrintAmountsInLCY)
                {
                    ApplicationArea = All;
                }
                field("Exclude Vendors That Have A Balance Only"; ExcludeBalanceOnly)
                {
                    ApplicationArea = All;
                    Caption = 'Exclude Vendors That Have A Balance Only';
                }
                field(PrintDetail; PrintDetail)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Print Narration"; PrintNarration)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }


    labels
    {
    }

    trigger OnInitReport()
    begin
        m := 1;
    end;

    trigger OnPostReport()
    begin
        IF ExporttoExcel = TRUE THEN BEGIN
            //ExcelBUff.CreateBook; // BIS 1145
            //ExcelBUff.CreateSheet('Vender Ledger','Vender Ledger',COMPANYNAME,USERID);// BIS 1145
            //ExcelBUff.GiveUserControl;// BIS 1145
        END;
    end;

    trigger OnPreReport()
    var
    begin
        Dated := Today;
        companyname.get();
        Name[1] := companyname.Name;
        //ResCen.GET(UserMgt.GetRespCenterFilter);
        VendFilter := Vendor.GETFILTERS;
        branchFilter := "Vendor Ledger Entry".GetFilter("Global Dimension 1 Code");
        VendDateFilter := Vendor.GETFILTER("Date Filter");
        MinDate := Vendor.GETRANGEMIN("Date Filter");
        MaxDate := Vendor.GETRANGEMAX("Date Filter");

        WITH "Vendor Ledger Entry" DO
            IF PrintAmountsInLCY THEN BEGIN
                AmountCaption := FIELDCAPTION("Amount (LCY)");
                RemainingAmtCaption := FIELDCAPTION("Remaining Amt. (LCY)");
            END ELSE BEGIN
                AmountCaption := FIELDCAPTION(Amount);
                RemainingAmtCaption := FIELDCAPTION("Remaining Amount");
            END;
    end;

    var
        Text000: Label 'Period: %1';
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        VendFilter: Text[250];
        branchFilter: Code[20];
        VendDateFilter: Text[30];
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendBalanceLCY: Decimal;
        VendEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        ExcludeBalanceOnly: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        VendLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        VendCurrencyCode: Code[10];
        "---MES": Integer;
        CheckLedgerEntry: Record "Check Ledger Entry";
        CheckNo: Code[20];
        CheckDate: Date;

        VLE2: Record "Vendor Ledger Entry";
        RefInvNo: Code[30];
        CompanyInfo: Record "Company Information";
        PurchInvLine: Record "Purch. Inv. Line";
        ItemCategory: Record "Item Category";
        ItemCategoryName: Text[200];
        DimensionValue: Record "Dimension Value";
        ViewAppliedEntries: Boolean;
        BankAccount: Record "Bank Account";
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        RespCnt: Record "Responsibility Center";
        gCompaddress: Text[150];
        DocDate: Date;
        ResCen: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        ResAdd: Code[150];
        CreBal: Decimal;
        DeBal: Decimal;
        BalDes: Text[30];
        CreBal1: Decimal;
        DeBal1: Decimal;
        CreBal2: Decimal;
        DeBal2: Decimal;
        SumDebit: Decimal;
        SumCredit: Decimal;
        SumDebit1: Decimal;
        SumCredit1: Decimal;
        PurchInvHEader: Record "Purch. Inv. Header";
        PreAssNo: Code[20];
        ExporttoExcel: Boolean;
        ExcelBUff: Record "Excel Buffer" temporary;
        NotDecimalValues: Boolean;
        m: Integer;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Vendor_LedgerCaptionLbl: Label 'Vendor Ledger';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        BalanceCaptionLbl: Label 'Balance';
        CheckDateCaptionLbl: Label 'Chq. Date';
        CheckNoCaptionLbl: Label 'Chq. No';
        Invoice_No_CaptionLbl: Label 'Invoice No.';
        NarrationCaptionLbl: Label 'Narration';
        Doc__No_CaptionLbl: Label 'Doc. No.';
        Invoice_DateCaptionLbl: Label 'Invoice Date';
        Debit_Bal_CaptionLbl: Label 'Debit Bal.';
        Credit_Bal_CaptionLbl: Label 'Credit Bal.';
        TDS_AmountCaptionLbl: Label 'TDS Amount';
        Pre_AsgNoCaptionLbl: Label 'Pre.AsgNo';
        BalanceCaption_Control1000000025Lbl: Label 'Balance';
        Credit_AmountCaptionLbl: Label 'Credit Amount';
        Debit_AmountCaptionLbl: Label 'Debit Amount';
        Chq__DateCaptionLbl: Label 'Chq. Date';
        NarrationCaption_Control1000000041Lbl: Label 'Narration';
        Doc__No_Caption_Control1000000042Lbl: Label 'Doc. No.';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Invoice_No_Caption_Control1000000044Lbl: Label 'Invoice No.';
        Chq__No_CaptionLbl: Label 'Chq. No.';
        Invoice_DateCaption_Control1000000052Lbl: Label 'Invoice Date';
        Credit_Bal_Caption_Control1000000056Lbl: Label 'Credit Bal.';
        Debit_Bal_Caption_Control1000000057Lbl: Label 'Debit Bal.';
        TDS_AmountCaption_Control1000000097Lbl: Label 'TDS Amount';
        Pre_AsgNoCaption_Control1000000071Lbl: Label 'Pre.AsgNo';
        Opening_BalanceCaptionLbl: Label 'Opening Balance';
        Adj__of_Opening_BalanceCaptionLbl: Label 'Adj. of Opening Balance';
        Total__LCY_CaptionLbl: Label 'Total (LCY)';
        Total_Adj__of_Opening_BalanceCaptionLbl: Label 'Total Adj. of Opening Balance';
        Total__LCY__Before_PeriodCaptionLbl: Label 'Total (LCY) Before Period';
        Total__LCY__Before_PeriodCaption_Control26Lbl: Label 'Total (LCY) Before Period';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control46Lbl: Label 'Continued';
        Closing_BalanceCaptionLbl: Label 'Closing Balance';
        Closing_BalanceCaption_Control1000000047Lbl: Label 'Closing Balance';
        OpeCreBal: Decimal;
        OpeDeBal: Decimal;
        OpenBalDes: Text[30];
        GLEntry: Record "G/L Entry";
        FirstRecord: Boolean;
        DrCrText: Text[2];
        ControlAccountName: Text[100];
        DetailAmt: Decimal;
        PrintDetail: Boolean;
        AccountName: Text[100];
        Text16500: Label 'As per Details';
        Daybook: Report "Day Book";
        DrCrTextBalance: Text[2];
        ReferenceNo: Record 18011;
        OpeningDRBal: Decimal;
        OpeningCRBal: Decimal;
        TransDebits: Decimal;
        refNo: Code[50];
        TransCredits: Decimal;
        TotCrAmt, CrAmt2 : Decimal;
        TotDrAmt, DrAmt2 : Decimal;
        VLE: Record "Vendor Ledger Entry";
        VLECr: Decimal;
        DeBal11: Decimal;
        VLEDr: Decimal;
        MinDate: Date;
        MaxDate: Date;
        VLEBalanceLCY: Decimal;
        PrintNarration: Boolean;
        i: Integer;
        Comments: array[50] of Text[80];
        PurchCommentLine: Record "Purch. Comment Line";
        j: Integer;
        Narration: array[200] of Text[1024];
        PostedNarration: Record "Posted Narration";
        CostCenter: Code[50];
        Branch: Code[50];
        Employee: Code[50];
        FY: Code[20];
        SalComponent: Code[50];
        SecDeposit: Code[50];
        Retention: Code[50];
        PaymentType: Code[50];
        DimensionSetEntry: Record "Dimension Set Entry";
        vouchertype: Code[50];
        entitycode: Code[50];
        GenJournalTemplate: Record "Gen. Journal Template";
        SourceDesc2: Text[50];
        invdoc: Decimal;
        companyname: Record "Company Information";
        Name: array[8] of Text[1000];
        TDSAmt: Decimal;
        Dated: Date;
        FA: Report 5605;
        skip: Boolean;
        Narra: Text[200];
}