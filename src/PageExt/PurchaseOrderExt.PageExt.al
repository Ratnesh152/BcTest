pageextension 50051 "SSE Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("AXT Workflow Sub Document Type"; Rec."AXT Workflow Sub Document Type")
            {
                ApplicationArea = All;
            }
            field("AXT Order Type"; Rec."AXT Order Type")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Archive Document")
        {
            action("Terms and Conditions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Caption = 'Terms and Conditions';
                Image = ViewComments;
                RunObject = Page "SSE PO Term Details";
                RunPageLink = "Purchase Order No." = FIELD("No.");
            }

            action("Xml Download")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = XMLFile;
                trigger OnAction()
                begin
                    CreateXmlDemo;
                end;
            }
        }
    }
    var
        TempBlob: Codeunit "Temp Blob";
        Instr: InStream;
        Outstr: OutStream;
        ReadAs: Text;
        WriteText: Text;

    local procedure CreateXmlDemo()
    var
        xmlElem, xmlElem2, xmlElem3, xmlElem4, xmlElem5, xmlElem6, xmlElem7, xmlElem8, xmlElem9, xmlElem10, xmlElem11, xmlElem12, xmlElem13, xmlElem14 : XmlElement;

        RootNode: XmlElement;
        XmlDoc: XmlDocument;
        XmlDec: XmlDeclaration;
        XmlResult: Text;
        NodeElm: XmlNode;
    begin
        xmlDoc := xmlDocument.Create();

        xmlDec := xmlDeclaration.Create('1.0', 'utf-8', 'yes');
        xmlDoc.SetDeclaration(xmlDec);

        xmlElem := xmlElement.Create('Document');
        xmlElem.SetAttribute('', 'urn:iso:std:iso:20022:tech:xsd:pain.001.001.03');

        xmlElem2 := XmlElement.Create('CstmrCdtTrfInitn');
        xmlElem3 := XmlElement.Create('GrpHdr');

        xmlElem4 := XmlElement.Create('MsgId');
        xmlElem4.add(XmlText.Create('UNIQUE-MESSAGE_REFERENCE'));
        xmlElem3.add(xmlElem4);

        xmlElem5 := XmlElement.Create('CreDtTm');
        xmlElem5.add(XmlText.Create('2023-01-01T10:09:56Z'));
        xmlElem3.add(xmlElem5);

        xmlElem6 := XmlElement.Create('NbOfTxs');
        xmlElem6.add(XmlText.Create('1'));
        xmlElem3.add(xmlElem6);

        xmlElem7 := XmlElement.Create('CtrlSum');
        xmlElem7.add(XmlText.Create('123456.00'));
        xmlElem3.add(xmlElem7);

        xmlElem8 := XmlElement.Create('InitgPty');

        xmlElem9 := XmlElement.Create('Nm');
        xmlElem9.Add(XmlText.Create('PAYMENT INITIATING PARTY NAME'));
        xmlElem8.Add(xmlElem9);

        xmlElem10 := XmlElement.Create('Id');

        xmlElem11 := XmlElement.Create('PrvtId');

        xmlElem12 := XmlElement.Create('Othr');

        xmlElem13 := XmlElement.Create('Id');
        xmlElem13.Add(XmlText.Create('ABCDABCD'));
        xmlElem12.Add(xmlElem13);

        xmlElem11.Add(xmlElem12);
        xmlElem10.Add(xmlElem11);
        xmlElem8.Add(xmlElem10);
        xmlElem3.Add(xmlElem8);
        xmlElem2.Add(xmlElem3);
        xmlElem.Add(xmlElem2);
        XmlDoc.Add(xmlElem);

        TempBlob.CreateInStream(InStr);
        TempBlob.CreateOutStream(Outstr);
        XmlDoc.WriteTo(Outstr);
        Outstr.WriteText(WriteText);
        Instr.ReadText(WriteText);
        ReadAs := 'xmltext.xml';
        DownloadFromStream(Instr, '', '', '', ReadAs);
    end;
}