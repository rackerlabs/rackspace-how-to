---
permalink: cloud-office-quick-start-for-uk-customers/
audit_date: '2018-01-30'
title: Cloud Office quick start for UK customers
type: article
created_date: '2015-06-22'
created_by: Rose Contreras
last_modified_date: '2018-10-25'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

The instructions in this article are for customers who signed up for their Rackspace Email account at <http://www.rackspace.co.uk>. The steps in this article guide you through setting up your Rackspace mail services.


### Access your Cloud Office Control Panel

1.  Log in to the [MyRackspace Portal](https://login.rackspace.com/).
2.  In the top navigation bar, click **Select a Product > Dedicated Hosting**.
3.  Click **Products > Cloud Office**.
4.  In the Cloud Office window, click **Open Cloud Office Control Panel**.

### Add mailboxes

Follow these steps to add a mailbox.

1.  In the email hosting section, click **Mailboxes**.
2.  Click the domain to which you want to add mailboxes.
3.  Click **Add Mailbox**.
4.  On the **General** tab, enter values in the **User Details** section.

    **Note:** **User Name** is the email address for the new mailbox. The domain for the email address is already entered. For example, to set up the email address **info@ukkcmail.com**, type **info** in the **User Name** field.

5.  On the **Contact Info** tab, enter values in the Basic Info, Phone Numbers, and Other User Data sections.

6.  Click **Save**.

    **Note:** If you want to move your existing email account to your Rackspace account, contact the Cloud Office support team about your migration before you change your MX records. Contact Cloud Office support at 0800 954 1007 or 020 8734 4029. You can also create a Cloud Office support ticket by selecting **Support > Tickets > Create New Ticket**.

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

-   Use Outlook, Exchange, Thunderbird, or another email client of your preference. Use our [interactive guide](https://emailhelp.rackspace.com/) to help you set up your email client.

If you have questions or need assistance to view your email, contact Rackspace Cloud Office support by live chat, or by phone at 0800 954 1007 or 020 8734 4029. You can also create a support ticket in the [MyRackspace Portal](https://login.rackspace.com).

#### Add a new domain

Follow these steps to set up a mailbox alias.

1.  Log in to the [MyRackspace Portal](https://login.rackspace.com/).
2.  In the top navigation bar, click **Select a Product > Dedicated Hosting**.
3.  Click **Products > Cloud Office**.
4.  In the Cloud Office window, click **Open Mail Control Panel**.
5.  From the **Go to section** menu or the **Domains** section, click **Domains**.
6.  Click **Add Domain**.
7.  Enter the new domain into the **Domain Name** field.
8.  Select the product options that you want to add to your domain:
    -   Rackspace Email
    -   Microsoft Exchange with ActiveSync
    -   Rackspace Archiving

9.  Click **Save**.

### Add an alias

Follow these steps to set up a mailbox alias.

1.  Log in to the [MyRackspace Portal](https://login.rackspace.com/).
2.  In the top navigation bar, click **Select a Product > Dedicated Hosting**.
3.  Click **Products > Cloud Office**.
4.  In the Cloud Office window, click **Open Mail Control Panel**.
5.  In the Rackspace Email section, click **Aliases**.
6.  Select the domain for which you want to add an alias.
7.  Click **Add Alias**.
8.  Enter the new alias in the **Create New Alias** field.
9.  Select members of your domain and move them to the **Members of this Alias** field, and click **Add**.
10.  *(Optional)* Add email addresses for members outside of your domain into the **Email Address** field, and click **Add**.
11.  Click **Save**.

**Note:** To add a *domain alias*, create a support ticket in the
[MyRackspace Portal](https://login.rackspace.com/), call, or chat in. This option is not available in the Control Panel and must be added by your support team.

### Migrate your existing mail account

You can migrate your email data to your Rackspace mail account in the following ways:

-   **Do it yourself** - If you are currently using a POP mailbox, this is your only option. If you are not certain or have any questions, contact our Support team at 0800 954 1007 or 020 8734 4029. You can also create a support ticket in the [MyRackspace Portal](https://login.rackspace.com/).

-   **Self-service tool** - Run your migration at any time of the day or night with our easy-to-use version of MigrationWiz. For more information, see [Migrate your email by using the Self-Service tool](/how-to/migrate-your-email-by-using-the-self-service-migration-tool/).

-   **Assisted migrations** - This option is for companies that need help with consulting, planning, and scheduling a migration project. Contact our Assisted Migrations team by creating a support ticket in the [MyRackspace Portal](https://login.rackspace.com/). They will provide you with all the necessary information.

### Set up payments

The initial credit card payment that you made online was a one-time payment. Follow these steps to set up your preferred payment method:

1.  Log in to the [MyRackspace Portal](https://login.rackspace.com/).
2.  Click **Account**, and select **Transactions**.
3.  Select **Payment Methods** to make a payment or review payment methods.
    You can also select **Billing Settings** to review your billing settings.

### View and download invoices

To view and download your invoices follow these steps:

1.  Log in to [MyRackspace Portal](https://login.rackspace.com).
2.  Click **Account**, and select **Transactions**.
3.  To view and download your invoice, click on it and either select **View** or select a file type to download.

### Downgrade or cancel your services

If you want to downgrade your services, you must submit a support ticket.

Rackspace has a 30-day cancellation policy. Inform us of your intentions by either calling us or submitting a support ticket.

**Note:** Email hosting services are a month-to-month service billed in arrears and are not billed pro-rata.

### Mail terms, conditions, and acceptable usage policy

[Rackspace Mail terms and conditions](http://www.rackspace.com/information/legal/mailterms)

[Read the Rackspace mail acceptable use policy](http://www.rackspace.com/information/legal/aup)
