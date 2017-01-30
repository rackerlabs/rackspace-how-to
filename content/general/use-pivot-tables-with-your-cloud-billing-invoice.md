---
permalink: use-pivot-tables-with-your-cloud-billing-invoice/
audit_date: '2016-05-24'
title: Use pivot tables with your Cloud billing invoice
type: article
created_date: '2015-03-24'
created_by: David Hendler
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

You can use the CSV-formatted invoice to filter and manipulate your Rackspace billing data. Three pivot tables are available to help you find the information that you need.

**Note:** UK Cloud accounts cannot export the CSV format to pivot tables. We plan to make the CSV export feature available to UK Cloud accounts in September 2016.

### View billing data in pivot tables

First you download the spreadsheet that best matches your application.
Then you download your billing invoice in a CSV format and import
its data into the spreadsheet. Then you can refresh the
data in the pivot tables. Each pivot table lets you filter your data in
the following ways:

-   **Pivot Example 1**: Sort by Service, Product Type, Impact (charge discount), and Resource
-   **Pivot Example 2**: Sort by Service, Product Type, and Resource
-   **Pivot Example 3**: Sort by Resource, Flavor, Server Type, Product, and Event


1.  Select the spreadsheet that matches your spreadsheet application and
    download it:
    -   Old Excel: Microsoft Office versions earlier than 2007
        ([link](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_old_excel_pivot_tables.xls))
    -   New Excel: Microsoft Office 2007 and later, Libre Office,
        and Google Sheets
        ([link](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_new_excel_pivot_tables.xlsx))
    -   Open Office
        ([link](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_open_office_pivot_tables.ods))

2.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
3.  In the top-right corner, click your user name and then select **Billing and Payments**.
4.  Under **Billing History**, click the ID number for the invoice that you want to view.
5.  On the Account Invoice page, export the CSV file.
6.  Open the CSV file in your spreadsheet program. If prompted, separate values on **comma**.
7.  Click the small blank square at the top left of the spreadsheet to
    select all values.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/2%20-%20billing_SelectAll_arrow.png %}" width="314" height="268" />

8.  Copy the data to your clipboard.
9.  Open the file that you downloaded in step 1.
10. Paste the CSV data into the **Invoice CSV Data** worksheet.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/3%20-%20billing_csvTab_arrow.png %}" width="538" height="130" />

11. In each of the three pivot tables (worksheets), right-click in the
    pivot table and select **Refresh**.
12. Save the spreadsheet with a new name to your computer.

### Video demos

The following videos show how to view your data in a pivot table:

-   Import invoice into the New Excel spreadsheet
    ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_new_excel_pivot_tables_demo.mov))
-   Import invoice into the Open Office spreadsheet
    ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_open_office_pivot_tables_demo.mov))

### About the CSV file

**Billing Time Charges** under Cloud Servers is the charge for Saved
Images. **Billing Time Charges** under Cloud Files is the charge for
storage.

The column headers in the CSV file are as follows:

- ACCOUNT\_NO: Your account number in the billing system

- BILL\_NO: The identification number of this invoice

- BILL\_START\_DATE: The start date of the billing cycle contained in
this invoice

- BILL\_END\_DATE: The end date of the billing cycle contained in this
invoice

- SERVICE\_TYPE: The products that accrued the charges, such as:

  -   Account
  -   Cloud Backup
  -   Cloud Bandwidth
  -   Cloud Big Data
  -   Cloud Block Storage
  -   Cloud Database
  -   Cloud Files
  -   Cloud Load Balancers
  -   Cloud Monitoring
  -   Cloud Queues
  -   Cloud Servers
  -   Cloud Sites


- EVENT\_TYPE: Within the product (SERVICE\_TYPE), the event that accrued
the charge, such as:

  -   BigData Uptime
  -   NG (previously next generation) Cloud Server Uptime
  -   Files BWOUT (bandwidth out)


- EVENT\_START\_DATE: The start date of the specified event

- EVENT\_END\_DATE: The end date of the specified event

- IMPACT\_TYPE: Whether the event was a debit or credit (for example,
Discount, Charge, Tax)

- QUANTITY: The number or amount of things being counted for charges, such as 300 (GB)

- UOM (Unit of Measure): How the QUANTITY is measured, such as GB

- RATE: The cost per chargeable unit

- AMOUNT: The number of chargeable units

- USAGE\_RECORD\_ID: The ID of the charge

- DC\_ID: The data center in which the charges were accrued

- REGION\_ID: The region in which the charges were accrued

- RES\_ID: The ID of the resource

- RES\_NAME: The name of the resource

- ATTRIBUTE\_1,  ATTRIBUTE\_2, ATTRIBUTE\_3: Any other important aspects of the resource
