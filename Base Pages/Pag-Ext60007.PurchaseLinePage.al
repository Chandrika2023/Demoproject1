pageextension 60007 PurchaseLinePage extends "Purchase Order Subform"
{

    layout
    {
        addafter(Description)
        {
            field("Test Field"; rec."Test Field")
            {
                Caption = 'Test Field';
                ApplicationArea = all;
            }
        }
    }
}
