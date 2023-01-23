pageextension 60009 WareHouseRecepitSubform extends "Whse. Receipt Subform"
{
    layout
    {
        addafter("Qty. per Unit of Measure")
        {
            field("Test Field"; Rec."Test Field")
            {
                ApplicationArea = all;
            }
        }
    }
}
