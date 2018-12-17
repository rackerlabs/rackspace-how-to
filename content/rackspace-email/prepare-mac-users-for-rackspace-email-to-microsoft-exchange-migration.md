---
permalink: prepare-mac-users-for-rackspace-email-to-microsoft-exchange-migration/
audit_date: '2017-07-24'
title: Prepare Mac users for migration from Rackspace Email to Microsoft Exchange
type: article
created_date: '2017-06-22'
created_by: Maggie Serrano
last_modified_date: '2017-07-24'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to prepare Mac users to migrate from Rackspace Email to Microsoft Exchange. Mac users require special attention during this migration because Apple Mail interacts with IMAP and POP connections in a way that does not translate properly to Microsoft Exchange. To prepare for migration, you must back up your mailbox before deleting it from your account.

### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Moderate
- **Time needed:** Approximately 30 minutes
- **Tools required:** Mac computer, apps.rackspace.com access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

**Warning:** Log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) to verify that all email data is stored in your mailbox on the server. If it is not, you risk losing data, and should contact your [Administrator](/how-to/cloud-office-support-terminology/) to troubleshoot synchronizing your mail up to [apps.rackspace.com](https://apps.rackspace.com/index.php).

### Create a backup by exporting the mailbox

1. In Apple Mail, select the email address that you want to export.
2. In the top navigation bar, click **Mailbox > Export Mailbox**.

   <img src="{% asset_path rackspace-email/prepare-mac-users-for-rackspace-email-to-microsoft-exchange-migration/selectExportMailbox.png %}" />

3. Choose an existing folder or create a new folder in which to save the exported file, and then click **Choose**.

    <img src="{% asset_path rackspace-email/prepare-mac-users-for-rackspace-email-to-microsoft-exchange-migration/selectMailbox.png %}" />

   After you select the file destination, the mailbox is exported.

**Note:** Apple Mail exports the mailboxes as **.mbox** packages. If you previously exported a mailbox, Apple Mail doesn't overwrite the existing **.mbox** file; it creates a new **.mbox** file, such as **My Mailbox 3.mbox**.

### Remove your mailbox from Apple Mail

1. In the top navigation bar, click **Mail > Accounts**.

   <img src="{% asset_path rackspace-email/prepare-mac-users-for-rackspace-email-to-microsoft-exchange-migration/selectMailAccounts.png %}" />

2. Click the IMAP account that you want to remove.

   **Warning:** Verify that you select the correct account. If the account is listed as POP instead of IMAP, you should be absolutely certain that the back up was successful before proceeding. If it was not, the data will be unrecoverable. If you are uncertain that the backup was successful, repeat the steps in the preceding section to back up the mailbox.

3. Click the minus sign (-) sign on the bottom of the window.
4. Click **OK**.

After the mailbox has been removed, and your account is ready for migration, reboot your Mac so that your device is ready to re-add your account after your migration is completed.

For steps on adding your Exchange mailbox after migration, see our email help tool at https://emailhelp.rackspace.com.
