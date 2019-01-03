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

The following list provides the data and configuration directories commonly chosen for Cloud Backup:

- **/etc/**
- **/home/**
- **/root/**
- **/var/spool/cron**
- **/var/log/**
- **/var/www/html/** (If Apache is using default `DocumentRoot`.)
- **/var/ftp/pub/** (If `vsftp` is using default settings.)
- **/var/spool/holland** (See the following explanation about backing up databases.)

We do *not* recommend backing up **/var/lib/mysql**. Because the database is actively writting to these files, they can't be effectively backed up.

If you are running MySQL or another database server, use a database archiving tool like [Holland](https://community.rackspace.com/products/f/25/t/1638).

This creates database dumps in `var/spool/holland`, which you then add to the Cloud Backup configuration file.

Alternatively, you can configure Cloud Backup to backup the entire `/` file system and exclude individual files or directories as needed.
