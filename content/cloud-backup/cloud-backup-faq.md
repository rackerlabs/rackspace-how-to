---
permalink: cloud-backup-faq/
audit_date:
title: Cloud Backup FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2016-04-05'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

### Account Services

#### Why do I get a 403 error when trying to migrate a vault?

When you use the API endpoint to migrate an existing vault to a new
agent, the new agent should not be configured with any new backup
configurations of its own.

You also cannot migrate an encrypted vault.

See [Migrate Vault API call](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#migrate-vault)
for a description.

#### Why does my backup fail with the error: `container does not exist Invalid snapshot id and engine, and check config_backup.json id.`?

The Cloud Files container named **z_DO_NOT_DELETE_CloudBackup** is
required for Rackspace Cloud Backup to work properly. If this container
is deleted, you will receive the error, `Container does not exist.
Invalid snapshot id and engine, and check config_backup.json id` when
you attempt to do a backup.

There are two causes for this error:

1.  The user has deleted the Cloud Files container where their backups
    are stored.
2.  Clicking the View Configuration link does not display the
    JSON configuration. The common cause of this is that the customer
    has backup configurations that are in a corrupted state.

To resolve this error, *do not delete* the **z_DO_NOT_DELETE_CloudBackup** container in your Cloud Files account; it is used for backup. If you have accidentally deleted this container, contact Rackspace Support.

------------------------------------------------------------------------

### Backups

#### What is Rackspace Cloud Backup?

Rackspace Cloud Backup is a service that allows you to select and back up
specific files and folders from your Cloud Server. You can schedule any
number of Backup jobs, and restore to the same system or a different
one, giving you the flexibility and power to work with your schedule and
your data.

Some key features are

-   Select the files and folders from your Cloud Server you want to back
    up
-   Run your backups manually or on a schedule that works for you
-   See the activity from all your backups, both current and previous
-   Use AES-256 encryption with a private encryption key known only to
    you
-   Restore individual files and folders from a particular date
-   Save space with incremental backups that only save the changed
    portions of files
-   Create unlimited Backups

For information on getting started with Cloud Backup, see our [introduction for Cloud Backup](/how-to/cloud-backup).

#### Can Cloud Backup change my system config file, even after I have modified it?

Yes - Some Ubuntu users have older agents installed on their machines.
In order to communicate properly with your system, the **config** file may
need to be overwritten with a current version.

#### How does Rackspace Cloud Backup handle corrupt files?

Cloud Backup double-checks to make sure files get written properly when
backed up and restored. However, if an uploaded file is corrupt, it will
get backed up and restored as corrupted. The backup and restore
processes themselves should never corrupt files. File corruption
occurring in Cloud Files itself may render the backup unusable, should
this ever occur.

#### What happens if I lose my encryption key?

Rackspace does not store customer encryption keys. Only you will know
and be able to access your encryption passphrase. If you forget your
passphrase, you will not be able to restore data from your backups.

For more information, see the section on [Setting up encryption on your Cloud Backup system](/how-to/rackspace-cloud-backup-system-actions)
in the list of Cloud Backup actions.

#### How do I generate a Rackspace Cloud Backup Encryption key?

If you wish to create your own encrypted key and bypass the default
client-side encryption, please refer to [this article on using OpenSSL to generate a key](/how-to/generate-your-encrypted-key-in-cloud-backup).

#### Where are my Cloud Backups stored?

All of your Cloud Backups are stored in your Cloud Files account.

*But what if I never set up a Cloud Files account?*

When you established your Cloud account, a Cloud Files account was set
up as well. You are not charged storage fees for your Cloud Files
account until you begin storing things in it.

#### How many backup jobs can I have at one time?

You can create any number of backup jobs for each of your servers, and
you can include a nearly unlimited number of files in each job.

For more information, see [Creating a Backup](/how-to/rackspace-cloud-backup-create-a-backup).

#### What is deduplication?

Our block-level deduplication backs up only those portions of files
that have changed since the previous backup. This means you don't
needlessly backup the same unchanged data again and again. This
increases efficiency by reducing the amount of data that is transferred
for each backup, and reduces your storage space by not storing duplicate
data. An added benefit is that this capability enables you to retrieve
previous versions of your files (up to the limits specified in your data
retention settings).

See the section on [Scheduling and Deduplication](/how-to/rackspace-cloud-backup-backup-actions)
in the list of Cloud Backup actions.

#### Can I use Rackspace Cloud Backup on my server?

You can use Rackspace Cloud Backup on virtually any server in the
Rackspace Cloud. The exceptions are FreeBSD 9, Debian 5 and Windows
2003.

**Note:** If you have servers that are not in the Rackspace Cloud,
you can use the equivalent service offered by [JungleDisk](https://jungledisk.com/) for those servers.

If you have a server with a Managed Operations Service Level, you may
already have the Cloud Backup agent installed on your system. If not,
contact your account representative to get started.

For more information, see the [Rackspace Cloud Backup introduction](/how-to/cloud-backup).

#### How long are my Cloud Backups kept?

You choose how long your backups are saved: 30 days, 60 days, or
indefinitely.

See the section on [Retaining your Backup](/how-to/rackspace-cloud-backup-backup-actions) in the list of Cloud Backup actions.

#### How do I configure my Rackspace Cloud Backups?

You set up your backups in the Rackspace Cloud Backup Control Panel.

If you need to create a new Backup, click the System you want to back up,
and then the **Create Backup** button. If you already have a Backup and
want to re-configure it, click the gear icon next to the Backup name and
select **Configure Backup**. See our page on [Configuring a Backup through Backup Actions](/how-to/rackspace-cloud-backup-backup-actions)
for more information.

Backups can be set to run hourly, daily, weekly, or on demand
(manually).

Read more about [Scheduling your Backup](/how-to/rackspace-cloud-backup-backup-actions)
in the list of Cloud Backup actions.

#### Are 32-bit servers and agents on Linux supported?

No, 32-bit servers and agents on Linus are not supported.

#### Why does by Backup fail with a 403 error from Cloud Files when account has sub-users?

**Issue**

I am registered as a sub-user and am authorized for Cloud Backup and not
for Cloud Files access. When I attempt to do a backup, all requests to
Cloud Files return a 403 error. In this case, I attempt to authenticate
again, but the new auth token is the same as the old one.

**Solution**

Account administrators can manage permission levels in the User
Management section of the Cloud Control Panel. Submit a request to your
account administrator for **Full** access to your account or
**Administrative** access to Cloud Files for your sub-user account.

#### What does Rackspace Cloud Backup cost?

With advanced deduplication and compression capabilities built-in,
Rackspace Cloud Backup can save you money by using less storage.
Standard rates for Cloud Files storage fees apply. For current storage
fees, see the [Cloud Files storage fees](http://www.rackspace.com/cloud/cloud_hosting_products/files/pricing/).

#### Why are files that are being modified during backup missing or corrupted?

There are 3 types of files that change as Cloud Backup backs them up:

1.  Files that are being overwritten or get deleted as we back them up.
2.  Files like logs that get appended to as we back them up.
3.  Files like databases that may have random updates to any part of
    them as we back them up.

If files are modified during backup, they may be:

1.  Overwritten or Deleted: These files are not guaranteed to have
    usable content or to even be included in the backup at all.
2.  Appended: We will make a best effort to back these up, but we expect
    to be able to restore a reasonable and usable form of these files.
3.  Randomly Updated: We do not in any way guarantee that these files
    will be restorable, and even if they are restored, we do not
    guarantee that what is restored is not corrupt.

These file types either change too rapidly (databases, logs, caches) or
don't exist long enough to be backed up (session files). Session files
should be avoided entirely. And if the information is valuable to your
business, log files should track it. Caches should also be avoided, as
their data is meant to be discarded.

If you do need to back up these files, our suggested workarounds are:

-   For databases - Take a snapshot of the database (e.g., a
    database dump) and back up the dump. See [Rackspace Cloud Backup - Backing up Databases](/how-to/rackspace-cloud-backup-backing-up-databases)
    for full instructions.
-   For log files - Take snapshots of your log files and back them up.
    -   To avoid running out of disk space, rotate your log
        files periodically.

#### Does the backup agent accept incoming connections?

No. The agent only makes outgoing SSL connections to our API server on
port 443.
