---
permalink: best-practices-for-cloud-backup/
audit_date:
title: Best practices for Cloud Backup
type: article
created_date: '2013-04-22'
created_by: David Hendler
last_modified_date: '2016-07-20'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

This article shows you how to get the most out of Rackspace Cloud Backup and addresses frequently encountered scenarios. This article should help you understand the key backup concepts, make smart choices about what to back up (and how often), make the most of data restoration, and resolve the most commonly encountered Cloud Backup issues.

**Note:** Cloud Backup works only with Rackspace Cloud Servers.

### Key features

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

**Note:** Cloud Backup does not take snapshots of your server. To read more about
how Cloud Backup differs from snapshots, see [Rackspace Cloud Backup vs. Cloud Server Image Backups](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups). For backup consideration on your General Purpose server, see [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).


### Key concepts

Knowing the language of backups can help you make informed decisions about your backup operations.

- **Backup**: A copy of data to use for restoring that data if it becomes corrupt or is lost.
- **Backup configuration**: Instructions that tell the backup agent what information to back up, how often to back up that information, and how long to keep that information.
- **Block**: A chunk of data from a file.
- **Bundle**: Several blocks packaged together.
- **Cloud Backup agent**: A program installed on your server that helps to perform backups and restores.
- **Data churn**: How often a file changes.
- **Encryption**: A method of scrambling the contents of data by using a key or a password so that only those who have the key or password can read the data.
- **Restore**: To bring your system back to a previously saved state, usually using a backup as the checkpoint.
- **Snapshot**: A checkpoint of system data, usually a backup.
- **Vault**: Disk space that contains information about every block of data that you currently have stored. It is shared between all of your backup configurations for that server.

### Choosing what to back up

**Warning:** Cloud Backup does *not* follow symlinks. For example, if a symlink points to a file, the symlink itself is backed up, but the file it points to is not backed up. Likewise, if a symlink points to a folder, the symlink itself is backed up, but the folder and anything under the folder is not be backed up. If you want to back up files or folders, *do not use a symlink*.

As a best practice for web servers and database servers, we recommend
using Cloud Backup on the following directories:

-   Web applications under `/var/www`
-   Database dumps under `/var/lib/mysqlbackup`
-   User data under `/home`
-   Systems configuration files under `/etc`

**Note:** Do not compress your data before it is backed up. Doing so defeats the backup deduplication, which is typically more efficient than simple file compression. Deduplication works across all files in all snapshots and stores only the new data. This almost always saves you more storage space and money during the backup process than simple compression does.

We recommend *not* backing up the following items:

- Running databases. To back up a database, see the article on [backing up databases](/how-to/rackspace-cloud-backup-backing-up-databases).
- Caches and session files.
- Frequently changing files, such as logs.
- Root. To save all data and the server, [make an image of the server](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image) instead.

These file types either change too rapidly (databases, logs, caches) or don't exist long enough (session files) to be backed up. You should not back up session files or caches at all, but if you need to back up databases or log files, we suggest the following workarounds:

-  Take a snapshot of a database (for example, a database dump), and back up the snapshot.
-  Take snapshots of log files, and back up the snapshots. To avoid running out of disk space, rotate your log files periodically.

The Cloud Backup agent skips the following types of files automatically:

- Memory-only file systems (Linux: /proc, etc.)
- Cloud Backup agent data directories
- Recovery information (Windows)
- Recycle Bin (Windows)
- **desktop.ini** and **thumbs.db** (Windows)

### Backup and restore best practices

You can configure backups and restores in many ways. To make Cloud Backup work for you, it helps to understand some of the tradeoffs you make when you configure the many options available to you.

**Note:** With Performance Cloud Servers, Cloud Monitoring only monitors the system disk. The data disk is not monitored. For data disk backup, use [Cloud Block Storage](/how-to/cloud-block-storage-overview).

**Note:** When you configure your backup, choose your contact email carefully. If anything goes wrong, the first alert is sent to that email address.

#### Backup frequency

When trying to determine how often to back up a file, consider the following variables:

1. Criticality: How important is tracking changes in the file to your business processes?
2. Size: How large is the file?
3. Data churn: How often does the file change?

Criticality is the most important factor to consider when making backup decisions. The more critical the file is to your business operations, the more often you want to back up this file.

If the speed of backups and restores is important to you, then size is an important consideration. Large files take longer to back up and to restore. It might be wise to back up large files less frequently.

Data churn is the last variable to consider, and perhaps the trickiest to handle. Files that change often invalidate blocks that have been stored previously. Depending on criticality, it might be wise to snapshot files with high data churn and back up those snapshots.

Back up less often files that have | Back up more often files that have
--- | ---
Lower criticality | Higher criticality
High data churn | Low data churn
Larger size | Smaller size

**Note**: Do not make decisions about backup frequency lightly. If you try to back up or restore files more frequently than the backup engine can manage, anomalous behavior might occur.

#### Effective restores

Test your restores to enaure that your data is saved as you expect. As with any disaster recovery plan, you should schedule semi-regular restore operations of your backed-up data sets. Doing so provides you with a reference for how long this process can take and ensures that your backups are complete and viable.

Another point to consider is the restore destination. Restoring to the original location and overwriting saves on storage space, but risks accidentally overwriting important existing files. Proceed with caution when restoring.

#### Encryption costs and benefits

Encryption is important for keeping your data confidential, but encryption has its costs. It takes significantly longer to back up and restore encrypted data. Consider whether the data that you are storing must be encrypted. If not, then don't use encryption.

**Warning**: If you encrypt a backup server, you may not remove it.

### Conserve resources with Cloud Backup

Some elements of Cloud Backup take up a nontrivial amount of space on a server’s system drive. When you are running Cloud Backup on servers with limited resources, such as small system drives, you can perform some actions to help reduce Cloud Backup's footprint.

The files that are necessary to make Cloud Backup work, such as the agent and tool executables and the configuration files are relatively small. However, the agent log files and the local agent backup database files have the capacity to grow very large. By default, the log files are configured to have a maximum size. Even though these files typically grow slowly, that size can eventually become very large over time. On the other hand, depending on the configuration of your backups, the local agent backup database files can grow indefinitely and quickly.

*For log files*, you can keep the files smaller in the following ways:

-  Set the maximum file size and the maximum number of rollover files to small values.
-  Set the normal logging mode to be less verbose.

*For database files*, you can keep the files smaller in the following ways:

-  Set the expiration of the backed-up files to something other than `infinite`.
-  Back up fewer and smaller files.
-  Back up less frequently.

However, the best way to reduce the size of the backup files on your system drive is to move most of the files from the system drive and to another drive. On both Linux and Windows, if you do not already have another drive to which to move the files, you must first create the second drive and then attach it to your system.

#### Move backup files

To move the biggest types of Cloud Backup files from a system drive, create a symlink (Windows) or a mount point (Linux) to the path of the log or database files. For information about the location of these paths, see the "Locations of Cloud Backup agent files" section in [Cloud Backup agent logging][https://support.rackspace.com/how-to/cloud-backup-agent-logging-basics/].

If you use the **AgentConfig.exe** tool located in the  `C:\Program Files\Driveclient` folder, use the following procedure to move these files from the system drive of a Windows system:

1.	Shut down the Cloud Backup agent service.

2.  Double-click **AgentConfig.exe** to open the **Agent Configuration** window.

3.  Click the **Cache** tab.

    The current location for the cache, which holds both the log files and the backup database files for the local agent, is shown in **Cache Source Location**.

4.  To change the location, click the folder icon next to **Cache Target Location** and select a folder on a different drive.

5.  To move the cache location, click the green arrow at the top of the window. The progress is displayed in  **Move Log**.

    Depending on the size of the cache files, this process might take some time.

6.	Restart the Cloud Backup agent service.    

**Note**: In order to move the cache files, the Cloud Backup agent service must be shut down briefly.

Alternatively, you can move only the backup local database files for the agent by using the **Database** tab.

#### Other optimizations with AgentConfig.exe

In addition to moving the cache location for the agent, you can use the **AgentConfig.exe** tool to perform other optimizations from the **General** tab of the **Agent Configuration** window.

When you click the blue **Save** icon at the top of the **Agent Configuration** window, you can save multiple changes in the settings at one time.

##### **Disable VSS backups**

By default, VSS is used to make backups more reliable, but there might be times when you want to disable it. For example, VSS might take up disk space on a volume that is already running low.

To turn off VSS shadowing for backups, select **VSS Disable** and then click **Save**.

##### **Turn off auto-update**

Auto-update is a service that continually keeps the Cloud Backup agent updated. In rare cases, you might want to turn this service off.

To turn off auto-update, select  **Auto Update Disable** and then click **Save**.

##### **Debug auto-update**

There might be times when you need to debug auto-update. The **Auto Update Debug** option debugs not only the auto-updater service (in the Event Logger), but also the installer and MSI.

To turn on debugging for auto-update, select **Auto Update Debug** and then click **Save**.

##### **Repair the Add/Remove Programs listing**

Older versions of the agent were sometimes installed without adding an entry in the **Add/Remove Programs** console.

To repair this issue, select  **Repair Add/Remove Programs Listing** and then click **Save**.

##### **Control log file configuration**

You can change the most commonly changed log file settings by using the **AgentConfig.exe** tool.

-  Set the maximum size of each rollover log file by changing the value in the **Max Log Size (MB)** field.

-  Set the maximum number of rollover logs by changing the value in the **Max Rollover Logs** field.

-  You can temporarily change the log level by selecting the value in the **Local Log Level** field. The log level is changed every time that the Cloud Backup API sends a configuration change or update to the agent. To keep logging at the appropriate level, also set the log level in the Cloud Control Panel. The advantage of setting the log level locally is that doing so changes the level prior to receiving a configuration change or update, which is useful for things like debugging agent startup.

After you change any of these values, click **Save**.

For more information, see [Cloud Backup agent logging] (https://support.rackspace.com/how-to/cloud-backup-agent-logging-basics/).

### Frequently encountered issues

To minimize your chances of experiencing the following issues, keep your backup agent updated. Many errors and issues are fixed between releases.

- **My backups are randomly being corrupted. Why?**

  If your server has a backup agent and cloned it to create a new backup system, then two backup agents exist with the same credentials writing to the same vault.

  Ensure that the agent on the cloned backup server is reregistered before any backups are run.

- **My backup is experiencing network errors.**

  Ensure that your backup server has a connection to both ServiceNet and PublicNet. If it is on an isolated network, the backup agent can’t function properly.

- **My backups sometimes fail.**

  Backup failure is most commonly caused by a failure to communicate with Cloud Files, running out of disk space, or a failure to communicate with Cloud Backup.

  Sometimes, the agent might fail to back up a particular file because of a permissions error. Either the file is in use when the agent attempts to save it or the file can’t be read by the agent. Consider permissions when looking for the root cause of a backup failure.

  Ensure that you're running the latest agent release. Then, attempt to determine the cause of the error. If the error is intermittent, try the backup again.


- **My backup/restore is slow. What can I do?**

  If your backup or restore is encrypted, it will be especially slow. Also, review the “Choosing what to back up” section for what you should *not* be backing up. The less there is to back up or restore, the faster the process will be.
