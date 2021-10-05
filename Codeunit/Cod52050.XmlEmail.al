codeunit 52050 "DataFeed ELA"
{
    trigger OnRun()
    var
        myInt: Integer;
        CustXml: XmlPort "DataFeed XMlPort ELA";
        out: OutStream;
        smtp1: Record "SMTP Mail Setup";
        smtp2: Codeunit "SMTP Mail";
        ins: InStream;
        c: Record customer;
        file: File;
        tempblob: Codeunit "Temp Blob";
        t: Text;
        tt: List of [Text];
        tempFileName: text;
        ErrorAtt: label 'No Data Found';
        DexIntSetup: Record "Data Exchange Int. Setup ELA";
    begin

        tempblob.CreateOutStream(out);
        CustXml.SetDestination(out);
        CustXml.Export();
        tempblob.CreateInStream(ins);
        //ins.Read(t);

        if DexIntSetup.get() then;
        tt.Add(DexIntSetup."Email for Tax Jar Notif.");
        smtp2.CreateMessage('faizan', 'fsubhani@elationerp.com', tt, 'test', 'attachment');
        smtp2.AddAttachmentStream(ins, 'DataFeed.csv');
        smtp2.Send;


        /* tempFileName := 'DataFeed.csv';
         DownloadFromStream(ins, 'Export', '', 'All Files (*.*)|*.*', tempFileName);
 */


    end;
}
