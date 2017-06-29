---
permalink: set-up-rackspace-email-forwarding/
audit_date:
title: Set up Rackspace Email forwarding
type: article
created_date: '2017-06-07'
created_by: William Loy
last_modified_date: '2017-06-09'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Configure a Rackspace Email mailbox to forward to another email address. If you require steps to set up forwarding for a Microsoft Exchange mailbox please see [Set up Microsoft Exchange email forwarding](/how-to/set-up-microsoft-exchange-email-forwarding/).

### Prerequisites

- **Applies to:** User and Administrator

- **Difficulty:** Easy

- **Time needed:** Approximately 5 minutes to set forward / Additional 15 minutes for forward to function

- **Tools required:** apps.rackspace.com access for Users / Cloud Office Control Panel for Administrators

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).


### Set up forwarding in webmail

Use these steps to forward email from your Rackspace Email address to another address using webmail.

1. Log into the mailbox you wish to forward at [apps.rackspace.com](https://apps.rackspace.com/index.php)

2. Click your username in the upper right-hand corner then select **Settings** from the drop down menu.

3. A settings box will appear. Select the **Incoming Email** tab on the left hand side of this box.

4. To the right, select the **Forwarding** tab.

5. For **Status:** select the **On** option.

6. Check the box next to **Save a copy of forwarded email**

    Warning: If **Save a copy of forwarded email** is not checked, this mailbox WILL NOT store any messages sent to it.

7. Enter the email address you would like to forward email to in the **Forward to** field.

<!--- add screen shot file ForwardRSEWebmailSC2.png--->

8. Click **Save** in the lower right-hand corner of the setting box.

Note: Allow at least 15 minutes for the forward to be fully enabled after setting it up. If you are unable to set up a forward using this method please contact your administrator.

### Set up forwarding for Rackspace Email using the Cloud Office Control Panel

Note: These steps apply to Administrators with access to their account's Control Panel.

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2. Select **Mailboxes** within the **Rackspace Email** section.
<!--- add screen shot file ForwardRSEcontrolpanelSC1.png--->
3. If you have multiple domains, select the domain that contains the mailbox you would like to forward.

4.  From the mailbox list, click the blue highlighted mailbox name that you would like to forward.
<!--- add screen shot file ForwardRSEcontrolpanelSC2.png--->

5. Select the **Forwarding/Auto-Reply** tab.

6. Check the box for **Forward email to**
    - In the blank box under **Forward email to** type in the email address you would like to forward email to.
    - Check the box for **Save copies of forwarded email**
    <!--- add screen shot file ForwardRSEcontrolpanelSC3.png--->

    Warning: If **Save a copy of forwarded email** is not checked, this mailbox WILL NOT store any messages sent to it.

7. Click **Submit** in the lower left-hand corner.

Note: Allow at least 15 minutes for the forward to be fully enabled after setting it up.

### References

[Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")

[Cloud Office support terminology](/how-to/cloud-office-support-terminology)

[Cloud Office Email Portal](https://apps.rackspace.com/index.php)

[Set up Microsoft Exchange email forwarding](/how-to/set-up-microsoft-exchange-email-forwarding/).
