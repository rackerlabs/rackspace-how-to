---
permalink: restore-your-mssql-database-with-mylittleadmin/
audit_date:
title: Restore your MSSQL database with myLittleAdmin
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

Follow the instructions below to restore your MSSQL database.

**Note:** The Rackspace Cloud recommends using Internet Explorer when managing your MSSQL databases via myLittleAdmin.

### Restoring Your MSSQL Database

1.  To manage your MSSQL database, you'll first need to [log in to the online manager (myLittleAdmin).](/how-to/rackspace-cloud-sites-essentials-mylittleadmin-database-management-interface)

2.  After you are logged into the online manager, click on **Tools** in
    the bottom of the left frame.

3.  Then on the **Tools** menu, click **Database Backup and Restore**.

    This will open the myLittleBackup interface in a new window.

4.  From myLittleBackup, click on **Restore databases** from the
    left menu.  The database restore form will load in the window's
    right frame.

5.  In step 1, choose the database you would like to restore from the
    drop-down menu (which should be the only one listed) and click OK to
    continue.

6.  Step 2 is just for information and verification; you will find
    generic information about your database in this step. Since you only
    have one database you can just click OK.

7.  In step 3, you will select the backup file to use when restoring
    the database. If you do not have a backup file prepared, you can
    upload one by clicking the **Browse** button.

    You can follow the upload progress on the screen; the length of time
    it takes to upload will vary depending on your location and internet
    connection.

    After the upload completes, select the file from the list and click
    **OK** to continue.

    **Note:** If you have a backup file available, you may have noticed that the upload form in the first image above is *grayed out*, preventing its use. This is because The Rackspace Cloud allows you to store 1 backup of your database in the web utility at any time.

8.  MSSQL backup files can contain multiple backup sets, but in
    myLittleBackup only one set can be restored. In step 4, you will
    select the backup set to use for the restore. Here we are restoring
    a backup file that only has a single backup set, so we just click **OK**.

    **Note:** If you receive an error during either of the next two
    steps you may need to logout and back in to complete the restore.
    You can do so under "Connection/Disconnect".

9.  If everything above looks correct, you're ready to click the
    **Restore** button in Step 5.

    During this time you will see a loading message on the screen.
    Please take heed of the warning myLittleBackup gives: **You're now
    ready to restore your database. The process can take
    several minutes. Be patient and do not click the stop button
    until done.**

10. A message box will alert you that what you are doing will overwrite
    the contents of your database. Because this is a crucial operation,
    we want you to realize the repercussions of what you are doing.
    Review the statements in the message and if you agree, click OK
    to continue.

### Summary

Congratulations! You have just restored a backup of your MSSQL database!

**Note:** If you receive a notification that some database users were not mapped successfully, this is generally considered normal. It's a logical assumption that the MSSQL usernames on your previous MSSQL server or previous hosting provider will not match the MSSQL logins you are provided here at The Rackspace Cloud. You may need to correct this by creating logins in your control panel and mapping the database users to these new logins; you can do so by [following this guide](/how-to/remap-database-users-in-mylittleadmin).

If you experience a problem or you have further questions or concerns,
please do not hesitate to contact our technical support 24x7 via phone,
chat or by submitting a ticket through your control panel.
