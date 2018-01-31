---
permalink: rename-a-rackspace-email-address/
audit_date: '2017-10-11'
title: Rename a Rackspace Email address
type: article
created_date: '2016-05-10'
created_by: Amber Melita
last_modified_date: '2017-10-20'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to rename a Rackspace Email address from the Cloud Office Control Panel.


### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 20 minutes
- **Tools required:** Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

For a video tutorial of the following steps, see [Rackspace Email - Adding/Editing/Renaming/Restoring](emailhelp.rackspace.com/l/add-edit-rename-rse-mailbox).

### Before you begin

If the mailbox is set up in a [local email client](/how-to/cloud-office-support-terminology) profile such as Outlook or Apple Mail, export the user's local profile. After the email address is renamed, the local profile must be recreated. Exporting the profile before renaming the mailbox prevents the loss of mail data.

### Rename a Rackspace Email Address

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/).

2. In the **Rackspace Email** section, click **Mailboxes**.

3. In the mailbox list, click the link for the email address that you want to rename.

4. Click the **More** button, expanding the dropdown menu, and select **Rename Email Address**.

   <img src="{% asset_path rackspace-email/rename-a-rackspace-email-address/edit-mailbox-options.png %}" />

5. In the Rename Email Address dialog box, enter the user name portion of the new email address, and then click **Rename Email Address**.

    <img src="{% asset_path rackspace-email/rename-a-rackspace-email-address/rename-pop-up-SC1.png %}" />

    If you receive a `This email address is already taken` message, it means the address is already in use as an alias, group list, distribution list, or as a Microsoft Exchange mailbox on this domain. Try a different email address.

    A confirmation message will appear with the banner **Email Address Renamed!**, displaying the old email address and the new email address.

    <img src="{% asset_path rackspace-email/rename-a-rackspace-email-address/success-message.png %}" />

6. Click **OK**.

### Update devices to connect to the renamed email address

After you rename the email address, you must update all devices such as desktop
computers and mobile phones to connect to the renamed mailbox. For steps,
see Renamed Rackspace Email address setup guide. [Renamed Rackspace Email address setup guide](/how-to/renaming-a-rackspace-email-address-overview)

**Note:** We recommend logging in to [apps.rackspace.com](https://apps.rackspace.com/index.php) with the new mailbox address before you configure devices. If you are unable to log in, update the mailbox password before continuing. If you can't log in to the mailbox, see [Change a Rackspace Email mailbox password](/how-to/change-rackspace-email-mailbox-password/#change-a-password-through-cloud-office-control-panel).
