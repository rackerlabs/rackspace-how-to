---
permalink: create-an-archive-audit-report/
audit_date:
title: Create an archive audit report
type: article
created_date: '2015-05-18'
created_by: Beau Bailey
last_modified_date: '2015-01-26'
last_modified_by: Kyle Laffoon
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

**Note:** The information contained in this article is for Cloud Office
account administrators only.

The Archive Manager records all user interactions. To view a report of
activity, Account Administrators can create an audit report. Reports can
include information about the following items:

-   Collections (when email is indexed and made searchable)
-   User management
-   Account settings
-   Creation of searches
-   Changes in scope to existing searches
-   Viewing of searches by users
-   Comments and ads placed on messages
-   Exporting of emails from a search

**Note:** Reports are sent to the email address associated with your
archiving account admin user name.

To create an archive audit report, perform the following steps:

1.  Log in to the [Archive
    Manager](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f).
    For more information, see [Log in to the Archive
    Manager](/how-to/log-in-to-the-archive-manager).

2.  In the upper-right corner of the window, click **Admin** to access
    the Admin dashboard.
    **Note**<span>: There are three dashboards for top-level
    administrators:  **Search**, **Admin**, and **Admin User**. If you
    do not see the </span>**Admin**<span> link in the upper-right, you
    are already on the Admin dashboard.</span>

3.  Click the **Reports** tab.

4. From the **Choose report** dropdown menu, select one of the
    following report types:

    - **Activity by User** - This report lists all users, their actions,
      the date of the actions, and the number of times that the
      actions were performed.

    - **Activity by UI Action** - This report lists all actions in
      alphabetical order, the users that performed the actions, the
      date, and the number of times that the actions were performed.

    - **Activity by Date** - This report lists by date the users who
      performed actions, the action performed, and the number of times
      that the actions were performed.

    - **Collection by Mailbox** - A collection indexes gathered email
      data and makes it searchable. This occurs automatically nightly.
      This report lists mailboxes, the number of email messages
      collected, the data size, and the date collected. These
      mailboxes are not your user mailboxes; they are collection
      points, and there is usually just one per account.

    - **Collection by Date** - A collection indexes gathered email data
      and makes it searchable. This occurs automatically nightly. This
      report lists the dates of collections, the number of email
      messages collected, the data size, and the mailbox collection
      point.


5. For **Format option**, select whether you want the report in **PDF**
   or **CSV** format. The PDF format is ideal for read-only reports.
   The CSV format is ideal if you want to sort or repurpose the report
   data.

6.  For **Date Range**, specify a date range for the report. To select a
    specific date range, click the calendar icons.

7.  In the **Sort options** section, indicate how you want the data to
    be sorted in the **Order by** dropdown menu. You can sort data by
    user name (*User*), date created (*Date*), or by user actions
    (*Activity*).

8. For **Sort order**, choose you want your report in ascending or
   descending order.

9.  Click **Create Report**. The report is sent to the email address
    associated with your account admin user name.
