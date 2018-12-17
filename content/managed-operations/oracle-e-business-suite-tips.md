---
permalink: oracle-e-business-suite-tips/
audit_date: '2017-10-12'
title: Oracle E-Business Suite tips
type: article
created_date: '2017-10-09'
created_by: Catherine Richardson
last_modified_date: '2017-10-16'
last_modified_by: Catherine Richardson
product: Managed Operations
product_url: managed-operations
---

Oracle® E-Business Suite (EBS) is the most comprehensive suite of integrated,
global business applications that enable organizations to make better
decisions, reduce costs, and increase performance. This article is for those
who know the basics of EBS and want to take their skills to the next level.

For more information about new ways to work in Oracle, check our
[blog](https://info.tricoresolutions.com/blog)
or [contact us](https://www.tricoresolutions.com/about-us/contact-us/).

This article includes tips to perform the following tasks:

- [General navigation](#general-navigation)
  - [Create a Top Ten List](#create-a-top-ten-list)
  - [Customize the order of the tabs](#customize-the-order-of-the-tabs)
  - [Sort summary forms](#sort-summary-forms)
  - [Copy Descriptive Flex Field values](#copy-description-flex-field-values)
  - [Enable Oracle Zoom](#enable-oracle-zoom)
  - [Fix Oracle forms closing too often](#fix-oracle-forms-closing-too-often)
  - [Hide the Preferences link](#hide-the-preferences-link)
  - [Use the document navigator](#use-the-document-navigator)
  - [Switch from data entry mode to query mode](#switch-from-data-entry-mode-to-query-mode)
- [Tools tips](#tools-tips)
  - [Oracle folder tools](#oracle-folder-tools)
  - [Export data from Oracle Summary forms](#export-data-from-oracle-summary-forms)
  - [Use the inventory Patch Wizard](#use-the-inventory-patch-wizard)
  - [Leverage MOAC security](#leverage-moac-security)
  - [Use attachments in Oracle applications](#use-attachments-in-oracle-applications)
- [Payables tips](#payables-tips)
  - [Payment on receipt](#payment-on-receipt)
  - [Priority number](#priority-number)
  - [Payments process in Oracle release 12](#payments-process-in-oracle-release-12)
  - [Regulatory reporting](#regulatory-reporting)
- [Purchasing tips](#purchasing-tips)
  - [Confirm receipts](#confirm-receipts)
  - [Professional Buyer's Work Center](#professionsl-buyer's-work-center)
  - [Purchase requisitions versus internal requisitions](#purchase-requisitions-versus-internal-requisitions)
  - [Requisition approver unavailable](#requisition-approver-unavailable)
- [Receivables tips](#receivables-tips)
  - [Manage revenue contingencies](#manage-revenue-contingencies)
  - [Empower collection agents](#empower-collection-agents)
  - [Invoice create memo netting](#invoice-create-memo-netting)
  - [Import multiple pre-calculated TAX lines](#import-multiple-pre-calculated-tax-lines)
  - [Score customers for collections](#score-customers-for-collections)
- [Project accounting tips](#project-accounting-tips)
  - [Derive expenditure item supplier invoice items](#derive-expenditure-item-supplier-invoice-items)
  - [Track project budgets](#track-project-budgets)
- [Miscellaneous tips](#miscellaneous-tips)
  - [Improve cash management in payables](#improve-cash-management-in-payables)
  - [Not ready for advanced supply chain planning](#not-ready-for-advanced-supply-chain-planning)
  - [Leverage Data Transfer Consolidation](#leverage-data-transfer-consolidation)  

### General navigation

This section includes some tips about general navigation in EBS.

#### Create a Top Ten List

Oracle EBS lets you store your top ten functions as favorites. Your Top Ten
List is on the right side of the Main Menu. After you have added a function to
your Top Ten List, you can open it by typing the number assigned to the
function.

Use the following steps to add a function to your Top Ten List:

1.  In the Navigator page, click the **Functions** tab.

2.  Select the function of your choice.

3.  Click the right arrow in the center of the Navigator to move the
    function to your Top Ten List.

#### Customize the order of the tabs

Standard functionality in Oracle allows you to change the order of the tabs on
many Oracle forms. Changing the tab order facilitates faster navigation and is
useful for processing things such as Accounts Payable (AP), Accounts
Receivable (AR), and General Ledger (GL) journals.

Use the following steps to change the order of tabs on Oracle forms:

1.  Have access to **Oracle Forms Personalization**.

2.  Open any form.

3.  Use the path **Help > Diagnostics > Custom Code > Personalize** to access
    the dialog to customize the order of the tabs.

    This brings up the Personalization Form in the context of the form and
    function that you are in. Here you build the personalizations specific to
    that form or function. (You use the **Folder Tools** to move a field.)

#### Sort summary forms

If you open a summary form and you want to change the way that it is
sorted, you can usually change the sort order on the first three fields.

Use the following steps to change the sort order:

1.  Use the **Folder Tools** to move a field into one of the first three
    positions used for the sort.

2.  Perform the sort in either of the following ways:

    a.  Double click the column header.

    b.  Go to **Folder > Sort Data**.    

#### Copy Descriptive Flex Field values

To copy Descriptive Flex Field (DFF) values from the **Payables Invoice Line**
to **Invoice Distribution**, set the following profile option at the site
level to **Yes**:

     AP: Copy Invoice Lines Flex field to Distributions during Import

#### Enable Oracle Zoom

Oracle Zoom is a fast way to navigate Oracle forms. By using Oracle Zoom, you
can be in one Oracle form and change to another form without navigating to the
Main Menu. Oracle Zoom also allows you to build custom links through
**Forms Personalization** and use global variables to transfer data across
forms.

To enable Oracle Zoom in EBS Release 12.2.6, navigate through **Help >
Diagnostics > Properties > Item** and then click **Close**.

Another option to enable Oracle Zoom is to do a small **Forms
Personalization** to enable the Zoom option directly. Use the following steps
for this option:

1.  While in a form, create a form personalization to call the Properties
    window with these settings:

        Seq: 10
        Desc: First step is to call the Properties window
        (Condition Tab)
        Target Event: WHEN-NEW-ITEM-INSTANCE
        Target Object: APPTREE_NAV_TREE.NAVIGATOR
        Processing Mode: Both
        (Actions Tab)
        Seq: 10
        Type: Property
        Language: All
        Object Type: Window
        Target Object: APPTREE_FOLDER_PROPS
        Property Name: VISIBLE
        VALUE: TRUE

2.  Create another forms personalization to disable and close the Properties
    window with these settings:

        Seq: 20
        Desc: Second step is to disable and close Properties window
        (Condition Tab)
        Target Event: WHEN-NEW-BLOCK-INSTANCE
        Target Object: APPTREE_FOLDER_PROPS
        Processing Mode: Both
        (Actions Tab)
        Seq: 20
        Type: Builtin
        Language: All
        Builtin Type: GO_ITEM
        Argument: RESULTS.GRID

3.  Save these form personalizations.

4.  Close and reopen the form to see that the Zoom option is enabled directly  
    without navigating through properties.

#### Fix Oracle forms closing too often

If the form that you are working on closes when you open another form in the
same responsibility, you might have the **Close Other Forms** option enabled.

To disable the **Close Other Forms** option, use the following steps:

1.  While in the Navigator form, go to the **Tools** menu.

2.  In the Tools dropdown menu, check to see if the **Close Other Forms**
    option is enabled (has a check mark in the box beside it).

3.  If the options is enabled, deselect the checkbox beside **Close Other
    Forms** to disable it.

#### Hide the Preferences link

The easiest way to hide the **Preferences** link is by changing the **General
Preferences Show Flag** profile option that can be set on **Site**,
**Responsibility**, and **User Level**. The default values are **NULL**,
which means to show the link.

Use the following steps to hide the link:

1. In System Administrator Responsibility, navigate to **Profile > System**

2. Search for the **General Preferences Show Flag** profile option.

3. Set the profile option value to **No**.

4. Save the changes.

5. Log out and then log back in to see the results.

#### Use the document navigator

Expedite navigation by using the document navigator to eliminate the need to
navigate back and forth to a document that you are working on.

Use the following steps to use the document navigator:

1.  Open the purchase order (PO) or invoice that you want to work on.

2.  Select **File > Place on Navigator** from the menu.

    The document is placed on the Navigator. This acts as a Zoom to get you
    back to the document quickly.

3.  From the Main Menu, click **Documents** to see all of your documents.

    Additionally, you can rename, organize, and clean up your document
    names.    

#### Switch from data entry mode to query mode

By using your function keys, you can switch your open form from data entry
mode to query mode.

Use the following steps to use the function keys to switch modes:

1.  Open a form.

2.  Use the **F11** key to switch modes. In query mode, the fields turn blue.

3.  Enter your search criteria.

4.  Use the **Control** + **F11** keys at the same time to execute your
    query.

You can also enter query mode by using the menu. Use the following steps to
switch modes in the menu:

1.  Open a form.

2.  Under the **View** menu, in the **Query by Example** section, use the
    **Enter** menu to switch from data entry mode to query mode.

4.  In the **Query by Example** section, use the **Run** menu to execute the
    query.

### Tools tips

This section includes tips about using some of the tools in EBS.

#### Oracle Folder Tools

Use Oracle Folder Tools to change the layout of an Oracle Summary form, such
as, an Invoice Summary or a PO Summary.

Access Oracle Folder Tools by clicking on the Folder Tools icon in the
menu. You can make the following changes:

- Move fields
- Add fields
- Hide fields
- Shrink and enlarge fields
- Save changes as your default view or a selectable view

Oracle Folder Tools enables features for form layouts that are similar to
Microsoft® Excel®. You can also save your frequently used queries for
future use.

#### Export data from Oracle Summary forms

You can export data from Oracle Summary forms for quick Ad Hoc reports. Use
the following steps to export the data:

1.  When your query has completed, navigate to **Tools > Export**.

2.  If you export to a text file but would rather export directly to Microsoft
    Excel, go to **Windows > Control Panel > Default Programs**.

3.  Change the default program for ``.csv`` files to Excel.

    **Note**: Exporting data in this way does not work for On-Hand inventory.
    For On-Hand inventory, right-click and select **Copy All Rows**. Then
    paste the rows into Excel.  

#### Use the inventory Patch Wizard

Use the Patch Wizard to stay up-to-date with your inventory patches. EBS
inventory customers are often asked if they are patched to the most recent
file version. To get the most out of their inventory investment, it's critical
that they avoid known issues by being patched up to the most recent product
patches available. The Patch Wizard is a key tool to use to keep patches
up-to-date.

The Patch Wizard is an interface that analyzes and compares patches currently
applied in your instance to the patches included in the Recommended Patch List
(RPL). It allows you to set your execution preferences, then performs impact
analysis, and allows easy download of the patches that you decide to apply.
You can easily access the Patch Wizard from the Oracle Applications Manager
menu by using the System Administrator Responsibility.


#### Leverage Multiple Organization Access Control security

Oracle EBS 12 has an integrated Service Oriented
Architecture (SOA) Gateway that leverages the Multiple Organization Access
Control (MOAC) security feature to ensure that only authorized users have data
access privilege within an operating unit.

Businesses can define multiple organizations and the relationships between
them in a single installation of EBS. Examples of multiple organizations are
sets of books, business groups, legal entities, operating units, or inventory
organizations. The following table shows the relationship between security
profiles, responsibilities, and operating units for a sales company:

Responsibility   |   Security   |   Operating unit
--- | --- | ---
Sales manager  |  XYZ Sales security profile  |  XYZ USA, XYZ UK, XYZ Corp
Sales supervisor  |  USA Sales security profile  |  XYZ USA, XYZ East, XYZ West  
Sales representatives  |  New York Sales security profile  |  New York region

With MOAC, a system administrator can predefine the scope of access privileges
as a security profile, and then use the profile option **MO: Security
Profile** to associate the security profile with a responsibility.

By using this approach, multiple operating units are associated with a
security profile and the security profile is assigned to a responsibility.
Therefore, through the access control of security profiles, users can access
data in multiple operating units without changing responsibilities.

#### Use attachments in Oracle applications

To illustrate or clarify your application data, you can link non-structured
data such as images, word processing documents, spreadsheets, web pages, or
video to more structured application data. For example, you can:

- Attach images to inventory items
- Attach video to manufacturing operations
- Attach Certificates of Insurance to Suppliers

Invoke the Attachment form to view an attachment by pressing the
Attachment toolbar button or clicking on the paperclip icon. The toolbar
Attachment icon indicates whether the Attachments feature is enabled in a form
block:

- When the button is dimmed, the Attachment feature is not available.

- When the Attachment feature is enabled in a form block, the icon becomes a
  solid paper clip.

  The icon switches to a paper clip holding a paper when the Attachment feature
  is enabled in a form block, and the current record has at least one
  attachment.

**Note**: The **Indicate Attachments** profile option allows you to turn off
indication of attachments when querying records for performance reasons.

### Payables tips

This section includes tips about working with payables in EBS.

#### Payment on receipt

Payment on Receipt enables you to automatically create standard, unapproved
invoices for payment of goods based on receipt transactions.

Invoices are created by using a combination of receipt and purchase order
information, which eliminates duplicate manual data entry and ensures accurate
and timely data processing. Payment on Receipt is also known as Evaluated
Receipt Settlement (ERS) and Self Billing.

You can automatically create invoices with multiple items and distribution
lines, and include tax. You define which supplier sites participate in Payment
on Receipt and enforce matching rules to ensure the proper payments are made
to the suppliers.

The Pay on Receipt Auto Invoice program automatically creates an invoice batch
depending on the options in the Payables Options window. Invoice count and
invoice total are calculated automatically.

#### Priority number

Oracle Payments does not allow you to select random invoices for
payment. However, you can use the **PRIORITY_NUMBER** option for this purpose.
This option has a default value of 99, which indicates top priority. Make sure
that you set appropriate value for **PRIORITY_NUMBER** on invoices to be
selected for next payment process to use this feature.

#### Payments process in EBS release 12

The Oracle Payments process in release 12 creates each line for each
remittance (invoice). If the payment batch selected 1000 remittances, the
Payments process creates 1000 lines.

The **Check Template** creates a number of overflow checks based on the
**Number of remittances per page** setup value.

**Note**: Some clients don’t want to see so many VOID checks. They want to
print one check with a summary line.

#### Regulatory reporting

The regulatory reporting feature available in the Oracle Payments
module can be used by corporations to manage the reporting that is
required by a regulatory body, such as a country-specific government, a
central bank, or an individual bank.

This feature provides the following fields with seeded values in the
**Regulatory Reporting** region of the **Payment Process Profile** page. These
fields enable you to determine the conditions under which regulatory reporting
can be generated.

- **No Reporting**
- **Reporting Directly to Central Bank**
- **Reporting Made by Bank**

Oracle Payments also provides a SQL function to personalize the conditions and
implement business criteria. Oracle Payments enables you to set up payment
reason codes that provide the payment system or bank with additional details
about the reason for the payment for regulatory reporting purposes.

**Note**: You can define payment reason codes in the **Create Payment Reason
Code** page of **Payment Administrator**.

### Purchasing tips

This section includes tips about working with purchasing in EBS.

#### Confirm receipts

You must have the Self–Service Purchasing Confirm Receipts Workflow Select
Orders process in Purchasing running in order to use the Confirm Receipts
workflow.

The Confirm Receipts workflow sends notifications through the Web, e–mail, or
Notification Details Web page (accessible through the **Notifications
Summary** menu in Purchasing) to requesters or buyers who create requisitions
in Purchasing or iProcurement. The Confirm Receipts workflow informs people
that they should have received an item.

The Confirm Receipts workflow sends notifications for the following items:

- Destination or Deliver–To Type of Expense

- Routing of Direct Delivery

- Need–By with a date that is equal to or later than today’s date

#### Professional Buyer's Work center

Released in Procurement 12.0, the Professional Buyer's Work Center (PBWC) is a
web-based interface that provides a central launch pad from which you can
efficiently perform the following tasks:

- Manage your requisitions and create them to Purchase Orders (like
  manual autocreate).

- Create new standard purchase orders, blanket purchase agreements, or
  contract purchase agreements.

- Create and maintain supplier information.

- If Oracle Sourcing is licensed and implemented, you can create buyer's
  auctions or sourcing requests for quotes (RFQs) all from the same HTML Page.

- If Oracle Services Procurement is licensed and implemented, you can create  
  and maintain purchase orders for complex work payments.

- If Oracle Procurement Contracts is licensed and implemented, you can handle
  author contract terms and manage deliverables.

- Globally for the PBWC, you can create and personalize your own document  
  views, including a list of columns, where conditions, and sort sequences.

- Globally for the PBWC, you can use predefined document views.  

The PBWC is accessed from the Purchasing responsibility. The Buyer's Work
Center has links to launch to the areas that you want to access.

For more information, see the
[PBWC User Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13410/T446883T443956.htm).

#### Purchase requisitions versus internal requisitions

Use the **Requisitions** window to create requisitions. You must choose the
requisition type: purchase or internal. You can also provide a description,
unlimited notes, and defaults for requisition lines.

**Purchase requisitions**

For each requisition line, choose the item that you want to order along
with the quantity and delivery location. You can get sourced pricing from
catalog quotations or open blanket purchase agreements.

You can also choose a price from a list of historical purchase order prices.
In the **Distributions** window, you can charge the item to the appropriate
accounts, or you can let the Account Generator create the accounts for you.
After you complete the requisition, send it through the approval process.

Purchase requisitions are supplied from purchase orders. They are picked up
when you use Auto-Create RFQs or purchase orders. You can assign them to a
buyer in the **Assign Requisitions** window.

**Internal requisitions**

Internal requisitions are supplied from internal sales orders. Internal
requisitions are not picked up when you use Auto-Create RFQs or purchase
orders, nor can they be assigned to a buyer in the **Assign Requisitions**
window.

#### Requisition approver unavailable

Oracle iProcurement can automatically forward documents when users do not
respond to notifications. This tool is used to prevent documents from holding
up business productivity. Oracle workflows manage this functionality,
typically set up to send a first and second reminder after pre-determined time
periods. If no response is received, the system forwards the notification to
the next approver.

For more information, see the [Oracle iProcurement User Guide](https://docs.oracle.com/cd/E26401_01/doc.122/e48970/T434157T434163.htm).

### Receivables tips

This section includes tips about working with receivables in EBS.

#### Manage revenue contingencies

Oracle Receivables supports revenue contingencies with a robust, event-based
revenue management process. The event-based model is based on stringent
revenue recognition requirements authorized by US GAAP or International
Accounting Standards Board.

In Oracle Receivables Revenue, contingencies are terms and conditions in a
sales contract or order that prevent revenue from being immediately recognized.

Following are typical contingencies that can delay revenue recognition:

- Fiscal funding clauses (for government contracts)
- Cancellation clauses
- Customer acceptance clauses
- Customer creditworthiness
- Nonstandard payment terms
- Nonstandard refund policies

Oracle Receivables uses event-based revenue management to automatically
evaluate your invoices and determine whether to immediately recognize revenue,
or temporarily defer revenue to an unearned revenue account. Revenue is
subsequently recognized depending on certain events, such as customer
acceptance or receipt of payment.

For more information, see the [Oracle Receivables Implementation Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13510/T447343T470046.htm).

#### Empower collection agreements

Oracle Advanced Collections provides a robust feature called Universal Work
Queue (UWQ). UWQ provides a high-level list of all actionable work assigned to
or owned by a collections agent. In UWQ, the work is automatically populated
on a screen as part of the automated collections management flow provided
by Oracle Advanced Collections. Collections agents save their time and effort
in finding work or remembering follow ups to be taken for various customers.

For more information, see the [Oracle Advanced Collections User Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13451/T379880T379883.htm).

#### Invoice credit memo netting

If you use Invoice Credit Memo Netting in Oracle Receivables release 12,
ensure that the credit memo **LINE** and **TAX** link is the same as the
invoice **LINE** and **TAX** link. Otherwise, the netting will not work.

#### Import multiple pre-calculated TAX lines

When you are importing multiple, pre-calculated **TAX** lines, the link
between **TAX** and **LINE** is critical.

In release 11i, you can assign all **TAX** lines to one **LINE**,
but in release 12, you need to assign a distinct **TAX** code to each **LINE**.
If enough **LINE** lines are not available, create $0.00 dummy **LINE** lines
and use them for the **TAX** line.

#### Score customers for collections

Scoring in Oracle Advanced Collections is another feature that forms the
foundation of business collections activities. Oracle Advanced Collections
uses scoring in the following ways:

- To determine transaction status - Current, Delinquent, or Pre-delinquent

  When scoring transactions, Advanced Collections looks at transactions from
  Oracle Receivables, including the following transactions:

  - Invoices, debit memos, and chargebacks
  - Lease invoices originating in Oracle Lease Management
  - Loan invoices originating in Oracle Loans

  In general, if a customer has delinquent transactions, the customer is
  considered to be delinquent.

- To determine the value of each customer

  When scoring to assign customer value, you can use any data point about the  
  customer. Typically, you run customer value scoring at an operational data
  level, such as customer, account, bill to, or delinquency.

For more information, see [Oracle Advanced Collections Implementation Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13452/T387641T426675.htm).

### Project accounting tips

This section includes accounting tips for working in EBS.

#### Derive expenditure item supplier invoice items

Oracle Projects determines the default expenditure date for project-related
supplier invoice items by using the **PA: Default Expenditure
Item Date Source for Supplier Costs** profile option. This profile option is
used to determine the default expenditure item date for supplier invoice
distribution lines and derives the item expenditure date during the invoice
match process and when you enter unmatched invoices.

The default expenditure date is derived when the concurrent process, **PRC:
Interface Supplier Costs**, is submitted to interface project-related supplier
costs into Oracle Projects from Oracle Payables.

For the transactions that are rejected during the validation and interfacing
to Oracle Projects, the default expenditure item date can be updated for
invoice distribution lines on the Invoice Workbench in Oracle Payables.

Additionally, you can to update the expenditure item date using the Review
Transactions window within Oracle Projects.

For more information, see [Oracle Projects Implementation Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13582/T188672T354742.htm#imp_po_expndsuppacc).

#### Track project budgets

Oracle Projects allows you to track project costs against project budgets.
Project Budgets can be defined in the following ways in Oracle Projects:

- Directly via budget screens in Oracle Projects
- Import budgets from external systems via import process

Oracle Projects includes the following product budget features:

- **Multiple budget versions**: Create multiple budget versions that include
  all of the costs for your project, such as engineering costs, item costs,
  manufacturing costs, and overheads. You can revise your estimate to complete
  many times during a project. Each project that you define can be compared to
  the current or baseline budget with earlier versions for analysis and
  reporting.

- **Several budget types**: Create diverse budgets including cost budgets,  
  revenue budgets, forecasted revenue budget, and approved cost budget.

- **Time-phased budgeting**: Create user-defined time periods or use existing
  calendars in Oracle General Ledger or Oracle Projects to establish multiple
  budgeting periods.

- **Budget extensions**: Customize budget extensions to meet your company's
  budgeting requirements.

- **Budget baselining and approval**: Project budgets can be baselined and  
  used in a workflow-supported approval process for approving your project
  budgets.

### Miscellaneous tips

This section includes miscellaneous tips for working in EBS.

#### Improve cash management in payables

To improve your organization’s current and future cash management in Accounts
Payables, you can use the Payables Manager to run the Payables Cash
Requirement Report.

The Payables Cash Requirement Report forecasts immediate cash needs for your
invoice payments. The Payables Manager can submit this report before
processing every payment process request to determine your cash requirements
for the payment process request.

You can also submit this report for the next few payment process requests to
forecast your cash requirements. The Payables Cash Requirement Report produces
output based on the Payment Template defined in the payment process request.
The Payables Cash Requirement generates output for all business units that
Payables Manager has access to enter invoices and process payment requests.
The Payables Manager can run the report from several pages in Oracle Payables
including **Manage Scheduled Processes** and **Create Payment Process Request
Template**.

#### Not ready for advanced supply chain planning

Oracle has alternatives to full blown implementations of advanced supply chain
planning.

Options such as Min Max Planning and Reorder Point Planning assist in getting
your demand history and might serve as a quick win until there is proper
funding or an approved advanced supply chain planning implementation project.

#### Leverage Data Transfer Consolidation

If your financial data is spread across multiple ledgers that do not
share the same chart of accounts and accounting calendar combination, or the
ledgers are on separate instances, consider using the Global Consolidation
System within Oracle General Ledger to consolidate results.

You can leverage a proven methodology called Data Transfer Consolidation (DTC)
in the Global Consolidation System. DTC methodology is used to move your
financial data from diverse ledgers and data sources into a single
consolidation parent ledger.

You can then report on and analyze consolidated financial information from
this consolidated ledger. Use the Global Consolidation System in situations
where you need to physically move the data to a consolidated location rather
than simply report off multiple ledgers in a set.

Global Consolidation System is the traditional consolidation methodology in
Oracle Financials. The Global Consolidation System imports in the form of
balances and journal level vouchers, and from appropriate accounts from the
trial balances of subsidiary ledgers.

For more information, see [Oracle General Ledger User's Guide](https://docs.oracle.com/cd/E18727_01/doc.121/e13627/T312864T314184.htm).
