---
permalink: migrate-your-email-by-using-the-self-service-migration-tool/
audit_date: '2016-09-01'
title: Migrate your email by using the Self-Service Migration Tool
type: article
created_date: '2013-03-18'
created_by: Mawutor Amesawu
last_modified_date: '2016-11-03'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

This article demonstrates how to use the Self-Service Migration Tool
provided in the Cloud Office Control Panel to copy email data from your
current provider to Rackspace Email, Rackspace Hosted Exchange, or Rackspace Office 365. The
Self-Service Migration Tool uses our private-label version of
MigrationWiz, which you can run at any time at no additional cost.

**Note**: Some of the features that are present in the full version of
MigrationWiz (at migrationwiz.com) are not readily available within the
Self-Service Migration Tool. If you want to use the full version, see
[Accessing the full version of MigrationWiz](/how-to/accessing-the-full-version-of-migrationwiz).

### Before you migrate

Perform the following actions before using the MigrationWiz tool.

- Gather all email addresses, usernames, and passwords for mailboxes on both your source (current) and destination (Rackspace Email/Rackspace Hosted Exchange) mail servers. This information is required for migrating email data with the Self-Service Migration Tool. For Office 365, you can use admin credentials to verify your migration.

  **Note:** The username for a mailbox is typically the same username you would use to log in to the Outlook Web App (OWA) or webmail in a web browser. For Rackspace, the username is the full email address

- Ensure that you can update your mailboxes' DNS records, either through a DNS manager or by contacting the DNS host directly. You can find information about the best DNS records for Rackspace in [Set up DNS records for Cloud Office email and Skype for Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business/).

- Review the list of [items migrated during a Cloud Office migration](/how-to/items-migrated-during-an-cloud-office-migration/).

- Ask users who use your mail server to delete folders that they no longer need. This action will drastically improve the speed of your migration.

- Ensure that the size of your destination mailbox is sufficient. We recommend that the size of your source mailbox not exceed 70 percent of your new mailbox's capacity.

- Copy email from the source server so that no data is lost. Some email messages might be corrupt and not migrate. If you want to back up your mailbox locally, see the "Export data into a .PST file" section in the article, [Migrating Exchange to Exchange via Outlook](/how-to/migrating-exchange-to-exchange-via-outlook/).

- Tell users and administrators of both your source and destination servers to refrain from changing their passwords during the migration process.

- Prepare users for reconfiguring Outlook, mail clients, and mobile devices, after the migration is complete. by reading [Email access options during an email migration](/how-to/email-access-options-during-an-email-migration/). For instructions specific to the users' needs, users can visit https://emailhelp.rackspace.com.

**DO NOT** cancel your source mail server service until you have confirmed with all users that they have their email data.

**Warning:** For more information about the migration preparation required for POP, IMAP, and Exchange servers, see [Prepare for POP, IMAP, and Exchange mail servers for migration](/how-to/prepare-pop-imap-exchange-mail-servers-for-migration/)

### Create mailboxes

Before you begin your migration, you need to create your mailboxes on
the Rackspace environment. The migration tool does not create your
mailboxes for you.

Use the following resources to help you create your mailboxes:

- Rackspace Email: [How to add Rackspace Email mailboxes](/how-to/add-rackspace-email-mailboxes)
- Microsoft Exchange: [How to add Microsoft Exchange mailboxes](/how-to/adding-microsoft-exchange-mailboxes-0)
- Rackspace Office 365:
  - [Add users](https://support.office.com/en-US/article/Add-users-individually-or-in-bulk-to-Office-365-Admin-Help-1970f7d6-03b5-442f-b385-5880b9c256ec)
  - [Create shared mailboxes](https://support.office.com/en-us/article/Create-shared-mailboxes-in-Office-365-871a246d-3acd-4bba-948e-5de8be0544c9)


### Migrate your email

1.  Log in to your control panel.
2.  To create your self-service migration portal, click **Get Started
    with MigrationWiz Now.**

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/self-service1.png %}" width="450" height="362" />

    You are redirected to the MigrationWiz portal.

3.  Enter a contact email address in the **Email Address** box, agree to
    the Terms of Service (BitTitan is MigrationWiz), and then click
    **Login**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/4-2_0.png %}" width="250" height="318" />

    A notification informs you that an email with a secure link has been
    sent to your email address. Follow the instructions in the email to
    log in to the MigrationWiz portal.

4.  Find the server address for your existing email service.

    -   IMAP: If you use Outlook, the incoming server address can be
        found under your account settings. It typically looks like
        **mail.domain.com** or **imap.domain.com**.
    -   Webmail: Your server address is a portion of the webmail URL.
        For example, if your webmail address is
        **https://webmail.domain.com**, then your server address is
        **webmail.domain.com**.
    -   Exchange: Your Outlook Web Access (OWA) address is the best way
        to connect. Check your mail via an Internet browser. It
        typically looks like **https://mail.domain.com/owa** or
        **https://mail.domain.com/exchange**.

    **Note:** You may also use your server's IP address in place of any host names and server addresses.

5.  Click **Next**.
6.  Enter your source and destination server configuration settings.

    A.  Select the source server system type and enter the
        server address. For IMAP, you must also enter a port number.
        IMAP ports are 993 (SSL) and 143 (non-SSL).
    B.  For the destination server, select the service that you are
        migrating to, Rackspace Email, Rackspace Exchange 2016, or Microsoft Office 365.
    C.  Click **Next**.    

    **Note:** : If you are migrating to a hybrid solution (both Rackspace Email and Rackspace Exchange), you need to create more than one migration project. Step 12 explains how to start a new project when the current one is completed.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/8-2_0.png %}" width="450" height="328" />

7.  Enter the email address, username and password for the source and
    destination mailboxes. You can migrate multiple mailboxes by
    clicking the + symbol or by entering your mailbox information in
    the spreadsheet provided. Then, click **Next**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/9-2_0.png %}" width="450" height="311" />

    The next step is a trial migration to ensure that connectivity is
    successful to both the source and destination mailboxes based on the
    information that you entered.

8.  Click **Next** to begin the trial migration.

9.  When the status changes to **Ready for migration**, click **Next**.

10. On the Ready to migrate page, click **Next** to begin the migration of your email data.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/13-2_0.png %}" width="450" height="302" />

    Several factors influence how long your email takes to migrate.
    For a list of possible factors, see [Factors that affect the
    duration of email
    migrations](/how-to/factors-that-affect-the-duration-of-email-migrations).

11. After your migration has completed, you can run the migration tool
    again by clicking **Migrate new items.** For more information about
    running additional migrations, see [Running additional passes with
    MigrationWiz](/how-to/running-additional-passes-with-migrationwiz).
    Otherwise, click **Finish**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/14-2_0.png %}" width="450" height="335" />

12. To begin a new migration project, click **My Migrations** in the top-right corner of your migration portal. On the My Migrations page, click **Start new migration**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/15-2_0.png %}" width="450" height="243" />
