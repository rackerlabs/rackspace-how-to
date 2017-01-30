---
permalink: manage-email-administrators-with-the-cloud-office-control-panel/
audit_date:
title: Manage email administrators with the Cloud Office Control Panel
type: article
created_date: '2012-09-17'
created_by: Rae D. Cabello
last_modified_date: '2016-01-15'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to add, disable, and delete an administrator
through the Cloud Office Control Panel. An email administrator can
contact support, add mailboxes, and unlock accounts. You can also set
limitations for administrators to see only certain information.

**Note:** Managed and Dedicated customers access contacts and
permissions via the MyRackspace Portal.

### Add an administrator

1.  Log into the [Cloud Office Control Panel](https://cp.rackspace.com/).
2.  Under **Common Actions**, click **Manage Administrators**.
3.  Click **Add Administrator**.
4.  Enter the following information under **Add Administrator**:
    -   **First Name** - Enter the administrator's first name.
    -   **Last Name** - Enter the administrator's last name.
    -   **Email** - Enter the administrator's email address.
    -   **Admin ID** - Enter a unique name for the account. If the ID that you enter is used elsewhere on the email hosting system, you are prompted to enter a new ID.
    -   **Type** - Select the level of security for the administrator:
        - **Super** - Allows full access to the control panel, and
          includes the ability to create and manage
          administrator accounts.
        - **Standard** - Allows full access to the control panel, but restricts the administrator from certain areas of the account section of the control panel.
        - **Limited** - Allows access to only the control panel areas
          that you specify. (You can select the specific areas at the bottom of
          the screen after selecting **Limited**. See step 6.)
    -   **Password** - Enter a password for this administrator account.
    -   **Confirm** - Retype the password.
    -   **Security Question** - Select a security question from the list provided.
    -   **Security Answer** - Enter the answer to the security question.
5. Enter in the following information for **Security Settings**:
    -   Specify whether the password never expires or expires in a specified number of days.
    -   Select **Allow simultaneous logins using this Administrative ID** to allow multiple people on different machines to log in using the same account.
    -   Select **Login restricted to IP address(es)** to allow access only from certain IP addresses, such as the office or home network.

6.  If you selected **Limited** as the type for your newly created
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
        multiple domains, hold the Ctrl key as you click each domain.
        Then, click **Add**.
    5.  To select multiple domains, hold the **Ctrl** key as you click
        each domain.
    6.  To remove a domain from the **Access-Allowed** box, click the
        domain and then click **Remove**.

9.  Click **Save**.

You can email your newly created administrator with the credentials to
log in.

### Delete an administrator

Deleting an administrator completely removes the admin user from the
control panel.  If access needs to be granted again, a different Super
Administrator must re-create the user.

To delete an administrator, [log in to the control
panel](https://cp.rackspace.com/), and perform the following steps:

1.  Under **Common Actions**, click **Manage Administrators**.
2.  Select the check box next to each administrator that you want
    to delete. If you delete the logged-in administrator, you will be
    logged out upon deletion. The account must have at least
    one administrator.
3.  Click **Delete**.
4.  In the confirmation box, click **OK**.

### Disable an administrator

Disabling administrators removes their ability to log in to the control
panel, but it keeps their information visible so that they can be
re-enabled in the future.

To disable an administrator, [log in to the control
panel](https://cp.rackspace.com/), and perform the following steps:

1.  Under **Common Actions**, click **Manage Administrators**.
2.  In the **Action** column for the administrator, click
    **Disable**.

    **Note**: You can reverse this action by clicking **Enable.**
3.  In the confirmation popup box, click **Delete *n* Administrator**.
    (The ***n*** corresponds to the number of administrators that you
    have selected for deletion.)
