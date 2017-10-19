---
permalink: delete-a-rackspace-email-mailbox/
audit_date: '2017-07-14'
title: Delete a Rackspace Email mailbox
type: article
created_date: '2017-06-09'
created_by: William Loy
last_modified_date: '2017-09-14'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to delete a Rackspace email mailbox in your Cloud Office Control Panel.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:**  Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).


### Block access versus delete

It is important to know the difference between blocking access to a mailbox and deleting a mailbox.

- Blocking access to a mailbox prevents users from accessing the mailbox. When mailbox access is blocked, it remains on your account and you continue to be billed for that mailbox. The mailbox retains its previous data and receives new mail sent to it. If you need to block access to a mailbox rather than deleting it, please see [Block mailbox access](/how-to/block-mailbox-access) for instructions.

- Deleting a mailbox removes that mailbox and all of its data from Rackspace's servers.

If you need any of the data in the mailbox, you must export the data before you delete the mailbox. Data exports must be performed through a [local mail client](/how-to/cloud-office-support-terminology), such as Outlook.

### Delete a mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) by using your Rackspace Cloud Office admin ID and password.
2. In the Rackspace Email section, click **Mailboxes**.

   <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/add-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain that contains the mailbox that you want to delete.
4. Click the name of the mailbox you want to delete.

    <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/click_username.png %}" />

5. Click **DELETE MAILBOX** in the upper-right corner.

    <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/delete_button.png %}" />

6. A pop up appears informing you of what services and data will be deleted. After you review the information and want to continue with deleting the mailbox click **YES, DELETE MAILBOX**.

    <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/yes_delete.png %}" />

    **Warning:** A deleted mailbox can be recovered for up to 14 days. For instructions, see [Recover a deleted mailbox](/how-to/recover-a-deleted-rackspace-email-mailbox/).

7. You are returned to the mailbox list where you can see that the mailbox has been removed from the list.

### Delete multiple mailboxes

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) by using your Rackspace Cloud Office admin ID and password.
2. In the Rackspace Email section, click **Mailboxes**.

   <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/add-mailbox-sc1.png %}" />

3. If you have multiple domains, select the domain that contains the mailbox that you want to delete.

4. Check the box to the left of all the mailboxes you intend to delete.

5. Expand the **Select Action** menu at the bottom of the mailbox list, and select **Delete mailboxes**

   <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/delete-rse-box-sc2.png %}" />

6.  A pop up appears informing you of what services and data will be deleted. After you review the information and want to continue with deleting the mailbox click **Delete # mailboxes**.

    <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/delete_mult_mailboxes.png %}" />

7. You are returned to the mailbox list where you can see that the mailbox has been removed from the list.
