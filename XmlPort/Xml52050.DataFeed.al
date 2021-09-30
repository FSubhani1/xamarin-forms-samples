xmlport 52050 CustXml
{
    Caption = 'CustXml';
    Direction = Export;

    Format = VariableText;
    //FieldDelimiter = '*';
    FieldSeparator = ',';
    RecordSeparator = '<NewLine>';
    TableSeparator = '<CR/LF>';
    TextEncoding = UTF8;
    UseRequestPage = false;
    FileName = 'sample.csv';
    schema
    {

        textelement(RootNodeName)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'Header';
                SourceTableView = SORTING(Number) WHERE(Number = CONST(1));
                textelement(provider)
                {

                    trigger OnBeforePassVariable()
                    begin
                        provider := 'provider';
                    end;
                }

                textelement(TransactionId)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TransactionId := 'transacion_id';
                    end;
                }
                textelement(TransactionType)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TransactionType := 'transaction_type';
                    end;
                }
                textelement(TransactionRefernceId)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TransactionRefernceId := 'transaction_refernce_id';
                    end;
                }
                textelement(TransactionDate)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TransactionDate := 'transaction_date';
                    end;
                }
                textelement(ToName)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToName := 'to_name';
                    end;
                }
                textelement(ToStreet)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToStreet := 'to_street';
                    end;
                }
                textelement(ToCity)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToCity := 'to_city';
                    end;
                }
                textelement(ToState)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToState := 'to_state';
                    end;
                }
                textelement(ToZip)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToZip := 'to_zip';
                    end;
                }
                textelement(ToCountry)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ToCountry := 'to_country';
                    end;
                }
                textelement(FromStreetAddress)
                {

                    trigger OnBeforePassVariable()
                    begin
                        FromStreetAddress := 'from_street';
                    end;
                }
                textelement(FromCityAddress)
                {

                    trigger OnBeforePassVariable()
                    begin
                        FromCityAddress := 'from_city';
                    end;
                }
                textelement(FromStateAddress)
                {

                    trigger OnBeforePassVariable()
                    begin
                        FromStateAddress := 'from_state';
                    end;
                }
                textelement(FromZipCode)
                {

                    trigger OnBeforePassVariable()
                    begin
                        FromZipCode := 'from_zip';
                    end;
                }
                textelement(FromCountryAddress)
                {

                    trigger OnBeforePassVariable()
                    begin
                        FromCountryAddress := 'from_country';
                    end;
                }
                textelement(TotalShippingQty)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TotalShippingQty := 'total_shipping';
                    end;
                }
                textelement(TotalHandlingQty)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TotalHandlingQty := 'total_handling';
                    end;
                }
                textelement(TotalSalesTax)
                {

                    trigger OnBeforePassVariable()
                    begin
                        TotalSalesTax := 'total_sales_tax';
                    end;
                }
                textelement(ItemProductIdentifier)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemProductIdentifier := 'item_product_identifier';
                    end;
                }
                textelement(ItemDescriptions)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemDescriptions := 'item_description';
                    end;
                }
                textelement(ItemQuantity)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemQuantity := 'item_quantity';
                    end;
                }
                textelement(ItemUnitPrice)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemUnitPrice := 'item_unit_price';
                    end;
                }
                textelement(ItemShippingQty)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemShippingQty := 'item_shipping';
                    end;
                }
                textelement(ItemHandlingQty)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemHandlingQty := 'item_handling';
                    end;
                }
                textelement(ItemDiscount)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemDiscount := 'item_discount';
                    end;
                }
                textelement(ItemSaleTax)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemSaleTax := 'item_sales_tax';
                    end;
                }
                textelement(ItemProductTaxCodes)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ItemProductTaxCodes := 'item_product_tax_code';
                    end;
                }
                textelement(ExemptionTypes)
                {

                    trigger OnBeforePassVariable()
                    begin
                        ExemptionTypes := 'exemption_type';

                    end;
                }

            }
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
                        trigger OnBeforePassField()
                        var
                            myInt: Integer;
                        begin
                            if SalesInvline."Line No." = 0 then
                                currXMLport.Skip();
                        end;
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
                            ReferenceId := '';
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
                            if loc.get(SalesInvHeader."Location Code") then;
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
                            if loc.get(SalesInvHeader."Location Code") then
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
                            if loc.get(SalesInvHeader."Location Code") then
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
                            if loc.get(SalesInvHeader."Location Code") then
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
                            if loc.get(SalesInvHeader."Location Code") then
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
                            if ItemCat.Get(SalesInvLine."Item Category Code") then
                                ItemProductTaxCode := ItemCat."TJ Product Tax Code ELA";
                        end;
                    }
                }
            }

            tableelement(SalesCrMemoHeader; "Sales Cr.Memo Header")
            {
                XmlName = 'SalesCrMemoHeader';
                tableelement(SalesCrLine; "Sales Cr.Memo Line")
                {
                    XmlName = 'SaleCrLine';
                    LinkFields = "Document No." = field("No.");
                    LinkTable = SalesCrMemoHeader;

                    textelement(WebCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            WebCR := 'Web';
                        end;
                    }
                    fieldelement(No; SalesCrMemoHeader."No.")
                    {

                    }
                    textelement(TypeCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            Type := 'Refund';
                        end;
                    }
                    textelement(ReferenceIdCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                        begin
                            ReferenceIdCR := '';
                        end;
                    }
                    fieldelement(PostingDate; SalesCrLine."Posting Date")
                    {

                    }
                    fieldelement(CustName; SalesCrMemoHeader."Sell-to Customer Name")
                    {

                    }
                    fieldelement(CustAddress; SalesCrMemoHeader."Sell-to Address")
                    {

                    }
                    fieldelement(CustCity; SalesCrMemoHeader."Sell-to City")
                    {

                    }
                    fieldelement(CustState; SalesCrMemoHeader."Sell-to County")
                    {


                    }
                    fieldelement(CustZip; SalesCrMemoHeader."Sell-to Post Code")
                    {

                    }
                    fieldelement(CustCountry; SalesCrMemoHeader."Sell-to Country/Region Code")
                    {

                    }
                    textelement(FromStreetCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            if loc.get(SalesCrMemoHeader."Location Code") then
                                FromStreetCR := loc.Address;
                        end;
                    }
                    textelement(FromCityCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            if loc.get(SalesCrMemoHeader."Location Code") then
                                FromCityCR := loc.City;
                        end;
                    }
                    textelement(FromStateCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            if loc.get(SalesCrMemoHeader."Location Code") then
                                FromStateCR := loc.County;
                        end;
                    }
                    textelement(FromZipCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            if loc.get(SalesCrMemoHeader."Location Code") then
                                FromZipCR := loc."Post Code";
                        end;
                    }
                    textelement(FromCountryCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            myInt: Integer;
                            loc: Record Location;
                        begin
                            if loc.get(SalesCrMemoHeader."Location Code") then
                                FromCountryCR := loc."Country/Region Code";
                        end;
                    }
                    textelement(TotalShippingCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            dexmap: Record "DEX Document Mapping ELA";
                            SRSetup: Record "Sales & Receivables Setup";
                        begin
                            if SRsetup.get() then
                                if (SalesCrLine.Type = SalesCrLine.Type::"G/L Account") and (SRSetup."G/L Shipping Account ELA" = SalesCrLine."No.") then
                                    TotalShippingCR := format(SalesCrLine.Quantity);
                        end;
                    }
                    textelement(TotalHandlingCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            TotalHandlingCR := '0';
                        end;
                    }
                    textelement(TotalTaxCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            TotalTaxCR := '0';
                        end;
                    }
                    textelement(ItemNoCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemNoCR := SalesCrLine."No.";
                        end;
                    }
                    textelement(ItemDescriptionCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemDescriptionCR := SalesCRLine.Description;
                        end;
                    }
                    fieldelement(Quantity; SalesCrLine.Quantity)
                    {

                    }
                    fieldelement(UnitPrice; SalesCrLine."Unit Price")
                    {

                    }
                    textelement(ItemShippingCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            dexmap: Record "DEX Document Mapping ELA";
                        begin
                            ItemShippingCR := '0';
                        end;
                    }
                    textelement(ItemHandlingCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemHandlingCR := '0';
                        end;
                    }
                    fieldelement(Discount; SalesCrLine."Line Discount Amount")
                    {

                    }
                    textelement(ItemSalesTaxCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ItemSalesTaxCR := '0';
                        end;
                    }

                    textelement(ExemptionTypeCR)
                    {
                        trigger OnBeforePassVariable()

                        begin
                            ExemptionTypeCR := '0';
                        end;
                    }

                    textelement(ItemProductTaxCodeCR)
                    {
                        trigger OnBeforePassVariable()
                        var
                            ItemCat: Record "Item Category";
                        begin
                            if ItemCat.Get(SalesCrLine."No.") then
                                ItemProductTaxCode := ItemCat."TJ Product Tax Code ELA";
                        end;
                    }
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
    trigger OnInitXmlPort()
    var
        myInt: Integer;
        last: date;
        first: date;
    begin
        last := CalcDate('CM -1M', Today);
        last := CalcDate('CM', last);
        first := CalcDate('-CM-1M', Today);
        SalesInvHeader.Setfilter("Posting Date", '%1..%2', first, last);
        SalesInvHeader.SetFilter("Site Code", '<>%1', '');
        SalesCrMemoHeader.Setfilter("Posting Date", '%1..%2', first, last);
    end;
}
