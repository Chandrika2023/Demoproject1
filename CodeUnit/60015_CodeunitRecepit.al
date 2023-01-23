codeunit 60015 WareHouseRecepit
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Whse.-Create Source Document", 'OnPurchLine2ReceiptLineOnAfterInitNewLine', '', true, true)]
    local procedure OnPurchLine2ReceiptLineOnAfterInitNewLine(var WhseReceiptLine: Record "Warehouse Receipt Line"; WhseReceiptHeader: Record "Warehouse Receipt Header"; PurchaseLine: Record "Purchase Line")
    begin
        WhseReceiptLine."Test Field" := PurchaseLine."Test Field";

    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnAfterPurchaseHeaderOnAfterGetRecord', '', true, true)]
    local procedure OnAfterPurchaseHeaderOnAfterGetRecord(var WarehouseRequest: Record "Warehouse Request"; PurchaseHeader: Record "Purchase Header")
    begin
        WarehouseRequest."Test Field1" := PurchaseHeader."Test Field1";

    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeWhseReceiptHeaderInsert', '', true, true)]
    local procedure OnBeforeWhseReceiptHeaderInsert(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; var WarehouseRequest: Record "Warehouse Request")
    begin
        WarehouseReceiptHeader."Test Field1" := WarehouseRequest."Test Field1";
    end;

}