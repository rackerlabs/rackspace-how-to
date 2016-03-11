---
permalink: best-practices-for-cloud-backup/
node_id: 3426
title: Best practices for Cloud Backup
type: article
created_date: '2013-04-22'
created_by: David Hendler
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Backup
product_url: cloud-backup
---

This guide shows you how to get the most out of Rackspace Cloud Backup well and addresses frequently encountered scenarios. Working through this guide, you will better understand the key backup concepts, how to make smart choices about what to backup (and how often), how to make the most of data restoration, and how to resolve the most commonly encountered Cloud Backup issues.


| Conventions |
--- |
&#9989; | **Best Practice**. Look to these when you need to make good backup decisions.
&#9995; | **Caution**. Consider the potential outcomes before you do these actions.
&#10060; | **Do Not Attempt**. These are warnings against possible future trouble.

### Key concepts

Knowing the language of backup goes a long way towards helping you make informed decisions about your backup operations.

- **Backup**: a spare copy of data to be used in the event of a failure or loss of the original.
- **Backup Configuration**: instructions to the backup agent that indicate 1) what you want to backup and 2) how often you'd like to save that information.
- **Block**: a chunk of data from a file.
- **Bundle**: several blocks packaged together.
- **Cloud Backup Agent**: a program installed on your server that knows how to perform backups and restores.
- **Data Churn**: how often a file changes.
- **Encryption**: a method of scrambling the contents of data using a key or a password so that only those that have the password or key can read the data.
- **Restore**: to bring your system back to a previously saved state, usually using a backup as the checkpoint.
- **Snapshot**: a checkpoint of system data/state, usually a backup.
- **The Vault**: disk space that contains information about every block of data that you've ever stored. It is shared between all of your backup configurations.

### Choosing what to backup

**Warning:** Cloud Backup does *not* follow symlinks. For example, if a symlink points to a file, the symlink itself is backed up, but the file it points to is not backed up. Likewise, if a symlink points to a folder, the symlink itself is backed up, but the folder and anything under the folder is not be backed up. If you want to back up files or folders to be backed up, do not use a symlink.

Our best guidance is not what to backup, but what not to backup:

- Do not back up running databases -- to backup a database, see the topic on [backing up databases](/how-to/rackspace-cloud-backup-backing-up-databases).
- Do not back up caches and session files
- Do not back up frequently changing files, such as logs
- Do not back up root -- to save all data and the server, [make an image of the server](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image) instead.

**Note:** Do not compress your data before backup it is backed up. Doing so defeats the backup deduplication, which is typically far more efficient than simple file compression. Deduplication stores only the updated data, and saves you storage space and money during the backup process.

The Cloud Backup Agent tries to be helpful, and skips the below types of files automatically.

- Memory-only file systems (Linux: /proc, etc. )
- Cloud Backup agent data directories
- Recovery information (Windows)
- Recycle Bin (Windows)
- desktop.ini and thumbs.db (Windows)


These file types either change too rapidly (databases, logs, caches) or don't exist long enough to be backed up (session files). Session files should be avoided entirely. And if the information is valuable to your business, log files should track it. Caches should also be avoided, as their data is meant to be discarded. If you do need to back up these files, our suggested workarounds are:

- Databases - Take a snapshot of the database (e.g., a database dump) and back up the dump.
- Log files - Take snapshots of your log files and back them up.
- To avoid running out of disk space, rotate your log files periodically.

&nbsp; ||
--- | ---
&#10060; | Do not back up session files or caches at all. Don't back up databases or log files directly; use a snapshot instead.

### Backup and Restore Best Practices

There are many ways to configure backups and restores. To make Cloud Backup work best for you, it helps to understand some of the tradeoffs you make when you configure the many options available to you.

**NOTE:** With Performance Cloud Servers, Cloud Monitoring will only monitor the system disk. The data disk is not monitored. For data disk backup, [Cloud Block Storage](/how-to/cloud-block-storage-overview) should be used.

&nbsp; ||
--- | ---
&#9989; | First off, choose your contact email carefully when you configure your backup. If anything goes wrong, you will be alerted there first.

#### Backup Frequency

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


&nbsp; | &nbsp;
--- | ---
&#9989; | Do not make decisions about backup frequency lightly. If you try to backup or restore files more frequently than the backup engine can keep up with, anomalous behavior may result.

#### Effective Restores

It is a good idea to periodically test your restores to make sure that they are working as you expect. You do not want to get in the situation where needed backups aren't available because you haven't been configured as you expected.

&nbsp; | &nbsp;
--- | ---
&#9989; | Test your restores periodically to make sure that your data is saved as you expect it to be.

Another point to consider is the restore destination. Restoring to the original location and overwriting saves on storage space, but you risk accidentally overwriting important existing files. Proceed with caution when restoring.

#### Encryption: Costs and Benefits

Encryption is important for keeping your data confidential. However, encryption has its costs. It takes significantly longer to backup and restore encrypted data. Consider if the data you are storing must be encrypted. If not, then it is best to proceed without encryption. Encryption applies across the board, and once you encrypt a backup server, you may not remove it.

&nbsp; | &nbsp;
--- | ---
&#9989; | Once you've set a server to encrypt data, all backups performed on that server will be encrypted.

### Frequently Encountered Issues

This section is similar to an FAQ. If you encounter a problem and need immediate help, look it up here first. There's a good chance a solution already exists.

&nbsp; | &nbsp;
--- | ---
&#9989; | To minimize your chances of issues, keep your Backup Agent updated. Many errors and issues are fixed between releases.

**Issue**: My backups are getting randomly corrupted. Why?

- Does your server have a backup agent and did you clone it to create a new backup system? This means that two backup agents exist with the same credentials writing to the same Vault.

**Solution**: Ensure the agent on the cloned backup server is re-registered before any backups are run.

**Issue**: My backup is experiencing network errors.

**Solution**: Make sure that your backup server has a connection to both Service Net and public net. If it is on an isolated network, the backup agent will not be able to function properly.

**Issue**: Sometimes, my backups fail.

- This is most commonly caused by either a failure to communicate with Cloud Files, running out of disk space, or a failure to communicate with Cloud Backup.
- Sometimes, the agent may fail to backup a particular file because of a permissions error. Either the file is in use when the agent attempts to save it or the file in question cannot be read by the agent. Consider permissions when hunting for the root cause of a backup failure.

**Solution**: Ensure you're running the latest agent release. Then, attempt to determine the cause of the error. Try the backup/restore again if it is an intermittent error. We're always working on making Cloud Backup more robust.

**Issue**: My backup/restore is slow. What can I do?

- If your backup or restore is encrypted, it will be especially slow. Encryption comes at a cost. Otherwise, look to the section above, "What Should I Not Save?". The less there is to save/restore, the faster it will be.
- We're always working on optimizing the agent to make backup and restore faster.
