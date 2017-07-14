---
permalink: microsoft-exchange-storage-maintenance-and-best-practices/
audit_date: '2017-07-06'
title: Microsoft Exchange storage maintenance and best practices
type: article
created_date: '2017-06-09'
created_by: William Loy
last_modified_date: '2017-07-10'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article describes how to monitor and adjust user storage from the Cloud Office Control Panel, and provides best practices for mailbox storage.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** At least 15 minutes for any changes made to storage
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Check and adjust mailbox storage

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") by using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Mailboxes**.

   <img src="{% asset_path exchange/microsoft-exchange-storage-maintenance-and-best-practices/HEXstorageCPSC1.png %}" />

3. If you have multiple domains, select the domain for which you want to check storage.

   In the mailbox list, the **Usage** column shows the amount of free space each user has. This column does not display a real-time reading of the mailbox storage; the value is updated once every 24 hours.

   **Warning:** If a mailbox is at maximum capacity, the mail sent during that time is rejected and is **not** delivered after more mailbox space is created.

4. To increase a user's storage quota, click the blue link for the corresponding mailbox name in the **Display Name** column.

   <img src="{% asset_path exchange/microsoft-exchange-storage-maintenance-and-best-practices/HEXstorageCPSC2.png %}" />

5. Under **Storage**, use the slide bar to increase the mailbox storage quota.

   <img src="{% asset_path exchange/microsoft-exchange-storage-maintenance-and-best-practices/HEXstorageCPSC3.png %}" />

6. Click **Save**.

   Allow at least 15 minutes for the storage quota to be increased.

**Warning:** Most [mail clients](/how-to/cloud-office-support-terminology/#cloud-office-terminology) have maximum storage limits. For example, Outlook 2016 allows a maximum of 50 GB of mail storage. If your Exchange mailbox size exceeds your mail client limit you will experience mail synchronization issues with your mail client.

### Recommendations for users nearing their storage capacity

Check mailbox usage regularly to determine which users are nearing capacity. Following are some recommendations for users nearing their storage capacity:

- Notify users about their capacity and advise them to archive items to free up mailbox storage. Rackspace Email Archiving ensures that email traffic to and from your domain is archived. For more information, see [Enable email archiving: Cloud Office Control Panel](/how-to/enable-email-archiving-cloud-office-control-panel/).
- Deleting emails frees up mailbox storage. However if a user deletes an excessive number of emails at once, it takes longer to process the deletion. Allow ample time for that deletion to be reflected in the storage quota.
- Email in the **Deleted Items** folder counts toward the storage quota of the mailbox. To ensure that a deleted message does *not* count toward your mailbox storage, delete the message from the **Deleted Items** folder.

   If you need to recover a message that you deleted from the **Deleted Items** folder, right-click the folder and select **Recover Deleted Items**.

   **Note:** Messages purged from the **Deleted Items** folder can be recovered for up to 14 days after deletion.

### Mailbox storage best practices

- Enable [**Rackspace Cloud Office Archiving**](/how-to/enable-email-archiving-cloud-office-control-panel/) for all domains. 
- Never store more than 10,000 items in one folder.
- Consider removing items from your **Spam** and **Deleted Items** folders.
- Do not exceed more than three levels of folders. For example:

    - Best-practice folder level 1

        - Best-practice folder level 2

            - Best-practice folder level 3

                - Not a best-practice folder

- If you archive or delete messages on your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) log in to [apps.rackspace.com](https://apps.rackspace.com/index.php) to verify that those changes are reflected in Outlook Web Access.
