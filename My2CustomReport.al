report 50022 "Customer Listing"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Customer Listing';
    ApplicationArea = All;
    DefaultRenderingLayout = CustomListCustEXCEL;
    DataAccessIntent = ReadOnly;

    dataset
    {
        // Define the data item for the Customer table
        dataitem(Customer; Customer)
        {
            // Set filter fields for the request page
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            // Set the sorting order for the data item
            DataItemTableView = SORTING("No.");

            // Define the columns to be included in the report
            column(Customer_No; "No.")
            {
            }
            column(Customer_Name; Name)
            {
            }
            column(Customer_Address; Address)
            {
            }
            column(Customer_City; City)
            {
            }
            column(Customer_Balance_LCY; "Balance (LCY)")
            {
                DecimalPlaces = 0 : 0;
            }
        }
    }

    // Define the request page
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(FiltresPersonalisées)
                {
                    // Define fields for the request page filter
                    field("No."; Customer."No.")
                    {
                        ApplicationArea = All;
                    }
                    field("Search Name"; Customer."Search Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Customer Posting Group"; Customer."Customer Posting Group")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(CustomListCustEXCEL)
        {
            Type = Excel;
            Caption = 'Excel Layout for Customer Listing';
            Summary = 'The Excel Layout for listing customers';
            LayoutFile = 'CustomListCust.xlsx';
        }

    }

    var
        myInt: Integer;
}