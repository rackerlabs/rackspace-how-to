---
permalink: add-and-edit-archive-users/
audit_date:
title: Add and edit archive users
type: article
created_date: '2015-05-18'
created_by: Beau Bailey
last_modified_date: '2018-03-13'
last_modified_by: William Loy
product: Rackspace Email Archiving
product_url: rackspace-email-archiving
---

**Note:** The information contained in this article is for Cloud Office
account administrators only.

When you have completed the steps in [Logging in to the Archive
Manager](/how-to/log-in-to-the-archive-manager),
you can add additional users to the Archive Manager and assign the
following user types:

-   **Account Admin (AA)** - A role likely filled by an individual or
    group of individuals within the IT organization. Users with this
    role can create and manage users and their permissions.

-   **Search Admin (SA)** - Responsible for creating and managing
    searches. Users with this role can create new searches, edit
    existing searches, export search details, and assign search access
    to Search Users.

-   **Search User (SU)** - Responsible for reviewing the search results
    created by the Search Administrator. Users with this role cannot
    create a new search and can change the scope of a search only if
    that right has been assigned to them by the Search Administrator.

-   **End User (EU)** - Permits access to an individual user's mailbox
    archive. Users with this can review, search, or recover any of their
    own email by logging into the archive site (for example,
    `http://yourdomain.archivesrvr.com`).

You can also edit an existing user to change any of the following user
settings or information:

-   Basic contact information
-   Temporary passwords
-   Permissions
-   Archive access expiration
-   Account disabling
-   Account locking
-   Password recovery
-   Outlook integration


### Add an archive user ###

Use the following steps to add individual users to the Archive Manager.

1.  In the upper-right corner of the screen, click **Admin**.

    **Note:** There are three dashboards for top-level
    administrators: Search, Admin, and Admin User. If you do not see
    the **Admin** link, you are already on the Admin dashboard.

2.  In the Admin dashboard, click the **Users** tab.

3.  Click the **Add User** button.

4.  Enter the following information for the user:
    - User name
    - First and last name
    - Email address
    - Temporary password

    **Note:** The user will be asked to create a new password when logging in.

5. Under **Additional email addresses (any email address from which you
   receive mail, or to which you send mail)**, add email aliases or
   other addresses that the user monitors to the list. Type the email
   address in the blank and click **Add Email Address**.

6. Under **Permissions,** select the user type for the new user.

   <img src="{% asset_path rackspace-email-archiving/add-and-edit-archive-users/4683.1.png %}" width="644" height="192" />

7. Enter additional contact information.

8. Under **Account Options**, specify the following user settings:
    - **Expire Date**: Accounts for users can be set up with permanent
      or temporary access. You can specify an expiration date for
      those users whose access should be limited.
    - **Account Disabled**: Disable users from accessing
      their account.
    - **Account Locked**: Lock or unlock a user's account.
    - **Disable password recovery**: Disable the feature that allows
      users to reset their password on the login screen.
    - **Disable Outlook Integration**: Selected by default, an
      administrator can clear this check box to enable Outlook
      integration for a user.

9.  In the **Custom text** box, enter any additional verbiage that you
    want to include in the welcome message that will be sent to
    the user. You can edit the welcome message or opt not to send one.

10. Click **Add user and send welcome message**.

### Add multiple archive users ###

Use the following steps to add multiple users to the Archive Manager.

1.  Under the **Users** tab in the admin dashboard, click **Bulk Create
    End Users**.

2.  Click **Download CSV file template** and save the compressed
    folder.
    The zipped folder contains an Excel XLS file with detailed
    instructions on column rules and the required fields.

3.  When you have entered the users, save the **Archive Users**
    worksheet as a CSV file.

4.  Return to the **Create Users in Bulk** page in the Archive
    Manager.

5.  Click **Chose File** and locate the CSV file.

6.  Click **Open** to specify the CSV file.

7.  If you will be sending separate email notifications of the archive
    access, select the **Do not send welcome message** check box.

    **Note:** When users are added, a welcome message <span>that
    contains their username and password</span> is sent to their
    email address. You can edit the welcome message or opt not to send
    one.

8.  Click **Process list and send welcome message**.


### Edit archive user settings ###


To edit the settings for an archive user, select the user name from
the **Users** list and click **Edit**. Edit specific user information as
needed and then click **Save changes**.
