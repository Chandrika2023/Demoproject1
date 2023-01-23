tableextension 60008 WarehouseRecepitLineTable extends "Warehouse Receipt Line"
{
    fields
    {
        field(50001; "Test Field"; Code[10])
        {
            Caption = 'Test Field';
            DataClassification = ToBeClassified;
        }
    }
}
