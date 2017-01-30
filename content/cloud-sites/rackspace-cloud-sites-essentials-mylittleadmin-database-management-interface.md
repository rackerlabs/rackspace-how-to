---
permalink: rackspace-cloud-sites-essentials-mylittleadmin-database-management-interface/
audit_date:
title: Rackspace Cloud Sites Essentials - MyLittleAdmin Database Management Interface
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

Rackspace Cloud Sites has made it easy to manage your MSSQL 2012 or
2014 databases by creating a server-wide install of a tool called
myLittleAdmin.

You can reach this interface at:

-   DFW 1-1: <https://mssql.dfw1-1.websitesettings.com/mla/>
-   DFW 1-2: <https://mssql.dfw1-2.websitesettings.com/mla/>
-   ORD: <https://mssql.ord1-1.websitesettings.com/mla/>

**Note:** To find out if your account is located in our ORD or DFW
datacenter, check the test link for your site. If your testlink includes
**DFW** in the URL, such as **www.domain.com.php54-2.dfw1-1.websitetestlink.com** then your account is
in DFW.

When logging into myLittleAdmin, you will need to make sure to select
the correct server choice from the drop down menu. You can find the
correct value within the control panel on the **View Database** page.

**Note:** Alternatively, you can use other programs such as Management
Studio Express or Enterprise Manager to manage your MSSQL databases as
well.

### Log into myLittleAdmin

1.  Log in to the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com).
2.  Navigate to **Hosting > Cloud Sites**.
3.  Click the **domain name** that the database exists under.
4.  Click the **Features** tab.
5.  Confirm that the database is active by scrolling to
    the Databases section. If the database is active it will display a
    green check mark icon in the status column.

To start working with this database, you will need the **Hostname**,
**username** and **password**. The details can be viewed by clicking on
the hyperlink for the database.

-   The Server Name is listed as **Hostname** under
    the Database Information section.
-   The Login is the **username**.

**Note:** The usernames are listed under the Database Users section. By
default, there is only one user and this would be the username you would
use to log in to myLittleAdmin. If there are multiple users listed, you
may log in with any of them. The number that prefixes the username is the
account number for the website owner (yourself or your client)
and is important when logging in, so be sure to enter the username
exactly as it is listed on this page.

The **password** is the password associated with the database user,
which would have been chosen when you created the database and database
user.

**Note:** Because this user is separate from your control panel account
and FTP users, the password may or may not be the same as those users.
If you cannot remember your database password you can reset the password
by clicking on the user in the list and filling out the password form;
however, please be aware that your website code may rely on the existing
password, so changing the password for a database user could cause
database connection errors on your website! If you are working with a
live website and cannot risk this password reset, please contact a web
developer for assistance.

With the above information, you're ready to start working with the
database.

1.  To do so, click on the **Online Manager link**.
2.  A myLittleAdmin interface will display in the browser. Select the
    correct **Server Name**--which is the Hostname from the details
    page**, as outlined above--from the drop down list.
3.  Enter the **database name** (including the numbered prefix as
    shown below).
4.  Enter the **login**--which is one of the Usernames from the details
    page, as outline above--(including the numbered prefix as
    shown below).
5.  Finally, enter the **password** for this database user and
    click **Connect**.
6.  Now that you're logged in to myLittleAdmin, you can manage your MSSQL
    database as necessary.

### Backing Up Your MSSQL Database

1.  After you are logged in to the online manager, click **Tools** in
    the bottom of the left frame.

2.  Then on the **Tools** menu, click **Database Backup and Restore**.

    This will open the myLittleBackup interface in a new window.

3.  From myLittleBackup, click **Backup databases** from the left
    menu.

    The database backup form will load in the window's right frame.

4.  In Step 1, choose the database you would like to backup from the
    drop-down menu (which should be the only one listed) and click **OK** to
    continue.

5.  Step 2 is just for information and verification; you will find
    generic information about your database in this step. Keep in mind
    that the backup process duration depends on the database size you
    see in this step. Since you only have one database you can just
    click **OK**.
    -   **Note:** If you see the notification (*There are too many
        backup files in your backup folder*), it means you all ready
        have a backup file saved in myLittleBackup.

6.  Step 3 is **optional**, but feel free to choose a backup set name
    and description.

    If you don't want choose a backup set name and description or you're
    not sure what to use, just leave it blank or use the database name
    for both.

7.  If everything above looks correct, click the **Backup** button in Step 4.

    During this time you will see a loading message on the screen.
    Take heed of the warning myLittleBackup gives: **You're now
    ready to backup your database. The process can take several minutes.
    Be patient and do not click the stop button until done.**

### Summary

Congratulations! You have just created a backup of your MSSQL database!
You should now see a link to download your database backup in Step 5.

If you experience a problem or you have further questions or concerns,
please do not hesitate to contact our technical support 24x7 via phone,
chat or by submitting a ticket through your control panel.

This concludes the series on adding and managing your databases for
Cloud Sites. We've discussed how to create a new MySQL database, a MSSQL
database and connect to the online interface offered by the Rackspace
Cloud, and how to perform database backups. In the next series, we will
dive into the different web services offered in Cloud Sites.

### Next section

[Cloud Sites Technologies](/how-to/rackspace-cloud-sites-essentials-cloud-sites-technologies)
