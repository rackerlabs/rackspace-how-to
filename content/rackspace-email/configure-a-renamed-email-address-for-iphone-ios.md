---
permalink: configure-a-renamed-email-address-on-iphone-iOS/
audit_date: '2017-09-11'
title: Configure a renamed email address on iPhone iOS
type: article
created_date: '2017-08-24'
created_by: William Loy
last_modified_date: '2017-09-11'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

After you have renamed a Rackspace Email address, your devices will receive new email only after you configure them to connect to the new email address. This article describes how to configure a renamed email address on iPhone iOS.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:**  Mailbox password and access to the devices that you want to configure

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Configure mail settings

The following steps use  general settings for iPhone iOS and might vary across iOS versions.

**Important:** For IMAP folders to sync properly on your iPhone, follow the instructions in the **Configure IMAP folder sync settings** section after completing the following steps.

1. On the home screen, tap the **Settings** icon.
2. In the **Settings** menu, tap **Mail**, and then tap **Accounts**.
3. Tap **Add Account**
4. In the list of mail account types, tap **Other**.
5. Tap **Add Mail Account**.
6. Enter your account information, and then tap **Next**.

    - **Name:** Your first and last name
    - **Email:** Your renamed Rackspace Email address
    - **Password:** Your mailbox password
    - **Description:** A brief description of the mailbox

7. Verify that IMAP is selected and that your name, email address, and the mailbox description are filled in. Then, enter the following settings:

   - Incoming server settings
    - **Host Name:** secure.emailsrvr.com
    - **User Name:** Your renamed Rackspace Email address
    - **Password:** Your mailbox password

  - Outgoing server settings
    - **Host Name:** secure.emailsrvr.com
    - **User Name:** Your renamed Rackspace Email address
    - **Password:** Your mailbox password

  <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-for-iphone-ios/imap-serversettings.png %}" />

  **Warning:** Before you enter any information, the outgoing server fields display *Optional*. Do *not* skip this step. For your outgoing email to function, you must enter the outgoing server information.

8. Tap **Next**.
9. Select the appropriate settings and tap **Save**.

**Note:** You can synchronize only Mail with Rackspace Email. If you need to synchronize Mail, Contacts, and Calendar items to your mobile device, consider upgrading to [Rackspace Email Plus](/how-to/upgrade-to-rackspace-email-plus/).

### Configure IMAP folder sync settings

1. On the **Settings > Mail > Accounts** screen, tap the account that you added in the previous section.
2. Under **IMAP**, tap **Account**.
3. In the account settings, tap **Advanced**.
4. Under **MAILBOX BEHAVIORS**, tap **Sent Mailbox**.

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-for-iphone-ios/mapping-folderlist.png %}" />

5. Under **ON THE SERVER**, tap the **Sent** folder.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-for-iphone-ios/mapping-ontheserver.png %}" />

6. Repeat steps 4 and 5 for **Deleted Mailbox**.

   You do not have to repeat the steps for the Archive Mailbox; it isn't used.

7. On the Advanced screen, verify that **Deleted Mailbox** is selected under **MOVE DISCARDED MESSAGES INTO**. This ensures that deleted messages go to the Deleted Mailbox folder.

Go back to the home screen and launch the Mail app. Your email should appear within a few minutes, depending on the number of items to synchronize.

**Note:** If you have a large mailbox, it might take several minutes before email appears. Please wait at least 15 minutes before troubleshooting.
