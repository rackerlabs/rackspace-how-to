---
permalink: managing-backups-for-cloud-databases/
audit_date:
title: Manage Backups for Cloud Databases
type: article
created_date: '2014-01-15'
created_by: Rackspace Support
last_modified_date: '2016-06-09'
last_modified_by: Kyle Laffoon
product: Cloud Databases
product_url: cloud-databases
---

### Introduction

Cloud Databases offers multiple ways to backup and restore your database. This article outlines how to create On-Demand backups and view backups for Cloud Databases instances. In addition, Cloud Databases allows automatic [scheduled backups](/how-to/scheduled-backups-for-cloud-databases) How-To article.

Below are some quick facts about Cloud Databases backups:

- Cloud Databases uses the [Percona Xtrabackup](https://www.percona.com/software/mysql-database/percona-xtrabackup) utility to create a hot backup of your database while minimizing write-locking of the database during the backup process.
- Backup files for Cloud Databases are stored in Cloud Files and billed at the standard [Cloud Files rate](https://www.rackspace.com/en-us/cloud/public-pricing#cloud-files).
- Backups created by Cloud Databases will remain in your Cloud Files account until you delete them, except for scheduled backups which are automatically cleaned up based on a set retention period.
- Even if the instance associated with a backup is deleted, the backup will remain until you delete it and restore it to a new Cloud Databases instance.
- The backup process for [High Availability instance groups](/how-to/high-availability-for-cloud-databases) always attempts to backup from a replica rather than the master instance.


### Create a Backup

To create backup of a database instance, click the gear icon next to
the name of the instance you want to backup, and select **Create
Backup**.  Once selected, a dialogue box will open, asking for a backup
name and description.

-   The name of the backup is required, and the maximum length for the
    name is 64 characters.
-   Backups are stored directly in your Cloud Files account and you will
    be charged for the storage used.  Standard rates for Cloud Files
    storage fees apply.


**WARNING**:  The behavior of your instance during a backup depends on
the storage engine that you are using for tables.  If you use only
InnoDB, write access to your database instance is not suspended.
Conversely, if you have MyISAM tables, those databases are write-locked
during the backup process.

**Things to Consider**

-   While the instance is being backed up you will not be able to
    add/delete databases, add/delete users, or delete/stop/reboot
    the instance.
-   You can only run one backup at a time. Duplicate requests will
    receive a 422 error.
-   Backups are not deleted when the instance is deleted. You must
    delete any backups that are not required.
-   During a backup, the backup files will be saved directly to your
    Cloud Files account. The process creates a container called
    z\_CLOUDDB\_BACKUPS and places all the files in it. In order for the
    restore and deletion of backups to work properly, you should not
    move, rename, or delete any of the files from this container.


### List Details of all backups for the account

To view list of all the backups, you can click on the **Backups** link
in the top menu row next to **MySQL Instances**. You will see the
following details for your backups:


-   The Backup Name assigned by the user.
-   The instance that was backed up.
-   The date the backup was created.
-   The most recent date the backup was updated.

You can also filter the backups for different regions by clicking on the
**Regions** filter from the drop-down.

### List Details of All Backups for an Instance

To view all the backups for an instance, click on the instance name to
view the Instance Details page.  There is a link for all the backups
associated for that instance.

<img src="{% asset_path cloud-databases/managing-backups-for-cloud-databases/ListDetailsInstance.png %}" width="611" height="471" />

### Delete a Backup

To delete a backup you can click on the gear icon next to the backup
name.

You can also delete any backups for an instance from the **Instance
Details** page.

### Restore a Backup

To restore a backup, click on the gear icon next to the backup name.

You can also restore any backup for an instance from within the Instance
Details page.

Once the option to restore a backup has been selected, you will be
prompted to enter the instance name, flavor, and volume size of the
backup that needs to be restored.  The volume size will be set by
default to the value of the original size of the database before the
backup.  You must specify a volume greater than that of the original
size of the database.

All user accounts, credentials, and access permissions that were saved
on the instance at the time of the backup will be restored along with
the databases. Once restored, you can create new users or databases, but
they cannot be the same as the ones from the instance that was backed
up.
