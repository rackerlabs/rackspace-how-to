---
permalink: renamed-email-address-configuration-for-android-mobile-phone/
audit_date: '2017-08-24'
title: Renamed email address configuration for Android mobile phone
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


#### Android renamed email address configuration

These are general settings for Android mobile phones and may vary across Android versions.

1. Launch the **Settings** app on your device.
2. Once it launches, tap on **Accounts**.
3. Tap on **Add Account**.
4. Select **Email** as the Account Type  and enter the following:
    - **Email Address:** renamed@yourdomainexample.com (*Use the new email address here*)
    - **Password:** You mailbox Password

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-android-mobile-phone/android-typemail.png %}" />

5. Tap **Sign In**
6. Tap **IMAP account**

    <img src="{% asset_path rackspace-email/renamed-email-address-configuration-for-android-mobile-phone/account-type-imap.png %}" />

7. Enter the following server details:

    - **Email address:** renamed@yourdomainexample.com (*Use the new email address here*)
    - **Username:** renamed@yourdomainexample.com (*Use the new email address here*)
    - **Password:** Your mailbox password
        - *IMAP Server Settings:*
            - **IMAP Server:** secure.emailsrvr.com
            - **Security Type:** SSL
            - **Port:** 993
        - *SMTP Server Settings:*
            - **SMTP Server:** secure.emailsrvr.com
            - **Security Type:** SSL
            - **Port:** 465
    - **Authentication required before sending emails:** On
    - **Username:** renamed@yourdomainexample.com (*Use the new email address here*)
    - **Password:** Your mailbox password

10. Tap Next and enter the following:

    **Account Name:** Used to distinguish the account in your device

    **Your Name:** Name shown on outgoing emails

You have now successfully configured your Android to connect to the renamed mailbox. When you have confirmed your mail data is synced to the phone, you can remove the old account using the previous email address from your phone.
