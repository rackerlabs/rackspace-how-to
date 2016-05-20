---
permalink: multi-factor-authentication-from-the-cloud-control-panel/
audit_date:
title: Multi-factor authentication from the Cloud Control Panel
type: article
created_date: '2014-07-17'
created_by: Margaret Eker
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Customers can increase security on Rackspace Cloud accounts by using the
multi-factor authentication capabilities provided by the Rackspace Cloud
Identity service. Multi-factor authentication adds an extra layer of
identity verification to the log in process by requiring a user to
submit a time-sensitive passcode that the Identity service sends to an
SMS or OTP (one-time password) device associated with the user's
account:

-   an SMS device is a mobile phone, notebook, or other digital device
    with an associated phone number that is capable of recieving SMS
    text messages.

-   an OTP device is created in an OTP client application installed on
    your phone, notebook, or other digital device.

You can add multi-factor authentication by updating your account
settings in the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com). After you pair a device with
your account, authentication becomes a two-step process:

1.  Each time you log in, the Rackspace authentication service generates
    a passcode and sends it to the associated device.

2.  After the passcode is sent, the system prompts you to type the
    passcode and submit it to the Identity service to complete the
    authentication process.

    **Note:** Standard text message rates and data fees apply based on
    your contract with your mobile device provider.

Additionally, Rackspace Cloud account administrators can configure
account-wide settings to specify a multi-factor authentication policy
for all account users. By default, account users have the option to set
up and use multi-factor authentication. Administrators can update the
account-wide settings to require multi-factor authentication for all
users. When this setting is enabled, users cannot access their account
until they configure multi-factor authentication. Current users are
logged out as soon as the account-wide requirement is applied. At the
next login, users are notified of the increased security and prompted to
complete the setup process.

**Notes**

-   MyRackspace also implements multi-factor authentication, but it is
    not implemented through the Rackspace Cloud Identity 2.0 API. For
    information about using multi-factor authentication with
    MyRackspace, see [MyRackspace Two-Factor Authentication](/how-to/myrackspace-two-factor-authentication).

-   You cannot configure multi-factor authentication from the Cloud
    Sites Control Panel. However, if you set up multi-factor
    authentication for your Rackspace Cloud account using the [Cloud Control Panel](https://mycloud.rackspace.com/), the configuration
    also applies to your Cloud Sites account. Multi-factor
    authentication can only be enabled for the main account user login;
    sub-account user logins are not able to use this feature. In
    addition, FTP user accounts (main or sub) cannot use
    multi-factor authentication.

-   When multi-factor authentication is enabled for an account, it is
    enabled only for authentication via username and password
    credentials.

    If a client a user supplies a valid username and API key
    credentials, the client receives the authentication
    token immediately. This behavior allows automated processes or
    agents to run operations by using the username and API key
    credentials.

-   If you use an OpenStack or Rackspace CLI tool to authenticate with
    username and password, you cannot authenticate if you add
    multi-factor authentication to your account because the CLI tools do
    not support multi-factor authentication.  To work around this
    problem, try one of the following approaches:

    -   Do not enable multi-factor authentication for accounts that
        require username and password authentication through a CLI tool.
    -   If you are using the nova-client, configure the client to
        authenticate with an API key.
    -   If you are using a client that supports token authentication,
        use cURL to get the authentication token. Export the token value
        to the token environment variable for the client--for example,
        OS_TOKEN or OS_AUTH_TOKEN. Then, use the CLI to submit API
        requests to the Rackspace Cloud.

-   You can also manage multi-factor authentication from the [Rackspace Identity service API.](https://developer.rackspace.com/docs/cloud-identity/v2/developer-guide/#document-authentication-info/use-mfa-ops)

### Configure your account to authenticate by using an SMS device

To configure you account to use an SMS device for multi-factor
authentication, you need the phone number associated with your digital
device. The device must be enabled to receive SMS text messages.

**To register and verify an SMS device**

1.  Log in to the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/).

2.  Click **Account: *yourUsername*** in the top-right corner, and then,
    select **Account Settings** from the menu**.**

3.  In the **Multi-factor authentication** field, click **Add**.

4.  On the Register SMS Device form, select the country code for the
    device, and then type the device phone number. Click **Add
    SMS Device.**

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/add-sms-device.png %}" alt="Add an SMS device to your account so you can set up multi-factor authentication" />

    When you click **Add SMS Device**, the Identity service sends an SMS
    text message with a four-digit PIN to the specified phone.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/verify_code.png %}" width="290" height="200" />

5.  On the Verify Code form in the control panel, type the PIN code sent
    to your mobile device in the verification code field. Then, click
    **Verify Device**.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/verify-sms-device.png %}" alt="Enter the verification code to pair the SMS device with your Rackspace Cloud account" />

    After you submit the verification code, the Cloud Control Panel
    login page is displayed so that you can re-authenticate by using the
    multi-factor authentication process.

### Configure your account to authenticate by using an OTP device

To configure your account to use an OTP device for multi-factor
authentication, you must have one of the following OTP client
applications installed on your device: [Authy](https://www.authy.com/),
[Duo](https://www.duosecurity.com/),
[Google Authenticator](https://support.google.com/accounts/answer/1066447?hl=en),
or [SecureAuth OTP](https://www.secureauth.com/Support/Downloads/Client-Applications.aspx).

**To register and verify an OTP device**

1.  Log in to the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/ "Cloud Control Panel").

2.  Click **Account: *yourUsername*** in the top-right corner, and then,
    select **Account Settings** from the menu**.**

3.  In the **Multi-factor Authentication Mobile Passcode** field, click
    **Add**.

4.  On the Name of your Device form, type a **Device nickname** for
    the OTP device. Then, click **Add Device.**

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/name-your-otp-device.png %}" alt="Add an OTP device to your Rackspace Cloud account" />

    After you click **Add Device**, the Identity service generates a
    barcode that you can use to link your Rackspace Cloud account with
    an OTP device.

5.  To pair your Rackspace Cloud account with your device, use the OTP
    client application on your device to scan the barcode on the Verify
    Code form.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/scan-barcode.png %}" alt="Scan barcode by using the OTP application on your device to pair your Rackspace Cloud account with your device." />

    After you scan the code, the OTP application on your device creates
    the OTP device using the device name you specified. It also
    generates a passcode.

    ![OTP device with generated passcode for use with one-time
    password authentication.]({% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/OTP-device.png %})


6.  To verify the new device, enter the passcode on the Verify
    Code form. Then, click **Verify Mobile Passcode**.

    **Note:** As soon as you submit the verification code, you will be
    logged out.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/otp-verify-device-code.png %}" alt="Verify new OTP device for multi-factor authentication" />

    **Note:** By default, the new OTP device will be the default method
    for authentication. If you do not want it
    to be the default or if you do not want to be logged out of your
    account, remove the selection from **Make this my default
    authentication method**.

    You can update the default authentication method on the Account
    settings page.

7.  On the Cloud Control panel, enter your username and password. Then,
    enter the verification code from the OTP device that you paired with
    your account

### Change default multi-factor authentication method

If your account has been configured with both SMS and OTP devices, you
can select the default multi-factor authentication method from the
Account Settings page.

1.  Log in to the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/).

2.  Click **Account:** **yourUsername** in the top-right corner, and
    then select **Account Settings** from the menu.

3.  In the Multi-Factor Authentication section, review the default
    authentication method setting.  Click **Edit** to change it.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/default-authentication-method.png %}" alt="Change default authentication method." />

### Configure account-wide multi-factor authentication settings from an Administrator account

Account administrators can update Rackspace Cloud account-wide settings
to require all users to authenticate by using multi-factor
authentication. When this setting is enabled, users cannot access their
accounts until they add and verify a device on their account.

**To configure account-wide settings for multi-factor
authentication**

1.  Log in to the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/ "Cloud Control Panel").

2.  Click **Account: yourUsername** in the top-right corner, and
    then select **Account Settings** from the menu.

3.  In the **Account-Wide Settings** section, click the pencil to edit
    the **Require multi-factor authentication** setting.

4.  On the Account-wide two-factor authentication form, click the
    selection to set the policy for account users. Then, click **Save
    Setting** to apply the change.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/mfa-required-setting_0.png %}" alt="Update the account-wide multi-factor authentication enforcement setting." width="550" height="118" />

    If you update the setting to required, users who do not have
    multi-factor authentication configured must add it the next time
    they log in. Current users who have not set up multi-factor
    authentication are logged out after seeing an error message like the
    following one:

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/mfa-force-logout.png %}" alt="Force user to log out when mulit-factor authentication requirement is not met." width="513" height="112" />

    When these users log back in, they are guided through the
    multi-factor authentication set up.

### Configure multi-factor authentication during account log in

If your account is not configured for multi-factor authentication when
it is required, you are notified about the increase in security
requirements and prompted to set up authentication.

<img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/mfa-setup-required.png %}" height="212" />

To access your account, click **Set Up Multi-Factor Authentication.**
Then, follow the steps to register and verify a
device, and authenticate by using the passcode sent to the device.

### Log in to the Rackspace Cloud by using multi-factor authentication

If you add multi-factor authentication capabilities to your account,
authentication is a two-step process.

**Prerequisites**

-   Rackspace Cloud accounts with valid username and password
    credentials
-   Access to the registered and verified SMS or OTP device paired with
    your Rackspace Cloud account

To log in to the Rackspace Cloud with multi-factor authentication

1.  Log in to the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com/) with
    your user name and password.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/control_panel_login.png %}" width="362" height="206" />

    If you account is configured to use multi-factor authentication with
    an SMS device, the Rackspace Cloud Identity service sends an SMS
    text message with a 7-digit passcode to the device registered to
    your account.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/mfa_passcode.png %}" width="366" height="207" />

    If your device is configured to use multi-factor authentication by
    OTP device, open the OTP client application and get the passcode
    from the OTP device associated with your Rackpspace Cloud account.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/OTP-device.png" width="360" height="189" />

2.  When prompted, type the passcode in the **Passcode** field on the
    control panel. Then, click **Verify Code** to log in to your
    account:

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/enter_mfa_passcode.png %}" width="439" height="250" />

    If the passcode is expired or invalid, refresh the page to return to
    the Rackspace Cloud Control Panel login page. Then, log in again and
    click the Resend code option on the Account Settings page to get a
    new passcode.

### Manage multi-factor authentication

<Rackspace Cloud users can view and manage the multi-factor
authentication configuration from the Account Settings menu in the cloud
control panel.

<img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/account-settings-mfa.png %}" alt="Rackspace Cloud Account multi-factor authentication settings" />

**To view multi-factor authentication settings**

1.  After logging in to the control panel, click **Account:
    *yourUsername > Account Settings** to open the Account Settings
    page for your Rackspace Cloud account.
2.  In the Login Details section, review the information in the
    **Multi-Factor Authentication** field.

**To verify your device**

You can verify your SMS or OTP device from the Account Settings page.

-   If you have an SMS device on your account that has not been verified, use the Verify option to complete the verification process.

-   If you have an OTP device that has not been verified, use the Manage
    option to complete the verification process.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/verify-device-options.png %}" alt="Verify multi-factor authentication device options" />

**To recover an account**

You can generate up to 10 bypass codes that you can use to authenticate
if the device associated with your account is not available. You save
the generated codes to a file on your computer for future use.

**Important:** To avoid losing access to your account, generate and save
the bypass codes as soon as you enable multi-factor authentication.

1.  After logging in to the control panel, click **Account:
    *yourUsername > Account Settings** to open the Account
    Settings page.

2.  In the Login Details section, click **Generate Recovery Codes**.

    <img src="{% asset_path cloud-servers/multi-factor-authentication-from-the-cloud-control-panel/generate-recovery-codes.png %}" alt="Generate recovery codes." />

3.  In the Quantity field, select the number of codes to generate or
    accept the default value.

4.  Click **Generate Codes**.

5.  Copy the recovery codes to a text file, or click save your codes.

**To remove multi-factor authentication**

You can turn off multi-factor authentication and remove all devices
associated with your account.

1.  After logging in to the control panel, click **Account:
    yourUserName > Account Settings** to open the Account
    Settings page.

2.  In the Login Details section, click **Remove all devices** in the
    Multi-Factor Authentication field.

**To change the mobile phone number**

To change the mobile phone number paired with your account, use the
Remove option to remove the existing phone number (for instructions, see
the preceding task).  Then, update the account settings with the new
phone number and verify the device.

**To remove an SMS or OTP device**

To remove an SMS device, use the **Remove all devices**.
To remove an OTP device, use the Manage option to delete the device from
your account.

### Troubleshooting

**Use the following information to resolve common issues that can occur
when configuring and using multi-factor authentication.**

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
<td align="left"><p>When you try to verify a mobile device, you might receive an error caused by an invalid PIN. Confirm that you are entering the correct four-digit PIN that you received via SMS text message.  Ensure that you are using the mobile device that is paired with the Rackspace Cloud account.</p></td>
</tr>
<tr class="even">
<td align="left"><h4 id="locked-account"><strong><strong><strong>Locked account</strong></strong></strong></h4></td>
<td align="left">If you enter an incorrect passcode more than six times during the multi-factor authentication process, your account will be locked. Contact Rackspace Support to restore access to a locked account. </td>
</tr>
<tr class="odd">
<td align="left"><h4 id="cannot-link-cloud-account-in-myrackspace-with-multi-factor-enabled"><strong><strong><strong>Cannot link cloud account in MyRackspace with multi-factor enabled</strong></strong></strong></h4></td>
<td align="left"><p>If you are using MyRackspace, you cannot link to an existing Rackspace Cloud account that has been enabled for multi-factor authentication.</p></td>
</tr>
<tr class="even">
<td align="left"><h4 id="account-recovery"><strong><strong><strong>Account recovery</strong></strong></strong></h4></td>
<td align="left"><p>If your account is configured for multi-factor authentication, and you do not have access to your device or your generated account recovery codes,  contact Rackspace Support.</p></td>
</tr>
</tbody>
</table>
