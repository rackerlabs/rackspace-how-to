---
permalink: migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/
audit_date:
title: Migrate from a POP server to Rackspace Email IMAP using Outlook 
type: article
created_date: '2013-11-19'
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
Rackspace Email account via IMAP.

You accomplish this task by adding your new Rackspace Email IMAP
account to the same profile that your POP account is on. This change
enables you to move all of the locally stored email to your
new Rackspace Email account.

To learn more about the differences between POP and
IMAP, see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

### Prerequisites

Before performing the steps, ensure that mailboxes have already
been created on the Rackspace environment and that the MX records have
been updated so that email is routing correctly to Rackspace.

-   [Add Rackspace Email mailboxes](/how-to/add-rackspace-email-mailboxes)
-   [Set up DNS records for Cloud Office email and Skype for Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

### Change settings

For increased security, we recommend that you use our secure (SSL)
servers. If your internal system configurations
require non-SSL ports, those settings are available in the article
referenced previously, [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

1. In Outlook, navigate to Account Settings:

   **Outlook 2007: Tools > Account Settings**
   
   **Outlook 2010/2013/2016: File > Account Settings > Account Settings**

2.  To add your IMAP account, click the **New** button.

3.  Enter your name and email address, **IMAP** for the account type,
    **secure.emailsrvr.com** for the incoming and outgoing mail servers,
    and your user name and password.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/settings_screenIMAP%20copy_0.jpg %}" width="339" height="312" />

4.  Select the **Remember Password** check box if you don't want to type your
    password each time you launch Outlook.

5.  Click the **More Settings** button.

6.  Click the **Outgoing Server** tab.

7.  Select the **My Outgoing Server (SMTP) Requires Authentication** check box.

8.  Leave the default setting, **Use Same Settings as My Incoming Mail
    Server**.

9.  Click the **Advanced** tab.

10. Set the incoming port to **993** and the outgoing port to
    **465**, and enable SSL encryption.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/portsimap%20copy.jpg %}" width="369" height="258" />

11. Navigate to your Inbox and note that your new IMAP account is listed in the left folder pane. Click on the account to expand the folders. You should see mail
    items for that account start to appear.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/IMAPaccount.png %}" width="173" height="277" />

12. Now that you have added your Rackspace account via IMAP, you can
    drag emails from your POP inbox to your IMAP inbox. As
    items start moving over, those emails will automatically upload to
    our server and will be visible across all of your devices that
    connect via IMAP to that account.

    **NOTE:** Depending on the number of emails in your POP account,
    this process can take a while. You can also consider moving emails
    over in batches by selecting groups of email messages. After you've
    confirmed that all emails have moved to the new account, you can
    remove the configuration for the POP account as it will no longer
    be needed.

After the change, your email will look similar to the following screenshot.

<img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook/2013-11-27_1204.png %}" width="437" height="600" />
