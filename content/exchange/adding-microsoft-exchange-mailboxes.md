---
permalink: adding-microsoft-exchange-mailboxes/
audit_date:
title: Add Microsoft Exchange mailboxes
type: article
created_date: '2012-05-23'
created_by: Rae D. Cabello
last_modified_date: '2016-05-17'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

You can create a single Microsoft Exchange mailbox by using the Cloud Office Control Panel
to enter all the information, or you can add multiple Microsoft Exchange boxes
by using the Cloud Office Control Panel to import that information from a .CSV file.

### Add one Exchange mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com). In the **Microsoft
   Exchange** section, select the **Add / Edit Mailbox** link.

   <img src="{% asset_path exchange/adding-microsoft-exchange-mailboxes/exchange_mailboxes_list.png %}" alt="" />

2. If you have multiple domains, select the appropriate domain name.
   Otherwise, select the **Add Mailbox** button.

3. Enter the requested information in the fields provided:

   <img src="{% asset_path exchange/adding-microsoft-exchange-mailboxes/new_mailbox_hex.png %}" alt="" />

   - **First and Last Name**: Enter first and last name information for
     the mailbox owner in the spaces provided. This is optional.

   - **Display Name**: Enter the name that should be associated with
     the mailbox. This name will be displayed when the user sends
     email. This is optional.

   - **User Name**: This is used in the email address.
     For example, if the user name is specified as "myname" and the domain is
     "example.com", then the email address will be "myname@example.com".

   - **Password**: Enter a password for the email account. The password
     requirements are:

     - Must be at least 8 characters
     - Cannot include your username, display name, or full name
     - Must use 3 of these 4 character groups: uppercase
       characters, lowercase characters, numerals 0-9, or
       non-alphabetic characters (such as !, $, #, or %).

     For example, **Ex@mple1** is a valid password.

     Confirm the password by retyping the password you entered in the
     **Password** box.

   - **Microsoft Outlook license**: This allows the user to download
     Outlook from the user control
     panel at http://cp.rackspace.com/usercp.

   - **Public Folder Admin**: This gives the user permission to
     create new public folders and administer public folders they create.

   - Select the **Save** button and the mailbox will appear in
     the list.

To manage additional features for the mailbox, such as
**Forwarding / Auto-Reply**, **Aliases**, or **Settings**, click the mailbox
name and then click the corresponding tab.

### Add multiple Exchange mailboxes

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).

   In the **Email Accounts** section, select the **Add / Edit Mailbox** link for
   either Rackspace Email or Microsoft Exchange.

2. If you have multiple domains, select the appropriate domain name;
   otherwise, select the **Multiple** **Add Mailbox** button.

3. Create a CSV or Excel file containing the information detailed in
   the **Data Format** section of the control panel page.

    <img src="{% asset_path exchange/adding-microsoft-exchange-mailboxes/(E%26A)AddingAMailbox3.png %}" alt="" />

    **Note**: Passwords must follow the rules described in the
    "Add one Exchange mailbox" section of this article.

4. In the **Import File** section, click **Browse** and locate and select
   the CSV or Excel file you created.

5. Select **Open** and then **Import**.

   Mailbox information will be
   imported and the mailboxes will be created. Any errors that occur
   will be detailed in the import.
