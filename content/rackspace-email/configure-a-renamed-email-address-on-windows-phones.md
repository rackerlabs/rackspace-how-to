---
permalink: configure-a-renamed-email-address-on-windows-phones/
audit_date: '2017-09-1'
title: Configure a renamed email address on Windows phones
type: article
created_date: '2017-08-24'
created_by: William Loy
last_modified_date: '2017-09-11'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

After you have renamed a Rackspace Email address, your devices will receive new email only after you configure them to connect to the new email address. This article describes how to configure a renamed email address on a Windows phone.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:**  Mailbox password and access to the devices that you want to configure

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

### Configure mail settings

The following steps use general settings for Windows phones. Some steps might vary across Windows versions.

1. Tap the **Windows** button and then tap **Settings** from the Application Menu.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/settings.jpg %}" />

2. Tap **email+accounts**.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/email-accounts.jpg %}" />

3. Tap **add an account**.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/add-account.jpg %}" />

4. Tap **other account (POP and IMAP)**.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/other-account.jpg %}" />

5. Enter the following account information:

   - **Email Address:** Your renamed Rackspace Email address
   - **Password:** Your mailbox password

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/account-login.jpg %}" />

6. Tap **sign in**.
7. When you see the message that the phone cannot determine your server settings, tap **advanced** to enter the information manually.

   <img src="{% asset_path rackspace-email/configure-a-renamed-email-address-on-windows-phones/advanced.jpg %}" />

8. Enter the following information:

    - **Incoming email server:** secure.emailsrvr.com
    - **Account type**: IMAP4
    - **Username**: Your renamed Rackspace Email address
    - **Password:** Your mailbox password
    - **Outgoing (SMTP) email server:** secure.emailsrvr.com
    - **Outgoing server requires authentication:** Selected
    - **Use the same user name and password for sending email:** Selected

9. Tap **sign in**.

You have now successfully configured your Windows phone to connect to the renamed email address. When you have confirmed your mail data is synchronized to the phone, you can remove the old account that uses the previous address name from your phone.

**Note:** You can synchronize only Mail with Rackspace Email. If you need to synchronize Mail, Contacts, and Calendar items to your phone, consider upgrading to [**Rackspace Email Plus**](/how-to/upgrade-to-rackspace-email-plus/).
