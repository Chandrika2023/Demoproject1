pageextension 60014 CustLedEntrExt extends "Customer Ledger Entries"
{
    layout
    {
        //Streams Concept
    }

    actions
    {


        addfirst(processing)
        {
            action(ExportToExt)
            {
                Caption = 'Export to Text';
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    InS: InStream;
                    OutS: OutStream;
                    FileName: Text;
                    TxtBuilder: TextBuilder;
                    CustLedgerEntry: Record "Cust. Ledger Entry";
                begin
                    FileName := 'TestFile_' + UserId + '_' + Format(CurrentDateTime) + '.txt';
                    TxtBuilder.AppendLine('Posting Date' + ',' + 'Document Type' + ',' + 'Document No.' + ',' + 'Customer No.' + ',' + 'Amount(LCY)');
                    CustLedgerEntry.Reset();
                    CustLedgerEntry.SetAutoCalcFields("Amount (LCY)");
                    if CustLedgerEntry.FindSet() then
                        repeat
                            TxtBuilder.AppendLine(Format(CustLedgerEntry."Posting Date") + ',' + Format(CustLedgerEntry."Document Type") + ',' +
                                                     CustLedgerEntry."Document No." + ',' + CustLedgerEntry."Customer No." + ',' +
                                                        Format(CustLedgerEntry."Amount (LCY)"));
                        until CustLedgerEntry.Next() = 0;
                    TempBlob.CreateOutStream(OutS);
                    OutS.WriteText(TxtBuilder.ToText());
                    TempBlob.CreateInStream(InS);
                    DownloadFromStream(InS, '', '', '', FileName);
                end;
            }
        }
    }
}




