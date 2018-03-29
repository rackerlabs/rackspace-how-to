---
permalink: multi-factor-authentication-from-the-myrackspace-portal/
audit_date: '2018-03-29'
title: Multi-factor authentication from the MyRackspace portal
type: article
created_date: '2014-07-17'
created_by: Margaret Eker
last_modified_date: '2018-03-29'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Customers can increase security on MyRackspace accounts by using the
multi-factor authentication capabilities provided by the Rackspace Cloud
Identity service. Multi-factor authentication adds an extra layer of
identity verification to the log in process by requiring a user to
submit a time-sensitive passcode that the Identity service sends to an
SMS or mobile passcode device associated with the user's
account:

-   An SMS device is a mobile phone, notebook, or other digital device
    with an associated phone number that is capable of receiving SMS
    text messages.

-   A mobile passcode device is created in a client application installed
    on your phone, notebook, or other digital device.

You can add multi-factor authentication by updating your account
settings in the [MyRackspace portal](https://my.rackspace.com). After you pair
a device with your account, authentication becomes a two-step process:

1.  Each time you log in, the Rackspace Identity service generates
    a passcode and sends it to the paired device.

2.  After the passcode is sent, the system prompts you to type the
    passcode and submit it to the Identity service to complete the
    authentication process.

    **Note:** Standard text message rates and data fees apply based on
    your contract with your mobile device provider.

Additionally, account administrators can configure account-wide settings to
specify a multi-factor authentication policy for all account users. By
default, account users have the option to set up and use multi-factor
authentication. Administrators can update the account-wide settings to require
multi-factor authentication for all users. When this setting is enabled, users
can’t access their account until they configure multi-factor authentication.
Current users are logged out as soon as the account-wide requirement is
applied. At the next login, users are notified of the increased security and
are prompted to complete the setup process.

**Notes**

-   You can't configure multi-factor authentication for the Cloud
    Control Panel inside of the MyRackspace portal. You must log in to
    the [Cloud Control Panel](mycloud.rackspace.com) and use these
    [instructions](https://support.rackspace.com/how-to/multi-factor-authentication-from-the-cloud-control-panel/)
    to setup your users for the Cloud Control Panel.

-   Administrators cannot set up devices for their users. Users must
    configure their own devices. To modify their multi-factor authentication
    settings, users must log in to the MyRackspace portal with the user
    credentials that they want to modify.

### Configure your account to authenticate by using an SMS device

To configure your account to use an SMS device for multi-factor
authentication, you need the phone number associated with your digital
device. The device must be enabled to receive SMS text messages.

To register and verify an SMS device, use the following steps:

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/).

2.  Click **Account** and then click **My Multi-Factor Devices**.

3.  Click **Add** next to the **SMS** option.

4.  Enter the phone number of your SMS-capable device and click **Add SMS Device**.

    After you click **Add SMS Device**, the Identity service sends an SMS
    text message with a four-digit PIN to the specified phone.

6.  On the **Verify Code** form in the MyRackspace Portal, type the PIN code sent
    to your mobile device in the **Verification Code** field. Then, click
    **Verify SMS Device**.

    After you submit the verification code, the MyRackspace portal login page
    is displayed so that you can re-authenticate by using the multi-factor
    authentication process.

### Configure your account to authenticate by using a mobile passcode device

To configure your account to use an mobile passcode device for multi-factor
authentication, you must have one of the following client applications
installed on your device: [Authy](https://www.authy.com/),
[Duo](https://www.duosecurity.com/),
[Google Authenticator](https://support.google.com/accounts/answer/1066447?hl=en),
or [SecureAuth OTP](https://www.secureauth.com/Support/Downloads/Client-Applications.aspx).

To register and verify an mobile passcode device, use the following steps:

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/).

2.  Click **Account** and then click **My Multi-Factor Devices**.

3.  Click **Add** next to **Mobile Passcode** option.

4.  Enter a nickname for your device and click **Add Device.**

    The Identity service generates a QR code that you can use to pair your
    MyRackspace account with your device.

5.  To pair your account with your device, use the client application on
    your device to scan the QR code.

    The application on your device adds the device name that you specified and
    generates a passcode.

6.  To verify the new device in the MyRackspace portal, enter the passcode in
    the portal's **Verification** pop-up dialog box.

    **Note:** When you add a mobile password device, mobile passeord is the
    default method for an authentication. If you do not want this to be the
    default method or if you do not want to be logged out of your account when
    you verify the passcode, clear the **Make this my default authentication
    method** check box.

    You can update the default authentication method on the **Account
    Settings** page.

7.  Click **Verify Mobile Device**.

    After you submit the verification code, you are automatically logged out.

8.  On the MyRackspace login page, enter your username and password. Then,
    enter the verification code from the mobile passcode device that you paired
    with your account.

### Change the default multi-factor authentication method

If your account has been configured with both SMS and mobile passcode devices,
you can select the default multi-factor authentication method from the
**My Multi-Factor Devices** page by using the following steps.

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/).

2.  Click **Account:** and then select **User Management** from the menu.

3.  Click **My Multi-Factor Devices**.

4.  In the **Multi-Factor Authentication** section, review the default
    authentication method setting and click **Edit** to change it.

5.  In the pop-up dialog box, select the default method that you want and then
    click **Save**.

### Configure account-wide multi-factor authentication settings from an administrator account

Account administrators can update MyRackspace account-wide settings to require
all users to authenticate by using multi-factor authentication. When this
setting is enabled, users can't access their accounts until they add and
verify a device on their account.

To configure account-wide settings for multi-factor authentication, use the
following steps:

1.  Log in to the [MyRackspace portal](https://my.rackspace.com).

2.  Click **Account**, and then select **User Management** from the menu.

3.  Click **My Multi-Factor Devices**.

4.  Click the pencil icon to edit the **Require Multi-Factor** setting.

5.  In the Account-wide multi-factor authentication pop-up dialog box, select
    an option to set the policy for account users. Then, click **Save
    Setting** to apply the change.

    If you update the setting to be required, users who do not have
    multi-factor authentication configured must add it the next time
    they log in.

    When these users log back in, they are guided through the
    multi-factor authentication setup.

### Configure multi-factor authentication during account log in

If your account is not configured for multi-factor authentication when
it is required, you are notified about the increase in security
requirements and prompted to set up authentication.

To access your account, click **Set Up Multi-Factor Authentication.**
Then, follow the steps to register and verify a
device, and authenticate by using the passcode sent to the device.

### Log in to MyRackspace by using multi-factor authentication

If you add multi-factor authentication to your account, authentication is a
two-step process.

Multi-factor authentication has the following prerequisites:

-   MyRackspace account with valid username and password credentials
-   Access to the registered and verified SMS or mobile passcode device paired
    with your MyRackspace account

To log in to the MyRackspace portal with multi-factor authentication, use the
following steps:

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/) with
    your username and password.

    If your account is configured to use multi-factor authentication with
    an SMS device, the Rackspace Cloud Identity service sends an SMS
    text message with a 7-digit passcode to the device registered to
    your account.

    If your device is configured to use multi-factor authentication with a
    mobile passcode device, open the client application and get the passcode
    from the mobile passcode device associated with your MyRackspace account.

2.  When prompted, type the passcode in the **Passcode** field on the
    login page. Then, click **Verify Code** to log in to your
    account.

### Manage multi-factor authentication

MyRackspace users can view and manage the multi-factor authentication
configuration from the **Account** > **User Management** > **My Multi-Factor Devices**
menu in the MyRackspace portal.

**To verify your device**

You can verify your SMS or OTP device from the **My Multi-Factor Devices**
page.

-   If you have an SMS device on your account that has not been verified,
    use the **Verify** option to complete the verification process.

-   If you have a mobile passcode device that has not been verified, use the
    **Manage** option to complete the verification process.

**To recover an account**

You can generate up to ten bypass codes that you can use to authenticate
if the device associated with your account is not available. You save
the generated codes to a file on your computer for future use.

**Important:** To avoid losing access to your account, generate and save
the bypass codes as soon as you enable multi-factor authentication by using the
following steps:

1.  On the **My Multi-Factor Devices** page, click **Generate Recovery Codes**.

2.  In the **Quantity** field, select the number of codes to generate or
    accept the default value.

3.  Click **Generate Codes**.

4.  Manually copy the recovery codes to a file or click **Save Your Codes**
    to generate a text file with the codes.

**To remove multi-factor authentication**

You can turn off multi-factor authentication and remove all devices
associated with your account.

On the **My Multi-Factor Devices** page, click **Remove all devices**.

**To change the mobile phone number**

To change the mobile phone number paired with your account, use the
**Remove all devices** option to remove the existing phone number (for
instructions, see the preceding task).  Then, update the authentication
settings with the new phone number and verify the device.

**To remove an SMS or mobile passcode device**

To remove an SMS device, use the **Remove all devices** option.
To remove a mobile passcode device, use the **Manage** option to delete the
device from your account.

### Troubleshooting

Use the following information to resolve common issues that can occur
when configuring and using multi-factor authentication.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong><strong>Issue</strong></strong></td>
<td align="left"><strong><strong>Resolution</strong></strong></td>
</tr>
<tr class="even">
<td align="left"><h4 id="invalid-phone-number"><strong><strong><strong>Invalid phone number</strong></strong></strong></h4></td>
<td align="left">If you get an error message when registering a phone number, verify that you have entered the correct country code and a valid phone number with no extra characters or spaces.</td>
</tr>
<tr class="odd">
<td align="left"><h4 id="invalid-pin-when-verifying-device"><strong><strong><strong>Invalid PIN when verifying device</strong></strong></strong></h4></td>
<td align="left"><p>When you try to verify a mobile device, you might receive an error caused by an invalid PIN. Confirm that you are entering the correct four-digit PIN that you received via SMS text message.  Ensure that you are using the mobile device that is paired with the MyRackspace account.</p></td>
</tr>
<tr class="even">
<td align="left"><h4 id="locked-account"><strong><strong><strong>Locked account</strong></strong></strong></h4></td>
<td align="left">If you enter an incorrect passcode more than six times during the multi-factor authentication process, your account will be locked. Contact Rackspace Support to restore access to a locked account. </td>
</tr>
<tr class="odd">
<td align="left"><h4 id="cannot-link-cloud-account-in-myrackspace-with-multi-factor-enabled"><strong><strong><strong>Cannot link cloud account in MyRackspace with multi-factor enabled</strong></strong></strong></h4></td>
<td align="left"><p>If you are using MyRackspace, you can't link to an existing Rackspace Cloud account that has been enabled for multi-factor authentication.</p></td>
</tr>
<tr class="even">
<td align="left"><h4 id="account-recovery"><strong><strong><strong>Account recovery</strong></strong></strong></h4></td>
<td align="left"><p>If your account is configured for multi-factor authentication, and you do not have access to your device or your generated account recovery codes,  contact Rackspace Support.</p></td>
</tr>
</tbody>
</table>
