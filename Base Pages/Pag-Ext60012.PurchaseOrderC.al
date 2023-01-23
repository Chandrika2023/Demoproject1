pageextension 60012 PurchaseOrderC extends "Purchase Order"
{
    layout
    {
        addafter("Job Queue Status")
        {
            field("Test Field1"; Rec."Test Field1")
            {
                ApplicationArea = all;
            }
        }

    }
}
