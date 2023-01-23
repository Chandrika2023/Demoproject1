tableextension 60011 PurchaseHeaderCu extends "Purchase Header"
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
