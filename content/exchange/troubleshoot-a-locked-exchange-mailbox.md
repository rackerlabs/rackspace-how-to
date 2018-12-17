---
permalink: troubleshoot-a-locked-exchange-mailbox/
audit_date: '2017-12-18'
title: Troubleshoot a Locked Exchange mailbox
type: article
created_date: '2017-11-24'
created_by: William Loy
last_modified_date: '2017-12-18'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article describes the troubleshooting process for when an Exchange mailbox has locked due to failed authentications.


### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Moderate
- **Time needed:** Approximately 30 minutes to unlock mailbox
- **Tools required:** [Cloud Office Control Panel](https://cp.rackspace.com) access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

**Warning:** You must gather all devices that can connect to the locked mailbox to successfully resolve the issue.

### How to tell if your mailbox is locked

Answering yes to any of the following questions could mean that your Exchange mailbox is locked.

- Have you recently changed the password to the mailbox?

- Are you repeatedly being prompted for a password on any of your devices?

- Have you attempted to log into [apps.rackspace.com](apps.rackspace.com) without success?

It could also be time to [update your password](/how-to/change-a-microsoft-exchange-mailbox-password) if you are having trouble remembering the current password.

### User instructions for mailbox lockouts

Use the following steps to access your mailbox:

1. Gather all of the devices that you use to check email.

   **Note:** Having every device is crucially important to stopping the cycle of lockouts.

2. Remove the cached password from each device. This might require locating instructions for specific devices. Most manufactures will have instructions for completing this process.

3. Allow at least 30 minutes to pass, and then try logging into apps.rackspace.com.

   **Note:** Your account Administrator can unlock the mailbox immediately.

4. Once you have successfully logged in at apps.rackspace.com, begin connecting to email on each of your devices, inputing your password as you are prompted for it on each device.

### Admin instructions for mailbox lockouts

Administrators must coordinate several steps with the locked-out user through the duration of this process. If the process is not coordinated, you might experience reoccurring lockouts.

1. Instruct the locked user to gather all devices that they use to check their email.
2. Instruct the locked user to remove the mailbox password from all of the devices, including mobile devices. Do not re-enter the password yet.
3. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).
4. In the **Microsoft Exchange** section, click **Mailboxes**.
5. Select the domain that contains the mailbox that is locked.
6. In the mailbox list, select the name of the mailbox that you want to unlock.
7. If the mailbox is locked, you will see an alert stating that the Mailbox is locked.

   <img src="{% asset_path exchange/troubleshoot-a-locked-exchange-mailbox/CP_unlock.png %}" />

8. Unlock the mailbox and allow 5 minutes for the unlock to complete.
9. Instruct the user to open their email application on each device one at a time, imputing their email address and password when prompted.
