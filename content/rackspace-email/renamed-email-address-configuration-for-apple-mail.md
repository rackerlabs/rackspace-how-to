---
permalink: configure-a-renamed-email-address-in-apple-mail/
audit_date:
title: Configure a renamed email address for Apple Mail
type: article
created_date: '2017-08-23'
created_by: William Loy
last_modified_date: '2017-09-12'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Instructions for setting up a renamed email address in Apple Mail.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 20 minutes
- **Tools required:**  Mailbox password and access to the devices you want to receive mail on

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

Once you have renamed a Rackspace Email address, your devices such as desktop computers, laptops, and mobile phones will not receive new email until you configure them to connect to the new email address.

Warning: If the old email address connects via POP, you will want to migrate the POP data to an IMAP account so no data is lost in the rename configuration.


#### Apple Mail renamed email address configuration


1. Launch **Mail**. If **Mail** is not in your dock, *Command (⌘) + Space Bar*. Then type **Mail** in the Spotlight search. Press enter to launch the **Mail** application.
2. Within **Mail**, click **Mail** on the top left. Then select **Add Account**.

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-in-apple-mail/mail_addaccountdropdown.png %}" />

3. In the pop-up window, select **Other Mail Account** and click **Continue**.

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-in-apple-mail/accounttype_imap.png %}" />

4. Enter the following:

    - **Name:** Enter your first and last name
    - **Email Address:** Enter the *new email address* here
    - **Password:** Your mailbox password
    - Click **Sign In**

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-in-apple-mail/imap_logindetails.png %}" />

5. You will see an alert which says Unable to verify account name or password. Along with this alert, you will see more fields that require additional info. Fill in the following details:

    - **Email Address:** Enter the *new email address* here
    - **User Name:** Enter the *new email address* here (even though it says automatic, fill it in as shown)
    - **Password:** Your mailbox password
    - **Account Type:** IMAP
    - **Incoming Mail Server:** secure.emailsrvr.com
    - **Outgoing Mail Server:** secure.emailsrvr.com

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-in-apple-mail/imap_serversettings.png %}" />

    Note: Apple Mail will usually clear the *User Name* field after entering the *Incoming and Outgoing Mail Server* fields. Ensure your *User Name* is filled in with your email address *after* entering the server information and *before* clicking *Sign in*

6. Click **Sign in**

7. Select the desired syncing options. You can leave the defaults on and click **Done**.

Warning: You must configure your Mac to sync various IMAP folders and prevent duplicate folder creation. This is referred to as **Folder Mapping**. See [Sync IMAP folders for new accounts in Apple Mail](/how-to/sync-imap-folders-for-new-accounts-in-apple-mail/) for instructions.
