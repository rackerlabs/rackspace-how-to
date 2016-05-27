---
permalink: setting-up-imap-or-pop-windows-mail/
audit_date:
title: Set up IMAP or POP for Windows Mail
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

To learn more about the differences between Post Office Protocol (POP) and Internet Message Access Protocol (IMAP), see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

For increased security, we recommend that you use our Secure Sockets Layer (SSL) servers as detailed in this article. If your internal system configurations require non-SSL ports, see the [Rackspace Email and Hosted Exchange settings](/how-to/rackspace-email-and-hosted-exchange-settings) page for a list of available servers and ports.

### Set up Windows Mail for IMAP

1. In Windows Mail, click **Tools** &gt; **Accounts**.

2. Click **Add**.

3. Click **Next**.

4. Enter your first and last name. This is the name that will appear in the **From** field of messages that you send.

5. Click **Next**.

6. Enter your entire email address (for example,**myname@mydomain.com**).

7. Click **Next**.

8. Enter the following information:

    - **Incoming e-mail server type** - Select **IMAP** from the list.
    - **Incoming mail (POP3 or IMAP) server** - Enter the secure server name: **secure.emailsrvr.com**
    - **Outgoing e-mail server (SMTP) name** - Enter the secure server name: **secure.emailsrvr.com**
    - Select the **Outgoing server requires authentication** check box.

    <img src="{% asset_path rackspace-email/setting-up-imap-or-pop-windows-mail/EA_ServerSettings_01.png %}" alt=" Server addresses form" />

9. Click **Next**.

10. Enter your entire email address (for example, **myname@mydomain.com**).

11. Enter the password for your email account.

12. *(Optional)* Leave the **Remember password** check box selected.

13. Click **Next**.

14. In the Congratulations window, if you don't want to download all your messages, select the **Do not download my e-mail at this time** check box.

15. Click **Finish**.

    The account you just created will be selected.

16. Click the **Properties** button.

17. Click the **Advanced** tab.

18.  Select both of the **This server requires a secure connection (SSL)** check boxes.

19. In the **Outgoing mail (SMTP)** field, enter the secure outgoing port: **465**

    <img src="{% asset_path rackspace-email/setting-up-imap-or-pop-windows-mail/EA_AdvancedSettings_02.png %}" alt=" Port addresses form" />

20. Click **OK**.

21. Click **Close**.

### Set up Windows Mail for POP

1. In Windows Mail, click **Tools < Accounts**.

2. Click **Add**.

3. Click **Next**.

4. Enter your first and last name. This is the name that will appear in the **From** field of messages that you send.

5. Click **Next**.

6. Enter your entire email address (for example, **myname@mydomain.com**).

7. Click **Next**.

8. Enter the following information:

    - **Incoming e-mail server type** - Ensure that **POP3** is selected.
    - **Incoming mail (POP3 or IMAP) server** - Enter the secure server name: **secure.emailsrvr.com**
    - **Outgoing e-mail server (SMTP)** - Enter the secure server name: **secure.emailsrvr.com**
    - Select the **Outgoing server requires authentication** check box.

    <img src="{% asset_path rackspace-email/setting-up-imap-or-pop-windows-mail/EA_SetupServers_01.png %}" alt=" Server address form" />

9. Click **Next**.

10. Enter your entire email address (for example, **myname@mydomain.com**).

11. Enter the password for your email account.

12. *(Optional)* Leave the **Remember password** check box selected.

13. Click **Next**.

14. In the Congratulations window, if you don't want to download all your messages, select the check box labeled **Do not download my e-mail at this time**.

15. Click **Finish**.

    The account you just created will be selected.

16. Click **Properties**.

17. Click the **Advanced** tab.

18. Select both **This server requires a secure connection (SSL)** check boxes.

19. In the **Outgoing mail (SMTP)** field, enter the secure outgoing port: **465**

    <img src="{% asset_path rackspace-email/setting-up-imap-or-pop-windows-mail/EA_AdvancedSettings_02.png %}" alt=" Port numbers form" />

20. A POP connection typically removes the email messages from the email server after you have downloaded new messages to your computer. If you want to leave copies on the server, select the **Leave a copy of messages on server** check box. To avoid exceeding your account's storage limits, indicate whether the server should delete messages after a certain number of days and/or delete messages when you manually delete them from the Deleted Items folder.

21. Click **OK**.

22. Click **Close**.
