---
permalink: rackspace-email-storage-maintenance-and-best-practices/
audit_date:
title: Rackspace Email storage maintenance and best practices
type: article
created_date: '2017-06-08'
created_by: William Loy
last_modified_date: '2017-06-09'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to monitor user storage in your Cloud Office Control Panel as well as best practices for mailbox storage.

### Prerequisites

- **Applies to:** Administrator

- **Tools required:**  Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).



### Checking mailbox storage in the Cloud Office Control Panel

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2.	Select **Mailboxes** within the **Rackspace Email** section.

    <!--add screen shot file RSEstorageCPSC1.png-->

3.	If you have multiple domains, select the domain you wish to check storage for.

4. The fourth column in the mailbox list labeled **Usage** shows the amount of free space each user has.

Warning: If a mailbox is at max capacity, the mail sent during that time will be rejected and WILL NOT deliver after more mailbox space is created.

Note: The **Usage** column is not a real time reading of the mailbox storage. **Usage** updates once every 24 hours. Always reference the storage in [apps.rackspace.com](https://apps.rackspace.com/index.php) for real time storage.

### Enable storage notifications to warn users when they are close to exceeding their storage quota

1.	Select **Mailboxes** within the **Rackspace Email** section.

    <!--add screen shot file RSEstorageCPSC1.png-->

2. If you have multiple domains, select the domain you wish to enable storage notifications for.

3. Select **Settings** from the sub-ribbon under **Email Accounts**

    <!--add screen shot file RSEstorageNotificationsSC1.png-->

4. Select **Storage Notification** from the options.

5. Check the box next to **Activate full mailbox notification** and adjust settings as desired.

    - Send a notification to the user when the mailbox reaches a certain percentage of capacity.
    - Send CC to an email address of your choosing so that you easily know when users are about to exceed capacity.
    - Customize the notification message to give your user instructions.  

6. Click **Save**.


### Checking mailbox storage in webmail

1. Log in to [apps.rackspace.com](https://apps.rackspace.com/index.php).

2. Click your username in the upper-right hand corner and the dropdown menu will show the current mailbox storage.

<!--add screen shot file RSEstorageWebmailSC1.png-->

Note: Consider the storage shown in [apps.rackspace.com](https://apps.rackspace.com/index.php) to be the authority for your storage available on the server.


### Recommendations for users nearing their storage capacity.

- Notify users near capacity and counsel them on archiving items to free up mailbox storage.

- If a user deletes an excessive number of emails, this change will take longer to process. Allow ample time for that deletion to be reflected.

- Email in the **Trash** folder DOES COUNT toward the storage of the mailbox. Follow the below steps to ensure a deleted message is not counting toward your mailbox storage.

     1. Move an unwanted message to **Trash**
     2. The message has been moved to the **Trash** folder. Delete the message from **Trash**.   
     3. The message no longer counts toward the mailbox storage. If you need to recover a message that you deleted from trash see [Recover deleted email in Webmail](/how-to/recover-deleted-email-in-webmail/).

     Warning: Messages purged from the **Trash** folder can be recovered for up to 14 days after deletion. 14 days after deletion the message cannot be recovered.

- **Consider Rackspace Email Archiving** to ensure that email traffic to and from your domain is archived going forward. [Enable email archiving: Cloud Office Control Panel](/how-to/enable-email-archiving-cloud-office-control-panel/).


### Mailbox storage best practices

- We recommend that all customers enable [**Rackspace Email Archiving**](/how-to/enable-email-archiving-cloud-office-control-panel/) for all domains.    

- Rackspace email storage is maxed at 25GB. Consider upgrading to our [Microsoft Exchange](https://www.rackspace.com/email-hosting/hosted-exchange) or [Office 365](https://www.rackspace.com/office-365) solutions for higher storage limits.

- Never store over 10,000 items in one folder.

- You should not exceed more than 3 levels of subfolders.

    Example folder structure:

    - Best practice folder(level 1)

        - Best practice folder(level 2)

            - Best practice folder(level 3)

                - Not best practice folder


- Consider removing items from your **Spam** or **Trash** folders.

- If you archive or delete messages on your [local mail client](/how-to/cloud-office-support-terminology/#cloud-office-terminology) log into [apps.rackspace.com](https://apps.rackspace.com/index.php) to make certain that those changes are reflected in webmail.

Note: Consider the storage shown in [apps.rackspace.com](https://apps.rackspace.com/index.php) to be the authority for mailbox storage available on the server.
