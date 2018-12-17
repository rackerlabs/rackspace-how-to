---
permalink: best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup/
audit_date: '2018-11-14'
title: 'Best practices for backing up your data: Cloud Block Storage versus Cloud Backup'
type: article
created_date: '2013-10-01'
created_by: Kyle Laffoon
last_modified_date: '2018-11-14'
last_modified_by: Kate Dougherty
product: Cloud Backup
product_url: cloud-backup
---

When backing up the data disk or disks on your general purpose Cloud
Servers, you can use either Cloud Block Storage or Cloud Backup. The best
option to use depends on the features that are most important to you.

This article helps you decide if you should use Cloud Block Storage or Cloud
Backup.

### Cloud Block Storage offers portability

Cloud Block Storage works much like a portable drive. You can detach it from a
server and attach it to another one. This capability enables you to easily
move data between servers by detaching the drive from your old server and
attaching it to a new server.

Cloud Block Storage offers the following drive types:

- **Serial Advanced Technology Attachment (SATA)**: This option helps control
  costs.
- **Solid state drive (SSD)**: This option offers higher performance.

Unlike Cloud Backup, there's no agent to install. You copy your files to the
attached volume.

#### Limitations of Cloud Block Storage

Cloud Block Storage has the following limitations:

- Cloud Block Storage attaches a traditional data volume to your server,
  so there's no built-in mechanism to track or retrieve overwritten data.

- If you select the SATA option, you might find that transferring large
  files or a large number of files is slower than other file transfer
  options.

- The Cloud Block Storage process can't be automated. You must copy the data
  to the volume after you configure it on your server.

To get started with Cloud Block Storage, see [Create and attach a Cloud Block
Storage volume](/how-to/create-and-attach-a-cloud-block-storage-volume).

### Use Cloud Backup for incremental backups

After the initial setup, including installation of the Cloud Backup
agent and capture of all of the initial files, Cloud Backup uses
deduplication to capture only the data that has changed. With
the exception of your first complete backup, every subsequent backup is
just a delta of the previous backup. This approach enables faster backup and
restore operations and reduces the amount of storage required. If necessary,
you can revert your data to a backup for an earlier date.

The Cloud Backup agent can complete the backup automatically by following a
schedule that you configure. Automatic backups help you avoid waiting for the
process to complete. Manual backups are also available on Cloud Backup.

#### Encryption

With Cloud Backup, enterprise-grade encryption (Advanced Encryption
Standard (AES), 256-bit key) is available. When encryption is enabled, your
data is encrypted with a password that only you know. After you
create your AES-256 encryption key, your data is encrypted before it
leaves the server and remains safely encrypted while it is stored.

**Warning**: You must keep track of this password. After AES encryption is
set, this password cannot be removed from the backup data files for
which it was used. You need the password to restore those files. If you forget
the password that you used to back up the data, that backup data is lost, and
you cannot recover it.

#### Limitations of Cloud Backup

Cloud Backup has the following limitations:

- To use Cloud Backup, you must set up the Cloud Backup agent. Backups
  cannot occur until you set up the agent, specify the files
  that you want to back up, and configure when backups should occur.
- The Cloud Backup Agent requires a small amount of space on your server.
- All backups that you perform with Cloud Backup are placed in Cloud Files, so
  there are no cost control options with different storage types.

To get started with Cloud Backup, see the [Cloud Backup introduction
page](/how-to/cloud-backup).
