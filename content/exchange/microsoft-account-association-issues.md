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

This article discusses diagnosing issues caused by Microsoft&reg; account conflicts when you try to connect to your email through Outlook&reg;.


### Prerequisites

- **Applies to:** Both User and Administrator
- **Difficulty:** Easy
- **Time needed:** 15 Minutes
- **Tools required:** Web browser

### Symptoms of Microsoft account conflicts

The following issues are indications of Microsoft account conflicts:

- A password prompt appears when you open Outlook
- You receive the message **"Cannot start Microsoft Office Outlook. Cannot open the Outlook Window."**
- You receive the message **"Your mailbox has been temporarily moved to Microsoft Exchange server."**
- You receive bounce messages that were sent out as **outlook_******@outlook.com**
- Users who have full access to other mailboxes are prompted for a password
- Autodiscover resolves to **https://Outlook.office365.com/autodiscover/autodiscover.xml** first

In these cases, Outlook is attempting to redirect to Microsoft's own Office 365&reg; servers, due to the user's email address being associated to a Microsoft account. To correct this situation, you must remove the association between the Rackspace email or Hosted Exchange address and the Microsoft account.

### Verify that the email address is associated with a Microsoft account

To verify that the email address is associated with a Microsoft account, navigate to <https://login.live.com/>, type in the affected email address, and click **Next**. If you receive the warning stating "That Microsoft account doesn't exist. Enter a different account or get a new one.", then the email address is not associated to a Microsoft account. If you are prompted to enter your password, your email address is set as the primary alias for your Microsoft account, and you need to follow the instructions in the next section to remedy the issue.

### Remove the association

1. Sign in to <https://login.live.com/> with your Microsoft account.

   If you are uncertain of your Microsoft account password, you should use the **Forgot password** option that appears on the sign-in page.

   **Warning:** If you use the **Forgot password** option, do *not* select **"Click here to remove your email address from that account"** in the password reset email.

2. Select **Your info** from the ribbon near the upper-left corner of the page.

3. Select **Manage your sign-in email or phone number**.

4. You might be asked to verify your identity by email or text. Select the preferred method and proceed with verification.

5. Locate the affected email address under the **Account alias** section.

6. If the affected email address is the only one listed, select **Add email** and proceed with adding a personal email address so that you can still sign in to your Microsoft account later if needed.

7. After you have added a personal email address to the account, select **Make Primary** to set it as your primary alias.

   You are asked to verify ownership of the new alias. Proceed with sending the address an ownership verification email.

8. After you have successfully changed the primary alias, select **Remove** next to the affected email address to remove it from your Microsoft account.

After your email address is no longer associated with your Microsoft account, restart your device and open Outlook.

### Additional information

Microsoft also provides detailed instructions about how to change the primary alias for a Microsoft account in [Rename your personal account](https://support.microsoft.com/en-us/help/11545/microsoft-account-rename-your-personal-account).

For more information about how Outlook 2016 implements Autodiscover, see [Outlook 2016 Implementation of Autodiscover](https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover).

By using the steps in this article as a reference, the Microsoft account association causes Autodiscover to resolve to Step 4, **Check for O365 as Priority**. In order to connect to the Hosted Exchange server, Autodiscover must resolve to Step 9, **Check for Http redirects**, where it is redirected by the Autodiscover CNAME record in your Domain Name System (DNS).
