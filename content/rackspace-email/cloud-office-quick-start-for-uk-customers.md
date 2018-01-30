---
permalink: cloud-office-quick-start-for-uk-customers/
audit_date: '2018-01-30'
title: Cloud Office quick start for UK customers
type: article
created_date: '2015-06-22'
created_by: Rose Contreras
last_modified_date: '2018-01-30'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

The instructions in this article are for customers who signed up for their Rackspace Email account at <http://www.rackspace.co.uk>. The steps in this article guide you through setting up your Rackspace mail services.


### Access your Cloud Office Control Panel

1.  Log in to the [MyRackspace Customer Portal](https://my.rackspace.com/).
2.  From the **Products** menu, click **Cloud Office**.
3.  In the Cloud Office window, click **Open Cloud Office Control Panel**.

### Add mailboxes

Follow these steps to add a mailbox.

1.  In the email hosting section, click **Mailboxes**.
2.  Click the domain to which you want to add mailboxes.
3.  Click **Add Mailbox**.
4.  On the **General** tab, enter values in the **User Details** section.

    **Note:** **User Name** is the email address for the new mailbox. The domain for the email address is already entered. For example, to set up the email address **info@ukkcmail.com**, type **info** in the **User Name** field.

5.  On the **Contact Info** tab, enter values in the Basic Info, Phone Numbers, and Other User Data sections.

6.  Click **Save**.

    **Note:** If you want to move your existing email account to your Rackspace account, contact the Cloud Office support team about your migration before you change your MX records. Contact Cloud Office support at 0800 954 1007 or 020 8734 4029. You can also create a Cloud Office support ticket by selecting **Support &gt; Tickets &gt; Create New Ticket**.

### Change your MX records

MX records tell the Internet where to deliver your mail. You must have access to your Domain Name System (DNS) records in order to point your MX records to the Rackspace email servers. For instructions on setting up your DNS records, see [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email).

If you do not have access to your DNS records, contact your domain registrar and have them update your MX records by using the following values:

-   `MX1.EMAILSRVR.COM (Priority 10)`
-   `MX2.EMAILSRVR.COM (Priority 20)`

The MX record changes take about 24 hours to update. During the update, mail starts being delivered to your
*new mailboxes* instead of your old ones.

#### View your mail

Choose one of the following options to view your new mailboxes.

-   Go to the Rackspace Webmail site at [https://apps.rackspace.com](https://apps.rackspace.com/).

-   Use Outlook, Exchange, Thunderbird, or another email client of your preference. Use the [Rackspace Cloud Office interactive guide](https://emailhelp.rackspace.com/) to help you set up your email client.

If you have questions or need assistance to view your email, contact Rackspace Cloud Office support by [live chat](https://cp.rackspace.com/Default.aspx), or by phone at 0800 954 1007 or 020 8734 4029. You can also create a support ticket in the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=Default.aspx).

#### Add a new domain

Follow these steps to set up a mailbox alias.

1.  Log in to the [MyRackspace Customer Portal](https://my.rackspace.com/).
2.  From the **Products** menu, click **Email & Apps**.
3.  In the Email & Apps window, click **Open Mail Control Panel**.
4.  From the **Go to section** menu or the **Domains** section, click **Domains**.
5.  Click **Add Domain**.
6.  Enter the new domain into the **Domain Name** field.
7.  Select the product options that you want to add to your domain:
    -   Rackspace Email
    -   Microsoft Exchange with ActiveSync
    -   Rackspace Archiving

8.  Click **Save**.

### Add an alias

Follow these steps to set up a mailbox alias.

1.  Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/).
2.  In the Rackspace Email section, click **Aliases**.
3.  Select the domain for which you want to add an alias.
4.  Click **Add Alias**.
5.  Enter the new alias in the **Create New Alias** field.
6.  *(Optional)* Select members of your domain and move them to the **Members of this Alias** field, and click **Add**.
7.  *(Optional)* Add email addresses for members outside of your domain into the **Email Address** field, and click **Add**.
8.  Click **Save**.

**Note:** To add a *domain alias*, create a support ticket in the
[MyRackspace Customer Portal](https://my.rackspace.com/). This option is not available in the
Cloud Office Control Panel.

### Migrate your existing mail account

You can migrate your email data to your Rackspace mail account in the following ways:

-   **Do it yourself** - If you are currently using a POP mailbox, this is your only option. If you are not certain or have any questions, contact our Support team at 0800 954 1007 or 020 8734 4029. You can also create a support ticket in the [MyRackspace portal](https://my.rackspace.com/).

-   **Self-service tool** - Run your migration at any time of the day or night with our easy-to-use version of MigrationWiz. To start this process, create a support ticket in the [MyRackspace portal](https://my.rackspace.com/). For more information, see Migrate your email by using the Self-Service tool.

-   **Assisted migrations** - This option is for companies that need help with consulting, planning, and scheduling a migration project. Contact our Assisted Migrations team by creating a support ticket in the [MyRackspace portal](https://my.rackspace.com/). They will provide you with all the necessary information.

### Set up payments

The initial credit card payment that you made online was a one-time payment. Follow these steps to set up your preferred payment method:

1.  Log in to the [MyRackspace Customer Portal](https://my.rackspace.com/).
2.  Select **Account &gt; Payments** from the drop-down menu.

### View and download invoices

To view and download your invoices follow these steps:

1.  Log in to [MyRackspace Customer Portal](https://my.rackspace.com).
2.  Click **Account**, and select **Transactions**.

    You can view an invoice by clicking on its number.

3.  To download your invoices, click the **Actions** button, and select **Export All Transactions**.

### Downgrade or cancel your services

If you want to downgrade your services, you must submit a support ticket.

Rackspace has a 30-day cancellation policy. Inform us of your intentions by either calling us or submitting a support ticket.

**Note:** Email hosting services are a month-to-month service billed in appears and are not billed pro-rata.

### Mail terms, conditions, and acceptable usage policy

[Rackspace Mail terms and conditions](http://www.rackspace.com/information/legal/mailterms)

[Read the Rackspace mail acceptable use policy](http://www.rackspace.com/information/legal/aup)
