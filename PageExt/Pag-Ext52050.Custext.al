pageextension 52050 Custext extends "Customer List"
{
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Codeunit.Run(52050);
    end;
}
