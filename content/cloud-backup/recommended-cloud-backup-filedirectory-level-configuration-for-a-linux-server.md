---
permalink: recommended-cloud-backup-filedirectory-level-configuration-for-a-linux-server/
audit_date:
title: Recommended Cloud Backup file or directory level configuration for a Linux server
type: article
created_date: '2014-08-05'
created_by: Chris Goldsmith
last_modified_date: '2016-04-11'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

The following is a list of the most common data and configuration directories typically used for Cloud Backup:

- **/etc/**
- **/home/**
- **/root/**
- **/var/spool/cron**
- **/var/log/**
- **/var/www/html/** (If Apache is using default DocumentRoot.)
- **/var/ftp/pub/** (If `vsftp` is using default settings.)
- **/var/spool/holland** (For database, backups see below.)

Backing up **/var/lib/mysql** directly is *not* recommended. These are live database files that will not be effectively backed up, since they are being actively written to.

If you are running MySQL or another database server, use a database archiving tool like [Holland](https://community.rackspace.com/products/f/25/t/1638).

This creates database dumps in `var/spool/holland`, which you then add to the Cloud Backup configuration file.

Alternatively you can set the Cloud Backup to backup the entire `/` file system and exclude individual files or directories as needed.
