xmlport 52050 CustXml
{
    Caption = 'CustXml';
    Direction = Export;

    Format = VariableText;
    //FieldDelimiter = '*';
    FieldSeparator = ',';
    RecordSeparator = '<NewLine>';
    TableSeparator = '';

    UseRequestPage = false;
    FileName = 'sample.csv';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(SalesInvHeader; "Sales Invoice Header")
            {
                XmlName = 'SalesInvHeader';

                tableelement(SalesInvLine; "Sales Invoice Line")
                {
                    XmlName = 'SalesInvLine';
                    LinkFields = "Document No." = field("No.");
                    LinkTable = SalesInvHeader;

                    textelement(Web)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            Web := 'Web';
                        end;
                    }
                    fieldelement(No; SalesInvHeader."Order No.")
                    {

                    }
                    textelement(Type)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            Type := 'Order';
                        end;
                    }
                    textelement(ReferenceId)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            Type := '';
                        end;
                    }
                    fieldelement(PostingDate; SalesInvLine."Posting Date")
                    {

                    }
                    fieldelement(CustName; SalesInvHeader."Sell-to Customer Name")
                    {

                    }
                    fieldelement(CustAddress; SalesInvHeader."Sell-to Address")
                    {

                    }
                    fieldelement(CustCity; SalesInvHeader."Sell-to City")
                    {

                    }
                    fieldelement(CustState; SalesInvHeader."Sell-to County")
                    {


                    }
                    fieldelement(CustZip; SalesInvHeader."Sell-to Post Code")
                    {

                    }
                    fieldelement(CustCountry; SalesInvHeader."Sell-to Country/Region Code")
                    {

                    }
                    textelement(FromStreet)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            loc.get(SalesInvHeader."Location Code");
                            FromStreet := loc.Address;
                        end;
                    }
                    textelement(FromCity)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            loc.get(SalesInvHeader."Location Code");
                            FromCity := loc.City;
                        end;
                    }
                    textelement(FromState)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            loc.get(SalesInvHeader."Location Code");
                            FromState := loc.County;
                        end;
                    }
                    textelement(FromZip)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            loc.get(SalesInvHeader."Location Code");
                            FromZip := loc."Post Code";
                        end;
                    }
                    textelement(FromCountry)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            loc.get(SalesInvHeader."Location Code");
                            FromCountry := loc."Country/Region Code";
                        end;
                    }
                    textelement(TotalShipping)
                    {
                        trigger OnBeforePassVariable()
                        var
                            dexmap: Record "DEX Document Mapping ELA";
                        begin
                            if dexmap.get(SalesInvHeader."Site Code") then;
                            if (SalesInvLine.Type = SalesInvLine.Type::"G/L Account") and (dexmap."Shipping GL Account No." = SalesInvLine."No.") then
                                TotalShipping := format(SalesInvLine.Quantity);
                        end;
                    }
                    textelement(TotalHandling)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            TotalHandling := '0';
                        end;
                    }
                    textelement(TotalTax)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            TotalTax := '0';
                        end;
                    }
                    textelement(ItemNo)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemNo := SalesInvLine."No.";
                        end;
                    }
                    textelement(ItemDescription)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemDescription := SalesInvLine.Description;
                        end;
                    }
                    fieldelement(Quantity; SalesInvLine.Quantity)
                    {

                    }
                    fieldelement(UnitPrice; SalesInvLine."Unit Price")
                    {

                    }
                    textelement(ItemShipping)
                    {
                        trigger OnBeforePassVariable()
                        var
                            dexmap: Record "DEX Document Mapping ELA";
                        begin
                            ItemShipping := '0';
                        end;
                    }
                    textelement(ItemHandling)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemHandling := '0';
                        end;
                    }
                    fieldelement(Discount; SalesInvLine."Line Discount Amount")
                    {

                    }
                    textelement(ItemSalesTax)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemSalesTax := '0';
                        end;
                    }

                    textelement(ExemptionType)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ExemptionType := '0';
                        end;
                    }

                    textelement(ItemProductTaxCode)
                    {
                        trigger OnBeforePassVariable()
                        var
                            ItemCat: Record "Item Category";
                        begin
                            if ItemCat.Get(SalesInvLine."No.") then
                                ItemProductTaxCode := ItemCat."TJ Product Tax Code ELA";
                        end;
                    }
                }
            }

            tableelement(SalesCrMemoHeader; "Sales Cr.Memo Header")
            {

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
