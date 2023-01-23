report 50032 ExampleMonthYear
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    ProcessingOnly = true;
    Caption = 'ExampleMonthYear';
    
    
    dataset
    {
        dataitem(Integer;Integer)
        {
        
            
        
                
        
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
                    /*field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }*/
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
        StartingDateGvar:date;
        EndingDateGvar:Date;
        StartingDate1Gvar:Date;
        ExcelBuffer1: Record "Excel Buffer" temporary;
         procedure makeexcelheader()
    begin
        ExcelBuffer1.NewRow;
        ExcelBuffer1.AddColumn('SL NO.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
        ExcelBuffer1.AddColumn('INDENT NUMBER', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuffer1."Cell Type"::Text);
    end;

}