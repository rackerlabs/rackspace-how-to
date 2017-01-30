---
permalink: rackspace-cloud-sites-essentials-phpmyadmin-database-management-interface/
audit_date:
title: Rackspace Cloud Sites Essentials - PHPmyAdmin Database Management Interface
type: article
created_date: '2011-03-15'
created_by: Rackspace Support
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

Now that you've successfully created your first MySQL database, lets
take a look at the database management tool The Rackspace Cloud offers
for Cloud Sites MySQL databases.

Manage your MySQL databases with a server wide install of PHPmyAdmin.
You can reach this interface at one of the following URLs, depending
on the datacenter housing your database:

-   DFW
    1-1: [https://mysql.dfw1-1.websitesettings.com](https://mysql.dfw1-1.websitesettings.com/)
-   DFW
    1-2: [https://mysql.dfw1-2.websitesettings.com](https://mysql.dfw1-2.websitesettings.com/)
-   ORD
    1-1: [https://mysql.ord1-1.websitesettings.com](https://mysql.ord1-1.websitesettings.com/)

**Which datacenter is my database located in?**

To find out if your account is located in our ORD or DFW datacenter,
check the test link for your site. If your testlink includes **DFW** in
the URL, such as **www.domain.com.php5-2.dfw1-1.websitetestlink.com** then
your account is in DFW.

**Note:** Alternatively, you can download use other programs such
as [MySQL Gui Tools (Free: Windows, Mac, Linux)](http://dev.mysql.com/downloads/gui-tools/5.0.html), [SQLyog](http://www.webyog.com/) or [Navicat](http://www.navicat.com/),
from their respective providers, to manage your MySQL databases as
well.

**How do I log in to PHPmyAdmin?**

1. Log in to the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com).
2. Navigate to **Hosting > Cloud Sites**.
3. Click the **domain name** that the database exists under.
4. Click the **Features** tab.
5. Confirm that the database is active by scrolling to the
    **Databases** section. If the database is active. it will have a
    green check mark in the Status column.
6. To view the details, click the hyperlink for the database.
7. The server name is listed as **Hostname** under the **Database
   Information** section.
8. The user names are listed under the **Database Users** section.
   By default, there is only one user and this would be the user
   name you would use to log in to phpMyAdmin.

   **Note:** If there are multiple users listed, you may log in with any
   of them. The number that prefixes the user name is the account number
   for the website owner (yourself or your client) and is important when
   logging in, so be sure to enter the user name exactly as it is listed
   on this page.

   The password is the password associated with the database user,
   which would have been chosen when you created the database and
   database user. Because this user is separate from your Control Panel
   account and FTP users, the password may or may not be the same as
   those users.

   If you cannot remember your database password, you can reset
   the password by clicking the user in the list and filling out
   the password form; however, **be aware that your website code may
   rely on the existing password, so changing the password for a
   database user could cause database connection errors on your website!**

   If you are working with a live website and cannot risk this password
   reset, contact a [web developer](/how-to/rackspace-cloud-sites-essentials-mylittleadmin-database-management-interface)
   for assistance.

**Work with the database**

With the information described above, you're ready to start working
with the database. Use the following steps to begin using the database.

1. Click the **Online Manager** link.

   A phpMyAdmin interface will display in the browser.

2. Enter the **user name** (including the numbered prefix) and password.
3. Select the **Hostname** (on the details page) from the drop-down list.

   **Note:** The first part of the host name identifies the server
   choice.

   **Note:** The server choices shown in the drop-down list may be
   different than what is shown in the screen shot above.

Now that you are logged in to phpMyAdmin, you can manage your MySQL database
as necessary.

**What do I do if my log in fails?**

Make sure to double-check the credentials you have entered for accuracy.

**OR**

Hard refresh your browser's cache by hitting Ctrl+F5 (PC) or CMD+Shift+R
(Mac) and re-enter your credentials.

**OR**

Reset your password in the Control Panel for your database user name.

**AND THEN**

If you have completed all of the above and you still cannot log in,
contact support through our 24-hour Live Chat support, or by opening a
new ticket.

### Next section

[MSSQL databases](/how-to/rackspace-cloud-sites-essentials-mssql-databases)
