report 50031 Example1
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;
    Caption = 'Example1';



    dataset
    {


        dataitem("TDS Entry"; "TDS Entry")
        {

            trigger OnPreDataItem()
            begin
                makeexcelheader();
            end;
            //RequestFilterFields = "T.A.N. No.";
            trigger OnAfterGetRecord()
            begin
                ExcelBuffer1.NewRow();
                ExcelBuffer1.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
                ExcelBuffer1.AddColumn("TDS Entry"."TDS Base Amount", FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
                ExcelBuffer1.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
                ExcelBuffer1.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
                ExcelBuffer1.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
                ExcelBuffer1.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);


            end;

        }



    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
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




    var
        myInt: Integer;
        ExcelBuffer1: Record "Excel Buffer" temporary;

    procedure makeexcelheader()
    begin
        ExcelBuffer1.NewRow;
        ExcelBuffer1.AddColumn('SL NO.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('INDENT NUMBER', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('INDENT DATE', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('PO NUMBER', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('PO DATE', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('SUPPLIER NAME', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
    end;

    LOCAL PROCEDURE CreateBook();
    BEGIN
        ExcelBuffer1.CreateBookAndOpenExcel('', 'GL Entry Dimensions', '', '', USERID);
    END;

    trigger OnPostReport()
    begin
        CreateBook();
    end;


}