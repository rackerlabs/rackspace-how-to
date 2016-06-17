---
permalink: backup-your-mssql-database-with-mylittleadmin-on-cloud-sites/
audit_date:
title: Backup your MSSQL database with myLittleAdmin on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

Follow the instructions below to backup your MSSQL database.

**Note:**

- The Rackspace Cloud recommends using Internet Explorer when
  managing your MSSQL databases via myLittleAdmin.

- Cloud Sites only allows one backup file to be stored at
  one time. If you have an existing backup file, use the
  Manage Backup Files feature to delete it before creating a
  new one.

### Backing Up Your MSSQL Database

1.  To manage your MSSQL database, you'll first need to [login to the
    online
    manager [myLittleAdmin](/how-to/rackspace-cloud-sites-essentials-mylittleadmin-database-management-interface "Working with a MSSQL database").

2.  After you are logged into the online manager, click on **Tools** in
    the bottom of the left frame.

3.  On the **Tools** menu, click **Database Backup and Restore** to open
    the myLittleBackup interface in a new window,

4.  In myLittleBackup, click **Backup databases** from the left
    menu.

    The database backup form loads in the window's right frame.

5.  Choose the database you would like to backup from the
    drop-down menu. Then, click **OK**.

6.  Review and verify the database information. Then, click **OK**.

    Check the database size. The larger the database, the longer
    it will take to complete the backup process.

    **Note:** If you see the notification ``There are too many
    backup files in your backup folder``, it means you already
    have a backup file saved in myLittleBackup. You need to delete that
    backup befoe you can create a new one.

7.  Optional, change the backup set name and description.

    If you don't want provide a backup set name and description, or you
    are noot sure what to specify, leave the fields blank or use the database name
    for both.

8.  To start the back up process, click **Backup**.

    During the backup process, a loading message displays on the screen
    with the following warning message:  

    ``You're now ready to backup your database. The process can take
      several minutes. Be patient and do not click the stop button until done.``

9.  To download your database backup, click the link that displays after the backup
    process completes.

If you have any problems, questions or concerns, contact our technical support 24x7 by phone,
chat, or by submitting a ticket through the control panel.
