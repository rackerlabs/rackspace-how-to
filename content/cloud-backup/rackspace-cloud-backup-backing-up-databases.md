---
permalink: rackspace-cloud-backup-backing-up-databases/
audit_date:
title: Back up databases with Cloud Backup
type: article
created_date: '2012-08-23'
created_by: David Hendler
last_modified_date: '2016-07-19'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

Rackspace Cloud Backup backs up files if it can get access to them. It
doesn't matter if the files contain database data or pictures of your
cat. Files are files.

But some applications, like databases, are more difficult to back up 
because of multiple, rapidly changing files, whose state must be 
synchronized. For instance, if Rackspace Cloud Backup backs up one of the
database's files and then, a few seconds (or milliseconds) later, it
backs up another one, the state of the database could get corrupted -
the database might have been in the middle of an operation during access
to the two files, and the two files represent two different points in
the middle of that operation.

You can use Rackspace Cloud Backup to backup your database by following
a few steps.

### Back up your database

Most databases have a utility that dumps a consistent state of the
database to another file; `mysqldump` is one such utility for MySQL. You
can safely back up a database using Rackspace Cloud Backup by running
such a utility before doing the backup. Then back up the output of
the utility, instead of the internal files that the database manages. Some
customers use a utility like `cron` to regularly schedule database
dumping, and then schedule Rackspace Cloud Backup to automatically back
up the output of this utility a couple of hours later.

Cloud Backup's de-duplication and compression capabilities save space and
storage costs because there is generally a lot of duplicated data
between the various dumps that were put into the **sqlbackups** folder.
Cloud Backup only saves the changed portions of the file. Because of this, 
you should *never* compress or encrypt the database files you are backing up.

1.  Remove the live database folder and files from your backup job.

    1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
    2.  In the top navigation bar, click **Backups > Systems**.
    3.  Select your system from the List.
    4.  Click the gear icon next to your backup job in the backup list,
        and select **Configure Files**.
    5.  Navigate to your database folder and unselect it.
    6.  Click the **Save Changes** button.

2.  Dump your database. For example, using `mysqldump`, go to your
    database and enter the following code:

        mysqldump -u root -p mytestdb > /my_directory/mytestdb.sql

3.  Add your SQL dump file to your backup.

    1.  In the top navigation bar of the Cloud Control Panel, click
        **Backups > Systems**.
    2.  Select your system from the list.
    3.  Click the gear icon next to your backup job in the backup list,
        and select **Configure Files**.
    4.  Navigate to your database backup folder and select it.
    5.  Click the **Save Changes** button.

Remember to add your database dump file or folder saved as part of your
backup job. You can automate this task by scheduling these dumps with applications like **crontab** on Linux or **Task Scheduler** on Windows.

**Warning:** If you use automated dumps, schedule them far enough ahead of your backup to allow them plenty of time to finish before the backup starts. Otherwise, you might experience file corruption or missing files in your backups.
