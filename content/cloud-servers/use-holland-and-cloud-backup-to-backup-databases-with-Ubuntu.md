---
permalink: use-holland-and-cloud-backup-to-backup-databases-with-ubuntu/
audit_date: '2019-01-30'
title: Use Holland and Cloud Backup to back up databases with Ubuntu
type: article
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-01-30'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to back up MySQL&reg; databases with Ubuntu&reg; by using Holland and Cloud Backup. 

### Install Holland

1. Get the release key for Holland by running the following command:

       wget http://download.opensuse.org/repositories/home:/holland-backup/xUbuntu_XX.XX/Release.key -O - | sudo apt-key add -

   **Note:** Replace `xUbuntu_XX.XX` with the version of Ubuntu that you are using. For example, for Ubuntu 13.04, use
   `xUbuntu_13.04`.

2. Open the list file **/etc/apt/sources.list.d/holland.list** in a text editor and add the following line:

       deb http://download.opensuse.org/repositories/home:/holland-backup/xUbuntu_XX.XX/ ./
       
   **Note:** Replace `xUbuntu_XX.XX` with the version of Ubuntu that you are using.
   
   Save and close the file.
   
3. Run the following commands to update and install Holland:

       apt-get update
       apt-get install holland-common holland-mysqldump
   

### Configure Holland

Before you configure Holland for your backups, ensure that you have a **.my.cnf** file in your **/root/** directory.
If you don't have that file, create one and enter the following information:

     [client]

      user=root

      password=yourpasswordhere

The default location for your backups is **/var/spool/holland**. If you want to store your backups in a different
location, open the **/etc/holland/holland.conf** file in a text editor and edit the following line:

    backup_directory = /var/spool/holland

Holland stores only one backup in the backup directory by default. If you want to have multiple backups in your backup
directory, open the **/etc/holland/backupsets/default** file in a text editor and edit the following line:

    backups-to-keep = 1
    
To ensure that all of your configuration settings are correct, run the following command:

    holland bk

Your Holland backup directory should now look similar to the following example:

    total 12
      drwxrwx--- 3 root root 4096 Sep 29 19:37 .
      drwxr-xr-x 3 root root 4096 Sep 29 19:08 ..
      drwxrwx--- 3 root root 4096 Sep 29 19:37 20130929_193720
      lrwxrwxrwx 1 root root   42 Sep 29 19:37 newest -> /var/spool/holland/default/20130929_193720
      lrwxrwxrwx 1 root root   42 Sep 29 19:37 oldest -> /var/spool/holland/default/20130929_193720

### Schedule Holland backups

You can use Holland to schedule regular backups of your database. To do so, open the **/etc/crontab** file and add a new
cron job. The following example tells Holland to run a backup every day at 3:00 am: 

    0 3 * * * root holland bk

The following syntax forms a cron job:

    Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6) Command_to_execute
    
You can set your scheduled backup to run as frequently as you want.

### Back up Holland by using Cloud Backup

For instructions about how to back up your Holland backup files to Rackspace Cloud Backup, see
[Create a backup](/how-to/rackspace-cloud-backup-create-a-backup).
