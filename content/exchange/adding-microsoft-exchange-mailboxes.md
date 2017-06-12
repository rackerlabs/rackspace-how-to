---
permalink: adding-microsoft-exchange-mailboxes/
audit_date:
title: Add Microsoft Exchange mailboxes
type: article
created_date: '2012-05-23'
created_by: Rae D. Cabello
last_modified_date: '2017-06-06'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---
You can add a single mailbox to your Cloud Office account or add multiple mailboxes by using a CSV or Microsoft Excel file.
### Prerequisites

- **Applies to:** Administrator

- **Difficulty:** Easy

- **Time needed:** Approximately 5 minutes to create a mailbox / Approximately 15 additional minutes for mailbox to be accessible

- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

Add Microsoft Exchange mailboxes using these steps. If you need to add a Rackspace Email mailbox see [Add Rackspace Email mailboxes](https://support.rackspace.com/how-to/add-rackspace-email-mailboxes/).

Warning: Adding multiple mailboxes will extend the time needed to be able to access a new mailbox as mailbox additions are processed in order.

### Add one Exchange mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com) using your Rackspace Cloud Office admin ID and password.

2. Select **Mailboxes** within the **Microsoft Exchange** section.
<!--add screen shot file AddHexmailboxSC1.png-->

**Note:** If the **Add Mailbox** button is greyed out, you must add the necessary licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

3.	If you have multiple domains, select the domain you wish to add a mailbox to.

4.	Click **Add Mailbox**.

<!--add screen shot file AddHexmailboxSC2.png-->

5. Enter the requested information in the fields provided:

   <!--add screen shot file AddHexmailboxSC3.png-->

   * **First and Last Name**: Enter first and last name information for
     the mailbox owner in the spaces provided. This is optional.

   * **Display Name**: Enter the name that should be associated with
     the mailbox. This name will be displayed when the user sends
     email. This is optional.

   * **User Name**: This is used in the email address.
     For example, if the user name is specified as "**myname** and the domain is
     **yourdomainexample.com**, then the email address will be **myname@yourdomainexample.com**.

     Note: You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.

   * **Password:** Enter a password for the email account using the following requirements:

      - It must be at least eight characters.
    	- It must use characters from at least three of the following four character types:
    	 - English alphabet uppercase letters (A-Z)
    	 - English alphabet lowercase letters (a-z)
    	 - Numerals (0-9)
    	 - Alphanumeric symbols (such as !, #, $, %)

   * **Confirm:** Retype the password that you entered in the **Password** box.

   * **? symbol:** Place your cursor over the **?** symbol for a description of additional mailbox options.

   * Select the **Save** button and the mailbox will appear in
     the list.

**Note:** Once a mailbox is created in the Cloud Office Control Panel, it can take up to 15 minutes for the mailbox to be accessible. You can then log into the mailbox at [apps.rackspace.com](https://apps.rackspace.com/index.php)

To manage additional features for the mailbox, such as
**Mail Forwarding**, **Email Addresses**, or **Permissions**, click the mailbox
name and then click the corresponding tab.

### Add multiple Exchange mailboxes

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).

2. Select **Mailboxes** within the **Microsoft Exchange** section.
<!--add screen shot file AddHexmailboxSC1.png-->

3. If you have multiple domains, select the domain you wish to add a mailbox to.

4.	Click **Add/Edit Multiple Mailboxes**.

    <!--add screen shot file AddmultHexSC1.png-->

    **Note:** If the **Add/Edit Mailboxes** button is greyed out, you must add the necessary number of licenses to your account before you can add a mailbox. See [Add a mailbox license](#add-a-mailbox-license) for instructions.

5.	Create a CSV or Excel file(XLS format) that contains the information detailed in the **Data Format** section of the **Import Mailboxes** page. You can download a template from that section to help you create a file with the correct format.

**Note:** You are not able to create a username that already exists as an alias, group list, distribution list, or as another mailbox. You must remove the conflicting address from your account before using the same username for another purpose.

**Warning:** **Username**, **Password**, **First Name**, **Last Name** and **Enabled(Enabled=1 Disabled=0)** fields are required on all CSV or Excel imports when adding Microsoft Exchange mailboxes. This method of mailbox creation should be used for adding a high number of mailboxes.

4. In the **Import File** section, click **Browse** and locate and select
   the CSV or Excel file you created.

5. Select **Open** and then **Import**.

The mailboxes will appear in the mailboxes list. Any errors that occur are detailed in the import log. Make corrections as detailed in the import log and import again.


### Add a mailbox license

   1.	Click the **Upgrade this plan** link.

   <!--add screen shot file AddHexlicenseSC1.png-->

   2.	Under **Microsoft Exchange Mailboxes**, add the number of mailboxes that you need.

   <!--add screen shot file AddHexlicenseSC2.png-->

   3.	Click **Continue**.

   4.	If the order summary looks correct, click **Complete Order**.


### References
[Cloud Office support terminology](/how-to/cloud-office-support-terminology)

[Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")

[Cloud Office Email Portal](https://apps.rackspace.com/index.php)

[Add Rackspace Email mailboxes](https://support.rackspace.com/how-to/add-rackspace-email-mailboxes/).
