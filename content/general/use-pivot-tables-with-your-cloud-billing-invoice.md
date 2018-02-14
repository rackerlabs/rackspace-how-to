---
permalink: use-pivot-tables-with-your-cloud-billing-invoice/
audit_date: '2018-02-13'
title: Use pivot tables with your Cloud billing invoice
type: article
created_date: '2015-03-24'
created_by: David Hendler
last_modified_date: '2018-02-13'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

You can use a comma-separated-values (CSV) invoice to filter and manipulate your Rackspace
billing data. Three pivot tables, which provide data filters, are available to help you find the information
that you need.

The pivot tables provide the following data filters:

-   **Pivot Example 1**: Sort by Service, Product Type, Impact (charge discount), and Resource
-   **Pivot Example 2**: Sort by Service, Product Type, and Resource
-   **Pivot Example 3**: Sort by Resource, Flavor, Server Type, Product, and Event

### View billing data in pivot tables

Use the following steps to view billing data in pivot tables:

1.  Select the pivot table spreadsheet from the following list, and download it:
    -   Old Excel: Microsoft Office &reg; versions earlier than 2007
        ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_old_excel_pivot_tables.xls))
    -   New Excel: Microsoft Office 2007 and later, Libre Office &reg;,
        and Google Sheets &trade;
        ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_new_excel_pivot_tables.xlsx))
    -   OpenOffice
        ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_open_office_pivot_tables.ods))

    **Note:** The following steps use the current version of Microsoft Excel on Windows &reg; or Mac &reg; OSX &reg;.
    If you are using a different spreadsheet application version or a different OS,
    adjust your steps accordingly.
    
2.  Log in to the portal.

      a.  **Dedicated account customers**: Log in to the [MyRackspace customer portal](https://my.rackspace.com/).

      b.  **Cloud customers**: Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
      
3.  Click **Billing** in top right corner of portal.
4.  Click **Billing History** > **Invoice Details**.
5.  On the **Invoice Details** page, click the CSV link, and export the CSV invoice file.
6.  Open Microsoft Excel, and create a new workbook. Do not open the CSV invoice file.
7.  In the new workbook, click **Data** > **From Text/CSV**.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/step2.png %}" width="314" height="268" />

8. In the import dialog box, select your CSV invoice file, and click **Get Data**.
9. In the import wizard, select **Delimited** (using commas as the delimiter
value), change the file origin to **Unicode (UTF-8)**, and click **Load**.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/step4.png %}" width="314" height="268" />

    The resulting spreadsheet looks similar to the following example:

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/result.png %}" width="690" height="153" />

10. Click the small blank square at the top left of the spreadsheet to
    select all of the values.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/2%20-%20billing_SelectAll_arrow.png %}" width="314" height="268" />

11. Copy the data to your clipboard.
12. Open the spreadsheet file that you downloaded in step 1.
13. Paste the CSV data into the **Invoice CSV Data** worksheet. 

    **Note:** Ensure that you select the A1 cell when you paste.

    <img src="{% asset_path general/use-pivot-tables-with-your-cloud-billing-invoice/3%20-%20billing_csvTab_arrow.png %}" width="538" height="130" />

14. In each of the three pivot tables (worksheets), right-click the pivot table,
and select **Refresh**.
15. Save the spreadsheet with a new name to your computer.


### Video demos

The following videos show how to view your data in a pivot table:

-   Import invoice into the New Excel spreadsheet
    ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_new_excel_pivot_tables_demo.mov))
-   Import invoice into the Open Office spreadsheet
    ([download](http://cf86f577ce3eeb804b0b-b288f28026fa4fe9b175ca1cf838e8ff.r99.cf2.rackcdn.com/rackspace_billing_open_office_pivot_tables_demo.mov))

### About the CSV file

The charge shown for Cloud Servers is the charge for saved images, and the
charge shown for Cloud Files is the charge for storage.

The column headers in the CSV file are defined as follows:

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
  -   Rackspace Monitoring
  -   Cloud Queues
  -   Cloud Servers

- EVENT_TYPE: Within the product (SERVICE\_TYPE), the event that accrued
the charge, such as:

  -   BigData Uptime
  -   NG (previously next generation) Cloud Server Uptime
  -   Files Bandwidth Out

- EVENT\_START\_DATE: The start date of the specified event
- EVENT\_END\_DATE: The end date of the specified event
- IMPACT\_TYPE: Whether the event was a debit or credit (for example,
Discount, Charge, Tax)
- QUANTITY: The number or the amount of things being counted for charges, such as 300 (GB)
- UOM (Unit of Measure): How the QUANTITY is measured, such as GB
- RATE: The cost per chargeable unit
- CURRENCY: The medium of exchange in which accrued charges are billed (for example, USD, AUD, GBP, EUR)
- AMOUNT: The number of chargeable units
- USAGE\_RECORD\_ID: The ID of the charge
- DC\_ID: The data center in which the charges were accrued
- REGION\_ID: The region in which the charges were accrued
- RES\_ID: The ID of the resource
- RES\_NAME: The name of the resource
- ATTRIBUTE\_1,  ATTRIBUTE\_2, ATTRIBUTE\_3: Any other important aspects of the resource
