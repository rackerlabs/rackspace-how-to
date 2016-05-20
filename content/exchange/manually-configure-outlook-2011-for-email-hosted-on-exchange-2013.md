---
permalink: manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/
audit_date:
title: Manually configure Outlook 2011 for email hosted on Exchange 2013
type: article
created_date: '2014-01-16'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-28'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article describes how to set up your
Microsoft Exchange 2013 mailbox
to work with your
Microsoft Outlook 2011 email client.

1. Open Outlook.

2. In the Outlook drop-down menu, select **Preferences**.

   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/1_53.png %}" width="231" height="238" />

3. In the **Outlook Preferences** menu, select **Accounts**.

   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/2_50.png %}" width="640" height="364" />

4. On the **Add an Account** page, click **Exchange Account**.

   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/01_0.png %}" width="496" height="529" />

5. Enter the following information:

   - **Email address** - Enter your entire email address
     (for example, myname@example.com).

   - **Method** - Select **User Name and Password**.

   - **Username** - Enter your entire email address
     (for example, myname@example.com).

   - **Password** - Enter the password associated with your email address.

   - **Server** - Enter **mex06.emailsrvr.com**.

   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/3_47.png %}" width="739" height="627" />


6. Click **Add Account**.

7. Confirm that the amber-colored dot next to the account name turns from an amber
   color to a solid green color.

   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/amber.png %}" width="190" height="56" />
   <img src="{% asset_path exchange/manually-configure-outlook-2011-for-email-hosted-on-exchange-2013/green.png %}" width="190" height="56" />

   **Note:** The dot might take a minute or two to change from amber to green.
   If the dot doesn't change, check the account settings and password and
   ensure that you are using the correct EWS server address.

8. Close all windows.

If you already have email on the server, your email will slowly begin
to populate your inbox. This can take some time depending on how much
data you have.
