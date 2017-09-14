---
permalink: delete-a-rackspace-email-mailbox/
audit_date: '2017-07-14'
title: Delete a Rackspace Email mailbox
type: article
created_date: '2017-06-09'
created_by: William Loy
last_modified_date: '2017-06-12'
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

- Blocking access to a mailbox prevents users from accessing the mailbox. When mailbox access is blocked, it remains on your account and you continue to be billed for that mailbox. The mailbox retains its previous data and receives new mail sent to it. If you simply need to block access to a mailbox rather than deleting it, please see [Block mailbox access](/how-to/block-mailbox-access) for instructions.

- Deleting a mailbox removes that mailbox and all of its data from Rackspace's
servers.

If you need any of the data in the mailbox, you must export the data before you delete the mailbox. Data exports must be performed through a [local mail client](/how-to/cloud-office-support-terminology) such as Outlook.


### Delete a mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) by using your Rackspace Cloud Office admin ID and password.
2. In the Rackspace Email section, click **Mailboxes**.

   <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/add-mailbox-sc1.png %}" />

3.	If you have multiple domains, select the domain that contains the mailbox that you want to delete.
4. Check the box to the left of the mailbox you wish to delete.

    **Warning:** A deleted mailbox can be recovered for up to 14 days. For instructions, see [Recover a deleted mailbox](/how-to/recover-a-deleted-rackspace-email-mailbox/).

5. Expand the **Select Action** menu at the bottom of the mailbox list, and select **Delete** mailboxes.

   <img src="{% asset_path rackspace-email/delete-a-rackspace-email-mailbox/delete-rse-box-sc2.png %}" />

6. Read the information in the popup box that appears. If there is no conflict, click **Delete 1 mailbox**.

7. Contact support to confirm the deletion.
