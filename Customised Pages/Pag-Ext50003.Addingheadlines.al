pageextension 50003 "Adding headlines" extends "Headline RC Order Processor"
{
    layout
    {
        addbefore(Control2)
        {
            field(HeadLineTxt; HeadLineTxt)
            {
                ApplicationArea = All;
            }

        }
    }
    trigger OnOpenPage()
    begin
        HeadLineTxt := 'GOOD MORNING ALL FROM CHANDRIKA';
    end;

    var
        HeadLineTxt: Text;
}
