codeunit 52050 "DataFeed ELA"
{
    trigger OnRun()
    var
        myInt: Integer;
        CustXml: XmlPort "DataFeed XMlPort ELA";
        out: OutStream;
        smtp1: Codeunit Email;
        smtp2: Codeunit "Email Message";
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
        smtp2.Create(DexIntSetup."Email for Tax Jar Notif.", 'test', 'attachment');
        smtp2.AddAttachment('DataFeed.csv', 'test', ins);
        smtp1.Send(smtp2);

        /* tempFileName := 'DataFeed.csv';
         DownloadFromStream(ins, 'Export', '', 'All Files (*.*)|*.*', tempFileName);
 */


    end;
}
