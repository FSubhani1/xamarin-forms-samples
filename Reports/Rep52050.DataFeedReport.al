report 52050 "Data Feed Report"
{
    Caption = 'Data Feed Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
                field(DateFilter; DateFilter)
                {
                    Caption = 'Date Filter';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        AppMgmt.MakeDateFilter(DateFilter);
                    end;

                }
            }

        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPostReport()
    var

        CustXml: XmlPort "DataFeed XMlPort ELA";
        out: OutStream;
        ins: InStream;
        file: File;
        tempblob: Codeunit "Temp Blob";
        t: Text;
        tempFileName: text;
    begin
        DataFeedXML.SetDate(DateFilter);
        tempblob.CreateOutStream(out);
        CustXml.SetDestination(out);
        CustXml.Export();
        tempblob.CreateInStream(ins);

        tempFileName := 'DataFeed.csv';
        DownloadFromStream(ins, 'Export', '', 'All Files (*.*)|*.*', tempFileName);


    end;

    var
        DateFilter: Text;
        DataFeedXML: XmlPort "DataFeed XMlPort ELA";
        AppMgmt: Codeunit "Filter Tokens";

}
