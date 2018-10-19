---
permalink: microsoft-account-association-issues/
audit_date: '2018-10-19'
title: Microsoft account association issues
type: article
created_date: '2018-10-19'
created_by: Walter Stubbs
last_modified_date: '2018-10-19'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article discusses diagnosing issues caused by Microsoft account conflicts when trying to connect to your email through Outlook.


#### Prerequisites

- **Applies to:** Both User and Admin
- **Difficulty:** Easy
- **Time needed:** 15 Minutes
- **Tools required:** Web browser

#### Symptoms of Microsoft account conflicts

- Password prompts when opening Outlook
- "Cannot start Microsoft Office Outlook. Cannot open the Outlook Window"
- "Your mailbox has been temporarily moved to Microsoft Exchange server"
- Bounce Messages received and showing sent out as outlook_******@outlook.com
- Users who have Full Access to other mailboxes getting password prompts.
- Autodiscover resolves to \<https://Outlook.office365.com/autodiscover/autodiscover.xml\> first

In these cases, Outlook is attempting to redirect to Microsoft's own Office 365 servers due to the user's email address being associated to a Microsoft account. To correct this, you must remove the association between the Rackspace email or Hosted Exchange address and the Microsoft account.

#### Verifying the email address is associated with a Microsoft Account

To verify if this could be affecting your email account, navigate to https://login.live.com/ type in the affected email address and click next. If you receive the warning stating, "That Microsoft account doesn't exist. Enter a different account or get a new one", then the email address is not associated to a Microsoft account. If you are prompted to enter your password, this means that your email address is set as the primary alias for your Microsoft account and you need to follow these instructions to remedy the issue.

#### Removing the association

1.  Sign in to [https://login.live.com/](https://login.live.com/) with your Microsoft account.

  - If the user is uncertain of their Microsoft Account password there is a forgot password option listed on the sign in page.

  **Warning:** If you opt for the forgot password option, **DO NOT** select the option in the password reset email that says **“click here to remove your email address from that account”**.

2.  Select **Your info** from the ribbon near the upper left-hand corner of the page.

3.  Select **Manage your sign-in email or phone number**.

4. You may be asked to verify your identity by email or text. Select the preferred method and proceed with verification.

5.  Locate the affected email address under the **Account alias** section.

6.  If the affected email address is the only one listed, select **Add email** and proceed with adding a personal email address so that you can still sign in to your Microsoft account later if needed.

7.  Once you have added a personal email address to the account, select **Make Primary** to set it as your primary alias.

  - You will be asked to verify ownership of the new alias. Proceed with sending the address an ownership verification email.

8.  Once you have successfully changed the primary alias, select **Remove** next to the affected email address to remove it from your Microsoft account.

Once your email address is no longer associated with your Microsoft account, restart your device and open Outlook.

#### Additional Information

If you would like to read more information on how Outlook 2016 implements Autodiscover, you can refer to the following Microsoft Article: [https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover](https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover)
Using this article as a reference, the Microsoft account association is causing Autodiscover to resolve to Step 4. In order to connect to the Hosted Exchange server, Autodiscover must resolve to Step 9, where it will be redirected by the Autodiscover CNAME Record in your DNS.
