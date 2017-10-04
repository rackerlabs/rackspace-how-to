---
permalink: configure-a-renamed-email-address-on-android-devices/
audit_date: '2017-09-11'
title: Configure a renamed email address on Android devices
type: article
created_date: '2017-08-24'
created_by: William Loy
last_modified_date: '2017-09-11'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

After you have renamed a Rackspace Email address, your devices will receive new email only after you configure them to connect to the new email address. This article describes how to configure a renamed email address on Android devices.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:**  Mailbox password and access to the devices that you want to configure

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Configure mail settings

The following steps use general settings for Android devices. Some steps might vary across Android versions.

1. Launch the **Settings** app on your device.
2. In the **Settings** menu, tap **Accounts**.
3. Tap **Add Account**.
4. Select **Email** as the Account Type.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-android-devices/android-typemail.png %}" />

5. Enter the following information:
   - **Email Address:** Your renamed Rackspace Email address
   - **Password:** Your mailbox Password

5. Tap **Sign In**.
6. Tap **IMAP account**.

    <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-android-devices/account-type-imap.png %}" />

7. Enter the following account and server information:

   - **Email address:** Your renamed Rackspace Email address
   - **Username:** Your renamed Rackspace Email address
   - **Password:** Your mailbox password

   - IMAP server settings:
      - **IMAP Server:** secure.emailsrvr.com
      - **Security Type:** SSL
      - **Port:** 993

   - SMTP server settings:
      - **SMTP Server:** secure.emailsrvr.com
      - **Security Type:** SSL
      - **Port:** 465

   - **Authentication required before sending emails:** On
   - **Username:** Your renamed Rackspace Email address
   - **Password:** Your mailbox password

10. Tap **Next** and then enter the following information:

   - **Account Name:** Used to distinguish the account in your device
   - **Your Name:** Name shown on outgoing emails

You have now successfully configured your Android device to connect to the renamed mailbox. When you have confirmed your mail data is synchronized to the device, you can remove the old account that uses the previous email address from your phone.

**Note:** You can synchronize only Mail with Rackspace Email. If you need to synchronize Mail, Contacts, and Calendar items to your mobile device, consider upgrading to [Rackspace Email Plus](/how-to/upgrade-to-rackspace-email-plus/).
