report 50030 ExampleReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;

    dataset
    {
        dataitem(PurchInvHeader; "Purch. Inv. Header")
        {
            RequestFilterFields = "Posting Date";
            trigger OnAfterGetRecord()
            begin
                PurchaseInvoiceLine.Reset();
                PurchaseInvoiceLine.SetRange("Document No.", PurchInvHeader."No.");
                if PurchaseInvoiceLine.FindSet() then
                    repeat
                        TotalQuanity += PurchaseInvoiceLine."Direct Unit Cost";

                    until PurchaseInvoiceLine.Next = 0;

            end;






        }
    }

   requestpage
    {
        layout
        {
            area(Content)
            {
                /*group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }*/
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    /*rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }*/

    var
        myInt: Integer;
        PurchaseInvoiceLine: Record "Purch. Inv. Line";
        TotalQuanity: Decimal;
}