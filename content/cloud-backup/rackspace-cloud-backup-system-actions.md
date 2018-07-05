---
permalink: rackspace-cloud-backup-system-actions/
audit_date: '2018-07-05'
title: Cloud Backup system actions
type: article
created_date: '2012-08-22'
created_by: David Hendler
last_modified_date: '2018-07-05'
last_modified_by: Cat Lookabaugh
product: Cloud Backup
product_url: cloud-backup
---

**Previous section:** [Cloud Backup actions](/how-to/rackspace-cloud-backup-backup-actions)

**Warning**: The system actions are for users who are familiar with Rackspace Cloud Backup. Users with Managed Cloud Service Level accounts might want to contact their account manager before performing any of the following actions.

This article describes the actions available in the **Rackspace Cloud Control Panel -> Backups -> Systems** selection.

You can access the **Actions** menu from the gear widget next to the server name in the system list or from the **Actions** button on the **System details** page. This menu is not the one that appears on the **Single Backup** page.

The **Actions** menu offers the following actions:

-   Create Backup
-   Restore Backup
-   Enable Encryption
-   Cleanup
-   Disable
-   Delete

### Create Backup

Clicking **Create Backup** from the **Actions** menu is the same as clicking **Create Backup** from the gear icon on the **Cloud Backups Systems** page. For complete instructions, see [Create a Backup](/how-to/rackspace-cloud-backup-create-a-backup).

**Note:** You cannot back up or restore a system that is offline. If the system status displays ``offline`` and your server is active, contact support.

### Restore Backup

Clicking **Restore Backup** from the **Actions** menu is the same as clicking **Restore Backup** from the gear icon on the **Cloud Backups Systems** page. For complete instructions, see the "Restore Backup" section in the [Cloud Backup actions](/how-to/rackspace-cloud-backup-backup-actions) article.

**Note:** You cannot back up or restore a system with an offline status. If the system status displays ``offline`` and your server is active, contact support.

### Enable Encryption

You may encrypt your backups with AES-256 encryption. The key or
passphrase you that create is known only to you. If you lose or forget
your passphrase, you *cannot recover your backups*.

Also, after you turn on encryption, *you cannot turn it off*. You can
only change your passphrase. This is a security measure. If anyone 
gains access to your account, they will not be able to access your
backups without your passphrase.

When you use a passphrase, Rackspace encrypts it locally on your browser using a
JavaScript RSA library before it is submitted over the web.
Rackspace never knows your passphrase. All communication between
your computer and Rackspace servers for Cloud Backup is done over SSL,
which means that no one can intercept and read your messages.

To encrypt your backups, perform the following steps:

1.  From the **Actions** menu, select **Enable Encryption**.
2.  Enter a passphrase that only you know.
3.  Enter your passphrase again.
4.  Click **Save Passphrase**.

You can confirm that you have enabled encryption by clicking
**Enable Encryption** from the **Actions** menu.

On the **Backup Encryption** page, your server name will have the encrypted flag next to it. Also, your encrypted backups will display "This is an encrypted backup" on the **Backup Details** page.

You can change your passphrase for encryption by performing the following steps:

1.  Select **Enable Encryption** from the **Actions** menu.
2.  Enter your current passphrase.
3.  Enter a new passphrase that only you know.
4.  Enter your new passphrase again.
5.  Click **Save Passphrase**.

### Cleanup

The **Cleanup** option allows you to manually start a cleanup at any time,
even if you have an automatic backup scheduled. A cleanup frees unused
space in your Cloud Files account, where your backups are stored.

If your system is encrypted, confirm your passphrase when prompted. After you enter your passphrase, click the **Check** button.

### Disable

When you disable a system, you prevent all future backups from running.
You can re-enable the system at any time and no data is deleted. To
re-enable the system, select **Enable** from the **Actions** menu.

### Delete

The **Delete** option permanently deletes all backups and any data
associated with this system. A confirmation prompt requires you to
verify that this is your intention.

**Next steps:** [Cloud Backup preferences](/how-to/rackspace-cloud-backup-preferences)
