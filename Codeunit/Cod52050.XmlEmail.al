codeunit 52050 XmlEmail
{
    trigger OnRun()
    var
        myInt: Integer;
        CustXml: XmlPort CustXml;
        out: OutStream;
        smtp1: Record "SMTP Mail Setup";
        smtp2: Codeunit "SMTP Mail";
        ins: InStream;
        c: Record customer;
        file: File;
        tempblob: Record TempBlob;
        t: Text;
        tt: List of [Text];


    begin

        tempblob.Blob.CreateOutStream(out);
        CustXml.SetDestination(out);
        CustXml.Export();
        tempblob.Blob.CreateInStream(ins);
        //ins.Read(t);
        tt.Add('fsubhani@elationerp.com');
        smtp2.CreateMessage('faizan', 'fsubhani@elationerp.com', tt, 'test', 'attachment');
        smtp2.AddAttachmentStream(ins, 'custs.csv');
        smtp2.Send;


    end;
}
