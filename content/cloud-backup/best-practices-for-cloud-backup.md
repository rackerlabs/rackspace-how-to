---
permalink: best-practices-for-cloud-backup/
audit_date:
title: Best practices for Cloud Backup
type: article
created_date: '2013-04-22'
created_by: David Hendler
last_modified_date: '2016-07-19'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

This article shows you how to get the most out of Rackspace Cloud Backup and addresses frequently encountered scenarios. Working through this article, you will better understand the key backup concepts, how to make smart choices about what to back up (and how often), how to make the most of data restoration, and how to resolve the most commonly encountered Cloud Backup issues.

**Note:** Cloud Backup works only on Rackspace Cloud Servers.

**Warning:** Cloud Backup does *not* follow symlinks. If you want to back up files or folders, do not use a symlink.

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
how Cloud Backup differs from snapshots, see [Rackspace Cloud Backup vs. Cloud Server Image Backups](/how-to/rackspace-cloud-backup-vs-cloud-server-image-backups "Rackspace Cloud Backup vs. Cloud Server Image Backups") or [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup)
for backup consideration on your General Purpose server.

As a best practice for web servers and database servers, we recommend
using Cloud Backup on the following directories:

-   Web applications under `/var/www`
-   Database dumps under `/var/lib/mysqlbackup`
-   User data under `/home`
-   Systems configuration files under `/etc`

### Key concepts

Knowing the language of backup goes a long way towards helping you make informed decisions about your backup operations.

- **Backup**: a copy of data to be used for restoring that data in the event of corruption or loss of the original.
- **Backup Configuration**: instructions to the backup agent that indicate 1) what you want to back up, 2) how often you’d like to back up that information, and 3) how long you would like to keep that information.
- **Block**: a chunk of data from a file.
- **Bundle**: several blocks packaged together.
- **Cloud Backup Agent**: a program installed on your server that helps to perform backups and restores.
- **Data Churn**: how often a file changes.
- **Encryption**: a method of scrambling the contents of data using a key or a password so that only those that have the password or key can read the data.
- **Restore**: to bring your system back to a previously saved state, usually using a backup as the checkpoint.
- **Snapshot**: a checkpoint of system data/state, usually a backup.
- **The Vault**: disk space that contains information about every block of data that you currently have stored. It is shared between all of your backup configurations for that server.

### Choosing what to back up

**Warning:** Cloud Backup does *not* follow symlinks. For example, if a symlink points to a file, the symlink itself is backed up, but the file it points to is not backed up. Likewise, if a symlink points to a folder, the symlink itself is backed up, but the folder and anything under the folder is not be backed up. If you want to back up files or folders to be backed up, do not use a symlink.

Our best guidance is not *what* to back up, but *what not* to back up:

- Do not back up running databases - to backup a database, see the topic on [backing up databases](/how-to/rackspace-cloud-backup-backing-up-databases).
- Do not back up caches and session files
- Do not back up frequently changing files, such as logs
- Do not back up root. In order to save all data and the server, [make an image of the server](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image) instead.

**Note:** Do not compress your data before it is backed up. Doing so defeats the backup deduplication, which is typically far more efficient than simple file compression. Deduplication works across all files in all snapshots and stores only the new data. This almost always saves you more storage space and money during the backup process than simple compression does.

The Cloud Backup Agent skips the following types of files automatically:

- Memory-only file systems (Linux: /proc, etc. )
- Cloud Backup agent data directories
- Recovery information (Windows)
- Recycle Bin (Windows)
- **desktop.ini** and **thumbs.db** (Windows)

These file types either change too rapidly (databases, logs, caches) or don't exist long enough to be backed up (session files). Session files should be avoided entirely. And if the information is valuable to your business, log files should track it. Caches should also be avoided, as their data is meant to be discarded. If you do need to back up these files, our suggested workarounds are:

- Databases - Take a snapshot of the database (e.g., a database dump) and back up the dump.
- Log files - Take snapshots of your log files and back them up.
- To avoid running out of disk space, rotate your log files periodically.

In short, do not back up session files or caches at all, and use a snapshot instead of backing up databases or log files directly.

### Backup and restore best practices

There are many ways to configure backups and restores. To make Cloud Backup work best for you, it helps to understand some of the tradeoffs you make when you configure the many options available to you.

**Note:** With Performance Cloud Servers, Cloud Monitoring will only monitor the system disk. The data disk is not monitored. For data disk backup, [Cloud Block Storage](/how-to/cloud-block-storage-overview) should be used.

Be sure to choose your contact email carefully when you configure your backup. If anything goes wrong, you will be alerted there first.

#### Backup frequency

When trying to determine how often to back up a file, there are three variables to consider:

1. Criticality - How important is tracking changes in the file to your business processes?
2. Size - How large is the file?
3. Data Churn - How often does the file change?

Criticality is the most important factor to consider when making backup decisions. The more critical the file is to your business operations, the more often you'll want to back this file up.

Size is an important consideration if the speed of backups/restores is important to you. Large files take longer to backup and to restore. It may be wise to backup large files less frequently.

Data churn is the last variable to consider, and perhaps the trickiest to handle. Files that change often invalidate blocks that have been stored previously. Depending on criticality, it may still be wise to snapshot files with high data churn and backup those snapshots.

Back up less often files that have | Back up more often files that have
--- | ---
Lower Criticality | Higher Criticality
High Data Churn | Low Data Churn
Larger Size | Smaller Size

**Note**: Do not make decisions about backup frequency lightly. If you try to backup or restore files more frequently than the backup engine can keep up with, anomalous behavior may result.

#### Effective restores

It is a good idea to periodically test your restores to make sure that they are working as you expect. You do not want to get in the situation where needed backups aren't available because they haven't been configured as you expected.

Test your restores periodically to make sure that your data is saved as you expect it to be. As with any disaster recovery plan, you should schedule
semi-regular restore operations of your backed-up data sets. Doing so will provide you with a reference for how long this process can take as well
as ensure that your backups are complete and viable.

Another point to consider is the restore destination. Restoring to the original location and overwriting saves on storage space, but you risk accidentally overwriting important existing files. Proceed with caution when restoring.

#### Encryption: costs and benefits

Encryption is important for keeping your data confidential. However, encryption has its costs. It takes significantly longer to backup and restore encrypted data. Consider if the data you are storing must be encrypted. If not, then it is best to proceed without encryption.

**Warning**: Encryption applies across the board, and once you encrypt a backup server, you may not remove it.

###Conserve resources with Cloud Backup

Some elements of Cloud Backup take up a non-trivial amount of space on a server’s system drive. When running Cloud Backup on servers with limited resources, such as small system drives, some things can help reduce Cloud Backup's footprint significantly.

Other than the relatively small files necessary to make Cloud Backup work, such as the agent and tool executables and configuration files, some files have the capacity to grow very large. These files are agent log files and local agent backup database files. By default, the log files are configured to have a maximum size. Even though these files typically grow very slowly, that size can eventually become very large over time. On the other hand, depending on the configuration of your backups, the local agent backup database files can grow indefinitely and very quickly.

*For log files*, you can keep the files smaller in the following ways:

-  You can set the maximum file size and the maximum rollover files to small values.
-  You can also set the normal logging mode to be less verbose.

*For database files*, you can keep the files smaller in the following ways:

-  You can set the expiration of the backed-up files to something other than `infinite`.
-  You can back up fewer and smaller files.
-  You can back up less frequently.

However, the best way to reduce the size of the backup files on your system drive is to move most of the files off of the system drive and onto another drive. In order to do this on both Linux and Windows, if you do not already have another drive to which to move these files, you must first create the second drive and attach it to your system.

#### Move backup files

The procedure to move the biggest types of Cloud Backup files off of a Linux system drive is simple. Create a symlink (Windows) or a mount point (Linux) to the path of the log or database files. For information about the location of these paths, see [Locations of Cloud Backup agent files][https://support.rackspace.com/how-to/cloud-backup-agent-logging-basics/].

If you use the **AgentConfig.exe** tool located in the  `C:\Program Files\Driveclient` folder, use the following procedure to move these files off the system drive of a Windows system:

1.  Double-click the tool to open the **Agent Configuration** window in the user interface.

2.  Click on the **Cache** tab.

    The current location for the cache, which holds both the log files and the backup database files for the local agent, is shown in **Cache Source Location**.

3.  To change the location, click the folder icon next to **Cache Target Location** and select a folder on a different drive.

4.  To move the cache location, click the green arrow at the top of the window. The progress is displayed in  **Move Log**.

Depending on the size of the cache files, this process might take some time.

**Note**: In order to move the cache files, the Cloud Backup agent service must be shut down briefly.

If you wish, you can move only the backup local database for the agent by using the **Database** tab.

#### Other optimizations with AgentConfig.exe

In addition to moving the cache location for the agent, the **AgentConfig.exe** tool is capable of doing a number of other optimizations from the **General** tab.

When you click the blue **Save** icon at the top of the **Agent Configuration** window, you can save multiple changes in the settings at one time.

##### Disabling VSS backups

By default, VSS is used to make backups more reliable. However, there might be times when VSS gets in the way. For instance, VSS might take up disk space on a volume that is already running low. In order to turn off VSS shadowing for backups, check **VSS Disable** and click the blue **Save** icon.

##### Turning off auto-update

Auto-update is a service that continually keeps the Cloud Backup agent updated. In rare cases, you might want to turn this service off. To do that, check the **Auto Update Disable** and click the blue **Save** icon.

##### Debugging auto-update

There might be times when you need to debug auto-update. **Auto Update Debug** not only debugs the auto-updater service (in the Event Logger), but it also debugs the installer and MSI, as well. To turn on debugging for auto-update, check the **Auto Update Debug** and click the blue **Save** icon.

##### Repair the Add/Remove Programs listing

Older versions of the agent were sometimes installed without adding an entry in the **Add/Remove Programs** uninstall console. You can repair this issue by checking  **Repair Add/Remove Programs Listing** and clicking the blue **Save** icon.

##### Log controls

The logs level is controlled by the Cloud Backup Control Panel. However, you can alter these settings locally either by editing the **log4cxx.xml** configuration file directly, or by using the **AgentConfig.exe** tool. You can exercise far greater control over the log configuration by editing this configuration file by hand, but not everyone has the time or expertise to do so. To make this easier, the three most commonly changed settings are controlled by the **AgentConfig.exe** tool.

-  You can set the maximum log size by changing the value in the spinner named **Max Log Size (MB)** and clicking the blue **Save** icon.

-  You can set the maximum rollover logs by changing the value in the spinner named **Max Rollover Logs** and clicking the blue **Save** icon.

-  You can temporarily change the log level by selecting the setting  you want via the drop-down menu on the **General** settings tab and clicking the blue **Save** icon. The log level is changed every time that the Cloud Backup API sends a configuration change or update to the agent. In order to keep logging at the desired level, set your log level in the Cloud Control Panel, as well. The advantage of setting the log level locally is that doing so changes the level prior to receiving a configuration change or update, which is useful for things like debugging agent startup.


### Frequently encountered issues

To minimize your chances of issues, keep your Backup Agent updated. Many errors and issues are fixed between releases.

- **My backups are getting randomly corrupted. Why?**

  Does your server have a backup agent and did you clone it to create a new backup system? This means that two backup agents exist with the same credentials writing to the same Vault.

  Ensure the agent on the cloned backup server is re-registered before any backups are run.

- **My backup is experiencing network errors.**

  Make sure that your backup server has a connection to both Service Net and public net. If it is on an isolated network, the backup agent will not be able to function properly.

- **My backups sometimes fail.**

  This is most commonly caused by either a failure to communicate with Cloud Files, running out of disk space, or a failure to communicate with Cloud Backup.

  Sometimes, the agent may fail to backup a particular file because of a permissions error. Either the file is in use when the agent attempts to save it or the file in question cannot be read by the agent. Consider permissions when hunting for the root cause of a backup failure.

  Ensure you're running the latest agent release. Then, attempt to determine the cause of the error. Try the backup/restore again if it is an intermittent error. We're always working on making Cloud Backup more robust.

- **My backup/restore is slow. What can I do?**

  If your backup or restore is encrypted, it will be especially slow. Encryption comes at a cost. Otherwise, look to the section above, "What Should I Not Save?". The less there is to save/restore, the faster it will be.

  We're always working on optimizing the agent to make backup and restore faster.
