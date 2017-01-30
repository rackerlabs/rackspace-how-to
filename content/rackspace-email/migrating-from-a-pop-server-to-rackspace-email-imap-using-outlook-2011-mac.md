---
permalink: migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/
audit_date:
title: Migrate from a POP server to Rackspace Email IMAP using Outlook 2011 - Mac
type: article
created_date: '2013-11-25'
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
through performing a manual migration of POP data in Outlook 2011 for
Mac to a Rackspace Email account via IMAP.

You accomplish this task by adding your new Rackspace Email IMAP
account to the same profile that your POP account is on. This change
enables you to move all of the locally stored email to your
new Rackspace Email account.

To learn more about the differences between POP and
IMAP, see [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

### Prerequisites

Before performing the steps, ensure that mailboxes have already
been created on the Rackspace environment and that the MX records have
been updated so to that email is routing correctly to Rackspace.

-   [Add Rackspace Email mailboxes](/how-to/add-rackspace-email-mailboxes)
-   [Set up DNS records for Cloud Office email and Skype for Business](/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business)

### Export Outlook data

Before you can import your data into Rackspace Email, you need to
export it to a file from Outlook 2011.

1.  Go to the **File** menu and select **Export.**

    A new window appears.

2.  Select **Outlook for Mac Data File (.olm)** for the file type.

3.  Select the items you want to export.

4.  Click the arrow in the bottom-right corner of the
    window to move to the next page.  

    **Note:** Only mail data will sync from Outlook 2011 to Rackspace Email. All other items will continue to be stored locally.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/Export_Shot_Mac.png %}" width="405" height="356" />

5.  Choose whether you want to delete the items from your local client
    after export. Click the arrow to continue.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/Delete.png %}" width="405" height="354" />

6.  In the Save window, choose a location that is easy to remember, such as the **Desktop**.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/Location_file%20copy.jpg %}" width="515" height="325" />

The items are exported. A progress bar shows how much of the process has completed.

### Import mails into Rackspace Email

When you import your mail into Rackspace Email, you can choose to either
leave your old mailbox configured in Outlook 2011 or remove it. In this
example, the mailbox is removed and the Rackspace Email
mailbox is set up by itself via IMAP.

To set up your Rackspace Email mailbox as IMAP, see the
[Help tool for hosted email and Skype for Business](/how-to/help-tool-for-hosted-email-and-skype-for-business).

For increased security, we recommend that you use our secure (SSL)
servers. If your internal system configurations require non-SSL ports,
those settings are available in the article referenced previously, [IMAP and POP mail protocol comparison](/how-to/imap-and-pop-mail-protocol-comparison).

When your Rackspace Email account is set up in Outlook, you can import
the **.olm** file into the new mailbox.

1.  Click **File &gt; Import** to import the **.olm** file.

2.  In the Import window, select **Outlook Data File (.pst or .olm)** and then click the
    arrow on the bottom-right corner of the window to continue.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/Import.png %}" width="394" height="348" />

3.  On the next page, select **Outlook for Mac Data File (.olm)** and
    then click the arrow.

4.  In the new window that appears, select the location of the **.olm** file
    and then click the **Import** button. A progress bar is displayed while the data is imported.

    <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/Import_2%20copy.jpg %}" width="550" height="344" />

5.  Move items from the **.olm** file to the newly configured Rackspace Email mailbox.

When the process is complete, a new section is displayed in the left sidebar of Outlook 2011 titled **On My Computer**. In this section, you can see the mail you exported from your previous account. You can either drag individual items into your new mailbox or drag the entire Inbox folder.  

**Note:** You might want to create a new folder in your Rackspace Email account to help keep track of the items you have imported.

 <img src="{% asset_path rackspace-email/migrating-from-a-pop-server-to-rackspace-email-imap-using-outlook-2011-mac/2013-11-25_1013%20copy_0.jpg %}" width="199" height="660" />

After the items are moved into the Rackspace Email account in Outlook 2011, it will start to sync with Webmail and any other device connected as IMAP to this mailbox.
