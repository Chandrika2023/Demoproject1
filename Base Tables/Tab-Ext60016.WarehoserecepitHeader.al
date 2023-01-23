tableextension 60016 WarehoserecepitHeader extends "Warehouse Receipt Header"
{
    fields
    {
        field(50001; "Test Field1"; Code[10])
        {
            Caption = 'Test Field1';
            DataClassification = ToBeClassified;
        }
    }
}
