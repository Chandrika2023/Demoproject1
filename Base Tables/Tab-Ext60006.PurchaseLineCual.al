tableextension 60006 "PurchaseLineCu.al" extends "Purchase Line"
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
