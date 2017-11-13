---
permalink: enable-or-disable-administrator-two-factor-authentication/
audit_date:
title: Enable or disable administrator two factor authentication
type: article
created_date: '2017-10-02'
created_by: William Loy
last_modified_date: '2017-10-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to enable two-factor authentication for Cloud Office control panel administrators.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time Needed:** Approximately 10 minutes
- **Tools Needed:** Administrators need access to their Cloud Office Control Panel, 
  their mobile device, and a two-factor authentication application that supports "time-based one-time password" technology

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

In the role of administrator of your company's email solution, your administrator access gives you a great deal of control over your account. If your administrator access is compromised, the results can be devastating to your business. A strong security policy is not complete without enabling two-factor authentication.


### Enable two factor authentication for your own admin ID

1. Log into your [Cloud Office control panel](cp.rackspace.com).

2. Click your username and account number in the upper-right corner to expand the menu. Example: **adminusername(acct#)**

3. From the menu, select **Enable Two-Factor Auth**.

    <img src="{% asset_path rackspace-email/enable-or-disable-administrator-two-factor-authentication/two_factor_dropdown.png %}"/>

4. The set a of instructions titled **Enable Two-Factor Authentication** are displayed.

    <img src="{% asset_path rackspace-email/enable-or-disable-administrator-two-factor-authentication/qr_code.png %}"/>

5. When you have completed the instructions, click **Enable**.

You have successfully enabled two-factor authentication for your admin ID.

**Note:** When you change mobile devices, you will need to [Disable two factor authentication](#disable-two-factor-authentication-for-other-administrators) and re-enable it on the new device.

### Log into the control panel with two-factor authentication

1. Navigate to [cp.rackspace.com](cp.rackspace.com).

2. Enter your **Admin ID** and **Password** as you normally would.

3. When prompted for the **Two-Factor Verification Code**, produce this verification code by using the desktop or mobile two-factor authentication application that you installed when enabling two-factor authentication. Enter this code into the **Two-Factor Verification Code** field.

You have successfully logged in using two-factor authentication.

### Disable two factor authentication for other administrators

You might need to perform these steps if an administrator gets a new device without first disabling two-factor authentication.

1. Log into the [Cloud Office control panel](cp.rackspace.com).
2. Click your username and account number in the upper right hand corner to expand the menu. Example: **adminusername(acct#)**
3. From the menu, select **Admins & Contacts**.
4. Click the blue username of the admin for whom you need to disable two-factor authentication.
5. Expand the **Security Settings** section.
6. Uncheck **Use Two-Factor Authentication**.
7. Click **Save**.

You have successfully disabled two-factor authentication for another admin.
