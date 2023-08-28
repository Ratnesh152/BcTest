// //ALLE - 25.05.2020/ALLE/NI - Create new codeunit to pull AQ vendors into NAV. This Codeunit will be also 
// //                            created for Job Queue to schedule automatically pull AQ Vendors.
// codeunit 50000 "PullAQ_Vendors"
// {
//     trigger OnRun()
//     begin
//         UpdateVendor();
//         PriceDataUpdate();
//     end;

//     procedure UpdateVendor()
//     var
//         HttpClient: HttpClient;
//         RequestHeader: HttpHeaders;
//         RequestContent: HttpContent;
//         RequestMessage: HttpRequestMessage;
//         ContectHeader: HttpHeaders;
//         ResponseMessage: HttpResponseMessage;
//         jsonToken: JsonToken;
//         jsonToken1: JsonToken;
//         JsonValue: JsonValue;
//         JsonObject: JsonObject;
//         JsonArray: JsonArray;
//         JsonText: Text;
//         i: Integer;
//         ManufacturerWebURL: Text;
//     begin
//         ManufacturerWebURL := 'https://api.aq-fes.com/products-api/manufacturers/';
//         RequestHeader := HttpClient.DefaultRequestHeaders();
//         RequestHeader.Add('Ocp-Apim-Subscription-Key', '4ccdd5cb595a4293ba3f9837ec7ccd85');
//         RequestHeader.add('aq-languagecode', 'en');
//         HttpClient.Get(ManufacturerWebURL, ResponseMessage);
//         ResponseMessage.Content.ReadAs(JsonText);
//         if jsonToken.ReadFrom(JsonText) then begin
//             JsonToken.SelectToken('data', jsonToken1);
//             JsonArray := jsonToken1.AsArray();
//             for i := 0 to JsonArray.Count - 1 do begin
//                 JsonArray.Get(i, JsonToken);
//                 InsertVendorData(jsonToken);
//             end;
//         end;
//     end;

//     procedure PriceDataUpdate()
//     var
//         HttpClient: HttpClient;
//         RequestHeader: HttpHeaders;
//         RequestContent: HttpContent;
//         RequestMessage: HttpRequestMessage;
//         ContectHeader: HttpHeaders;
//         ResponseMessage: HttpResponseMessage;
//         jsonToken: JsonToken;
//         jsonToken1: JsonToken;
//         JsonValue: JsonValue;
//         JsonObject: JsonObject;
//         JsonArray: JsonArray;
//         JsonText: Text;
//         i: Integer;
//         PriceDateWebURL: Text;
//     begin
//         PriceDateWebURL := 'https://api.aq-fes.com/products-api/priceupdates';
//         RequestHeader := HttpClient.DefaultRequestHeaders();
//         RequestHeader.Add('Ocp-Apim-Subscription-Key', '4ccdd5cb595a4293ba3f9837ec7ccd85');
//         RequestHeader.add('aq-languagecode', 'en');
//         HttpClient.Get(PriceDateWebURL, ResponseMessage);
//         ResponseMessage.Content.ReadAs(JsonText);
//         if jsonToken.ReadFrom(JsonText) then begin
//             JsonToken.SelectToken('Data', jsonToken1);
//             JsonArray := jsonToken1.AsArray();
//             for i := 0 to JsonArray.Count - 1 do begin
//                 JsonArray.Get(i, JsonToken);
//                 PriceDateUpdate(jsonToken);
//             end;
//         end;
//         if GuiAllowed then
//             Message('Process Completed');
//     end;

//     procedure PullItemCatalog(AQVendorId: Text[50])
//     var
//         HttpClient: HttpClient;
//         RequestHeader: HttpHeaders;
//         RequestContent: HttpContent;
//         RequestMessage: HttpRequestMessage;
//         ContectHeader: HttpHeaders;
//         ResponseMessage: HttpResponseMessage;
//         jsonToken: JsonToken;
//         jsonToken1: JsonToken;
//         JsonValue: JsonValue;
//         JsonObject: JsonObject;
//         JsonArray: JsonArray;
//         JsonText: Text;
//         i: Integer;
//         ItemCatalogWebURL: Text;
//         CompleteItemCatalogWebURL: Text;
//     begin
//         ItemCatalogWebURL := 'https://api.aq-fes.com/products-api/manufacturers/';
//         CompleteItemCatalogWebURL := ItemCatalogWebURL + AQVendorId + '/products';
//         RequestHeader := HttpClient.DefaultRequestHeaders();
//         RequestHeader.Add('Ocp-Apim-Subscription-Key', '4ccdd5cb595a4293ba3f9837ec7ccd85');
//         RequestHeader.add('aq-languagecode', 'en');
//         HttpClient.Get(CompleteItemCatalogWebURL, ResponseMessage);
//         ResponseMessage.Content.ReadAs(JsonText);
//         if jsonToken.ReadFrom(JsonText) then begin
//             JsonToken.SelectToken('data', jsonToken1);
//             JsonArray := jsonToken1.AsArray();
//             for i := 0 to JsonArray.Count - 1 do begin
//                 JsonArray.Get(i, JsonToken);
//                 InsertItemCatalog(jsonToken);
//             end;
//         end;
//     end;

//     procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken;
//     begin
//         if not JsonObject.Get(TokenKey, JsonToken) then
//             Error('Could not find a token with key %1', TokenKey);
//     end;

//     procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken;
//     begin
//         if not JsonObject.SelectToken(Path, JsonToken) then
//             Error('Could not find a token with path %1', Path);
//     end;

//     procedure GetNavVendorNo(AQVendorNo: Text[30]): Code[20]
//     var
//         Vendor: Record Vendor;
//         AQVendorInt: Integer;
//     begin
//         Evaluate(AQVendorInt, AQVendorNo);
//         Vendor.Reset();
//         // Vendor.SetRange("AutoQuotes Vendor No", AQVendorInt);
//         IF Vendor.FindFirst() then
//             exit(Vendor."No.");
//     end;

//     procedure InsertItemCatalog(JsonToken: JsonToken);
//     var
//         JsonObject: JsonObject;
//         VendorID: Text[100];
//         ItemID: TEXT[100];
//         ItemModel: Text[50];
//         ItemName: Text;
//         ItemCategory: Text[250];
//         ItemListPrice: Decimal;
//         MAPmrpPrice: Decimal;   //ALLEHB
//         ItemNetPrice: Decimal;
//         ItemHeight: Decimal;
//         ItemWidth: Decimal;
//         ItemDepth: Decimal;
//         ItemWeight: Decimal;
//         ItemSellingUnit: Text[30];
//         ItemPricedBy: text[30];
//         FreightClass: Code[10];
//         VendToStock: Decimal;
//         PackedToStock: Text[50];
//         Configurable: Boolean;
//         AQVendor: Record AutoQuotes_Vendor;
//         subjsontoken: jsonToken;
//         subjsonobject: jsonObject;
//         AQItem: Record AutoQuotes_Item;
//         Item: Record Item;
//         JsonToken1: JsonToken;
//         sppos: Integer;
//         packedbytext: Text;
//         GTIN: Text;
//         Jsonarray: JsonArray;
//     begin
//         JsonObject := JsonToken.AsObject;
//         VendorID := GetJsonToken(JsonObject, 'mfrId').AsValue().AsText();
//         ItemID := GetJsonToken(JsonObject, 'productId').AsValue().AsText();

//         JsonToken.SelectToken('models', subjsontoken);
//         subjsonobject := subjsontoken.AsObject();
//         ItemModel := GetJsonToken(subJsonObject, 'mfrModel').AsValue().AsText();

//         JsonToken.SelectToken('specifications', subjsontoken);
//         subjsonobject := subjsontoken.AsObject();
//         ItemName := GetJsonToken(subjsonobject, 'AQSpecification').AsValue().AsText();

//         if JsonToken.SelectToken('productCategory', subjsontoken) then begin
//             subjsonobject := subjsontoken.AsObject();
//             ItemCategory := GetJsonToken(subjsonobject, 'name').AsValue().AsText();  //CategoryName
//         end;

//         JsonToken.SelectToken('pricing', subjsontoken);
//         subjsonobject := subjsontoken.AsObject();
//         ItemListPrice := GetJsonToken(subJsonObject, 'listPrice').AsValue().AsDecimal();
//         ItemNetPrice := GetJsonToken(subJsonObject, 'netPrice').AsValue().AsDecimal();
//         MAPmrpPrice := GetJsonToken(subJsonObject, 'mapMrpPrice').AsValue().AsDecimal(); //ALLEHB - (aqMapPrice/mapMrpPrice)

//         JsonToken.SelectToken('productDimension', subjsontoken);
//         subjsonobject := subjsontoken.AsObject();
//         if subjsonobject.Get('productHeight', JsonToken1) then
//             ItemHeight := JsonToken1.AsValue().AsDecimal();
//         if subjsonobject.Get('productWidth', JsonToken1) then
//             ItemWidth := JsonToken1.AsValue().AsDecimal();
//         if subjsonobject.Get('productDepth', JsonToken1) then
//             ItemDepth := JsonToken1.AsValue().AsDecimal();
//         if subjsonobject.Get('shippingWeight', JsonToken1) then
//             ItemWeight := JsonToken1.AsValue().AsDecimal();

//         JsonToken.SelectToken('packingData', subjsontoken);
//         subjsonobject := subjsontoken.AsObject();
//         if not (GetJsonToken(subjsonobject, 'sellingUnit').AsValue().IsNull) then
//             ItemSellingUnit := GetJsonToken(subJsonObject, 'sellingUnit').AsValue().AsText();
//         if not (GetJsonToken(subJsonObject, 'priceBy').AsValue().IsNull) then
//             ItemPricedBy := GetJsonToken(subJsonObject, 'priceBy').AsValue().AsText();
//         if not (GetJsonToken(JsonObject, 'freightClass').AsValue().IsNull) then
//             FreightClass := GetJsonToken(JsonObject, 'freightClass').AsValue().AsText();
//         // if not (GetJsonToken(JsonObject, 'VenToStock').AsValue().IsNull) then
//         //     VendToStock := GetJsonToken(JsonObject, 'VenToStock').AsValue().AsDecimal();

//         if not (GetJsonToken(subJsonObject, 'packedBy').AsValue().IsNull) then begin
//             packedbytext := GetJsonToken(subJsonObject, 'packedBy').AsValue().AsText();
//             PackedToStock := packedbytext;
//             sppos := StrPos(packedbytext, ' ');
//             if sppos > 1 then
//                 Evaluate(VendToStock, CopyStr(packedbytext, 1, (sppos - 1)));
//         end;
//         Configurable := GetJsonToken(JsonObject, 'isConfigurable').AsValue().AsBoolean();
//         if (ItemPricedBy = 'KT') or (ItemPricedBy = 'kt') then
//             ItemPricedBy := 'KIT'
//         else
//             if (ItemPricedBy = 'CS') or (ItemPricedBy = 'cs') then
//                 ItemPricedBy := 'CASE'
//             else
//                 if (ItemPricedBy = 'ST') or (ItemPricedBy = 'st') then
//                     ItemPricedBy := 'SET'
//                 else
//                     if (ItemPricedBy = 'DZ') or (ItemPricedBy = 'dz') then
//                         ItemPricedBy := 'DOZEN'
//                     else
//                         if (ItemPricedBy = 'EA') or (ItemPricedBy = 'ea') then
//                             ItemPricedBy := 'EACH';
//         JsonToken.SelectToken('GTIN', subjsontoken);
//         subjsontoken.SelectToken('each', jsonToken1);
//         JsonArray := jsonToken1.AsArray();

//         if JsonArray.Get(0, JsonToken) then
//             GTIN := JsonToken.AsValue().AsText();

//         AQVendor.Get(VendorID);
//         IF AQItem.GET(VendorId, ItemId) THEN BEGIN
//             AQItem."AQ Vendor Nick Name" := AQVendor."AQ Vendor Nick Name";
//             AQItem."AQ Item No/Model No" := ItemModel; //COPYSTR(ItemModel, 1, 20);
//             IF STRLEN(ItemName) > 250 THEN BEGIN
//                 AQItem."AQ Item Name" := COPYSTR(ItemName, 1, 250);
//                 AQItem.Spec1 := COPYSTR(ItemName, 1, 250);
//                 AQItem.Spec2 := COPYSTR(ItemName, 251, 250);
//                 AQItem.Spec3 := COPYSTR(ItemName, 501, 250);
//                 AQItem.Spec4 := COPYSTR(ItemName, 751, 250);
//             END ELSE BEGIN
//                 AQItem."AQ Item Name" := ItemName;
//                 AQItem.Spec1 := ItemName;
//             END;
//             AQItem."AQ Item Category" := ItemCategory;
//             AQItem."List Price" := ROUND(ItemListPrice, 0.01);
//             AQItem."Net Price" := ROUND(ItemNetPrice, 0.01);
//             AQItem."MAP Price" := Round(MAPmrpPrice, 0.01); //ALLEHB
//             AQItem.Height := ItemHeight;
//             AQItem.Width := ItemWidth;
//             AQItem.Depth := ItemDepth;
//             AQItem.Weight := ItemWeight * VendToStock;
//             AQItem."Selling Unit" := ItemSellingUnit;
//             AQItem."Priced By" := ItemPricedBy;
//             AQItem.GTIN := GTIN;
//             AQItem.FreightClass := FreightClass;
//             AQItem."Vendor To Stock" := VendToStock;
//             AQItem."Packed To Stock" := PackedToStock;
//             AQItem."AQ Vendor No." := AQVendor."AQ Vendor No.";
//             AQItem."NAV Vendor No." := AQVendor."NAV Vendor No.";
//             AQItem."AQ Date Updated" := AQVendor."AQ Date Updated";
//             AQItem."NAV Item No." := GetNAVItemNo(AQItem."AQ Item No/Model No", AQItem."NAV Vendor No.");
//             AQItem.Modify(); //Alle-SS code added 12/14/22
//                              // IF AQItem.Modify() THEN BEGIN //Alle-SS code commented 12/14/22
//             IF AQItem."NAV Item No." <> '' THEN begin
//                 IF Item.GET(AQItem."NAV Item No.") THEN
//                     Item."Matched In AQ" := true
//                 ELSE
//                     Item."Matched In AQ" := false;
//                 Item.MODIFY;
//             end;
//             // end; //Alle-SS code commented 12/14/22
//         END ELSE BEGIN
//             AQItem.INIT;
//             AQItem."AQ Vendor Id" := VendorId;
//             AQItem."AQ Vendor Nick Name" := AQVendor."AQ Vendor Nick Name";
//             AQItem."AQ Item Id" := ItemId;
//             AQItem."AQ Item No/Model No" := ItemModel;//COPYSTR(ItemModel, 1, 20);
//             IF STRLEN(ItemName) > 250 THEN BEGIN
//                 AQItem."AQ Item Name" := COPYSTR(ItemName, 1, 250);
//                 AQItem.Spec1 := COPYSTR(ItemName, 1, 250);
//                 AQItem.Spec2 := COPYSTR(ItemName, 251, 250);
//                 AQItem.Spec3 := COPYSTR(ItemName, 501, 250);
//                 AQItem.Spec4 := COPYSTR(ItemName, 751, 250);
//             END ELSE BEGIN
//                 AQItem."AQ Item Name" := ItemName;
//                 AQItem.Spec1 := ItemName;
//             END;
//             AQItem."AQ Item Category" := ItemCategory;
//             AQItem."List Price" := ROUND(ItemListPrice, 0.01);
//             AQItem."Net Price" := ROUND(ItemNetPrice, 0.01);
//             AQItem."MAP Price" := Round(MAPmrpPrice, 0.01); //ALLEHB
//             AQItem.Height := ItemHeight;
//             AQItem.Width := ItemWidth;
//             AQItem.Depth := ItemDepth;
//             AQItem.Weight := ItemWeight * VendToStock;
//             AQItem."Selling Unit" := ItemSellingUnit;
//             AQItem."Priced By" := ItemPricedBy;
//             AQItem.GTIN := GTIN;
//             AQItem.FreightClass := FreightClass;
//             AQItem."Vendor To Stock" := VendToStock;
//             AQItem."Packed To Stock" := PackedToStock;
//             AQItem."AQ Vendor No." := AQVendor."AQ Vendor No.";
//             AQItem."NAV Vendor No." := AQVendor."NAV Vendor No.";
//             AQItem."AQ Date Updated" := AQVendor."AQ Date Updated";
//             AQItem."NAV Item No." := GetNAVItemNo(AQItem."AQ Item No/Model No", AQItem."NAV Vendor No.");
//             AQItem.Insert(); //Alle-SS code added 12/14/22
//                              // IF AQItem.INSERT THEN BEGIN //Alle-SS code commented 12/14/22
//             IF AQItem."NAV Item No." <> '' THEN begin
//                 IF Item.GET(AQItem."NAV Item No.") THEN
//                     Item."Matched In AQ" := TRUE
//                 ELSE
//                     Item."Matched In AQ" := FALSE;
//                 Item.MODIFY;
//             end;
//             // end; //Alle-SS code commented 12/14/22
//         END;
//     end;

//     procedure GetNAVItemNo(VendItemNo: code[50]; NAVVendorNo: code[20]): Code[20]
//     var
//         ItemVendor: Record "Item Vendor";
//         Item: Record Item;
//     begin
//         ItemVendor.RESET;
//         ItemVendor.SETRANGE(ItemVendor."Vendor Item No.", VendItemNo);
//         ItemVendor.SETRANGE("Vendor No.", NAVVendorNo);
//         IF ItemVendor.FINDFIRST THEN
//             IF Item.GET(ItemVendor."Item No.") THEN
//                 EXIT(ItemVendor."Item No.")
//             else
//                 exit('');
//     end;

//     procedure PriceDateUpdate(JsonToken: JsonToken);
//     var
//         JsonObject: JsonObject;
//         VendorID: Text[100];
//         Updated: DateTime;
//         UpdatedDate: Text;
//         ConvertedUpdatedDate: Date;
//         Day: Integer;
//         Month: Integer;
//         Year: Integer;
//         AutoQuoteVendor: Record AutoQuotes_Vendor;
//     begin
//         JsonObject := JsonToken.AsObject;
//         VendorID := GetJsonToken(JsonObject, 'VendorId').AsValue().AsText();
//         UpdatedDate := GetJsonToken(JsonObject, 'Updated').AsValue().AsText();
//         Evaluate(Day, CopyStr(UpdatedDate, 9, 2));
//         Evaluate(Month, CopyStr(UpdatedDate, 6, 2));
//         Evaluate(Year, CopyStr(UpdatedDate, 1, 4));
//         ConvertedUpdatedDate := DMY2Date(Day, Month, Year);
//         if AutoQuoteVendor.Get(VendorID) then begin
//             AutoQuoteVendor.Validate("AQ Date Updated", ConvertedUpdatedDate);
//             AutoQuoteVendor.Modify();
//         end;

//     end;

//     procedure InsertVendorData(JsonToken: JsonToken);
//     var
//         JsonObject: JsonObject;
//         VendorID: Text[100];
//         VendorNo: Text[30];
//         VendorName: Text[100];
//         VendorShortName: Text[50];
//         VendorNickName: Text[50];
//         AutoQuoteVendor: Record AutoQuotes_Vendor;
//         SalesOrder: Page "Sales Order";
//     begin
//         JsonObject := JsonToken.AsObject;
//         VendorID := GetJsonToken(JsonObject, 'mfrId').AsValue().AsText();
//         VendorNo := GetJsonToken(JsonObject, 'mfrNumber').AsValue().AsText();
//         VendorName := GetJsonToken(JsonObject, 'mfrName').AsValue().AsText();
//         VendorShortName := GetJsonToken(JsonObject, 'mfrShortName').AsValue().AsText();
//         if not AutoQuoteVendor.Get(VendorID) then begin
//             AutoQuoteVendor.Init();
//             AutoQuoteVendor."AQ Vendor Id" := VendorID;
//             AutoQuoteVendor."AQ Vendor No." := VendorNo;
//             AutoQuoteVendor."AQ Vendor Name" := VendorName;
//             AutoQuoteVendor."AQ Vendor Short Name" := VendorShortName;
//             AutoQuoteVendor."AQ Vendor Nick Name" := VendorShortName;

//             // if AutoQuoteVendor.Insert() then begin //Alle-SS code commented 12/14/22
//             AutoQuoteVendor."NAV Vendor No." := GetNavVendorNo(AutoQuoteVendor."AQ Vendor No.");
//             AutoQuoteVendor.Insert(); //Alle-SS code added 12/14/22
//             // end; //Alle-SS code commented 12/14/22
//         END ELSE begin
//             AutoQuoteVendor."AQ Vendor No." := VendorNo;
//             AutoQuoteVendor."AQ Vendor Name" := VendorName;
//             AutoQuoteVendor."AQ Vendor Short Name" := VendorShortName;
//             AutoQuoteVendor."AQ Vendor Nick Name" := VendorShortName;
//             AutoQuoteVendor."NAV Vendor No." := GetNAVvendorNo(AutoQuoteVendor."AQ Vendor No.");
//             AutoQuoteVendor.MODIFY;
//         end;
//     end;

//     var

// }