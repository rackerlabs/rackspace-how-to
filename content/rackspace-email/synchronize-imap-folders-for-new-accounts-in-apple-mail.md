---
permalink: synchronize-imap-folders-for-new-accounts-in-apple-mail/
audit_date: '2017-08-23'
title: Synchronize IMAP folders for new accounts in Apple Mail
type: article
created_date: '2017-08-23'
created_by: William Loy
last_modified_date: '2017-08-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to synchronize IMAP folders after you set up a new account in Apple Mail. Because Apple Mail does not automatically synchronize IMAP folders, you must complete this process manually through folder mapping. Instructions for several Apple Mail version are included; select the version that applies to you:

 - [Sierra](#map-imap-folders-in-sierra-apple-mail)
 - [El Capitan or Yosemite](#map-imap-folders-in-el-capitan-or-yosemite-apple-mail)

 
 **Note:** These instructions are for setting up a new account. If you have been using your IMAP account in Apple Mail and are having folder synchronization issues, contact support.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:**  Access to Apple Mail IMAP account

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Map IMAP folders in Sierra Apple Mail

 1. Within the **Mail** app, select **Mail** > **Preferences**.

     <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/preference-mapping-sierra.png %}" />

 2. Select the **Accounts** tab at the top of the window, and then select your IMAP email account in the left pane.
 
 3. Select the **Mailbox Behaviors** tab.

     <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/IMAP_MailboxBehaviors.png %}" />

 4. Click the **Sent Mailbox** menu, and select the **Sent** folder that is listed under your email (*not* the folder listed under **On My Mac**).

     <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/IMAP_SentFolderMapping.png %}" />

 5. Click the **Junk Mailbox** menu, and select the **Spam** folder that is listed under your email (*not* the folder listed under **On My Mac**).

     <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/IMAP_SpamFolderMapping.png %}" />

 6. Click the **Trash Mailbox** menu, and select the **Trash** folder that is listed under your email (*not* the folder listed under **On My Mac**).

     <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/IMAP_TrashFolderMapping.png %}" />


 7. Test the functionality of each of these folders to ensure that the mapping was successful.  

### Map IMAP folders in El Capitan or Yosemite Apple Mail

 1. Close all windows so that only your mailbox's Inbox is open and visible.
 
 2. Under your email account, click on the **Sent** folder  (*not* the **Sent** folder with the paper airplane icon).

    <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/el_capitan_yosemite_MailboxFolderList.png %}" />

 3. From the **Mailbox** menu, select **Use This Mailbox As** > **Sent Mailbox**.

    <img src="{% asset_path rackspace-email/synchronize-imap-folders-for-new-accounts-in-apple-mail/el_capitan_yosemite_FolderMapping_Sent.png %}" />

 4. Repeat steps 2 & 3 for the **Junk/Spam** and **Trash** folders.

 5. Test the functionality of each of these folders to ensure that the mapping was successful.  
