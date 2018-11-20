---
permalink: migrating-exchange-to-exchange-via-outlook/
audit_date: '2018-10-17'
title: 'Migrate Exchange to Exchange with Outlook'
type: article
created_date: '2012-05-27'
created_by: Rae D. Cabello
last_modified_date: '2018-10-19'
last_modified_by: Kate Dougherty
product: Microsoft Exchange
product_url: exchange
---

This article shows you how to transfer all of your current
Microsoft&reg; Exchange data to your new [Rackspace Microsoft
Exchange](https://www.rackspace.com/email-hosting/hosted-exchange) account,
including your email, calendar data, contacts, tasks, and notes.

**Note**: If your office network has bandwidth limitations, you might want to
turn off cached Exchange mode before your users begin to migrate their
personal storage (PST) files.

### Export your data to a PST file

1. Open Microsoft Outlook&reg; and log in to your
   previous Microsoft Exchange mailbox. Select **File > Import and
   Export**, as shown in the following image:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/1.png %}" alt="" />

    The Import and Export Wizard opens.

2. Select **Export to a file** and click **Next**.

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/2.png %}" alt="" />

3. On the next screen, select **Personal Folder File (.pst)** and click
   **Next**.

   Then, perform one of the following actions and click **Next**:

   - To export an entire mailbox, including calendar, contacts, tasks,
     and notes, click once on the top folder (which has the format **Mailbox -
     Your Name**), then select the **Include subfolders** check box.

   - To export a public folder, click once on the top folder (or
     **Public Folders** to export all public folders), then select the
     **Include subfolders** check box.

   - To export individual **Calendars, Contacts, or Tasks**, highlight
     the individual folder, then select the **Include subfolders**
     check box.

4. Save the export as a `.pst` file. You are
   prompted for a save location. The default save location is `C:\\Documents
   and Settings\\(user name)\\Local Settings\\Application
   Data\\Microsoft\\Outlook\\backup.pst.`

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/3.png %}" alt="" />

    **Note**: To make it easier to locate the file later, save it to
    your desktop. You need to know the location of the file to import it
    into your new account.

5. Select the root folder of your mailbox, then select the check box to
   **Include subfolders** and click **Next**. On the next screen, ensure
   that you leave the option **Replace duplicates with items exported** selected, then click **Finish** to begin your export, as shown in the
   following images:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/ExportPersonalFolders.png %}" alt="Export personal folders" width="451" height="336" />

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/5.png %}" alt="" />

**Note**: Because this file is only used temporarily for export and import, we
recommend that you use **No Encryption** for speed and compatibility purposes by leaving the password blank.

### Import your PST file to your email client

After you have exported your PST file, you need to add your new
Rackspace Microsoft Exchange email account to your email client. After
your account is set up, perform the following steps:

1. Open Outlook, log in to your
   Microsoft Exchange mailbox, and select **File > Import and Export**, as
   shown in the following image:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/1.png %}" alt="" />

    The Import and Export Wizard opens.

2. Select **Import from another program or file**
   and click **Next**, as shown in the following image:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/6.png %}" alt="" />

3. Select **Personal Folder File (.pst)** and click **Next**. On the next
   screen, click **Browse** to locate the **PST file** that you exported, as
   shown in the following image:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/7.png %}" alt="" />

4. Click **Open**. Then, leave the option **Replace duplicates
   with items imported** selected and click **Next**, as shown in the
   following image:

    <img src="{% asset_path   exchange/migrating-exchange-to-exchange-via-outlook/8.png %}" alt="" />

5. Select **Personal Folders**, then select the **Include
   subfolders** check box, and click **Import items into the same
   folder in**. From the drop-down box, select the Exchange mailbox
   (shown as Mailbox - Your Name) into which you want to import your data.
   Click **Finish** to begin the import process, as shown in the following
   image:

    <img src="{% asset_path exchange/migrating-exchange-to-exchange-via-outlook/10.png %}" alt="" />

**Note**: Your import might take some time to finish, depending on the size of
the PST file.
