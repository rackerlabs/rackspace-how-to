---
permalink: add-microsoft-exchange-mailboxes/
audit_date: '2017-06-12'
title: Add Microsoft Exchange mailboxes
type: article
created_date: '2012-05-23'
created_by: Rae D. Cabello
last_modified_date: '2017-06-12'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

You can add a single mailbox to your Cloud Office Exchange account, or you can add multiple mailboxes by using a CSV or Microsoft Excel file.

If you need to add a Rackspace Email mailbox, see [Add Rackspace Email mailboxes](https://support.rackspace.com/how-to/add-rackspace-email-mailboxes/).

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes to create a mailbox, and approximately 15 additional minutes for the mailbox to be accessible
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Add a single Exchange mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com) using your Rackspace Cloud Office admin ID and password.

2. In the Microsoft Exchange section, click **Mailboxes**.

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain to which you want to add a mailbox.

4. Click **Add Mailbox**.

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-mailbox-sc2.png %}" />

   If the **Add Mailbox** button is unavailable, you must add the necessary licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

5. Enter the requested information in the fields provided:

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-mailbox-sc3.png %}" />

	 * **First Name and Last Name** (optional): Enter first and last name information for the mailbox owner.

	 * **Display Name**: Enter the name to display when the user sends email.

	 * **User Name**: Enter the name to use in the email address. For example, if you specify **myname** as the username, and the domain is **yourdomainexample.com**, then the email address is **myname@yourdomainexample.com**.

      **Note**: You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.

	 * **Password:** Enter a password for the email account using the following requirements:

	   - It must be at least eight characters.
	   - It must use characters from at least three of the following four character types:
	     - English alphabet uppercase letters (A-Z)
	     - English alphabet lowercase letters (a-z)
	     - Numerals (0-9)
	     - Non-alphanumeric symbols (such as !, #, $, %)

	 * **Confirm:** Retype the password that you entered in the **Password** box.

6. Under Options, place your cursor over the **?** symbol for a description of additional mailbox options, and select any options that you want.

7. Click **Save**.

   **Note:** After a mailbox is created in the Cloud Office Control Panel, it can take up to 15 minutes for the mailbox to become accessible. You can then log in to the mailbox at [apps.rackspace.com](https://apps.rackspace.com/index.php).

   The mailbox appears in the mailboxes list. To manage additional features for the mailbox, such as forwarding, addresses, or permissions, click the mailbox name and then click the corresponding tab on the details page.

### Add multiple Exchange mailboxes

**Warning:** Adding multiple mailboxes will extend the time needed to be able to access a new mailbox as mailbox additions are processed in order.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com) using your Rackspace Cloud Office admin ID and password.

2. In the Microsoft Exchange section, click **Mailboxes**.

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain to which you want to add a mailbox.

4. Click **Add Multiple Mailboxes**.

    <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-multi-hex-sc1.png %}" />

    If the **Add Mailboxes** button is unavailable, you must add the necessary number of licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

5. Create a **CSV** or **Excel file (XLS)** that contains the information detailed in the Data Format section of the Import Mailboxes page. You can download a template from that section to help you create a file with the correct format.

    **Username**, **Password**, **First Name**, **Last Name** and **Enabled(Enabled=1 Disabled=0)** fields are required on all CSV or Excel imports when adding Microsoft Exchange mailboxes. This method of mailbox creation should be used for adding a high number of mailboxes.

6. In the **Import File** section of the Import Mailboxes page, click **Browse**.

7. Locate the CSV or Excel file you created.

8. Select **Open** and then **Import**.

   The mailboxes appear in the mailboxes list. Any errors that occur are detailed in the import log. Make corrections as detailed in the import log and import again.


### Add a mailbox license

If the buttons to add one or more mailboxes are unavailable, you must add the necessary licenses to your account before you can add a mailbox

1. Click the **Upgrade this plan** link.

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-license-sc1.png %}" />

2. Under **Microsoft Exchange Mailboxes**, add the number of mailboxes that you want to make available to your account.

   <img src="{% asset_path exchange/add-microsoft-exchange-mailboxes/add-hex-license-sc2.png %}" />

3. Click **Continue**.

4. If the order summary looks correct, click **Complete Order**.


### References

- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)

- [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")

- [Cloud Office Email Portal](https://apps.rackspace.com/index.php)

- [Add Rackspace Email mailboxes](https://support.rackspace.com/how-to/add-rackspace-email-mailboxes/)
