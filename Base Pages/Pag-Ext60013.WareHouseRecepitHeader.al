pageextension 60013 WareHouseRecepitHeader extends "Warehouse Receipt"
{
    layout
    {
        addafter("Assignment Time")
        {
            field("Test Field1";rec."Test Field1")
            {
            ApplicationArea=all;
            }

        }
    }

}
