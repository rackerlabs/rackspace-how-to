---
permalink: getting-started-with-cloud-sites-adding-new-mailboxes/
audit_date:
title: 'Getting Started with Cloud Sites: Adding new mailboxes'
type: article
created_date: '2016-11-11'
created_by: Thomas Hester
last_modified_date: '2016-11-14'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for the [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com), a feature that was added for Classic Customers in November 2016.

This article shows how to add new mailboxes through the Cloud Sites Email Control Panel.

### Add new mailboxes individually

1. Log in to the [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com) by using your user name and password.

2. In the **Email Hosting** section, click **Mailboxes**.

3. If you have multiple domains, select the appropriate domain name.

4. Click **Add Mailbox** and enter the following required information on the **General** tab:

   - **User Name**: Enter a unique user name for the email account in all lowercase letters
   - **Password**: Enter a password for the email account
   - **Confirm**: Retype the password just entered.

   **Note:** You can optionally enter additional information about the user. The **Display Name** is the name that is displayed when the user sends email. To add more personal or organizational information, click the **Contact Info** tab.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-how-to-add-new-mailboxes/CSEMAIL1.png %}" />

5. Click **Save**.

### Add or edit multiple mailboxes

1. To add multiple mailboxes at one time (up to 500), create a CSV or Excel file that contains the required data about each mailbox. Download and edit the template provided in the Email Control Panel.

   The first line, the column headers, must remain unedited. The required fields are indicated in bold:

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-how-to-add-new-mailboxes/CSEMAIL2.png %}" />

2. To edit multiple mailboxes at one time (up to 500), create a CSV or Excel file that contains the necessary data about each mailbox. To save time, you can export a list of mailboxes on the domain and edit that list as needed.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-how-to-add-new-mailboxes/CSEMAIL3.png %}" />

3. After the CSV or Excel document is completed, click **Choose File** on the control panel and select the file.

4. Select the **Overwrite existing mailbox details** check box and then click **Import**.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-how-to-add-new-mailboxes/CSEMAIL4.png %}" />

**Note:** These changes will affect only the mailboxes specified in the uploaded file. Any fields left empty in the CSV or Excel document remain unchanged in the control panel if data previously existed. However, the **Username, Password,** and **Enabled** fields are required for each mailbox being updated.
