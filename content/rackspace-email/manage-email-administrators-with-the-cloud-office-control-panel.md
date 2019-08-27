---
permalink: manage-email-administrators-with-the-cloud-office-control-panel/
audit_date: '2019-08-19'
title: Manage email administrators with the Cloud Office Control Panel
type: article
created_date: '2012-09-17'
created_by: Rae D. Cabello
last_modified_date: '2019-08-19'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to add, disable, and delete an administrator
through the Cloud Office Control Panel.

**Note:** Managed and Dedicated customers access contacts and
permissions via the MyRackspace Portal. For more information, see [adding or editing users](/how-to/viewing-and-editing-user-information-for-your-account/) in the MyRackspace Portal.

### Add an administrator

1.  Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/).
2.  Under **Common Actions**, click **Manage Administrators**.
3.  Click **Add Admin**.
4.  Enter the following information under **Add Administrator**:
    -   **First Name** - Enter the administrator's first name.
    -   **Last Name** - Enter the administrator's last name.
    -   **Username** - Enter a unique name for the account. If the username that you enter is used elsewhere on the email hosting system, you are prompted to enter a new username.
    -   **Email** - Enter the administrator's email address.
        **Note:** We recommend using an email address that is _not_ hosted under the same account.
    -   **Phone Number** Enter a valid phone number for the administrator.
    -   **Type** - Select the level of security for the administrator:
        - **Super** - Allows full access to the control panel and
          includes the ability to create and manage
          administrator accounts.
        - **Standard** - Permits the administrator to manage all products and domains under the account while restricting access to account level operations.
        - **Limited** - Allows access only to the control panel areas
          that you specify. (You can select the specific areas at the bottom of
          the screen after selecting **Limited**. See step 6.)

5. Select which notifications you want this administrator to receive.

    -   **Billing Information**
    -   **Product and Service Updates**
    -   **System Alerts**

6. Enter in the following information for **Security Settings**:

    -   Specify whether an administrator is required to use [Multi-factor authentication](/how-to/enable-or-disable-two-factor-authentication-for-administrators/).
    -   Specify whether the password never expires or expires in a specified number of days.
    -   Select **Login restricted to IP address(es)** to allow access only from certain IP addresses, such as the office or home network.

7.  If you selected **Limited** as the type for your newly created
    administrator, perform the following actions at the bottom of the
    screen:
    1.  On the **Permissions** tab, select the check box for each area to
        which this limited administrator should have access. By default,
        limited administrators have access to all domains in the
        account.
    2.  To specify which domains the administrator can access, click
        the **Domain Access** tab.
    3.  Use the **Filter** and **Search** tools to locate the domains
        associated with the account.
    4.  In the **Current Domains** box, select the domain or domains
        that you want to allow the administrator to access. To select
        multiple domains, hold the **Ctrl** key as you click each domain, and then click **Add**.
    5.  To select multiple domains, hold the **Ctrl** key as you click
        each domain.
    6.  To remove a domain from the **Access-Allowed** box, click the
        domain and then click **Remove**.

8.  Click **Save**.

An email is then sent to the newly created administrator's email address. The email contains instructions for the administrator to log in to their new account and set up their security question and password.


### Delete an administrator

Deleting an administrator removes the admin user from the
control panel. If access needs to be granted again, a different Super
Administrator must re-create the user.

To delete an administrator, [log in to the control
panel](https://cp.rackspace.com/) and perform the following steps:

1.  Under **Common Actions**, click **Manage Administrators**.
2.  Select the check box next to each administrator that you want
    to delete. If you delete the logged-in administrator, you are
    logged out upon deletion. The account must have at least
    one administrator.
3.  Click **Delete**.
4.  In the confirmation box, click **OK**.

### Disable an administrator

Disabling administrators removes their ability to log in to the control
panel, but it keeps their information visible so that they can be
re-enabled in the future.

To disable an administrator, log in to the [control
panel](https://cp.rackspace.com/) and perform the following steps:

1.  Under **Common Actions**, click **Manage Administrators**.
2.  In the **Action** column for the administrator, click
    **Disable**.

    **Note**: You can reverse this action by clicking **Enable.**
3.  In the confirmation popup box, click **Delete "X" Administrator**.
    (The ***X*** corresponds to the number of administrators that you
    have selected for deletion.)
