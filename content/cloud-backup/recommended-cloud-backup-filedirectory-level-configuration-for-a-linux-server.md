---
node_id: 4169
title: Recommended Cloud Backup file/directory level configuration for a Linux server
type: article
created_date: '2014-08-05'
created_by: Chris Goldsmith
last_modified_date: '2014-08-07'
last_modified_by: Chris Goldsmith
product: Cloud Backup
product_url: cloud-backup
---

The following is a list of the most common data and config directories typically used for Cloud Backup:

* /etc/
* /home/
* /root/
* /var/spool/cron
* /var/log/
* /var/www/html/ (If Apache is using default DocumentRoot.)
* /var/ftp/pub/ (If vsftp is using default settings.)
* /var/spool/holland (For database, backups see below.)

**Note**: Backing up /var/lib/mysql directly IS NOT recommended. These are live database files that WILL NOT be effectively backed up, since they are being actively written to.

If running MySQL or other database server, use a database archiving tool like [Holland](https://community.rackspace.com/products/f/25/t/1638).

This will (by default) create database dumps in `var/spool/holland` and you would add that to the Cloud Backup configuration file.

Alternatively you can set the Cloud Backup to backup the entire `/` file system and exclude as needed for example `/var/lib/mysql`.
