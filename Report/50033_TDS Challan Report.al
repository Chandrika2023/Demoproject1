report 50033 "TDS Challan Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    caption = 'TDS Challan Report';
    RDLCLayout = './TDS Challan Report.rdl';

    dataset
    {
        dataitem(TDSEntryGR; "TDS Entry")
        {
            RequestFilterFields = "Posting Date", "TDS Paid";


            column(SNoCap; SNoCap)
            { }
            column(PostingDateCap; PostingDateCap)
            { }
            column(DocumentTypeCap; DocumentTypeCap)
            { }
            column(VendorNoCap; VendorNoCap)
            { }
            column(DocumentNoCap; DocumentNoCap)
            { }
            column(PartyTDSDocNoCap; PartyTDSDocNoCap)
            { }
            column(VendorNameCap; VendorNameCap)
            { }
            column(VendorPANNoCap; VendorPANNoCap)
            { }
            column(AssesseecodeCap; AssesseecodeCap)
            { }
            column(InvoiceAmountCap; InvoiceAmountCap)
            { }
            column(TDSBaseAmountCap; TDSBaseAmountCap)
            { }
            column(TDSPerCap; TDSPerCap)
            { }
            column(TDSAmountCap; TDSAmountCap)
            { }
            column(SurchargePCap; SurchargePCap)
            { }
            column(SurchargeAmountCap; SurchargeAmountCap)
            { }
            column(TDSincluSurchaCap; TDSincluSurchaCap)
            { }
            column(EcessAmountCap; EcessAmountCap)
            { }
            column(EcessPCap; EcessPCap)
            { }
            column(SHECessCap; SHECessCap)
            { }
            column(SHECessAmountCap; SHECessAmountCap)
            { }
            column(TotTDSincSHECessCap; TotTDSincSHECessCap)
            { }
            column(ChallanNoCap; ChallanNoCap)
            { }
            column(ChallanDateCap; ChallanDateCap)
            { }
            column(BSRCodeCap; BSRCodeCap)
            { }
            column(BankNameCap; BankNameCap)
            {

            }
            column(MinorHeadCodeCap; MinorHeadCodeCap)
            { }
            column(CheckNoCap; CheckNoCap)
            { }
            column(CheckDateCap; CheckDateCap)
            { }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_Type; "Document Type")
            {

            }
            column(Invoice_Amount; "Invoice Amount")
            { }
            column(Assessee_Code; "Assessee Code")
            { }


            column(Document_No_; "Document No.")
            { }
            column(Pay_TDS_Document_No_; "Pay TDS Document No.")
            { }
            column(TDS_Base_Amount; "TDS Base Amount")
            { }
            column(TDS__; "TDS %")
            { }
            column(Vendor_No_; "Vendor No.")
            { }

            column(TDS_Amount; "TDS Amount")
            { }
            column(Surcharge__; "Surcharge %")
            { }
            column(Surcharge_Amount; "Surcharge Amount")
            { }
            column(TDS_Amount_Including_Surcharge; "TDS Amount Including Surcharge")
            { }
            column(eCess__; "eCess %")
            {

            }
            column(Check_DD_No_; "Check/DD No.")
            {

            }
            column(Check_Date; "Check Date")
            {

            }

            column(eCess_Amount; "eCess Amount")
            { }
            column(SHE_Cess__; "SHE Cess %")
            { }
            column(SHE_Cess_Amount; "SHE Cess Amount")
            { }
            column(Total_TDS_Including_SHE_CESS; "Total TDS Including SHE CESS")
            { }
            column(Adjusted; Adjusted)
            { }
            column(Bal__TDS_Including_SHE_CESS; "Bal. TDS Including SHE CESS")
            {

            }

            column(Challan_Date; "Challan Date")
            { }
            column(Challan_No_; "Challan No.")
            { }
            column(BSR_Code; "BSR Code")
            { }
            column(Bank_Name; "Bank Name")
            { }
            column(Minor_Head_Code; "Minor Head Code")
            { }
            column(Nature_of_Remittance; "Nature of Remittance")
            { }
            column(Act_Applicable; "Act Applicable")
            { }
            column(Country_Code; "Country Code")
            { }

            column(Deductee_PAN_No_; "Deductee PAN No.")
            { }
            column(VendorName; VendorGRec.Name)
            { }
            column(TDS_Paid; "TDS Paid")
            { }
            column(CompanyInfoName; CompanyInfoGRec.Name)
            { }
            column(CompanyInfAdd; CompanyInfoGRec.Address)
            { }
            column(Text001; Text001)
            { }
            column(PostingDate1; PostingDate1)
            { }


            trigger OnAfterGetRecord()
            begin
                if VendorGRec.get("Vendor No.") then;

            end;



        }

    }
    trigger OnPreReport()
    begin
        CompanyInfoGRec.get();
        PostingDate1 := TDSEntryGR.GetFilter("Posting Date");

    end;



    /*requestpage
    {
        layout
        {
            area(Content)
            {
                group("Date Filters")
                {
                    field(;)
                    {
                        ApplicationArea = All;
                        
                    }
                   
                }
            }
        }

        
    }*/

    /*rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }*/

    var
        VendorGRec: record Vendor;
        CompanyInfoGRec: Record "Company Information";

        PostingDateCap: Label 'Posting Date';
        SNoCap: Label 'S.No';
        DocumentTypeCap: Label 'Document Type';
        VendorNoCap: Label 'Vendor No';
        DocumentNoCap: label 'Document No';
        PartyTDSDocNoCap: Label 'Party TDS Doc.No';
        VendorNameCap: Label 'Vendor Name';
        VendorPANNoCap: Label 'Vendor PAN No';
        AssesseecodeCap: Label 'Assessee code';
        InvoiceAmountCap: Label 'Invoice Amount';
        TDSBaseAmountCap: Label 'TDS Base Amount';
        TDSPerCap: Label 'TDS %';
        TDSAmountCap: Label 'TDS Amount';
        SurchargePCap: Label 'Surcharge %';
        SurchargeAmountCap: Label 'Surcharge Amount';
        TDSincluSurchaCap: Label 'TDS including Surcharge';
        EcessPCap: Label 'Ecess%';
        EcessAmountCap: Label 'EcessAmount';
        SHECessCap: Label 'SHE Cess%';
        SHECessAmountCap: Label 'SHE Cess Amount';
        TotTDSincSHECessCap: Label 'Total TDS includeing SHE Cess';
        ChallanNoCap: Label 'Challan No';
        ChallanDateCap: Label 'Challan Date';
        BSRCodeCap: Label 'BSR Code';
        BankNameCap: Label 'Bank Name';
        MinorHeadCodeCap: Label 'Minor Head Code';
        CheckNoCap: Label 'Check No';
        CheckDateCap: Label 'Check Date';
        Text001: Label 'TDS Report for the period of';
        PostingDate1: Text;

}