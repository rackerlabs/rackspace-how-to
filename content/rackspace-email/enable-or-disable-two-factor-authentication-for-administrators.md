---
permalink: enable-or-disable-two-factor-authentication-for-administrators/
audit_date: '2019-02-27'
title: Enable or disable two-factor authentication for administrators
type: article
created_date: '2017-10-02'
created_by: William Loy
last_modified_date: '2019-02-27'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to enable two-factor authentication for Cloud Office Control Panel administrators.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time Needed:** Approximately 10 minutes
- **Tools Needed:** Administrators need access to their Cloud Office Control Panel

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

As an administrator of your company's email solution, you have a great deal of control over your account. If your administrator access is compromised, the results can be devastating to your business. A strong security policy is not complete without enabling two-factor authentication.

### Multi-factor authentication options

The Cloud Office Control Panel provides two options for enabling multi-factor authentication when you first log in. Upon login you are presented the option to opt-in to setting up multi-factor authentication. You can proceed with setting up multi-factor authentication or skip this option.

#### Short Message Service (SMS)

With SMS two factor authentication you can use your phone number to receive a one time code that allows you access to the control panel.

Use the following steps to enable SMS two factor authentication:

1. When you are prompted with a screen titled **Choose Your Multi-Factor Authentication Method** select the option **Get A Text Message**.

2. Enter the phone number that you would like to link the multi-factor SMS messaging with.

3. Once a verification code has been sent to your phone, enter the code in the verification field and click **Verify Code**.

4. The last step displays the message **You have successfully set up Multi-Factor Authentication!**.


#### App option


### Enable two factor authentication for your own admin ID

1. Log in to your [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click your username and account number, for example **adminusername (acct#)**, in the upper-right corner to expand the menu.

3. From the menu, select **Enable Two-Factor Auth**.

    <img src="{% asset_path rackspace-email/enable-or-disable-administrator-two-factor-authentication/two_factor_dropdown.png %}"/>

4. A set of instructions titled **Enable Two-Factor Authentication** are displayed.

    <img src="{% asset_path rackspace-email/enable-or-disable-administrator-two-factor-authentication/qr_code.png %}"/>

5. When you have completed the instructions, enter your verification code and click **Enable**.

You have successfully enabled two-factor authentication for your admin ID.

**Note:** When you change mobile devices, you will need to [Disable two factor authentication](#disable-two-factor-authentication-for-other-administrators) and re-enable it on the new device.

### Log in to the control panel with two-factor authentication

1. Navigate to [cp.rackspace.com](https://cp.rackspace.com).

2. Enter your **Admin ID** and **Password** as you normally would.

3. When prompted for the **Two-Factor Verification Code**, use the desktop or mobile two-factor authentication application that you installed when enabling two-factor authentication to produce a verification code. Enter this code into the **Two-Factor Verification Code** field.

You have successfully logged in using two-factor authentication.

### Disable two-factor authentication for other administrators

You might need to perform these steps if an administrator gets a new device without first disabling two-factor authentication.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).
2. Click your username and account number, for example **adminusername(acct#)**, in the upper right hand corner to expand the menu.
3. From the menu, select **Admins & Contacts**.
4. Click the blue username of the admin for whom you need to disable two-factor authentication.
5. Expand the **Security Settings** section.
6. Uncheck **Use Two-Factor Authentication**.
7. Click **Save**.

You have successfully disabled two-factor authentication for another admin.


### Manage multi-factor authentication linked devices

You have the option to trust devices when using multi-factor authentication. This option to trust a device is presented to you the first time you setup multi-factor authentication on that device.

Use the following instructions to edit your trusted devices:

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).
2. Click your username and account number, for example **adminusername(acct#)**, in the upper right hand corner to expand the menu.
3. From the menu, select **My Profile**.
4. Select **Trusted Devices**.

    - You are presented with a list of trusted devices associated with your administrator account. Here you can choose to remove devices that you do not recognize or no longer use.

5. Click **Edit Trusted Devices**. You can now click the trash icon to the right of the device you would like to remove and then click **Save**.
