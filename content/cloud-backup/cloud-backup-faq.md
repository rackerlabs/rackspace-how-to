---
permalink: cloud-backup-faq/
audit_date:
title: Cloud Backup FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2019-01-29'
last_modified_by: Cat Lookabaugh
product: Cloud Backup
product_url: cloud-backup
---

### Account services

#### Why do I get a 403 error when trying to migrate a vault?

When you use the API endpoint to migrate an existing vault to a new
agent, you should not configure the new agent with any new backup
configurations of its own.

You also cannot migrate an encrypted vault.

See the [Migrate Vault API call](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#migrate-vault)
for a description.

#### Why does my backup fail with the error "Container does not exist. Invalid snapshot id and engine, and check config_backup.json id?"

The Cloud Files container named **z_DO_NOT_DELETE_CloudBackup** is
required for Rackspace Cloud Backup to work properly. If this container
is deleted, you receive the error `Container does not exist.
Invalid snapshot id and engine, and check config_backup.json id` when
you attempt to do a backup.

This error can have the following causes:

1.  The Cloud Files container where your backups are stored has been deleted.
2.  Clicking **View Configuration** does not display the JSON configuration.
    This issue commonly occurs when you have corrupted backup configurations.

To resolve this error, ensure that you do not delete the
**z_DO_NOT_DELETE_CloudBackup** container in your Cloud Files account because
it is used for backups. If you accidentally delete this container, [contact
Rackspace Support](https://www.rackspace.com/support).

------------------------------------------------------------------------

### Backups

#### What is Rackspace Cloud Backup?

Even though the cloud is engineered to prevent data loss, maintaining recent
backups of your important data is still considered a fundamental best practice.
Cloud Backup is a file-based backup solution that uses compression, encryption,
and de-duplication to ensure your data is protected and recoverable.

Cloud Backup should not be confused with the ability to image your servers,
which is a strategy for horizontal scalability and not recommended for backup.

Cloud Backup is a service that enables you to select and back up
specific files and folders from your Cloud Server. You can schedule any
number of backup jobs, and restore to the same system or a different
one, giving you the flexibility and power to work with your schedule and
your data.

Cloud Backup has the following key features:

-   Select the files and folders that you want to back up from your cloud
    server.
-   Run your backups manually or on a schedule that works for you.
-   See the activity from all your backups, both current and previous.
-   Use AES-256 encryption with a private encryption key known only to
    you.
-   Restore individual files and folders from a particular date.
-   Save space with incremental backups that only save the changed
    portions of files.
-   Create unlimited backups.

For information on getting started with Cloud Backup, see our [introduction to
Cloud Backup](/how-to/cloud-backup).

#### Can Cloud Backup change my system configuration file, even after I have modified it?

Yes. Some Ubuntu&reg; users have older agents installed on their machines.
In order to communicate properly with your system, the configuration file
might need to be overwritten with a current version.

#### How does Cloud Backup handle corrupt files?

Cloud Backup double-checks to make sure files get written properly when
they are backed up and restored. However, if an uploaded file is corrupt,
it is backed up and restored as corrupted. The backup and restore
processes themselves should never corrupt files. If file corruption
occurs in Cloud Files itself, it might render the backup unusable.

#### What happens if I lose my encryption key?

Rackspace does not store customer encryption keys. Only you know
and are able to access your encryption passphrase. If you forget your
passphrase, you are not be able to restore data from your backups.

For more information, see the section on [Setting up encryption on your Cloud Backup system](/how-to/rackspace-cloud-backup-system-actions)
in the list of Cloud Backup actions.

#### How do I generate a Cloud Backup encryption key?

If you want to create your own encrypted key and bypass the default
client-side encryption, see [Generate your encrypted key in Cloud
Backup](/how-to/generate-your-encrypted-key-in-cloud-backup).

#### Where are my Cloud Backups stored?

All of your Cloud Backups are stored in your Cloud Files account.

#### What if I never set up a Cloud Files account?

When you establish your Cloud account, a Cloud Files account is set
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

#### Can I use Cloud Backup on my server?

You can use Cloud Backup on virtually any server in the
Rackspace Cloud. The exceptions are FreeBSD 9, Debian&reg; 5 and Windows&reg;
2003.

**Note**: If you have servers that are not in the Rackspace Cloud,
you can use the equivalent service offered by [JungleDisk](https://jungledisk.com/) for those servers.

If you have a server with a Managed Operations service level, you might
already have the Cloud Backup agent installed on your system. If not,
contact your Account Representative to get started.

Before you can use Cloud Backup, you must have the backup agent installed and
running on your cloud server. Cloud servers with a Managed Operations service
level should have this additional piece of software installed by default. If it
is not installed, contact your Account Representative to get started. If you
have an infrastructure-only account, you must manually install the agent by
following these instructions for [Linux&reg;](https://support.rackspace.com/how-to/install-or-update-the-cloud-backup-agent-on-linux/)
or for [Windows](https://support.rackspace.com/how-to/rackspace-cloud-backup-install-the-agent-on-windows-by-using-silent-installation/).


For more information, see the [Rackspace Cloud Backup introduction](/how-to/cloud-backup).

#### How long are my Cloud Backups kept?

You choose how long your backups are saved: 30 days, 60 days, or
indefinitely.

See the section on [Retaining your Backup](/how-to/rackspace-cloud-backup-backup-actions) in the list of Cloud Backup actions.

#### How do I configure my cloud backups?

You set up your backups in the Rackspace [Cloud Control Panel](https://login.rackspace.com).

In the top navigation bar, click **Select a Product > Rackspace Cloud**, then
select **Backups**.

If you need to create a new backup, click the **System** that you want to
back up, and then click **Create Backup**. If you already have a backup and
want to reconfigure it, click the gear icon next to the backup name and
select **Configure Backup**. See [Configuring a Backup through Backup Actions](/how-to/rackspace-cloud-backup-backup-actions)
for more information.

You can set backups to run hourly, daily, weekly, or on demand
(manually).

Read more about [Scheduling your Backup](/how-to/rackspace-cloud-backup-backup-actions) in the list of Cloud Backup actions.

#### Are 32-bit servers and agents on Linux supported?

No, 32-bit servers and agents on Linux&reg; are not supported.

#### Why does my backup fail with a 403 error from Cloud Files when the account has subusers?

**Issue**

I am registered as a subuser and am authorized for Cloud Backup and not
for Cloud Files access. When I attempt to do a backup, all requests to
Cloud Files return a 403 error. In this case, I attempt to authenticate
again, but the new authentication token is the same as the old one.

**Solution**

Account administrators can manage permission levels in the **User Management**
section of the [Cloud Control Panel](https://login.rackspace.com).
Submit a request to your account administrator for **Full** access to your
account or **Administrative** access to Cloud Files for your subuser account.

#### What does Cloud Backup cost?

With advanced deduplication and compression capabilities built-in,
Cloud Backup can save you money by using less storage.
Standard rates for Cloud Files storage fees apply. For current storage
fees, see the [Cloud Files storage fees](http://www.rackspace.com/cloud/cloud_hosting_products/files/pricing/).

#### Why are the files that are being modified during backup missing or corrupted?

The following three types of files change as Cloud Backup backs them up:

1.  Files that are overwritten or deleted as we back them up.
2.  Files such as logs that get appended to as we back them up.
3.  Files such as databases that might have random updates to any part of
    them as we back them up.

If files are modified during backup, they might be handled in the following
ways:

1.  **Overwritten or deleted**: These files are not guaranteed to be included in
    the backup.
2.  **Appended**: We make a best effort to back these up, but we expect
    to be able to restore a reasonable and usable form of these files.
3.  **Randomly updated**: We do not guarantee that these files
    are restorable, and even if they are restored, we do not
    guarantee that what is restored is not corrupt.

These file types either change too rapidly (databases, logs, caches) or
don't exist long enough to be backed up (session files). Session files
should be avoided entirely. If the information is valuable to your
business, log files should track it. Caches should also be avoided, as
their data is meant to be discarded.

If you do need to back up these files, we suggest the following workarounds:

-   **For databases**: Take a snapshot of the database (a
    database dump) and back up the dump. See [Rackspace Cloud Backup - Backing up Databases](/how-to/rackspace-cloud-backup-backing-up-databases)
    for full instructions.
-   **For log files**: Take snapshots of your log files and back them up. To
    avoid running out of disk space, rotate your log files periodically.

#### Does the backup agent accept incoming connections?

No. The agent only makes outgoing Secure Sockets Layer (SSL) connections to
our API server on port 443.
