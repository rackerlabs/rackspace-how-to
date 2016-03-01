---
node_id: 2037
title: Rackspace Cloud Backup overview
type: article
created_date: '2012-08-22'
created_by: Rackspace Support
last_modified_date: '2016-01-05'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

**Note:** Cloud Backup works only on Rackspace Cloud Servers.

Rackspace Cloud Backup [product
page](http://www.rackspace.com/cloud/backup/) is a file-based backup
application that lets you choose which files and folders to back up from
your cloud server. You can choose to restore your whole system with all
of its folders and files, restore individual files or folders from a
given date, or restore to an entirely different server.

Following are the key features of Cloud Backup:

-   Select the files and folders from your cloud server that you want to
    back up
-   Run your backups manually or on a schedule that works for you
-   See the activity from all your backups, both current and previous
-   Use AES-256 encryption with a private encryption key known only to
    you
-   Restore individual files and folders from a particular date
-   Save space with incremental backups that save only the changed
    portions of files
-   Create unlimited backups

Cloud Backup does not take snapshots of your server. To read more about
how Cloud Backup differs from snapshots, see [Rackspace Cloud Backup vs.
Cloud Server Image
Backups](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups "Rackspace Cloud Backup vs. Cloud Server Image Backups")
or [Best Practices for Backing Up Your Data: Cloud Block Storage versus
Cloud
Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup)
for backup consideration on your General Purpose server.

As a best practice for web servers and database servers, we recommend
using Cloud Backup on the following directories:

-   Web applications under `/var/www`
-   Database dumps under `/var/lib/mysqlbackup`
-   User data under `/home`
-   Systems configuration files under `/etc`

For more information, see [Best Practices for Cloud
Backup](/how-to/best-practices-for-cloud-backup)
and the [Cloud Backup
FAQ](/how-to/cloud-backup-faq)
or visit Cloud Backup's [main product
page](http://www.rackspace.com/cloud/backup/).

Following are a list of articles to help you get started with
Cloud Backup:

-   [How to install the Cloud Backup Agent on Linux
    servers](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
-   [How to install the Cloud Backup Agent on Windows
    servers](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
-   [How to create a
    backup](/how-to/rackspace-cloud-backup-create-a-backup)
-   [How to view backup
    information](/how-to/rackspace-cloud-backup-view-backup-information)
-   [How to use the backup actions
    menu](/how-to/rackspace-cloud-backup-backup-actions)
-   [How to use the system actions
    menu](/how-to/rackspace-cloud-backup-system-actions)
-   [How to manage your notification
    preferences](/how-to/rackspace-cloud-backup-preferences)
-   [How to troubleshoot common
    issues](/how-to/cloud-backup-troubleshooting)

### Next step

If you have the Managed Operations service level, you might already have
the agent installed on your server. You will know you have the agent
when you see your cloud servers listed under **Systems** in the
Rackspace Cloud Control Panel. If the agent is not already installed, we
can install it for you. Check with your account manager and jump ahead
to [Create A
Backup](/how-to/rackspace-cloud-backup-create-a-backup).

Other users should begin with installing the backup tool:

-   [Install the Cloud Backup agent on
    Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
-   [Install the Cloud Backup agent on
    Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
