---
permalink: add-rackspace-email-mailboxes/
audit_date: '2017-06-12'
title: Add Rackspace Email mailboxes
type: article
created_date: '2011-12-18'
created_by: William Loy
last_modified_date: '2017-06-06'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

You can add a single mailbox to your Rackspace Email account or you can add multiple mailboxes by using a CSV or Microsoft Excel file.

If you need to add a Microsoft Exchange mailbox see [Add Microsoft Exchange mailboxes](https://support.rackspace.com/how-to/adding-microsoft-exchange-mailboxes/).

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes to create a mailbox and approximately 15 additional minutes for the mailbox to become accessible
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Add a single mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.
2. In the Rackspace Email section, click Mailboxes. 

   <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-mailbox-sc1.png %}" />
   
3. If you have multiple domains, select the domain to which you want to add a mailbox.
4. Click **Add Mailbox**.

    <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-mailbox-sc2.png %}" />
    
    **Note:** If the **Add Mailbox** button is unavailable, you must add the necessary licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.
     
5. Enter the following information in the fields provided:

	 * **First Name and Last Name** (optional): Enter first and last name information for the mailbox owner.
	 * **Display Name** (optional): Enter the name to display when the user sends email.
	 * **User Name:** Enter the name to use in the email address. For example, if you specify **myname** as the username, and the domain is **yourdomainexample.com**, then the email address is **myname@yourdomainexample.com**.
      **Note:** You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.
	 * **Password:** Enter a password for the email account using the following requirement
	   - It must be at least eight characters.
	   - It must use characters from at least three of the following four character types:
	     - English alphabet uppercase letters (A-Z)
	     - English alphabet lowercase letters (a-z)
	     - Numerals (0-9)
	     - Non-alphanumeric symbols (such as !, #, $, %)
	 * **Confirm:** Retype the password that you entered in the **Password** box.
	 
6. Click **Save**.

   **Note:** After a mailbox is created in the Cloud Office Control Panel, it can take up to 15 minutes for the mailbox to become accessible. You can then log in to the mailbox at [apps.rackspace.com](https://apps.rackspace.com/index.php).
     
The mailbox appears in the mailboxes list. To manage additional features for the mailbox, such as forwarding, autoreply, aliases, or settings, click the mailbox name and then click the corresponding tab on the details page.

### Add multiple mailboxes

**Warning:** When you add multiple mailboxes, the time needed for the new mailboxes to become accessible is extended because mailbox additions are processed sequentially.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.
2. In the Rackspace Email section, click **Mailboxes**. 

    <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-mailbox-sc1.png %}" />
    
3. If you have multiple domains, select the domain to which you want to add a mailbox.
4. Click **Add/Edit Multiple Mailboxes**.

    <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-multi-mailboxes.png %}" />
    
    **Note:** If the **Add/Edit Multiple Mailboxes** button is unavailable, you must add the necessary number of licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.
    
5. Create a CSV or Excel file(XLS) that contains the information detailed in the **Data Format** section of the Import Mailboxes page. You can download a template from that section to help you create a file with the correct format.

   The **Username**, **Password**, and **Enabled** fields are required for all mailbox entries in the file. Passwords must meet the following requirements:
   
    - It must be at least eight characters.
    - It must use characters from at least three of the following four character types:
      - English alphabet uppercase letters (A-Z)
      - English alphabet lowercase letters (a-z)
      - Numerals (0-9)
      - Non-alphanumeric symbols (such as !, #, $, %)
		
	**Note:** You can’t create a username that already exists as an alias, group list, distribution list, or another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.
		
6. In the **Import File** section of Import Mailboxes page, click **Browse** or **Choose File**.
7. Locate and select the CSV or Excel file that you created.
8. Click **Open** and then click **Import**.

After they are created, the mailboxes appear in the mailboxes list. Any errors that occur are detailed in the import log. Make corrections as detailed in the import log and import again.

### Add a mailbox license

If the buttons to add one or more mailboxes are unavailable, you must add the necessary licenses to your account before you can add a mailbox.

1. Click the **Upgrade this plan** link.

    <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-rse-license-sc1.png %}" />
    
2. Under **Rackspace Email Mailboxes**, add the number of mailboxes that you want to make available to your account.

    <img src="{% asset_path rackspace-email/add-rackspace-email-mailboxes/add-rse-license-sc2.png %}" />
    
3. Click **Continue**.
4. If the order summary looks correct, click **Complete Order**.

### References

- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)
- [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")
- [Cloud Office Email Portal](https://apps.rackspace.com/index.php)
- [Add Microsoft Exchange mailboxes](https://support.rackspace.com/how-to/adding-microsoft-exchange-mailboxes/)
