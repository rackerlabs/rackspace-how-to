---
permalink: microsoft-exchange-storage-maintenance-and-best-practices/
audit_date:
title: Microsoft Exchange storage maintenance and best practices
type: article
created_date: '2017-06-09'
created_by: William Loy
last_modified_date: '2017-06-09'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article explains how to monitor user storage in your Cloud Office Control Panel as well as best practices for mailbox storage.

### Prerequisites

- **Applies to:** Administrator

- **Difficulty:** Easy

- **Time needed:** At least 15 minutes for any changes made to storage

- **Tools required:**  Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).



### Checking mailbox storage in the Cloud Office Control Panel

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2.	Select **Mailboxes** within the **Microsoft Exchange** section.

    <!--add screen shot file HEXstorageCPSC1.png-->

3.	If you have multiple domains, select the domain you wish to check storage for.

4. The fourth column in the mailbox list labeled **Usage** shows the amount of free space each user has.

Note: The **Usage** column is not a real time reading of the mailbox storage. **Usage** updates once every 24 hours.

Warning: If a mailbox is at max capacity, the mail sent during that time will be rejected and WILL NOT deliver after more mailbox space is created.

5. To increase a user's storage quota, click the blue link for their corresponding mailbox name.

    <!--add screen shot file HEXstorageCPSC2.png-->

6. Under **Storage** there is a slide bar to increase the mailbox storage quota.

    <!--add screen shot file HEXstorageCPSC3.png-->

7. Click **Save**

Note: Allow at least 15 minutes for the storage quota to be increased.

Warning: Most [mail clients](/how-to/cloud-office-support-terminology/#cloud-office-terminology) have maximum storage limits. For example, Outlook 2016 only allows up to 50GB of mail storage. If your Exchange mailbox size exceeds your mail client limit you will experience mail synchronization issues with your [mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology).


It is important to check  the **Usage** of mailboxes to determine which users are nearing capacity. Below are recommendations for users nearing their storage capacity.

- Notify users nearing capacity and counsel them on archiving items to free up mailbox storage.

- If a user deletes an excessive number of emails, this change will take longer to process. Allow ample time for that deletion to be reflected in the storage quota.

- Email in the **Deleted Items** folder DOES COUNT toward the storage quota of the mailbox. Follow the below steps to ensure a deleted message is not counting toward your mailbox storage.

     1. Move an unwanted message to **Deleted Items**
     2. The message has been moved to the **Deleted Items** folder. Delete the message from **Deleted Items**.
     3. The message no longer counts toward the mailbox storage. If you need to recover a message that you deleted from **Deleted Items** right-click the **Deleted Items** folder and select **Recover Deleted Items**.  

     Warning: Messages purged from the **Deleted Items** folder can be recovered for up to 14 days after deletion. 14 days after deletion the message cannot be recovered.

- **Consider Rackspace Cloud Office Archiving** to ensure that email traffic to and from your domain is archived going forward. [Enable email archiving: Cloud Office Control Panel](/how-to/enable-email-archiving-cloud-office-control-panel/).


### Mailbox storage best practices

- We recommend that all customers enable [**Rackspace Cloud Office Archiving**](/how-to/enable-email-archiving-cloud-office-control-panel/) for all domains.   

- Never store over 10,000 items in one folder.

- Consider removing items from your **Spam** or **Deleted Items** folders.

- You should not exceed more than 3 levels of subfolders.

    Example folder structure:

    - Best practice folder(level 1)

        - Best practice folder(level 2)

            - Best practice folder(level 3)

                - Not best practice folder

- If you archive or delete messages on your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) log into [apps.rackspace.com](https://apps.rackspace.com/index.php) to make certain that those changes are reflected in Outlook Web Access.
