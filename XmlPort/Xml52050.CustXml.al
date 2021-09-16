xmlport 52050 CustXml
{
    Caption = 'CustXml';
    Direction = Export;

    Format = VariableText;
    //FieldDelimiter = '*';
    FieldSeparator = ',';
    RecordSeparator = '<NewLine>';
    UseRequestPage = false;
    FileName = 'sample.csv';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer; Customer)
            {
                fieldelement(No; Customer."No.")
                {
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(City; Customer.City)
                {
                }
                fieldelement(Address; Customer.Address)
                {
                }
            }
        }
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
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
