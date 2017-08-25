---
permalink: renamed-email-address-configuration-for-windows-mobile-phone/
audit_date: '2017-08-24'
title: Renamed email address configuration for Windows mobile phone
type: article
created_date: '2017-08-24'
created_by: William Loy
last_modified_date: '2017-08-24'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Once you have renamed a Rackspace Email address, your devices will not receive new email until you configure them to connect to the new email address.

### Prerequisites

- **Applies to:** User
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:**  Mailbox password and access to the devices you want to configure

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/).

#### Windows phone renamed email address configuration

1. Tap the **Windows** button and locate the **Settings** option from the Application Menu.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/settings.jpg %}" />

2. Tap **email+accounts**.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/email-accounts.jpg %}" />

3. Tap **add an account**.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/add-account.jpg %}" />

4. Tap **other account (POP and IMAP)**.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/other-account.jpg %}" />

5. Enter the following details:

    **Email Address:** renamed@yourdomainexample.com (*Use the new email address here*)

    **Password:** Your mailbox password

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/account-login.jpg %}" />

6. Tap **sign in**.
7. The phone likely will be unable to determine your settings. Tap **advanced**.

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-windows-mobile-phone/advanced.jpg %}" />

8.  Enter the following details:
    **Incoming email server:** secure.emailsrvr.com
    **Account type**: IMAP4
    **Username**: renamed@yourdomainexample.com (*Use the new email address here*)
    **Password:** Your mailbox password
    **Outgoing (SMTP) email server:** secure.emailsrvr.com
    **Outgoing server requires authentication:** Checked
    **Use the same user name and password for sending email:** Checked

9. Tap **sign in**.

You have now successfully configured your Windows phone to connect to the renamed mailbox. When you have confirmed your mail data is synced to the phone, you can remove the old account using the previous mailbox name from your phone.

Note: You will only be able to sync **Mail** with Rackspace Email. If you need to sync **Mail**, **Contacts**, and **Calendar** items to your mobile device consider upgrading to [**Rackspace Email Plus**](/how-to/upgrade-to-rackspace-email-plus/).
