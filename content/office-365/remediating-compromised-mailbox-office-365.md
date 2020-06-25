---
permalink: remediating-compromised-mailbox-office-365/
audit_date: '2020-06-25'
title: How to remediate a compromised user account and mailbox in Office 365
type: article
created_date: '2020-01-08'
created_by: Simon Ponder
last_modified_date: '2020-01-08'
last_modified_by: Walter Stubbs
product: Office 365
product_url: office-365
---

This article describes how to remediate a compromised user account and mailbox in Office 365&reg;.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time Needed:** Approximately 1 hour
- **Tools Needed:** Administrators need Global Administrator permissions to the Office 365.

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

If an attacker has gained access to a user's account credentials, they can sign in as that user and perform actions as that user. The attacker has full access to the user's Office 365 Mailbox, SharePoint&reg; and OneDrive&reg;. Attackers might send emails as the user. Securing a compromised account is essential to prevent further issues from arising.

### Diagnosing a compromised mailbox

The following symptoms may indicate that a user account or mailbox is compromised:

**NOTE:** This is not a definitive list of symptoms. Compromised users may experience symptoms not included in this list, or may not experience any symptoms at all.

  - Missing or deleted emails.
  - Reports of people receiving email from the user that the user does not recall sending.
  - Reports of people receiving email from the user without the corresponding message being in the Sent Items folder.
  - Inbox rules that were not created by the user. These rules typically forward emails externally or move them to the Notes,   Junk Email, RSS Subscription folders, or the Deleted Items folder.
  - Changes to the user's Display Name or other contact information.
  - Mailbox blocked from sending email.
  - User receives the following Non-Delivery Report (NDR) when trying to send out email:
    `Your message couldn't be delivered because you weren't recognized as a valid sender. The most common reason for this is  that your email address is suspected of sending spam and it's no longer allowed to send email. Contact your email admin for assistance. Remote Server returned '550 5.1.8 Access denied, bad outbound sender.'`

### Secure a compromised account

Use the following steps to secure a compromised user account:

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left menu, select **Office 365 Admin Center**.

3.  In the Active Users section, select the impacted user and click the circle icon with the slash through it under the user's name at the top. The alternate text for the icon should read **Block this user?**.

4.  Click the checkbox the left of **Block this user from signing in**, then select **Save changes**.

5.  Select the back arrow in the upper left-hand corner of this window to go back to the user information screen.

6.  Select the **OneDrive** tab, then the **Initiate sign-out** link under the **Sign-out** section.

7.  Select the key icon under the user's name, then select the options that you prefer, then click **Reset**.

8.  Uncheck the box to the left of **Send password in email**. If you selected to auto-generate a password, be sure to copy down the sign-in information on the next screen.

**NOTE:** Do not send the password in an email to the user. They might have other accounts, including personal email accounts, that are compromised which could provide the attacker with access to the account again.

### Remove email forwarding and malicious inbox rules

Use the following steps to remove any email forwarding and inbox rules from the user's mailbox:

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left menu, select **Office 365 Admin Center**.

3.  In the Active Users section, select the impacted user and click the **Mail** tab.

4.  Under the **Email forwarding** section, click **Manage email forwarding**.

5.  If **Forward all emails sent to this mailbox** is checked, uncheck the box and then select **Save changes**.

**NOTE:** If forwarding is enabled and you can verify that the forwarding is not malicious, you can skip Step 5.

6.  Exit the user info screen by selecting the **X** in the upper right-hand part of the screen, then open the Exchange Admin Center by selecting **Exchange** under the Admin centers section of the menu.

7.  In the upper right-hand corner of the Exchange Admin Center, select your user icon, then select **Another user...**

8.  Search for and select the affected user, then click **OK**.

9.  Verify at the top of the window that you are working on behalf of the compromised user, then select **organize email** from the left menu.

10.  On the **inbox rules** screen, audit the list of inbox rules. If there are any suspicious rules, you can either uncheck them to turn them off so they can be reviewed later, or delete them using the trashcan icon.

**NOTE:** Administrators are unable to review the inbox Sweep Rules through this screen. We recommend you or your user log in to their mailbox using the [Outlook Web App](https://outlook.office.com)&reg; and audit the Sweep Rules in their mailbox.

### Unblock the user from sending email

Often when a user is compromised, the compromised account is used to send spam, which can get an account flagged by Microsoft's Anti-Abuse system and placed in the restricted users section to prevent them from sending email. Use the following steps to release the user from the restricted users section of the Security & Compliance center:

1.	Visit [https://protection.office.com/#/restrictedusers](https://protection.office.com/#/restrictedusers) and sign in with your Global Admin credentials.

2.	This page lists users that are currently restricted from sending by Microsoft. Find the user you are working on and select **Unblock**.

3.  A panel appears detailing the user that was restricted and recommended actions to take. Click **Next** when done.

4.  Click **Yes** to confirm the change.

**NOTE:** It may take 30 minutes to an hour before restrictions are removed.

### Additional information

Having a compromised user can negatively impact your business. To reduce the risk of an account compromise, consider enforcing strong password policies and enabling [multi-factor authentication for users in Office 365](/how-to/manage-multi-factor-authentication-for-users-in-office-365/).
