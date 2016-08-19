---
permalink: multi-factor-authentication-from-the-myrackspace-control-panel/
audit_date:
title: Multi-factor authentication from the MyRackspace Control Panel
type: article
created_date: '2014-07-17'
created_by: Margaret Eker
last_modified_date: '2016-08-18'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Customers can increase security on MyRackspace accounts by using the
multi-factor authentication capabilities provided by the Rackspace Cloud
Identity service. Multi-factor authentication adds an extra layer of
identity verification to the log in process by requiring a user to
submit a time-sensitive passcode that the Identity service sends to an
SMS or OTP (one-time password) device associated with the user's
account:

-   An SMS device is a mobile phone, notebook, or other digital device
    with an associated phone number that is capable of receiving SMS
    text messages.

-   An OTP device is created in an OTP client application installed on
    your phone, notebook, or other digital device.

You can add multi-factor authentication by updating your account
settings in the [MyRackspace portal](https://my.rackspace.com). After you pair a device with your account, authentication becomes a two-step process:

1.  Each time you log in, the Rackspace authentication service generates
    a passcode and sends it to the associated device.

2.  After the passcode is sent, the system prompts you to type the
    passcode and submit it to the Identity service to complete the
    authentication process.

    **Note:** Standard text message rates and data fees apply based on
    your contract with your mobile device provider.

Additionally, MyRackspace account administrators can configure account-wide settings to specify a multi-factor authentication policy for all account users. By default, account users have the option to set up and use multi-factor authentication. Administrators can update the account-wide settings to require multi-factor authentication for all users. When this setting is enabled, users can't access their account until they configure multi-factor authentication. Current users are logged out as soon as the account-wide requirement is applied. At the next login, users are notified of the increased security and prompted to complete the setup process.

**Notes**

-  You cannot configure multi-factor authentication for the Cloud Control   
   Panel inside of MyRackspace. You must login to mycloud.rackspace.com and use these [instructions](https://support.rackspace.com/how-to/multi-factor-authentication-from-the-cloud-control-panel/) to setup your users for the Cloud CP.

-  Administrators cannot setup devices for their users. Each user must
   configure their own device. To modify a user’s multi-factor settings, they must log into MyRackspace with the user credentials you wish to modify.

### Configure your account to authenticate by using an SMS device

To configure you account to use an SMS device for multi-factor
authentication, you need the phone number associated with your digital
device. The device must be enabled to receive SMS text messages.

**Register and verify an SMS device**

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/).

2.  Click **Account** and then, select **User List** from the menu.

3.  At the top of the page, click **My Multi-Factor Devices**.

4.  In the **Multi-factor authentication** field, click **Add**.

5.  In the Step 1 of 2: Register SMS Device pop-up dialog box, select the
    country code for the device, and then type the device phone number. Then click **Add SMS Device.**

    The identity service sends an SMS text message with a four digit PIN to the specified number.

6.  In the Step 2 of 2: Verify PIN pop-up dialog box in the portal, type the  
    PIN sent to the device in the verification code field. Then, click
    **Verify SMS Device**.

    After you submit the verification code, the MyRAckspace login page is displayed so that you can re-authenticate by using the multi-factor authentication process.

### Configure your account to authenticate by using an OTP device

To configure your account to use an OTP device for multi-factor
authentication, you must have one of the following OTP client
applications installed on your device: [Authy](https://www.authy.com/),
[Duo](https://www.duosecurity.com/),
[Google Authenticator](https://support.google.com/accounts/answer/1066447?hl=en),
or [SecureAuth OTP](https://www.secureauth.com/Support/Downloads/Client-Applications.aspx).

**To register and verify an OTP device**

1.  Log in to the [Rackspace portal](https://my.rackspace.com/ "MyRAckspace portal").

2.  Click **Account** and then, select **User List** from the menu.

3.  At the top of the page, click **My Multi-Factor Devices**.

4.  In the **Multi-factor Authentication Mobile Passcode** field, click
    **Add**.

5.  In the Step 1 of 2: Name of your Device pop-up dialog box, type a  
    nickname for the OTP device. Then, click **Add Device.**

    The Identity service generates a barcode that you can use to link your MyRackspace account with an OTP device.

6. To pair your account with your device, use the OTP client application on
   your device to scan the barcode in the Step 1 of 2: Verify Code pop-up dialog box.

   The OTP application on your device creates the OTP device by using the device name that you specified. It also generates a passcode.

7.  To verify the new device, enter the passcode in the Step 1 of 2: Verify
    Code pop-up dialog box.

    **Note:** When you add an OTP device, it is the default method for authentication. If you do not want it to be the default method or if you do not want to be logged out of your account when you verify the passcode, clear the **Make this my default authentication method** check box.

    You can update the default authentication method on the **My Multi-Factor Devices page**.

8.  Click **Verify Mobile Passcode**.

    After you submit the verification code, you are automatically logged out.

9.  On the MyRackspace login page, enter your username and password. Then,
    enter the verification code from the OTP device that you paired with
    your account.

### Change the default multi-factor authentication method

If your account has been configured with both SMS and OTP devices, you
can select the default multi-factor authentication method from the
**My Multi-Factor Devices** page.

1.  Log in to the [MyRackspace Portal](https://my.rackspace.com/).

2.  Click **Account**, and then select **User List** from the menu.

3.  At the top of the page, click **My Multi-Factor Devices**.

4.  In the Multi-Factor Authentication section, review the default
    authentication method setting and click **Edit** to change it.

5.  In the pop-up dialog box, select the default method that you want and then
    click **Save**.

    <img src="{% asset_path cloud-sites/multi-factor-authentication-myrackspace-control-panel/default-authentication-method.png %}" alt="Change default authentication method." />

### Configure account-wide multi-factor authentication settings from an Administrator account

Account administrators can update MyRackspace account-wide settings to require all users to authenticate by using multi-factor authentication. When this setting is enabled, users can't access their accounts until they add and verify a device on their account.

**To configure account-wide settings for multi-factor authentication**

1.  Log in to the [MyRackspace Control Panel](https://my.rackspace.com/ "MyRackspace Control Panel").

2.  Click **Account** and then, select **User List** from the menu.

3.  At the top of the page, click **My Multi-Factor Devices**.

4.  Click the pencil icon to edit the **Require multi-factor authentication**
    setting.

5.  On the Account-wide two-factor authentication form, click the
    selection to set the policy for account users. Then, click **Save
    Setting** to apply the change.

    If you update the setting to required, users who do not have
    multi-factor authentication configured must add it the next time
    they log in. Current users who have not set up multi-factor
    authentication are logged out after seeing an error message like the
    following one:

    <img src="{% asset_path cloud-sites/multi-factor-authentication-myrackspace-control-panel/set-account-user-policy.png %}" %}" alt="Set account user policy." />

    When these users log back in, they are guided through the
    multi-factor authentication set up.

### Configure multi-factor authentication during account log in

If your account is not configured for multi-factor authentication when
it is required, you are notified about the increase in security
requirements and prompted to set up authentication.

To access your account, click **Set Up Multi-Factor Authentication.**
Then, follow the steps to register and verify a
device, and authenticate by using the passcode sent to the device.

### Log in to the MyRackspace by using multi-factor authentication

If you add multi-factor authentication capabilities to your account,
authentication is a two-step process.

**Prerequisites**

-   MyRackspace accounts with valid user name and password credentials
-   Access to the registered and verified SMS or OTP device paired with
    your MyRackspace account

To log in to the MyRackspace portal with multi-factor authentication

1. Log in to the [MyRackspace portal](https://my.rackspace.com/) with
   your user name and password.

   -  If your account is configured to use multi-factor authentication with
      an SMS device, the Rackspace Cloud Identity service sends an SMS
      text message with a 7-digit passcode to the device registered to
      your account.

   -  If your device is configured to use multi-factor authentication by
      OTP device, open the OTP client application and get the passcode
      from the OTP device associated with your Rackspace Cloud account.

2. When prompted, type the passcode in the **Passcode** field on the
   login page. Then, click **Verify Code** to log in to your account.

   If the passcode is expired or invalid, refresh the page to return to
   the Rackspace Cloud Control Panel login page. Then, log in again and
   click the Resend code option on the Account Settings page to get a
   new passcode.

### Manage multi-factor authentication

MyRackspace users can view and manage the multi-factor authentication configuration from the Account Settings menu in the **Account** > **My Multi-Factor Devices** menu in the MyRackspace portal.

+**To verify your device**

You can verify your SMS or OTP device from the **My Multi-Factor Devices** page.

-   If you have an SMS device on your account that has not been verified, use  
    the **Verify** option to complete the verification process.

-   If you have an OTP device that has not been verified, use the **Manage**
    option to complete the verification process.

**To recover an account**

You can generate up to 10 bypass codes that you can use to authenticate
if the device associated with your account is not available. You save
the generated codes to a file on your computer for future use.

**Important:** To avoid losing access to your account, generate and save
the bypass codes as soon as you enable multi-factor authentication.

1. In the **MyMulti-FActor Devices** page, click **Generate Recovery Codes**.

2. In the Quantity field, select the number of codes to generate or
   accept the default value.

3. Click **Generate Codes**.

4. Manually copy the recovery codes to a text file, or click **save your codes** to generate a text file with the codes.

**To remove multi-factor authentication**

You can turn off multi-factor authentication and remove all devices
associated with your account.

On the **My Multi-Factor Devices** page, click **Remove all devices**.

**To change the mobile phone number**

To change the mobile phone number paired with your account, use the
Remove option to remove the existing phone number (for instructions, see
the preceding task).  Then, update the account settings with the new
phone number and verify the device.

**To remove an SMS or OTP device**

To remove an SMS device, use the **Remove all devices** option. To remove an OTP device, use the **Manage** option to delete the device from your account


### Troubleshooting

Use the following information to resolve common issues that can occur
when configuring and using multi-factor authentication.

| **Issue** | **Resolution** |
| --- | --- |
|
#### **Invalid phone number**
| If you get an error message when registering a phone number, verify that you have entered the correct country code and a valid phone number with no extra characters or spaces. |
|
#### **Invalid PIN when verifying device**
 | When you try to verify a mobile device, you might receive an error caused by an invalid PIN. Confirm that you are entering the correct four-digit PIN that you received via SMS text message. Ensure that you are using the mobile device that is paired with the MyRackspace account. |
|
#### **Locked account**
 | If you enter an incorrect passcode more than six times during the multi-factor authentication process, your account will be locked. Contact Rackspace Support to restore access to a locked account. |
|
#### **Can't link cloud account in MyRackspace with multi-factor enabled**
 | If you are using MyRackspace, you can't link to an existing Rackspace Cloud account that has been enabled for multi-factor authentication. |
|
#### **Account recovery**
 | If your account is configured for multi-factor authentication, and you do not have access to your device or your generated account recovery codes, contact Rackspace Support. |
