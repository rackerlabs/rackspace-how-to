---
permalink: recommended-cloud-backup-filedirectory-level-configuration-for-a-linux-server/
audit_date: '2019-01-04'
title: Recommended Cloud Backup file or directory level configuration for a Linux server
type: article
created_date: '2014-08-05'
created_by: Chris Goldsmith
last_modified_date: '2019-01-04'
last_modified_by: Cat Lookabaugh
product: Cloud Backup
product_url: cloud-backup
---

The following list provides some data and configuration directories commonly chosen for 
Cloud Backup for a Linux&reg; server:

- **/etc/**
- **/home/**
- **/root/**
- **/var/spool/cron**
- **/var/log/**
- **/var/www/html/** (If Apache is using the default `DocumentRoot`.)
- **/var/ftp/pub/** (If `vsftp` is using the default settings.)

We don't support or recommend backing up active databases or directories such as **/var/lib/mysql**. 
Because the live database is actively writing to these directories, the files can't be effectively 
backed up. 

To back up a database, see the article on [backing up databases](/how-to/rackspace-cloud-backup-backing-up-databases).

Instead of listing specific files and directories to back up, you can configure Cloud Backup to back up 
the entire file system and exclude individual files or directories as needed.

For more information, see [Best practices for Cloud Backup](https://support.rackspace.com/how-to/best-practices-for-cloud-backup/).
