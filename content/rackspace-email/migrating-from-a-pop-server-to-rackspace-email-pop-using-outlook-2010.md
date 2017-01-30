---
permalink: migrating-from-a-pop-server-to-rackspace-email-pop-using-outlook-2010/
audit_date:
title: Migrate from a POP server to Rackspace Email POP using Outlook 2010
type: article
created_date: '2013-11-18'
created_by: Milton Prado
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Rackspace Email
product_url: rackspace-email
---

POP email is typically stored locally on a computer and removed from the
mail server after being downloaded by the client. In many cases, this
data cannot be migrated with our migration tool when it does not exist
on your source mail server. The steps in this article walk you
through performing a manual migration of POP data via Outlook to a
Rackspace Email setup via POP.

You accomplish this task by changing the POP settings on your account.
The change enables you to use all of the locally stored email
with your new Rackspace Email account. After the new server is added,
mail sent to Rackspace will start to arrive in the same Inbox.

To learn more about the differences between POP and
IMAP, see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

### Prerequisites

Before performing the steps below, make sure that mailboxes have already
been created on the Rackspace environment and that the MX records have
been updated so to that email is routing correctly to Rackspace.

-   [Add Rackspace Email mailboxes](/how-to/add-rackspace-email-mailboxes)
-   [Set up DNS records for Cloud Office email and Skype for Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

### Change settings

For increased security, we recommend that you use our secure (SSL)
servers. If your internal system configurations
require non-SSL ports, those settings are available in the article
referenced previously, [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

1.  In Outlook 2010, select **File &gt; Account Settings**.

2.  If you're adding a new account, click **New**. If you're changing
    your existing POP account, highlight the account and select
    **Change**.

3.  Enter your name and email address, **POP3** for the account type,
    **secure.emailsrvr.com** for the incoming and outgoing mail servers,
    and your user name and password.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-pop-using-outlook-2010/settings_screen%20copy_1.jpg %}" width="339" height="312" />

    Select the **Remember Password** check box if you don't want to type your
    password each time you launch Outlook.

4.  Click the **More Settings** button.

5.  Click the **Outgoing Server** tab.

6.  Select the **My Outgoing Server (SMTP) Requires Authentication** check box.

7.  Leave the default setting, **Use Same Settings as My Incoming Mail
    Server**.

8.  Select the **Advanced** Tab.

9.  Set the incoming server port to **995** and the outgoing server port to
    **465**, and enable SSL encryption.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-pop-using-outlook-2010/Ports%20copy_0.jpg %}" width="368" height="273" />

10. If you want to leave copies of email messages on the
    server, select the **Leave a copy of messages on server** check box.
    To avoid exceeding your account's storage limits, indicate whether
    the server should delete messages after a certain number of days,
    delete messages when you manually delete them from the
    **Deleted Items** folder, or both.

11. After the settings have been updated, navigate to your Inbox and click
    the **Send/Receive** button. New emails that have been sent to your
    Rackspace account should now start appearing in your Inbox.

**NOTE:** This process does not store your old emails on our servers.
 It will only allow you to consolidate those emails with your new emails
while using the same Inbox in Outlook.

After the change, your email will look very similar to your previous
setup.

<img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-pop-using-outlook-2010/2013-11-27_1232.png %}" width="435" height="600" />
