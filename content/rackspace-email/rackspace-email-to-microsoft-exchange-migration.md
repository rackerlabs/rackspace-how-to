---
permalink: rackspace-email-to-microsoft-exchange-migration/
audit_date: '2017-07-26'
title: Rackspace Email to Microsoft Exchange migration
type: article
created_date: '2017-06-19'
created_by: William Loy
last_modified_date: '2017-07-26'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

Use the information in this article to plan, schedule, and complete a migration from Rackspace Email to Microsoft Exchange.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Challenging
- **Time needed:** Minimum of 5 business days to schedule migration
- **Tools required:** Administrator access to the Cloud Office Control Panel

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

To determine if migrating your users to Microsoft Exchange is necessary for your business, compare the available solutions:

|Feature | Rackspace Email | Rackspace Email Plus | Microsoft Exchange
|---|---|---|---|
|**Syncs to mail client** | &#10003; Mail | &#10003; Mail | &#10003; Mail<br /><br />&#10003; Contacts<br /><br />&#10003; Calendar<br /><br />&#10003; Notes <br /><br /> &#10003; Tasks|
|**Syncs to mobile device** | &#10003; Mail | &#10003; Mail<br /><br />&#10003; Contacts<br /><br />&#10003; Calendar<br | &#10003; Mail<br /><br />&#10003; Contacts<br /><br /> &#10003; Calendar<br /><br />&#10003; Notes <br /><br /> &#10003; Tasks |
|**Online contacts** | &#10003; | &#10003; |&#10003; |
|**Online calendar** | &#10003; | &#10003; |&#10003; |
|**Online notes** | &#10003; | &#10003; | &#10003; |
|**Online tasks** | &#10003; | &#10003; | &#10003; |
|**30GB Cloud Drive storage**|  | &#10003;| |
|**Desktop file synchronization**| | &#10003;| |
|**Online document and spreadsheet editors**| | &#10003;| |
| **Maximum mailbox storage**| 25 GB | 25 GB | 100 GB|

**Note:** Upgrading from Rackspace Email to Rackspace Email Plus does *not* require a migration. For details, see [Upgrade to Rackspace Email Plus](/how-to/upgrade-to-rackspace-email-plus/).

If you are considering the migration because your Rackspace Email mailbox is at maximum capacity, you might want to reconsider because migration does not immediately resolve the issue. Try the recommendations in [Rackspace Email storage maintenance and best practices](/how-to/rackspace-email-storage-maintenance-and-best-practices/).

### Before migration

- Consider the number of users that will be migrating. All of them must prepare for the migration.
- Set up Autodiscover for your domain. See [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email/) for the necessary autodiscover record.

   - Autodiscover enables users to set up email in Outlook by using only their email address and password.
   - Autodiscover is required for Outlook 2016 set ups.

- Instruct all of your users to verify that they can find all of their email in [apps.rackspace.com](https://apps.rackspace.com/index.php). The mail stored in apps.rackspace.com is the mail that is migrated.

   If a user notices mail is missing in apps.rackspace.com, that mail might be stored mail locally. These users must import their locally stored email into their Rackspace Email IMAP account before migration.
   
   If any of your users are using a POP connection to their mailbox, direct them to the following instructions to synchronize their locally stored mail to apps.rackspace.com:
   
   - *(Windows)* [Migrate from a POP server to Rackspace Email IMAP using Outlook](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/)
   - *(Mac)* [Migrate from a POP server to Rackspace Email IMAP using Outlook 2011 - Mac](/how-to/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/)

- Remove special characters from folder names.

   Folder names with special characters—such as commas, periods, slashes, and ampersands—cause migration issues. For example, the period in the folder name **1.Inbox** will cause an issue. Change folder names with special characters to use only alphanumerica characters.

- Consider the special preparation that Mac users require when migrating from Rackspace Email to Microsoft Exchange. For more information, see [Prepare your Mac users for migration from Rackspace Email to Microsoft Exchange](/how-to/prepare-mac-users-for-rackspace-email-to-microsoft-exchange-migration/).

- Review the following lists to understand which items are and are *not* migrated.

#### Items migrated

- Mail stored in webmail is migrated. You can verify what email is stored in webmail by logging in at [apps.rackspace.com](https://apps.rackspace.com/index.php).
- Calendar and contact data stored in Rackspace Webmail is *not guaranteed to migrate but migration will be attempted*. We recommend backing up your contact data to a **.csv** file. For instructions on exporting contacts from Rackspace Email, see [Import or export contacts in Rackspace Email](/how-to/import-or-export-contacts-in-rackspace-email/).
- Users will remain members of any aliases or lists they are a part of.

#### Items not migrated

- Tasks and notes in Rackspace Webmail
- Autosaved and group contacts in Rackspace Webmail
- Flags in flagged messages
- Passwords
- Forwarding
- Safelists and blacklists
- Custom signatures
- Rules and alerts
- SharePoint permissions and user settings
- Outlook settings (categories, junk folder settings, delegate permissions, folder permissions, archive settings, and autocomplete settings/NK2)

### Migrate from Rackspace Email to Microsoft Exchange

After you have prepared all of your users to migrate from Rackspace Email to Microsoft Exchange, schedule your migration by performing the following steps.

1. Submit a ticket through your Cloud Office Control Panel or contact Support directly, and request a migration from Rackspace Email to Microsoft Exchange.
2. After you receive your migration plan in a support ticket, read the plan carefully and respond to the ticket with the following information:

   - Confirm that you have read and fully understand the migration plan.
   - List a date and time that you want the migration to start.

      **Warning:** Users will not have access to email after the migration has started.

   - List all email addresses that you want to migrate.
   - Ask any questions that you have about the migration plan.

Our Internal Migrations team will reply to you within five business days to confirm your scheduled migration time.

### What to expect during migration

1. You will receive a ticket update notifying you that the migration has started.

   **Warning:** If you do not receive this notification on the day that your migration is scheduled, check your migration ticket to verify that you confirmed your migration date with the migrations team.

2. After the migration has started users can't access their mailboxes.

   **Note:** Mail will still be delivered to your mailboxes and will be available after the migration is completed.

3. Migrations take time to complete. However, we will notify you if anything occurs that will prolong the migration.

   Factors that affect the duration of your migration:
      - Number of mailbox items. Each item is processed individually so the more items in a mailbox, the more individual processes to complete.
      - Mailbox size.
      - Number of users being migrated.

4. When the migration is complete you will receive a ticket update informing you of its completion.

### After migration

Once you are notified that the migration has been completed, you and your users must perform some final steps to ensure that everyone can access their new Microsoft Exchange mailboxes.

1. User passwords were changed during the migration, so you must update all the users' passwords through the Cloud Office Control Panel. See [Change a Microsoft Exchange mailbox password](/how-to/change-a-microsoft-exchange-mailbox-password/#reset-a-mailbox-password-through-the-cloud-office-control-panel). 

2. After you have updated all of the passwords, instruct users to log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) to verify that they can access their new mailboxes and that all their email was migrated.

3. Users can reset their own passwords by using the instructions in [Change a Microsoft Exchange mailbox password](/how-to/change-a-microsoft-exchange-mailbox-password).

3. Users must configure their [mail client](/how-to/cloud-office-support-terminology/) on all devices, including desktop and mobile devices, to connect to their new mailboxes. They can obtain instructions at [emailhelp.rackspace.com](https://emailhelp.rackspace.com/).

   **Warning:** If users do not configure their mail client to connect to the new Microsoft Exchange mailbox they will not receive new mail in their mail client.

4. When you have confirmed that all of the data has been successfully migrated, submit a ticket to remove the remaining Rackspace Email licenses from your account.
