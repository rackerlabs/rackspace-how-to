---
permalink: early-adopters-add-and-edit-archive-users-in-cloud-office/
audit_date: '2019-11-11'
title: Early Adopters&mdash;Add and edit archive users
type: article
created_date: '2019-11-11'
created_by: Joe Brooks
last_modified_date: '2019-11-11'
last_modified_by: Joe Brooks
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

This article describes how to add and edit archive users.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 10 minutes
- **Tools required:** Cloud Office Control Panel access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

After you have completed the steps in [Log in to the Archive
Manager](/how-to/log-in-to-the-archive-manager),
you can add additional users to the Archive Manager and assign the
following user types:

-   **Administrator** - Provides complete access across the archive with the ability to create, modify, and export searches; manage hold reason, users, permissions, and policies.

-   **Admin Only** - Provides access to most accounts, user management settings, and permissions but prohibits access to interaction with message data, including running, editing, and exporting searches or affecting retention policies.

-   **Compliance Officer** - Provides access to interact with data across the archive in addition to creating and managing hold reasons.

-   **Search Administrator** - Provides access to create, save, edit, export, and review searches across the archive.

-   **Exporter** - Provides access to view and export the results of saved searches, explicitly shared with the individual user. Exporters only have access to exports that are requested by the individual user.

-   **Reviewer** - Provides access to view the results of saved searches, explicitly shared with the individual user. Reviewers are unable to download or send the results from the application.

-   **End User** - Provides access to **MyArchive** functionality, which limits access to archived assets associated with the logged-in users’ listed email address.

You can also edit an existing user to change any of the following user
settings or information:

-   Basic contact information
-   Temporary passwords
-   Permissions
-   Account Status
-   Enable or disable Administrator(s) listed in the archive

### Add an archive user

Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) and then use the following steps to add individual users to the Archive Manager:

1.  On the left side of the screen, click **Users**.

2.  On the top right corner, click the **+New** tab.

3.  In the drop-down menu, click **User**.

4.  Enter the following information for the user:

    - User name
    - First and last name
    - Email address
    - Select a **Role**

    **Note**: The **Send welcome email** option is checked by default, and the user is asked to create a password after selecting **Activate your account** in the Welcome Email.


### Add multiple archive users

Use the following steps to add multiple users to the Archive Manager:

1.  Select the **Users** tab on the left and click **+New**.

2.  Click **CSV template** and save the compressed
    folder.

    **Note**: Enter **TRUE** or **FALSE** in the **Send-welcome-email** column.
    <img src="{% asset_path rackspace-email-archiving/add-and-edit-archive-users/add-edit-user-pic.png %}" />

3.  When you have entered the users, save the **Archive Users**
    worksheet as a CSV file.

4.  Return to the **CSV Import** page in the Archive
    Manager.

5.  Click **Browse** and locate the CSV file.

6.  Click **Open** to specify the CSV file.

7.  The users are added, and the Welcome Email is sent to the specified address.

   **Note**: When bulk-adding users, the **End User** role is assigned by default.


### Edit archive user settings

To edit an Archive User’s role, use the following steps:

1.  Click **Users**, check the box by the user’s name, and then click **Roles** on the top right.

2.  After selecting a new role, click **Add** to save changes.

To remove a role, use the following steps:

1.  Click **Roles** and check the box for the current role.

2.  Click **Remove**.

To edit the settings for an archive user, use the following steps:

1.  Click **Users** on the left, and then click **Edit** for the specific user.

2.  Edit specific user information as needed and then click **Save**.
