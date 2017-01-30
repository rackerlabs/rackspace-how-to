---
permalink: prepare-to-migrate-a-linux-server/
audit_date:
title: Prepare to migrate a Linux server
type: article
created_date: '2012-03-13'
created_by: Jered Heeschen
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article provides recommended actions that you can perform before
you migrate your Linux server to mitigate common issues and optimize
your server for a faster transition. These recommendations are based on
common issues identified by our support technicians, but these are not
mandatory. Some of these recommendations can cause significant downtime,
so you should schedule them accordingly.

For Windows migration preparation, see [Prepare to migrate a Windows server](/how-to/prepare-to-migrate-a-windows-server).

### Back up your data

Before you perform any migration, create a file-level backup of
important data. You can use Rackspace Cloud Backup to automate the
storing and retrieving of backup data from Cloud Files, or you can use
rsync to copy your data to another server.

-   [Rackspace Cloud Backup - Install the agent on Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
-   [Backing up your files with rsync](/how-to/backing-up-your-files-with-rsync)

### Prepare for a system reboot

It's good practice to shut down your server during the final stages of a
migration to safely copy dynamic content to the new host. During a
Rackspace-automated migration, the server is usually shut down for this
purpose.

Ensure that your server will reboot quickly and safely when the
migration completes.

### General preparation

The following tasks help to avoid issues with server time and the size
of the disk space on the server.

#### Set accurate time via NTP

Some older cloud servers pull time from their host machine instead
of keeping time independently from the host. Unfortunately, the time set
on these hosts can be inaccurate. To avoid migration issues related to
the server date or file time stamps, set up and configure Network Time
Protocol (NTP) on your server.

For details on setting up NTP on your server, see [Using NTP to sync time](/how-to/using-ntp-to-sync-time).

#### Reduce number and size of files

You can reduce the time required for a migration and improve the
reliability of a resulting image by reducing the number and size of
files that might change during the migration operation.

#### Lock databases

If a database changes during a migration, data could be lost data or the
database in the image could be corrupted.

We recommend that you bring the database down entirely for the
migration. If that isn't practical, however, make your tables read-only
so that they won't be written to during the operation.

To lock your tables in MySQL, run the following command:

    mysql -u root -p --execute="FLUSH TABLES WITH READ LOCK"

### Postmigration tasks

After a migration is complete and your new server starts, you should
test your web sites and applications. Ensure that applications are
responsive and that they can write information to their databases.

If you have any services that need to communicate to other servers,
explicitly test their connectivity to ensure that they still talk to
each other.
