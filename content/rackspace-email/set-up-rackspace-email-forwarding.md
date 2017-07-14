---
permalink: set-up-rackspace-email-forwarding/
audit_date:
title: Set up Rackspace Email forwarding
type: article
created_date: '2017-06-07'
created_by: William Loy
last_modified_date: '2017-06-29'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to forward a Rackspace Email mailbox to another email address.

If you need to configure forwarding for a Microsoft Exchange mailbox, see [Set up Microsoft Exchange email forwarding](/how-to/set-up-microsoft-exchange-email-forwarding/).

### Prerequisites

- **Applies to:** User and Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes to set forward / Additional 15 minutes for forward to function
- **Tools required:** [apps.rackspace.com](https://apps.rackspace.com/index.php) access for Users / [Cloud Office Control Panel](https://cp.rackspace.com) access for Administrators

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Set up forwarding by using webmail

Use these steps to forward email from your Rackspace Email address to another address by using webmail.

1. Log in to the mailbox you wish to forward at [apps.rackspace.com](https://apps.rackspace.com/index.php)
2. Click your username in the upper right-hand corner then select **Settings** from the drop down menu.

   A settings pop-up box displays.

3. Select the **Incoming Email** tab on the left-hand side of this box.
4. To the right, select the **Forwarding** tab.
5. Select the **On** option for **Status**.
6. Check the box next to **Save a copy of forwarded email**.

   **Warning:** If **Save a copy of forwarded email** is not checked, this mailbox will *not* store any messages sent to it.

7. Enter the email address to which you want to forward email in the **Forward to** field.

   <img src="{% asset_path rackspace-email/set-up-rackspace-email-forwarding/ForwardRSEWebmailSC2.png %}" />

8. Click **Save**.

Allow at least 15 minutes for the forward to be fully enabled after setting it up. If you are unable to set up a forward by using this method, contact your account administrator.

### Set up forwarding by using the Cloud Office Control Panel

**Note:** These steps apply to Administrators with access to their account's Cloud Office Control Panel.

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.
2. In the **Rackspace Email** section, click **Mailboxes**.
3. If you have multiple domains, select the domain that contains the mailbox that you want to forward.
4. From the mailbox list, click the blue highlighted mailbox name that you want to forward.

   <img src="{% asset_path rackspace-email/set-up-rackspace-email-forwarding/ForwardRSEcontrolpanelSC2.png %}" />

5. Select the **Forwarding/Auto-Reply** tab.
6. Check the box for **Forward email to**.

   A. In the field under **Forward email to**, type in the email address to which you want to forward email.
   B. Check the box for **Save copies of forwarded email**

   <img src="{% asset_path rackspace-email/set-up-rackspace-email-forwarding/ForwardRSEcontrolpanelSC3.png %}" />

   **Warning:** If **Save a copy of forwarded email** is not checked, this mailbox will *not* store any messages sent to it.

7. Click **Submit**.

Allow at least 15 minutes for the forward to be fully enabled after setting it up.

### References

- [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")
- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)
- [Cloud Office Email Portal](https://apps.rackspace.com/index.php)
- [Set up Microsoft Exchange email forwarding](/how-to/set-up-microsoft-exchange-email-forwarding/).
