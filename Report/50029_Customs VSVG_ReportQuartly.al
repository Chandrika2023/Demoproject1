report 50029 "Customs VSVG Report Quartly"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    Caption = 'Customs VSVG Report Quartly';
    RDLCLayout = './CustomsVSVGReport.rdl';

    dataset

    {
        dataitem(Integer; Integer)
        {
            MaxIteration = 1;


            // RequestFilterFields = "Posting Date";

            //DataItemTableView = WHERE("Gst Customer Type" = const(Export));

            column(FormatCap; FormatCap)
            {

            }

            column(PeriodCap; PeriodCap)
            { }
            column(NameCap; NameCap)
            { }
            column(PermanentCap; PermanentCap)
            { }
            column(WebsiCap; WebsiCap)
            { }
            column(DateCap; DateCap)
            { }
            column(DetailCap; DetailCap)
            { }
            column(QuantiCap; QuantiCap)
            { }
            column(ValueCap; ValueCap)
            { }
            column(ExportCap; ExportCap)
            { }
            column(QuantityinCap; QuantityinCap)
            { }
            column(ValueinusCap; ValueinusCap)
            { }
            column(FOBCap; FOBCap)
            { }
            column(GcaCap; GcaCap)
            { }
            column(RpaCap; RpaCap)
            { }
            column(TotalCap; TotalCap)
            { }
            column(DeemedCap; DeemedCap)
            { }
            column(CumulaCap; CumulaCap)
            { }
            column(ImpoCap; ImpoCap)
            { }
            column(CumulativeimpoCap; CumulativeimpoCap)
            { }
            column(CumulatCap; CumulatCap)
            { }
            column(NetFoCap; NetFoCap)
            { }
            column(DTACap; DTACap)
            { }
            column(DTASCap; DTASCap)
            { }
            column(QuanCap; QuanCap)
            { }
            column(valCap; valCap)
            { }
            column(CaseCap; CaseCap)
            { }
            column(CaseesCap; CaseesCap)
            { }
            column(DateoCap; DateoCap)
            { }
            column(AddressCap; AddressCap)
            { }
            column(AmouCap; AmouCap)
            { }
            column(SignCap; SignCap)
            { }
            column(WithCap; WithCap)
            { }
            column(NotCap; NotCap)
            { }
            column(TheAboveCap; TheAboveCap)
            { }
            column(QprsCap; QprsCap)
            { }
            column(ThesiCap; ThesiCap)
            { }
            column(NosCap; NosCap)
            { }
            column(InrCap; InrCap)
            { }

            column(TotalQuantity; TotalQuantity)
            { }
            column(TotalAmount; TotalAmount)
            {

            }
            column(ExportForCap; ExportForCap)
            { }
            COLUMN(StartingDateG; StartingDateG)
            { }
            column(EndingDateG; EndingDateG)
            { }
            column(TotalAmount1; TotalAmount1)
            { }
            column(TotalAmount2; TotalAmount2)
            { }
            column(StartingDate1; StartingDate1)
            {

            }
            column(StartingDate2; StartingDate2)
            { }
            column(EndingDate1; EndingDate1)
            { }
            column(StartingDate3; StartingDate3)
            { }
            Column(EndingDate2; EndingDate2)
            { }
            column(TotalAmount3; TotalAmount3)
            { }
            column(GrandTotal; GrandTotal)
            {

            }
            column(PTotalAmount; PTotalAmount)
            {

            }
            column(PTotalAmount1; PTotalAmount1)
            { }
            column(PTotalAmount2; PTotalAmount2)
            { }
            column(PTotalAmount3; PTotalAmount3)
            { }
            column(PfGrandTotal; PfGrandTotal)
            { }
            column(CompanyInformation; CompanyInformation."E-Mail")
            {

            }
            column(CompanyInformationName; CompanyInformation.Name)
            {

            }




            trigger OnAfterGetRecord()
            begin
                //CompanyInformation.Get();
                Psalesinvoiceheader.Reset();
                Psalesinvoiceheader.SetRange("GST Customer Type", Psalesinvoiceheader."GST Customer Type"::Export);
                Psalesinvoiceheader.setrange("Posting Date", StartingDateG, EndingDateG);
                if Psalesinvoiceheader.FindSet() then
                    repeat

                        PSalesline.Reset();
                        PSalesline.SetRange("Document No.", Psalesinvoiceheader."No.");
                        if PSalesline.FindSet() then begin
                            PSalesline.CalcSums(Quantity);
                            TotalQuantity += PSalesline.Quantity;

                        end;

                    until Psalesinvoiceheader.Next = 0;

                Psalesinvoiceheader.Reset();
                Psalesinvoiceheader.SetRange("GST Customer Type", Psalesinvoiceheader."GST Customer Type"::Export);
                Psalesinvoiceheader.SetRange("Posting Date", StartingDateG, EndingDateG);
                if Psalesinvoiceheader.FindSet() then
                    repeat
                        CustomerLedgerEntrier.Reset();
                        CustomerLedgerEntrier.SetRange("Document No.", Psalesinvoiceheader."No.");
                        if CustomerLedgerEntrier.FindSet() then begin

                            CustomerLedgerEntrier.CalcSums("Sales (LCY)");
                            TotalAmount += CustomerLedgerEntrier."Sales (LCY)";
                        end;
                    until Psalesinvoiceheader.Next = 0;


                StartingDate1 := CalcDate('-1Y', StartingDateG);

                Psalesinvoiceheader.Reset();
                Psalesinvoiceheader.SetRange("GST Customer Type", Psalesinvoiceheader."GST Customer Type"::Export);
                Psalesinvoiceheader.SetRange("Posting Date", StartingDate1, EndingDateG);
                if Psalesinvoiceheader.FindSet() then
                    repeat
                        CustomerLedgerEntrier.Reset();
                        CustomerLedgerEntrier.SetRange("Document No.", Psalesinvoiceheader."No.");
                        if CustomerLedgerEntrier.FindSet() then begin

                            CustomerLedgerEntrier.CalcSums("Sales (LCY)");
                            TotalAmount1 += CustomerLedgerEntrier."Sales (LCY)";
                        end;
                    until Psalesinvoiceheader.Next = 0;
                StartingDate2 := CalcDate('-2Y', StartingDateG);
                EndingDate1 := CalcDate('-1Y', EndingDateG);
                Psalesinvoiceheader.Reset();
                Psalesinvoiceheader.SetRange("GST Customer Type", Psalesinvoiceheader."GST Customer Type"::Export);

                Psalesinvoiceheader.SetRange("Posting Date", StartingDate2, EndingDate1);
                if Psalesinvoiceheader.FindSet() then
                    repeat
                        CustomerLedgerEntrier.Reset();
                        CustomerLedgerEntrier.SetRange("Document No.", Psalesinvoiceheader."No.");
                        if CustomerLedgerEntrier.FindSet() then begin

                            CustomerLedgerEntrier.CalcSums("Sales (LCY)");
                            TotalAmount2 += CustomerLedgerEntrier."Sales (LCY)";
                        end;
                    until Psalesinvoiceheader.Next = 0;
                StartingDate3 := CalcDate('-3Y', StartingDateG);
                EndingDate2 := CalcDate('-2Y', EndingDateG);
                Psalesinvoiceheader.Reset();
                Psalesinvoiceheader.SetRange("GST Customer Type", Psalesinvoiceheader."GST Customer Type"::Export);
                Psalesinvoiceheader.SetRange("Posting Date", StartingDate2, EndingDate1);
                if Psalesinvoiceheader.FindSet() then
                    repeat
                        CustomerLedgerEntrier.Reset();
                        CustomerLedgerEntrier.SetRange("Document No.", Psalesinvoiceheader."No.");
                        if CustomerLedgerEntrier.FindSet() then begin

                            CustomerLedgerEntrier.CalcSums("Sales (LCY)");
                            TotalAmount3 += CustomerLedgerEntrier."Sales (LCY)";
                        end;
                    until Psalesinvoiceheader.Next = 0;
                GrandTotal := TotalAmount + TotalAmount1 + TotalAmount2 + TotalAmount3;



                Ppurchaseinvoiceheader.Reset();
                Ppurchaseinvoiceheader.setrange("GST Vendor Type", Ppurchaseinvoiceheader."GST Vendor Type"::Import);
                Ppurchaseinvoiceheader.SetRange("Posting Date", StartingDateG, EndingDateG);
                if Ppurchaseinvoiceheader.FindSet() then
                    repeat
                        VendorLedgerEntries.Reset();
                        VendorLedgerEntries.SetRange("Document No.", Ppurchaseinvoiceheader."No.");
                        if VendorLedgerEntries.FindSet() then begin
                            VendorLedgerEntries.CalcSums("Purchase (LCY)");
                            PTotalAmount += VendorLedgerEntries."Purchase (LCY)";
                        end;
                    UNTIL Ppurchaseinvoiceheader.Next = 0;

                StartingDate1 := CalcDate('-1Y', StartingDateG);

                Ppurchaseinvoiceheader.Reset();
                Ppurchaseinvoiceheader.setrange("GST Vendor Type", Ppurchaseinvoiceheader."GST Vendor Type"::Import);
                Ppurchaseinvoiceheader.SetRange("Posting Date", StartingDate1, EndingDateG);
                if Ppurchaseinvoiceheader.FindSet() then
                    repeat
                        VendorLedgerEntries.Reset();
                        VendorLedgerEntries.SetRange("Document No.", Ppurchaseinvoiceheader."No.");
                        if VendorLedgerEntries.FindSet() then begin
                            VendorLedgerEntries.CalcSums("Purchase (LCY)");
                            PTotalAmount1 += VendorLedgerEntries."Purchase (LCY)";
                        end;
                    UNTIL Ppurchaseinvoiceheader.Next = 0;
                StartingDate2 := CalcDate('-2Y', StartingDateG);
                EndingDate1 := CalcDate('-1Y', EndingDateG);
                Ppurchaseinvoiceheader.Reset();
                Ppurchaseinvoiceheader.setrange("GST Vendor Type", Ppurchaseinvoiceheader."GST Vendor Type"::Import);
                Ppurchaseinvoiceheader.SetRange("Posting Date", StartingDate2, EndingDate1);
                if Ppurchaseinvoiceheader.FindSet() then
                    repeat
                        VendorLedgerEntries.Reset();
                        VendorLedgerEntries.SetRange("Document No.", Ppurchaseinvoiceheader."No.");
                        if VendorLedgerEntries.FindSet() then begin
                            VendorLedgerEntries.CalcSums("Purchase (LCY)");
                            PTotalAmount2 += VendorLedgerEntries."Purchase (LCY)";
                        end;
                    UNTIL Ppurchaseinvoiceheader.Next = 0;
                StartingDate3 := CalcDate('-3Y', StartingDateG);
                EndingDate2 := CalcDate('-2Y', EndingDateG);
                Ppurchaseinvoiceheader.Reset();
                Ppurchaseinvoiceheader.setrange("GST Vendor Type", Ppurchaseinvoiceheader."GST Vendor Type"::Import);
                Ppurchaseinvoiceheader.SetRange("Posting Date", StartingDate3, EndingDate2);
                if Ppurchaseinvoiceheader.FindSet() then
                    repeat
                        VendorLedgerEntries.Reset();
                        VendorLedgerEntries.SetRange("Document No.", Ppurchaseinvoiceheader."No.");
                        if VendorLedgerEntries.FindSet() then begin
                            VendorLedgerEntries.CalcSums("Purchase (LCY)");
                            PTotalAmount3 += VendorLedgerEntries."Purchase (LCY)";
                        end;
                    UNTIL Ppurchaseinvoiceheader.Next = 0;
                PfGrandTotal := PTotalAmount + PTotalAmount1 + PTotalAmount2 + PTotalAmount3;



            end;




            trigger OnPostDataItem()
            begin
                Message('%1total quantity', TotalQuantity);

                Message('%1 totalAmount', TotalAmount);
            end;

        }

    }

    requestpage

    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(StartingDateG; StartingDateG)
                    {
                        ApplicationArea = All;
                        Caption = 'Starting Date';

                    }
                    field(EndingDateG; EndingDateG)
                    {
                        ApplicationArea = All;
                        Caption = 'Ending Date';
                    }
                }
            }


        }



        /* actions
         {
             area(processing)
             {
                 action(ActionName)
                 {
                     ApplicationArea = All;

                 }
             }
         }*/
    }



    var
        myInt: Integer;
        Psalesinvoiceheader: Record "Sales Invoice Header";
        Salesinvoiceheader1: Record "Sales Invoice Header";
        CustomerLedgerEntrier: Record "Cust. Ledger Entry";
        Ppurchaseinvoiceheader: Record "Purch. Inv. Header";
        Ppurchaseinvoiceline: Record "Purch. Inv. Line";
        VendorLedgerEntries: Record "Vendor Ledger Entry";
        GrandTotal: Decimal;
        CompanyInformation: record "Company Information";

        StartingDateG: Date;
        EndingDateG: Date;
        StartingDate1: Date;
        EndingDate1: Date;
        TotalAmount1: Decimal;
        TotalAmount2: Decimal;
        TotalAmount3: Decimal;
        StartingDate2: Date;
        EndingDate2: Date;
        StartingDate3: Date;
        PTotalAmount: Decimal;
        PTotalAmount1: Decimal;
        PTotalAmount2: Decimal;
        PTotalAmount3: Decimal;
        PfGrandTotal: Decimal;







        FormatCap: Label 'FORMAT FOR QUARTERLY REPORT FOR THE WORKING UNITS';
        PeriodCap: Label 'Period-PERIOD REPORTING:QUARTERLY';
        NameCap: Label 'Name of the Unit & location';
        PermanentCap: Label '(a)Permanent E-mail Address(Compulosry)';
        WebsiCap: label '(b)Web Site';
        DateCap: Label 'Date of commencement of production';
        DetailCap: Label 'Details of Production figures';
        QuantiCap: Label 'Quantity(MT/pieces)';
        ValueCap: Label 'Value in INR in Lakhs';
        ExportCap: Label 'EXPORT(INFLOW)';
        FOBCap: Label 'FOB value of exports for the Quarter';
        GcaCap: Label 'GCA exports';
        RpaCap: Label 'RPA exports';
        TotalCap: Label 'Total in INR';
        QuantityinCap: Label 'Quantity in Nos';
        ValueinusCap: Label 'Value in USD/INR In Lakhs';
        NosCap: Label 'Nos';
        InrCap: Label 'INR';
        DeemedCap: Label 'Deemed export for other categories during the quarter';
        CumulaCap: Label 'Cumulative exports/deemed export up to the current Quarter';
        ImpoCap: Label 'IMPORT(OUTFLOW)';
        CumulativeimpoCap: Label 'Cumulative import of RM/consumable etc during the quarter';
        CumulatCap: Label 'Cumulative import of RM/Consumables etc.,Consumed up to the Quarter';
        NetFoCap: Label 'Net foregin exchange earning Achieved(NFE)(Column4-Column5{ii}+Column 5{ii})';
        DTACap: Label 'DTA SALE';
        DTASCap: Label 'DTA sale';
        QuanCap: label 'Quantity';
        valCap: Label 'Value';
        CaseCap: Label 'Cases of pending Foreign Exchange';
        CaseesCap: Label 'Cases of Pending Foreign Exchange realisation outstanding for more than 360 days at the end of last quarter/financial year';
        DateoCap: Label 'Date of export : Name of Importer';
        AddressCap: Label 'Address:';
        AmouCap: Label 'Amount';
        SignCap: Label '(SIGNATURE)';
        WithCap: Label 'With a stamp';
        NotCap: Label 'Notes:-';
        TheAboveCap: Label 'The above information should be given separately for each Letter of Permission';
        QprsCap: Label 'QPRs must be submitted electronically only if the zones have provided online facilities';
        ThesiCap: Label 'The signature of the authorised signatory of the unit must be sent to the zone electronically';
        StaringDate: Date;
        EndingDate: Date;
        TotalQuantity: Decimal;
        TotalAmount: Decimal;
        PSalesline: Record "Sales Invoice Line";
        ExportForCap: Label 'Export for';

    //psalesheader: Record "Sales Invoice Header";




}