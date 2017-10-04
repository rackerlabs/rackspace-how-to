---
permalink: migrate-your-email-by-using-the-self-service-migration-tool/
audit_date: '2016-09-01'
title: Migrate your email by using the Self-Service Migration Tool
type: article
created_date: '2013-03-18'
created_by: William Loy
last_modified_date: '2017-07-18'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

Use the Self-Service Migration Tool provided in the Cloud Office Control Panel to copy email data from your current provider to Rackspace Email, Rackspace Hosted Exchange, or Rackspace Office 365.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Up to several hours, depending on how much data is migrated
- **Tools required:** Cloud Office Control Panel access, DNS host Administrator access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

**Note**: Some of the full version features of MigrationWiz (at migrationwiz.com) are not available within the Self-Service Migration Tool. If you want to use the full version, see [Access the full version of MigrationWiz](/how-to/accessing-the-full-version-of-migrationwiz).

### Create mailboxes

Before you begin your migration, you must create your mailboxes on the Rackspace environment. The migration tool does not create your mailboxes for you.

Use the following resources to help you create your mailboxes:

- Rackspace Email: [Add Rackspace Email mailboxes](/how-to/add-rackspace-email-mailboxes)
- Microsoft Exchange: [Add Microsoft Exchange mailboxes](/how-to/adding-microsoft-exchange-mailboxes-0)
- Rackspace Office 365:
  - [Add an Office 365 Licenses](/how-to/add-an-office-365-license/)
  - [Add users individually or in bulk to Office 365](https://support.office.com/en-US/article/Add-users-individually-or-in-bulk-to-Office-365-Admin-Help-1970f7d6-03b5-442f-b385-5880b9c256ec) (Microsoft Support site)
  - [Create a shared mailbox](https://support.office.com/en-us/article/Create-shared-mailboxes-in-Office-365-871a246d-3acd-4bba-948e-5de8be0544c9) (Microsoft Support site)

**Note:** During the migration process, you need the email address and password for every mailbox that you create.

### Migration requirements

**Warning:** *Do not* cancel your source mail server service until you have confirmed with all users that they have their email data.

- Gather all email addresses, usernames, and passwords for mailboxes on both your source (current) and destination (Rackspace Email or Hosted Exchange) mail servers. This information is required for migrating email data with the Self-Service Migration Tool. For Office 365, you can use admin credentials to verify your migration.

   **Note:** The username for a mailbox is typically the same username you would use to log in to the Outlook Web App (OWA) or webmail in a web browser. For Rackspace Email, the username is the full email address.

- Ensure that you can update your email DNS records at your current DNS host. If you do not know where to update your email DNS records, read [Find your DNS host](/how-to/find-dns-host/).  You can find information about the best DNS records for Rackspace in [Set up DNS records for Cloud Office email ](/how-to/set-up-dns-records-for-cloud-office-email).

- Review the list of [items migrated during a Cloud Office migration](/how-to/items-migrated-during-a-cloud-office-migration/).

- Ensure that the size of your source mailbox does not exceed 70 percent of your new mailbox's capacity.

- Copy email from the source server so that no data is lost. Some email messages might be corrupt and not migrate. If you want to back up your mailbox locally, see the "Export data into a .PST file" section in [Migrating Exchange to Exchange via Outlook](/how-to/migrating-exchange-to-exchange-via-outlook/).

- Inform users to refrain from changing their passwords during the migration process.

**Note:** After the migration is complete, users must reconfigure Outlook, [mail clients](/how-to/cloud-office-support-terminology/), and mobile devices to connect to their mailbox at Rackspace. Users can visit https://emailhelp.rackspace.com for configuration instructions.

For more information about the migration preparation required for POP, IMAP, and Exchange servers, see [Prepare POP, IMAP, and Exchange mail servers for migration](/how-to/prepare-pop-imap-exchange-mail-servers-for-migration/).

### Migrate your email

1. Log in to the [Cloud Office Control Panel](cp.rackspace.com).
2. In the **Domains** section at the bottom of the screen, click **Email Migrations**.
3. Click **Start Migration Now**.

   You are redirected to the MigrationWiz portal.

   You can follow the remaining instructions or follow a [MigrationWiz video tutorial](https://www.youtube.com/watch?v=AOvY0gOY1ao).

4. In the **Email Address** box, enter a contact email address that will *not* be migrating. Then, agree to the User Agreement (BitTitan is MigrationWiz), and click **Login**.

   <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/MigWizSC1.png %}" />

   A notification informs you that an email with a secure link has been sent to your email address. Follow the instructions in the email to log in to the MigrationWiz portal.

5. Find the server address for your existing email service:

   - IMAP: If you use Outlook, the incoming server address can be found under your account settings. It typically looks like **mail.domain.com** or **imap.domain.com**.
   - Webmail: Your server address is a portion of the webmail URL. For example, if your webmail address is **https://webmail.domain.com**, then your server address is **webmail.domain.com**.
   - Exchange: Your Outlook Web Access (OWA) address is the best way to connect. Check your mail via an Internet browser. It typically looks like **https://mail.domain.com/owa** or **https://mail.domain.com/exchange**.

    **Note:** You can also use your server's IP address in place of any host names and server addresses.

6. Click **Next**.
7. Enter your source and destination server configuration settings:

    1. Select the source server system type and enter the server address. For IMAP, you must also enter a port number. IMAP ports are **993** (SSL) and **143** (non-SSL).
    2. For the destination server, select the service that you are migrating to, **Rackspace Email**, **Rackspace Exchange 2016**, or **Microsoft Office 365**.
    3. Click **Next**.    

    **Note:** If you are migrating to a hybrid solution (both Rackspace Email and Rackspace Exchange), you must create more than one migration project. Step 12 explains how to start a new project when the current one is completed.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/8-2_0.png %}" width="450" height="328" />

8. Enter the email addresses, usernames, and passwords for the source and destination mailboxes. You can migrate multiple mailboxes by clicking the + symbol or by entering your mailbox information in the spreadsheet provided. Then, click **Next**.

   <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/9-2_0.png %}" width="450" height="311" />

   The next step is a trial migration to ensure that connectivity is successful to both the source and destination mailboxes based on the information that you entered.

9. Click **Next** to begin the trial migration.

10. When the status changes to **Ready for migration**, click **Next**.

    **Note:** If the status shows **Failed**, click the red button labeled **More info**. Next select **Solve Issue** for instructions on resolving the issue.

11. On the Ready to migrate page, click **Next** to begin the migration of your email data.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/13-2_0.png %}" width="450" height="302" />

    Several factors influence how long your email takes to migrate. For a list of possible factors, see [Factors that affect the duration of email migrations](/how-to/factors-that-affect-the-duration-of-email-migrations).

12. After your migration has completed, you can run the migration tool again by clicking **Migrate new items.** For more information about running additional migrations, see [Run additional passes with MigrationWiz](/how-to/running-additional-passes-with-migrationwiz). Otherwise, click **Finish**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/14-2_0.png %}" width="450" height="335" />

13. To begin a new migration project, click **My Migrations** in the top-right corner of your migration portal. On the My Migrations page, click **Start new migration**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/15-2_0.png %}" width="450" height="243" />
