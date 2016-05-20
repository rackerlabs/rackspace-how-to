---
permalink: myrackspace-two-factor-authentication/
audit_date:
title: MyRackspace two-factor authentication
type: article
created_date: '2014-07-14'
created_by: Rackspace Support
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Two-factor authentication uses an extra device, like a mobile phone, to
provide an additional layer of security when you access your account.
Two-factor authentication is a significant security improvement over
using a password alone. This article explains how to manage two-factor
authentication for your MyRackspace account from the
[MyRackspace](https://my.rackspace.com/portal/auth/login?targetUri=%2Fhome) portal.

**Note:** You must be an administrative user to manage two-factor
authentication for your MyRackspace account.

### Set up two-factor authentication for users

An administrative user of the account can decide whether to make
two-factor authentication a requirement for all users of the account or
allow users to choose whether they want to use two-factor
authentication.

With the **Two-factor login administration** option, you can decide
whether to make two-factor authentication a requirement for all users or
allow users to choose whether or not they want to use two-factor
authentication.

1.  Log in to the [MyRackspace portal](https://my.rackspace.com/).

2.  In the top menu bar, click **Account** and then select **User
    List**.

3.  At the top of the User List page, click **Two-Factor Login
    Administration**.

4.  On the Two-Factor Login page, select one of the following options:

    -  **Required for all users on this account**& - Makes two-factor
    authentication a requirement for all users on your account. Setup
    must take place on each user's next login.

    -  **Optional per user** - Makes two-factor authentication optional for
    all users on your account. Users who want to use two-factor
    authentication are prompted to register a paired SMS-capable device
    on their next login.

7.  Click **Save Two-Factor Login**.

### Register a device after two-factor authentication is enabled for your account

If two-factor authentication is enabled for your user account, you must
register a new SMS-capable device to pair with your account by using
these steps:

1.  Log in to the [MyRackspace portal](https://myrackspace.com).

2.  Enter the phone number of your SMS-capable device to begin the
    device registration process.

    You will receive an SMS or text message with a 4-digit PIN code.

3.  To complete verification of your device, enter the 4-digit PIN code.

    After your PIN is successfully entered and accepted, you are granted
    access to MyRackspace.

### Log in with two-factor authentication

If you have a registered device paired with your account, a 7-digit
verification code is sent via SMS text message to your device after you
log in to the MyRackspace portal with your username and password. This
verification code is the second factor of authentication for accessing
the portal.

Enter the correct verification code to complete two-factor
authentication to the [MyRackspace portal](https://myrackspace.com).

### Manage your two-factor devices

You can manage the devices that you use for two-factor authentication.
Users are allowed multiple devices for two-factor authentication.

1.  Log in to the [MyRackspace portal](https://myrackspace.com).

2.  In the top menu bar, click **Account** and then select **User
    List**.

3.  At the top of the User List page, click **My Two-Factor Devices**.

4.  On the **My Two-Factor Devices** page, click the **Actions** menu
    and choose one of the following options:

    -   Select **Add New Device** to add a new device to your two-factor
        authentication settings.
    -   Click **Generate Bypass Codes** to generate from one to ten
        bypass codes to use in place of your device.
        You can also remove devices from the list.

### Troubleshoot two-factor authentication problems

Following are a few common problems that you might encounter when
setting up two-factor authentication and some basic troubleshooting
steps that can help you overcome them.

#### Invalid phone number

When trying to register a mobile device, you might receive an error
indicating an invalid phone number. Confirm that a valid 10-digit phone
number has been entered correctly with no extra characters or spaces.

#### Verify device - Invalid PIN

When attempting to verify your mobile device, you might receive an error
that the PIN entered is incorrect. Confirm that the correct 4-digit PIN
received via SMS text message has been entered correctly.

#### MyRackspace account locked

After you log in to the [MyRackspace portal](https://myrackspace.com) by
using your Rackspace account number, username, and password, you receive
a 7-digit verification code via SMS to complete the two-factor
authentication. Entering the incorrect 7-digit passcode causes
authentication to fail. After six failed attempts, the account is
locked. A user with administrator privileges is required to unlock the
account. See the following section for instructions.

#### Unlock a user account

Follow these steps to unlock a user account:

1.  Log in to the [MyRackspace portal](https://myrackspace.com) as an
    administrator.

2.  Select **Account > User List**.

3.  Locate the locked user and open the user's account record.

4.  From the **Actions** menu, select **Unlock User**.

    A green banner is displayed, stating that the user account was
    successfully unlocked.

#### Generate a temporary passcode

Follow these steps to generate a temporary passcode for a user.

**Note:** An account must be unlocked for this item to be displayed in
the **Actions** menu.

1.  Log in to the MyRackspace portal as an administrator.

2.  Select **Account > User List**.

3.  Locate the user and open the user's account record.

4.  From the **Actions** menu, select **Send Temporary Code**.

    A green banner is displayed, stating that the temporary code has
    been sent to the indicated device. The code is valid for
    five minutes.

#### Two-factor authentication links do not appear in the MyRackspace portal

If you do not see the two-factor authentication links in the menu bar of
the MyRackspace portal, the account might not be enabled for two-factor
authentication, or the two-factor system might be unavailable because of
maintenance or service interruption.
