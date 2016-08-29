---
permalink: migrate-your-email-by-using-the-self-service-tool/
audit_date:
title: Migrate your email by using the Self-Service tool
type: article
created_date: '2013-03-18'
created_by: Mawutor Amesawu
last_modified_date: '2016-08-29'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

This article demonstrates how to use the Self-Service Migration Tool
provided in the Cloud Office Control Panel to copy email data from your
previous provider to Rackspace Email or Rackspace Hosted Exchange. The
Self-Service Migration Tool uses our private-label version of
MigrationWiz, which you can run at any time at no additional cost.

**Note**: Some of the features that are present in the full version of
MigrationWiz (at migrationwiz.com) are not readily available within the
Self-Service Migration Tool. If you want to use the full version, see
[Accessing the Full Version of
MigrationWiz](/how-to/accessing-the-full-version-of-migrationwiz).

### Before you migrate

Perform the following steps before using the MigrationWiz tool.

1. Gather all email addresses, usernames, and passwords for mailboxes on both your source (current) and destination (Rackspace Email/Rackspace Hosted Exchange) mail servers. This information is required for migrating email data with the Self-Service Migration Tool.

**Note:** The username for a mailbox is typically the same username you would use to log in to the Outlook Web App(OWA) or webmail in a web browser. For Rackspace, the username is the full email address

2. Make sure that you can updated your mailboxes' DNS records, either through a DNS manager or by contacting the DNS host directly. You can find information about the best DNS records for Rackspace in the article, [Set up DNS records for Cloud Office email and Skype for business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business/).

3. Review the list of items that are migrated and not migrated in the article, [Items migrated during a Cloud Office migration](/how-to/items-migrated-during-an-cloud-office-migration/).

4. Request that users who use your mail server delete folder that they no longer require. This will drastically improve the speed of your migration.

5. Make sure that the size of your destination mailbox is sufficient. We recommend that the size of your source mailbox not exceed 70% of your new mailbox's capacity.

6. Copy email from the source server so that no data is lost. Some email messages may be corrupt and not migrate. If you want to back up your mailbox locally, refer to the section titled "Export data into a .PST file" in the article, [Migrating Exchange to Exchange via Outlook](/how-to/migrating-exchange-to-exchange-via-outlook/).

7. Inform users and administrators of both your source and destination servers to refrain from changing their passwords during the migration process.

8. Prepare users for reconfiguring Outlook, mail clients, and mobile devices once the migration is complete. Users can visit https://emailhelp.rackspace.com for instructions specific to the users' needs. Read the article, [Email access options during an email migration](/how-to/email-access-options-during-an-email-migration/).

Remember, **DO NOT** cancel your source mail server service until you have confirmed with all users that they have their email data.

For more information on the migration preparation required for POP, IMAP, and Exchange servers, read the article (Prepare for POP, IMAP, and Exchange server )

### Create mailboxes

Before you begin your migration, you need to create your mailboxes on
the Rackspace environment. The migration tool does not create your
mailboxes for you.

Use the following resources to help you create your mailboxes:

-   Rackspace Email: [How to add Rackspace Email
    mailboxes](/how-to/add-rackspace-email-mailboxes)
-   Microsoft Exchange: [How to add Microsoft Exchange
    mailboxes](/how-to/adding-microsoft-exchange-mailboxes-0)

You need the usernames and passwords for both your previous service and
the Rackspace environment. The migration tool requires that you enter
this information.

To ensure that mail is routed properly to your new mailboxes, you must
update the MX records for your domain. The following article provides
you with the appropriate DNS records: [Set up DNS records for Cloud Office email and Skype for
Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

To configure your email clients and mobile devices, you can use our
Email Setup Assistant: <http://emailhelp.rackspace.com>

### Migrate your mail

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

4.  Locate your existing email service server information and determine
    what kind of service you have (POP, IMAP, or Exchange).
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

    -  Select the source server system type and enter the
        server address. For IMAP, you must also enter a port number.
        IMAP ports are 993 (SSL) and 143 (non-SSL).
    -  For the destination server, select the service that you are
        migrating to, Rackspace Email or Rackspace Exchange 2016, and
        then click **Next**.

    **Note:** If you are migrating to a hybrid solution (both Rackspace email and Rackspace Exchange), you will have to create more than one migration project. Please see step 12 for information on starting a new project.


    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/8-2_0.png %}" width="450" height="328" />

7.  Enter the email address, username and password for the source and
    destination mailboxes. You can migrate multiple mailboxes by
    clicking the + symbol or by inputting your mailbox information into
    the spreadsheet provided. Then, click **Next**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/9-2_0.png %}" width="450" height="311" />

    The next step is a trial migration to ensure that connectivity is
    successful to both the source and destination mailboxes based on the
    information that you entered.

8.  Click **Next** to begin the trial migration.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/10-2_0.png %}" width="450" height="237" />

9.  When the status changes to **Ready for migration**, click **Next**
    to proceed to the next screen.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/11-2_0.png %}" width="257" height="197" />

10. Click **Next** to begin the migration of your email data.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/13-2_0.png %}" width="450" height="302" />

    Several factors influence how long your email will take to migrate.
    For a list of possible factors, see [Factors that affect the
    duration of email
    migrations](/how-to/factors-that-affect-the-duration-of-email-migrations).

11. After your migration has completed, you can run the migration tool
    again by selecting **Migrate new items.** For more information about
    running additional migrations, see [Running additional passes with
    MigrationWiz](/how-to/running-additional-passes-with-migrationwiz).
    Otherwise, clidk **Finish**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/14-2_0.png %}" width="450" height="335" />

12. You can find a list of all your projects under **My Migrations**,
    located in the top-right corner of your migration portal. To begin a
    new project, click **Start a new migration**.

    <img src="{% asset_path rackspace-email/migrate-your-email-by-using-the-self-service-tool/15-2_0.png %}" width="450" height="243" />
