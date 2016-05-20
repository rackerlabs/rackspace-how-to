---
permalink: manually-configure-mac-mail-for-email-hosted-on-exchange-2010/
audit_date:
title: Manually configure Mac Mail for email hosted on Exchange 2010
type: article
created_date: '2012-02-27'
created_by: Rackspace Support
last_modified_date: '2016-05-17'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article describes how to set up your Microsoft Exchange
2010 email account with Mac Mail.

**Note**: Exchange 2010 runs only on Mac OS X version 10.6 or later. If
you're unsure about which OS X version you're running, click the
**Apple** icon located in the top-left corner and select **About This
Mac**.

1.  Open Mac Mail and select **Mail > Preferences**.
2.  In the new window that appears, click the **Accounts** tab in the
    top menu bar and then click the plus (+) symbol in the
    lower-left corner.
3.  Select **Exchange** and then click **Continue.**

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2010/MM101.png %}" width="470" height="480" />

4.  On the next page, enter your full name and your entire Microsoft
    Exchange email address and password. Then click **Continue**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2010/MM102.png %}" width="403" height="347" />

    -   If your Autodiscover CNAME record is set correctly, Mail
        automatically pulls the correct server settings for you. Skip to
        Step 6.
    -   If the Autodiscover CNAME record is not set correctly, you can
        set up the account manually. Continue to Step 5.

5.  Enter the following information and then click **Continue**:
    -   **Description** - Enter a descriptive name for your mail account
        (for example, Work Mail).
    -   **User Name** - Enter your entire email address (for example,
        **user@example.com**).
    -   **Password** - Enter the password associated with the email
        account you are setting up.
    -   **Server Address** - Enter **connect.emailsrvr.com**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2010/MM104_0.png %}" width="377" height="322" />

6.  Confirm the settings and then click **Continue**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2010/MM103.png %}" width="396" height="339" />
    
7.  Choose any other options that you want to enable, and then click
    **Done**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2010/MM105_0.png %}" width="397" height="333" />

Your Microsoft Exchange 2010 email account is now set up with Mac Mail.
