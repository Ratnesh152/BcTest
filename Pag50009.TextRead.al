// page 50009 "Text Read"
// {
//     ApplicationArea = All;
//     Caption = 'Text Read';
//     PageType = List;
//     SourceTable = "Text Read";
//     UsageCategory = Lists;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Trans Id"; Rec."Trans Id")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Primary key"; Rec."Primary key")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Primary key field.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Reference Number"; Rec."Reference Number")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Tranfer comment"; Rec."Tranfer comment")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Trans Date"; Rec."Trans Date")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Transfer Amount"; Rec."Transfer Amount")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Transfer Balance"; Rec."Transfer Balance")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Transfer Currency"; Rec."Transfer Currency")
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Value Date"; Rec."Value Date")
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(Navigation)
//         {
//             action("Read Text File")
//             {
//                 ApplicationArea = All;
//                 trigger OnAction()
//                 var
//                     ImportFile: Codeunit "Import Attachment - Inc. Doc.";
//                     XmlDoc: XmlDocument;
//                     xmlnodelists: XmlNodeList;
//                     xmlnode: XmlNode;
//                     MyTable: Record "Text Read";
//                 begin
//                     ImportXmlFile();                    // Error('Select an import from the provided list to proceed');
//                 end;
//             }
//         }
//     }
//     var
//         DED: Record "Data Exch. Def";
//         tempblob: Codeunit "Temp Blob";
//         IncomingDocumentAttachment: Record "Incoming Document Attachment";

//     procedure ImportXmlFile()
//     var
//         // fromfile: Text;
//         // instr: InStream;
//         // xmlDoc1: XmlDocument;
//         // element1: XmlElement;
//         // element2: XmlElement;
//         // element3: XmlElement;
//         // element4: XmlElement;
//         // Node1: XmlNode;
//         // node2: XmlNode;
//         // node3: XmlNode;
//         // node4: XmlNode;
//         // nodelist1: XmlNodeList;
//         // nodelist2: XmlNodeList;
//         // nodelist3: XmlNodeList;
//         // readText: Record "Text Read";
//         fromfile: Text;
//         instr: InStream;
//         xmlDoc: XmlDocument;
//         Xmlelement1: XmlElement;
//         nodelist: XmlNodeList;
//         XmlNode1: XmlNode;
//         Xmlnode2: XmlNode;
//         element: XmlElement;
//         nodelist2: XmlNodeList;
//         readText: Record "Text Read";
//     begin
//         if UploadIntoStream('Upload Xml File', '', '', FromFile, Instr) then begin
//             XmlDocument.ReadFrom(instr, xmlDoc);
//             Message('File Uploaded');
//         end else
//             Error('File Not Found');
//         if xmlDoc.GetRoot(Xmlelement1) then
//             nodelist := Xmlelement1.GetChildElements();
//         foreach XmlNode1 in nodelist do begin
//             readText.Init();
//             element := XmlNode1.AsXmlElement();
//             nodelist2 := element.GetChildElements();
//             foreach Xmlnode2 in nodelist2 do begin
//                 case Xmlnode2.AsXmlElement().Name of
//                     'TranId':
//                         readText.Validate(readText."Trans Id", Xmlnode2.AsXmlElement().InnerText);
//                     'TranCcy':
//                         readText.Validate(readText."Transfer Currency", Xmlnode2.AsXmlElement().InnerText);
//                     'TranParticular':
//                         readText.Validate(readText."Tranfer comment", Xmlnode2.AsXmlElement().InnerText);
//                 end;
//             end;
//             readText.Insert();
//         end;
//     end;
// }