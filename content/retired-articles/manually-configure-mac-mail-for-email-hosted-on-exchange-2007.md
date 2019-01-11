---
permalink: manually-configure-mac-mail-for-email-hosted-on-exchange-2007/
audit_date:
title: Manually configure Mac Mail for email hosted on Exchange 2007
type: article
created_date: '2012-02-28'
created_by: Aaron Medrano
last_modified_date: '2016-05-17'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

The following article shows you how to set up your Microsoft Exchange
2007 email account with Mac Mail.

**Note**: Exchange 2007 runs only on Mac OS X version 10.6 or later. If
you're unsure about which OS X version you're running, click the
**Apple** icon located in the top-left corner and select **About This
Mac**.

1. Open Mac Mail and select **Mail > Preferences**.

2. In the new window that appears, click the **Accounts** tab in the
   top menu bar and then click the plus (+) symbol in the
   lower left corner.

3. Select **Exchange** and then click **Continue.**

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2007/MM071.png %}" width="441" height="451" />

4. On the next page, enter your full name and your entire Microsoft
   Exchange email address and password. Then click **Continue**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2007/MM072.png %}" width="434" height="374" />

    -   If your Autodiscover CNAME record is set correctly, Mail
        automatically pulls the correct server settings for you.
        In this case, skip to Step 8.
    -   If the Autodiscover CNAME record is not set correctly, you can
        set up the account manually by using the settings in the User
        Control Panel.
        In this case, continue with Step 5.

5.  Log in to the User Control Panel by going to the following link:
    <https://cp.rackspace.com/usercp>.

6.  Find the Mac Mail icon under the **Client Setup** section and click
    it to open the settings for your account. You will use these
    settings in the next step.

7.  Go back to the Exchange configuration page in Mail, enter the
    following information, and then click **Continue**:

    -   **Description** - Enter a descriptive name for your mail account
        (for example, Work Mail).
    -   **User Name** - Enter your entire email address (for example,
        **user@example.com**).
    -   **Password** - Enter the password associated with the email
        account you are setting up.
    -   **Server Address** - From the **Setting Up Mac Mail** window (from
        Step 6), remove **https://** and **/ews/exchange.asmx**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2007/MM073.png %}" width="412" height="352" />

8.  Confirm the settings and then click **Continue**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2007/MM074.png %}" width="422" height="361" />

9.  Choose any other options that you want to enable, and then click
    **Done**.

    <img src="{% asset_path exchange/manually-configure-mac-mail-for-email-hosted-on-exchange-2007/MM075.png %}" width="407" height="342" />

Your Microsoft Exchange 2007 email account is now set up with Mac Mail.
