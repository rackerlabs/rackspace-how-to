---
permalink: change-the-password-for-a-mysql-database-user-on-cloud-sites/
audit_date:
title: Change the password for a MySQL database user on Cloud Sites
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2015-05-05'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

This article provides instructions for changing the password for a user
of the MySQL database that is attached to your Cloud Sites website.

### Prerequisites

To perform these steps, you must have administrative access to the
Rackspace Cloud.

### To change the password for a database user

1.  Log in to the [Cloud Sites Control Panel](http://manage.rackspacecloud.com/pages/Login.jsp "http://manage.rackspacecloud.com/pages/Login.jsp").
2.  In the left navigation pane, click **Hosting > Cloud Sites**.
3.  Click the name of the website that owns the database that you want
    to modify.
4.  Click the **Features** tab.
5.  In the **Databases** section, click the name of the database that
    you want to modify.
6.  On the Database Information page, scroll to the **Database
    Users** section.
7.  In the list of available users, click the hyperlink of the user
    whose password you want to change.
8.  In the **Password** box, enter a password that is at least eight
    characters long and contains at least one of each of the following
    character types:

    -   Uppercase alphabetic character (A-Z)
    -   Lowercase alphabetic character (a-z)
    -   Numeric character (0-9)

    **Note:** For maximum security, your password should not be a
    dictionary word or anything that can be easily guessed.

9.  In the **Confirm Password** box, retype the new password.
10. Click **Save**.

    If you mistyped the password in the **Confirm Password** box, you
    are informed that your passwords do not match. Repeat steps 8-10.

11. Repeat these steps for each database user whose password you want
    to change.
