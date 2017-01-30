---
permalink: add-delete-or-disable-admin-accounts/
audit_date:
title: Add, delete, or disable admin accounts
type: article
created_date: '2016-11-30'
created_by: Thomas Hester
last_modified_date: '2016-11-30'
last_modified_by: Laura Santamaria
product: Cloud Sites
product_url: cloud-sites
---

This article explains how to add, delete, and disable an administrator through the Cloud Office Control Panel. An email administrator can contact support, add mailboxes, and unlock accounts. You can also set limitations for administrators to see only certain information.

### Add an administrator

1. Log in to the [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com).

2. Under **Common Actions** on the right of the screen, click **Manage Administrators**.

    <img src="{% asset_path cloud-sites/add-delete-or-disable-admin-accounts/image01.png %}" alt="Manage administrators link in the Cloud Sites Email Control Panel" />

3. Click **Add Administrator**.

4. Enter the following information under **Add Administrator**:

    <img src="{% asset_path cloud-sites/add-delete-or-disable-admin-accounts/image03.png %}" alt="Add Administrator settings fields" />

    - **First Name** - Enter the administrator's first name.

    - **Last Name** - Enter the administrator's last name.

    - **Email** - Enter the administrator's email address.

    - **Admin ID** - Enter a unique name for the account. If the ID that you enter is used elsewhere on the email hosting system, you are prompted to enter a new ID.

    - **Type** - Select the level of security for the administrator:

        - **Super** - Allows full access to the control panel and includes the ability to create and manage administrator accounts.

        - **Standard** - Allows full access to the control panel but restricts the administrator from certain areas of the account section of the control panel.

        - **Limited** - Allows access to only the control panel areas that you specify. By default, Limited admins will have access to all domains. You can select the specific areas at the bottom of the screen after selecting **Limited**. See step 6.
        
            **NOTE:** Limited admins will still see a full count of the domains on the account but will only be able to admin domains to which they are assigned. We are looking to correct this error in a future update of the control panel.

    - **Password** - Enter a password for this administrator account.

    - **Confirm** - Retype the password.

    - **Security Question** - Select a security question from the list provided.

    - **Security Answer** - Enter the answer to the security question.

5. Enter in the following information for **Security Settings**:

    - Specify whether the password never expires or expires in a specified number of days.

    - Select **Allow simultaneous logins using this Administrative ID** to allow multiple people on different machines to log in using the same account.

    - Select **Login restricted to IP address(es)** to allow access only from certain IP addresses, such as the office or home network.

6. If you selected **Limited** as the type for your newly created administrator, perform the following actions at the bottom of the screen:

    - On the **Permissions** tab, select the check box for each area to which this limited administrator should have access. By default, limited administrators have access to all domains in the account.

    - To specify which domains the administrator can access, click the **Domain Access** tab.

    - Use the **Filter** and **Search** tools to locate the domains associated with the account.

    - In the **Current Domains** box, select the domains that you want to allow the administrator to access. To select multiple domains, hold the **Ctrl** key as you click each domain. Then, click **Add**.

    - To select multiple domains, hold the **Ctrl** key as you click each domain.

    - To remove a domain from the **Access-Allowed** box, click the domain and then click **Remove**.

7.  Click **Save**.

You can email your newly created administrator with the credentials to log in.

### Delete an administrator

Deleting an administrator completely removes the admin user from the control panel. If access needs to be granted again, a different Super Administrator must re-create the user.

To delete an administrator, log in to the [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com) and perform the following steps:

1. Under **Common Actions**, click **Manage Administrators**.

2. Select the check box next to each administrator that you want to delete. If you delete the logged-in administrator, you will be logged out upon deletion. The account must have at least one administrator.

3. Click **Delete**.

4. In the confirmation box, click **OK**.

5. To disable multiple administrators, select the administrators that you would like to delete and in the confirmation popup box, click **Delete _n_ Administrators**. (The _n_ corresponds to the number of administrators that you have selected for deletion.)

### Disable an administrator

Disabling administrators removes their ability to log in to the control panel, but it keeps their information visible so that they can be re-enabled in the future.

To disable an administrator, log in to the [Cloud Sites Email Control Panel](https://cloudsites.mycpsrvr.com) and perform the following steps:

1.  Under **Common Actions**, click **Manage Administrators**.

2.  In the **Action** column for the administrator, click **Disable**.

    **Note:** You can reverse this action by clicking **Enable**.
