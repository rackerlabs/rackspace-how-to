---
permalink: enable-or-disable-two-factor-authentication-for-administrators/
audit_date: '2019-03-04'
title: Enable or disable two-factor authentication for administrators
type: article
created_date: '2017-10-02'
created_by: William Loy
last_modified_date: '2019-03-12'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article describes how to enable two-factor authentication for Cloud Office Control Panel administrators.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time Needed:** Approximately 5 minutes
- **Tools Needed:** Administrators need access to their Cloud Office Control Panel

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

As an administrator of your company's email solution, you have a great deal of control over your account. If your administrator access is compromised, the results can be devastating to your business. A strong security policy is not complete without enabling two-factor authentication.

### Multifactor authentication options

The Cloud Office Control Panel provides two options for enabling multifactor authentication when you first log in. Upon login you are presented the option to set up multifactor authentication. You can proceed with this option or skip it.

#### Use text message multifactor authentication

With text message multifactor authentication, you can use your phone number to receive a one-time code that allows you access to the control panel.

Use the following steps to enable text message multifactor authentication:

1. Log in to your [Cloud Office Control Panel](https://cp.rackspace.com).

2. When you are prompted with a screen titled **Choose Your Multi-Factor Authentication Method**, select **Get A Text Message**.

3. Enter the phone number that you want to link the multifactor SMS messaging with.

4. AFter a verification code has been sent to your phone, enter the code in the verification field and click **Verify Code**.

5. The last step displays the following message: **You have successfully set up Multi-Factor Authentication!**


#### Use a multifactor authentication mobile application

Use the following steps to enable a mobile multifactor authentication application:

1. Log in to your [Cloud Office Control Panel](https://cp.rackspace.com).

2. When you are prompted with a screen titled **Choose Your Multi-Factor Authentication Method**, select **Use a Mobile App**.

3. Link your mobile device to your adminstrator account by using the following the instructions in the prompt:

    <img src="{% asset_path rackspace-email/enable-or-disable-two-factor-authentication-for-administrators/mobile_app.png %}" />

4. The last step displays the following message: **You have successfully set up Multi-Factor Authentication!**


### Require two-factor authentication for an administrator

1. Log in to your [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click your username and account number, for example **adminusername (acct#)**, in the upper-right corner to expand the menu.

3. From the menu, select **Admins & Contacts**.

4. Click the username for the administrator that you are going to require to use two-factor authentication.

5. Expand the section labeled **Security Settings**.

6. Check the box next to **Require Multi-Factor Authentication**.

This administrator is now required to set up multifactor authentication upon their next login to [Cloud Office Control Panel](https://cp.rackspace.com)). They have the option to [Use text message multifactor authentication](#use-text-message-multifactor-authentication) or [Use a multifactor authentication mobile application](#use-a-multifactor-authentication-mobile-application).


**Note:** When you change mobile devices, you will need to [disable two-factor authentication](#disable-two-factor-authentication-for-other-administrators) and re-enable it on the new device.

### Log in to the control panel with two-factor authentication

1. Navigate to [Cloud Office Control Panel](https://cp.rackspace.com).

2. Enter your **Admin ID** and **Password**.

3. When prompted for the **Two-Factor Verification Code**, use the desktop or mobile two-factor authentication application that you already installed to produce a verification code. Enter this code into the **Two-Factor Verification Code** field.

You have successfully logged in using two-factor authentication.

### Disable two-factor authentication for other administrators

You might need to perform these steps if an administrator gets a new device without first disabling two-factor authentication.

1. Log in to your [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click your username and account number, for example **adminusername (acct#)**, in the upper-right corner to expand the menu.

3. From the menu, select **Admins & Contacts**.

4. Click the username for the administrator that you are going to require to use two-factor authentication.

5. Expand the section labeled **Security Settings**.

6. Uncheck the box next to **Require Multi-Factor Authentication**.

7. Click **Save**.

You have successfully disabled two-factor authentication for another adminstrator.


### Manage multifactor authentication linked devices

You have the option to trust devices when using multifactor authentication. This option is to trust a device is presented to you the first time you set up multifactor authentication on that device.

Use the following instructions to edit your trusted devices:

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).
2. Click your username and account number, for example **adminusername(acct#)**, in the upper right-hand corner to expand the menu.
3. From the menu, select **My Profile**.
4. Select **Trusted Devices**.

    - You are presented with a list of trusted devices associated with your administrator account. Here you can choose to remove devices that you do not recognize or no longer use.

5. Click **Edit Trusted Devices**. You can now click the trash icon to the right of the device you want to remove and then click **Save**.
