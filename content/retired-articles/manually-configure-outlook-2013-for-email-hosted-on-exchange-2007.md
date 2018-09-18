---
permalink: manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/
audit_date:
title: Manually configure Outlook 2013 for email hosted on Exchange 2007
type: article
created_date: '2013-09-18'
created_by: Marco Salazar
last_modified_date: '2016-01-28'
last_modified_by: Rose Coste
---

This article describes how to set up your
Microsoft Exchange 2007 mailbox
to work with your
Microsoft Outlook 2013 email client.

1. Obtain the server settings for your email account by logging in to
   the User Control Panel (<https://admin.emailsrvr.com/usercp/Login>) and
   selecting **Outlook 2013**.

2. From the pop-up box, record the following settings. You will
   use them in a later step.

   - **Server Name**, such as ORD1MBX01
   - **User Name**, such as test@example.com

3. With these settings recorded, navigate to the
   **Start Menu -&gt; Control Panel -&gt; Mail**.

   <img src="{% asset_path exchange/manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/1.%20Control%20Panel%20Mail_0.png %}" width="921" height="586" />

4. Select **Show Profiles...** then **Add**. Fill in the Profile's Name
   (this can be whatever you like), and select **OK**.

5. Select **Manually configure server settings or
   additional server types**, then select
   **Next**.

   <img src="{% asset_path exchange/manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/2.%20Add%20Account%2007.png %}" width="700" height="497" />

6. Select **Microsoft Exchange Server or compatible service**, then
   select **Next**.

7. In the **Add Account** page, enter values that you recorded in Step 2 for
   your server name and user name. After you fill in those fields,
   select **More Settings...**.

   <img src="{% asset_path exchange/manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/3.%20Server%20Settings_0.png %}" width="694" height="491" />

8. On the **Connection** tab check the **Connect to Microsoft Exchange using
   HTTP** box, select **Exchange Proxy Settings...**, and click **OK.**

   Click **Apply** and **OK** on the resulting screen.

   <img src="{% asset_path exchange/manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/4.%20Proxy%20Settings_0.png %}" width="483" height="411" />

9. On the **Add Account** screen, click **Check Name**.

   In the new window, fill
   in **User Name** with your full email address
   and fill in **Password** with the
   password used to log into your mailbox.

   When the **Server** and
   **Username** are underlined, the profile has been successfully set up.

   Click **Next** and click **Finish**.

   <img src="{% asset_path exchange/manually-configure-outlook-2013-for-email-hosted-on-exchange-2007/5.%20Check%20name.png %}" width="694" height="491" />
