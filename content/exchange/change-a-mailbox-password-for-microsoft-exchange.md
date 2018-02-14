---
permalink: change-a-microsoft-exchange-mailbox-password/
audit_date:
title: Change a Microsoft Exchange mailbox password
type: article
created_date: '2017-06-08'
created_by: William Loy
last_modified_date: '2017-11-29'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article describes how to change the password for a Hosted Microsoft Exchange mailbox. Users can change their own password through the User Control Panel, and administrators can change the password for a user through the Cloud Office Control Panel.

### Prerequisites

- **Applies to**: User and administrator
- **Difficulty**: Moderate
- **Time needed**: Approximately 10 minutes
- **Tools required**: Users need their current mailbox password; administrators need Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology/#cloud-office-terminology).

### Change your password through the User Control Panel

If you prefer a video tutorial, see [Password Resets: Hosted Exchange](https://emailhelp.rackspace.com/l/password-reset-user).

1. Log in to the [User Control Panel](https://cp.rackspace.com/usercp/Login) with your email address and current password.

   **Note:** If you are unable to log in, attempt to log in at [apps.rackspace.com](https://apps.rackspace.com/index.php). If you cannot log in to either site, you must contact your administrator to have your password reset.

2. Under **Change Password**, enter your current password, your new password, and your new password again to confirm.

   **Note:** We recommend that you create a password that you have never used before and that remains unique from all your other passwords. Review [Password Management and Best Practices](/how-to/password-management-and-best-practices) for guidance on password creation.

   <img src="{% asset_path exchange/change-a-mailbox-password-for-microsoft-exchange/UserpasswordResetCPSC2.png %}" />

3. Click **Change**.

**Warning:** After you change the password, you must update the password on all devices that connect to this mailbox. If you do not update the password on *every* device, the mailbox locks itself and you must contact your administrator to unlock it. Provide your administrator the ["Recover a locked mailbox""](#recover-a-locked-mailbox) instructions at the end of this article.

### Reset a password through the Cloud Office Control Panel

**Note:** Only administrators have access to the Cloud Office Control Panel.

If you prefer a video tutorial, please see [Password Resets: Hosted Exchange <img src="{% asset_path exchange/change-a-mailbox-password-for-microsoft-exchange/reset_user_password_thumb.png %}" />](https://emailhelp.rackspace.com/l/password-reset-user).

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).

2. In the **Microsoft Exchange** section, click **Mailboxes**.

3. In the mailbox list, click the mailbox name for which you want to change the password.

   <img src="{% asset_path exchange/change-a-mailbox-password-for-microsoft-exchange/CPpasswordResetSC2.png %}" />

4. Under **User Details**, enter the following information:

   - **Password:** Enter a new password.
   - **Confirm:** Enter the new password again.

    **Note**: We recommend that you create a password that you have never used before and that remains unique from all your other passwords. Also, longer passwords provide better security for your account.

5. Click **Save**.

   <img src="{% asset_path exchange/change-a-mailbox-password-for-microsoft-exchange/CPpasswordResetSC3.png %}" />

**Warning:** After the password has been changed, the user must update the password on all devices that connect to this mailbox. If the password is not updated on *every* device, the mailbox will lock itself and users cannot access their email.

### Recover a locked mailbox

If a user's mailbox is locked, the admin and user can follow these steps to unlock it.

1. *(User)* Identify every device that connects to the locked mailbox.

2. *(User)* Remove the mailbox password from all of the devices, including mobile devices. Do *not* re-enter the password yet.

3. *(Admin)* Log in to the [Cloud Office Control Panel](https://cp.rackspace.com) and unlock the user's mailbox.

4. *(User)* Log in at [apps.rackspace.com](https://apps.rackspace.com/index.php). If you cannot log in, the admin must reset your password as outlined in the previous section.

5. *(User)* After you have successfully logged into [apps.rackspace.com](https://apps.rackspace.com/index.php), manually enter your email address and password into each device that connects to the mailbox, one at a time.
