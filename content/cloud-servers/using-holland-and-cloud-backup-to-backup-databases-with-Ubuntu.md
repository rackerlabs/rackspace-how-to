---
permalink: using-holland-and-cloud-backup-to-backup-databases-with-Ubuntu
audit_date: '2019-01-30'
title: Use Holland and Cloud Backup to back up databases with Ubuntu
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

   **Note:** Replace `xUbuntu_XX.XX` with the version of Ubuntu that you are using. For example, for Ubuntu 13.04, you use
   `xUbuntu_13.04`.

2. Open the list file **/etc/apt/sources.list.d/holland.list** in a text editor and add the following line:

       deb http://download.opensuse.org/repositories/home:/holland-backup/xUbuntu_XX.XX/ ./
       
   **Note:** Replace `xUbuntu_XX.XX` with the version of Ubuntu that you are using.
   
   Save and close the file.
   
3. Run the following commands to update and install Holland:

       apt-get update
       apt-get install holland-common holland-mysqldump
   

### Configure Holland

A couple of things need to be in place to make your life easier. If you do not already have a .my.cnf file in your /root/ directory, you should create one, that file should look like this:
 
 [client]

  user=root

  password=yourpasswordhere

As well, if you don't make any configuration changes, the default location for your backups will be /var/spool/holland/
If you're looking to change this, you would edit the file /etc/holland/holland.conf file and look for this line:
backup_directory = /var/spool/holland
Feel free to change this as you see fit. We'll just leave it there as is.
Last bit of configuration changes to consider, if you're wanting to have multiple backups present in your backups directory, check out the file /etc/holland/backupsets/default and look for the line
backups-to-keep = 1
Feel free to change this as you see fit!
Now to make sure all your configs are correct run the following command:

holland bk

This should output some text for you to let you know what happened, and you should get a Backup complete message. Your holland back up directory should look like the following:
root@ubuntu:/etc/holland# ls -la /var/spool/holland/default/
total 12
  drwxrwx--- 3 root root 4096 Sep 29 19:37 .
  drwxr-xr-x 3 root root 4096 Sep 29 19:08 ..
  drwxrwx--- 3 root root 4096 Sep 29 19:37 20130929_193720
  lrwxrwxrwx 1 root root   42 Sep 29 19:37 newest -> /var/spool/holland/default/20130929_193720
  lrwxrwxrwx 1 root root   42 Sep 29 19:37 oldest -> /var/spool/holland/default/20130929_193720
Setting up scheduled holland:
Last thing we need to do with holland is to schedule a time to back up our database:
  vim /etc/crontab
This file is where you may already have some various jobs running, now the cron is customizable depending on how you want it to run, comment below if you need some help specifying a specific time, mine below as an example will run every day at 3am:
  0 3 * * * root holland bk
And voila! You're all holland out!
Cloud Backup:

All that's left to do now is backup the holland directory you specified in your holland configuration, to do that, follow this article on configuring a backup from our control panel:
http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-create-a-backup-0
The backup is now complete.  Of course to restore any of these backups is super easy now using the driveclient, and then restoring them to MySQL is as easy now as running the below command, thanks to the .my.cnf file we made earlier.

  mysql < NAMEOFBACKUP.sql
