codeunit 50120 Events
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostSalesLineOnAfterTestSalesLine', '', false, false)]
    local procedure OnPostSalesLineOnAfterTestSalesLine(PreviewMode: Boolean; var CostBaseAmount: Decimal; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var WhseShptHeader: Record "Warehouse Shipment Header"; WhseShip: Boolean)
    var
        itemLedgerEntries: Record "Item Ledger Entry";
        SaleLine: Record "Sales Line";
        i: Integer;
    begin
        if SalesLine.Type = SalesLine.Type::Item then
            itemLedgerEntries.Reference := SalesHeader.Reference;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Header", , '', false, false)]
    // local procedure MyProcedure()
    // begin

    // end;
}