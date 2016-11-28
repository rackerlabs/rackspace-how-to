Getting Started: How to Add Email Account and Domain Administrators

This article explains how to add, disable, and delete an administrator through the Cloud Sites Email Control Panel. An email administrator can add mailboxes, reset passwords, unlock accounts, and manage spam settings on an account, domain or mailbox basis. Default settings provide administrators permissions to all domains within the account. The Domain Access tab allows you to tailor the administrator account to specific domains.

Three different types of administrator accounts can be created.

-   Super Admins can access the entire control panel and can create/manage other administrators

-   Standard Admins can access the entire control panel, but cannot create new administrators

-   Limited Admins can only access the sections of the control panel you specify

<span id="_gjdgxs" class="anchor"></span>NOTE: Limited Administrators are the only type you can restrict to specific domains. Super and Standard Administrators have access to all domains in the account.

**Adding Administrators**

1.  Log in to the [**Cloud Sites Email Control Panel**](https://cloudsites.mycpsrvr.com/) using your username and password.

2.  Under **Common Actions** select **Manage Administrators**.

3.  Click **Add Administrator**

4.  Enter the following information under **Add Administrator**

    -   **First Name:** Enter the administrator’s first name

    -   **Last Name:** Enter the administrator’s last name

    -   **Email:** Enter the administrator’s email address

    -   **Admin ID:** Enter a unique name for the account. If the ID that you enter is used elsewhere on the email hosting system, you are prompted to enter a new ID.

    -   **Type:** Select the level of security for the administrator:

        -   **Super:** Allows full access to the control panel and includes the ability to create and manage administrator accounts.

        -   **Standard:** Allows full access to the control panel

        -   **Limited:** Allows full access to the control panel for any domains they are assigned access to. By default, Limited Administrators have access to **ALL** domains.

    <!-- -->

    -   **Password:** Enter a password for this administrator account.

    -   **Confirm:** Retype the password.

    -   **Security Question:** Select the security question from the list provided

    -   **Security Answer:** Enter the answer to the security question.

5.  Enter in the following information for **Security Settings**:

    -   Specify whether the password never expires or expires in a specified number of days.

    -   Select **Allow simultaneous logins using this Administrative ID** to allow multiple people on different machines to log in using the same account.

    -   Select **Login restricted to IP address(es)** to allow access only from certain IP addresses, such as the office or home network.

6.  If you selected **Limited** as the type for your newly created administrator, perform the following actions at the bottom of the screen:

    -   On the **Permissions** tab, select the check box for each area to which this limited administrator should have access. **By default, limited administrators have access to all domains in the account.**

    -   To specify which domains the administrator can access, click the **Domain Access** tab.

    -   Use the **Filter** and **Search** tools to locate the domains associated with the account.

    -   In the Current Domains box, select the domain or domains that you want to allow the administrator to access. To select multiple domains, hold the CTRL key as you click each domain. Then, click **Add**

    -   To remove a domain from the **Access-Allowed** box, click the domain and then click **Remove.**

7.  Click **Save**

> You can email your newly created administrator with the credentials to log in.
>
> **Delete an Administrator**
>
> Deleting an administrator completely removes the admin user from the control panel. If access needs to be granted again, a different Super Administrator must re-create the user.
>
> To delete an administrator, log in to the [**Cloud Sites Email Control Panel**](https://cloudsites.mycpsrvr.com/), and perform the following steps:

1.  Under Common Actions, click **Manage Administrators**

2.  Select the check box next to each administrator that you want to delete. If you delete the logged-in administrator, you will be logged out upon deletion. The account must have at least one administrator.

3.  Click **Delete.**

4.  In the confirmation box, click **OK**

> **Disable an Administrator\
> \
> **Disabling an administrator removes their ability to log in to the control pnael, but it keeps their information visible so they can be re-enabled in the future.
>
> To disable an administrator, log in to the [**Cloud Sites Email Control Panel**](https://cloudsites.mycpsrvr.com/), and perform the following steps:

1.  Under Common Actions, click **Manage Administrators**

2.  In the **Action** column for the administrator, click **Disable.**

> Note: You can reverse this action by clicking **Enable**.

1.  In the confirmation popup box, click **Delete *n* Administrator**. (The ***n*** corresponds to the number of administrators that you have selected for deletion.)

**Enable Two Factor Authentication**

> **\
> **Two-factor authentication adds an extra layer of security to your account by requiring you to sign in with your password and a code from a second device. Once an admin account has been created, To Factor Authentication can be enabled for that account.

1.  Visit the app store on your mobile device or use a [*desktop app*](https://www.authy.com/app/desktop/).

2.  Search for Google Authenticator or Authy, apps that will generate your authentication code.

3.  Download and install the app.

4.  Scan the QR Code or manually enter the secret key presented in the control panel into the app.

5.  Enter the six-digit code from the app.

6.  Click **Enable**


