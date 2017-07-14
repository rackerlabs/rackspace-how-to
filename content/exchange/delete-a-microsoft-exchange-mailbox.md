---
permalink: delete-a-microsoft-exchange-mailbox/
audit_date: '2017-07-14'
title: Delete a Microsoft Exchange mailbox
type: article
created_date: '2017-06-09'
created_by: William Loy
last_modified_date: '2017-07-13'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: Exchange
---

This article describes how to delete a Microsoft Exchange mailbox in the Cloud Office Control Panel.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:**  Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Disable versus delete

It is important to know the difference between disabling a mailbox and deleting a mailbox.

- Disabling a mailbox prevents access to the mailbox. When a mailbox is disabled, it remains on your account and you continue to be billed for it. The mailbox retains its previous data and receives new mail sent to it.

- Deleting a mailbox removes that mailbox and all of its data from Rackspace's servers. After you have deleted a mailbox, you must contact Support to have that change reflected on your bill.

If you need any of the data in the mailbox, you must export the data before you delete the mailbox. Data exports must be performed through a [local mail client](/how-to/cloud-office-support-terminology) such as Outlook.

### Delete a mailbox

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) by using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Mailboxes**.

   <img src="{% asset_path exchange/delete-a-microsoft-exchange-mailbox/delete-hexbox-sc1.png %}" />

3.	If you have multiple domains, select the domain that contains the mailbox that you want to delete.
4. Select the check box next to the mailbox that you want to delete.

   **Warning:** A deleted mailbox can only be recovered for 14 days. For more information, see [Recover a deleted Microsoft Exchange mailbox](/how-to/recover-a-deleted-microsoft-exchange-mailbox/).

5. Expand the **Select Action** menu at the bottom of the mailbox list, and select **Delete mailboxes**.

   <img src="{% asset_path exchange/delete-a-microsoft-exchange-mailbox/delete-hexbox-sc2.png %}" />

6. Read the information in the popup box that appears. If there is no conflict, click **Delete 1 mailbox**.

7. Contact support to confirm your deletion.
