---
permalink: add-rackspace-email-mailboxes/
audit_date:
title: Add Rackspace Email mailboxes
type: article
created_date: '2011-12-18'
created_by: William Loy
last_modified_date: '2017-06-06'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

You can add a single mailbox to your Rackspace Email account or add multiple mailboxes by using a CSV or Microsoft Excel file.

### Prerequisites

- **Applies to:** Administrator

- **Difficulty:** Easy

- **Time needed:** Approximately 5 minutes to create a mailbox / Approximately 15 additional minutes for mailbox to be accessible

- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

Add Rackspace Email mailboxes using these steps. If you need to add a Microsoft Exchange mailbox see [Add Microsoft Exchange mailboxes](https://support.rackspace.com/how-to/adding-microsoft-exchange-mailboxes/).

Warning: Adding multiple mailboxes will extend the time needed to be able to access a new mailbox as mailbox additions are processed in order.

### Add a single mailbox

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2.	Select **Mailboxes** within the **Rackspace Email** section.
    <!--add screen shot file AddmailboxSC1.png-->

3.	If you have multiple domains, select the domain you wish to add a mailbox to.

4.	Click **Add Mailbox**.

<!--add screen shot file AddmailboxSC2.png-->

**Note:** If the **Add Mailbox** button is greyed out, you must add the necessary licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

5.	Enter the following information in the fields provided:

	 * **First Name and Last Name** (optional): Enter first and last name information for the mailbox owner.

	 * **Display Name** (optional): This name is displayed when the user sends email.

	 * **User Name:** This is used in the email address.
     For example, if the user name is specified as "**myname** and the domain is
     **yourdomainexample.com**, then the email address will be **myname@yourdomainexample.com**.

       **Note:** You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.

	 * **Password:** Enter a password for the email account using the following requirements:

	   - It must be at least eight characters.
	   - It must use characters from at least three of the following four character types:
	     - English alphabet uppercase letters (A-Z)
	     - English alphabet lowercase letters (a-z)
	     - Numerals (0-9)
	     - Non-alphanumeric symbols (such as !, #, $, %)

	 * **Confirm:** Retype the password that you entered in the **Password** box.

6.	Click **Save**.

**Note:** Once a mailbox is created in the Cloud Office Control Panel, it can take up to 15 minutes for the mailbox to be accessible. You can then log into the mailbox at [apps.rackspace.com](https://apps.rackspace.com/index.php)

The mailbox will appear in the mailboxes list. To manage additional features for the mailbox, such as forwarding, autoreply, aliases, or settings, click the mailbox name and then click the corresponding tab on the details page.


### Add multiple mailboxes

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2.	Select **Mailboxes** within the Rackspace Email section.
    <!--add screen shot file AddmailboxSC1.png-->

3.	If you have multiple domains, select the domain you wish to add a mailbox to.

4.	Click **Add/Edit Multiple Mailboxes**.

    <!--add screen shot file AddmultmailboxesSC1.png-->

    **Note:** If the **Add/Edit Multiple Mailboxes** button is greyed out, you must add the necessary number of licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

5.	Create a CSV or Excel file(XLS) that contains the information detailed in the **Data Format** section of the **Import Mailboxes** page. You can download a template from that section to help you create a file with the correct format.

    **Note:** You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.

	**Password requirements:**
  - It must be at least eight characters.
  - It must use characters from at least three of the following four character types:
    - English alphabet uppercase letters (A-Z)
    - English alphabet lowercase letters (a-z)
    - Numerals (0-9)
    - Non-alphanumeric symbols (such as !, #, $, %)

Warning: **Username**, **Password**, and **Enabled** fields are required on all CSV or Excel imports when adding Rackspace Email mailboxes. This method of mailbox creation should be used for adding a high number of mailboxes.

6.	In the **Import File** section, click **Browse** or **Choose File**.

7.	Locate and select the CSV or Excel file that you created.

8.	Click **Open** and then **Import**.

The mailboxes will appear in the mailboxes list. Any errors that occur are detailed in the import log. Make corrections as detailed in the import log and import again.


### Add a mailbox license

1.	Click the **Upgrade this plan** link.

<!--add screen shot file AddRSElicenseSC1.png-->

2.	Under **Rackspace Email Mailboxes**, add the number of mailboxes that you need.

<!--add screen shot file AddRSElicenseSC2.png-->

3.	Click **Continue**.

4.	If the order summary looks correct, click **Complete Order**.

### References
[Cloud Office support terminology](/how-to/cloud-office-support-terminology)

[Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")

[Cloud Office Email Portal](https://apps.rackspace.com/index.php)

[Add Microsoft Exchange mailboxes](https://support.rackspace.com/how-to/adding-microsoft-exchange-mailboxes/).
