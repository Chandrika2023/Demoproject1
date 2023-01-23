page 50002 DemoPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = DemoTable;
    caption = 'Demo Page';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("SNO."; Rec."SNO.")
                {
                    ApplicationArea = All;

                }
                field(CustName; Rec.CustName)
                {
                    ApplicationArea = all;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}