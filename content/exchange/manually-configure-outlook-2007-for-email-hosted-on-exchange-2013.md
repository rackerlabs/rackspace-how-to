---
permalink: manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/
audit_date:
title: Manually configure Outlook 2007 for email hosted on Exchange 2013
type: article
created_date: '2014-01-09'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-28'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article describes how to set up your
Microsoft Exchange 2013 mailbox
to work with your
Microsoft Outlook 2007 email client.

1. Click the Windows **Start** button, select **Control Panel**, and then
   click **Mail** (32-bit).

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step1.png %}" width="620" height="276" />

   **Note:** Depending on the version of Windows you're running, you might
   need to switch to Classic view to find the **Mail** entry or it might be
   labeled 32-Bit.

2. Click **Show Profiles**, click **Add**, enter a name for this
   profile, and then click **OK**.

3. On the **Auto Account Setup** page of the **Add New Account** wizard, select
   **Manually configure server settings or additional server types**, and
   click **Next**.

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step2.png %}" width="687" height="478" />

4. On the **Choose Service** page, select **Microsoft Exchange or compatible
   service**, and then click **Next**.

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step3.png %}" width="687" height="478" />

5. On the Server Settings page, perform the following actions:

   1. In the **Server** text box, type **outlook**.
   2. Select the  the **Use Cached Exchange Mode** check box.
   3. In the **User Name** text box, enter your entire email address.
   4. Click **More Settings**.

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step4.png %}" width="687" height="478" />

6. In the Microsoft Exchange dialog box, click the **Connection** tab
   and select the **Connect to Microsoft Exchange using HTTP** check box.
   Then click **Exchange Proxy Settings**.

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step5.png %}" width="354" height="439" />

7. In the Microsoft Exchange Proxy Settings dialog box, perform the
   following actions:

   A. In the **Use this URL to connect to my proxy server for
      Exchange** text box, enter **mex06.emailsrvr.com**.
   B. Select both the **On fast networks** and **On slow networks**
      check boxes.
   C. Under **Proxy authentication settings**, select **Basic
      Authentication**.
   D. Click **OK**.

   <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step6.png %}" width="462" height="411" />

8. In the Microsoft Exchange dialog box, click **Apply** and then click **OK**.

9. On the **Server Settings** page, click **Check Name**, type your password,
   and then click **OK**.

   **Note:** If you receive a pop-up message asking you to select your mailbox
   from a list, select your mailbox and click **OK**.

   Your name will then be highlighted and a line will appear under the
   **User Name** field, indicating that your profile has been configured.

   **Warning:** The server name resolves to a unique string that is different
   with every mailbox. Do not attempt to replicate this information with
   other accounts.

10. Click **Next**. On the next page, click **Finish**.

    <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step7.png %}" width="687" height="478" />
    <img src="{% asset_path exchange/manually-configure-outlook-2007-for-email-hosted-on-exchange-2013/Step8.png %}" width="687" height="478" />

11. Open Outlook to select your new Exchange profile.
