---
permalink: rackspace-cloud-backup-vs-cloud-server-image-backups/
audit_date: '2017-05-15'
title: Rackspace Cloud Backup vs. Cloud Server Image Backups
type: article
created_date: '2012-06-06'
created_by: Rackspace Support
last_modified_date: '2017-05-15'
last_modified_by: Brian King
product: Cloud Backup
product_url: cloud-backup
---

Rackspace customers now have two options for backing up their cloud servers:

- **Rackspace Cloud Backup**, which is a fully integrated, file-based backup solution that helps protect your data on cloud servers. For additional information, see the [Cloud Backup introduction](https://support.rackspace.com/how-to/cloud-backup/).

- **Cloud server image backup**, which provides a copy of the entire state of a server stored on Cloud Files. Images can be scheduled or created on demand. For additional information, see [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/) and [Scheduled Images FAQ](/how-to/scheduled-images-faq/).

Using an image as a backup works well for saving a configuration or keeping gold copies of your system. However, this method has some disadvantages:

- Images are not verified, so you need to actually build a server from an image to verify that it can boot a valid server. 
- Imaging the server captures the whole system disk, which is not helpful when you need only individual files. You cannot recover a single file from that image or update a single file.
- Image backups are not incremental: they copy the whole system every time.

In contrast, with Cloud Backup you can specify which folders or files to back up or restore. Cloud Backup can help you streamline your backup and restore process by choosing only the files that you need, rather than having to restore an entire image.

Moreover, Cloud Backup is an incremental backup tool. It copies only the changed portion of the file instead of copying the entire file that changed. Except for your first complete backup, every subsequent backup is just a "delta" of the previous backup, so this method provides faster backup and restore operations and also reduces the storage required. 

**Note:** With I/O-optimized cloud servers, only the system disk is captured when you use an image backup. If you require backups of your data disk or disks, use Cloud Backup so that you can configure your backup to include the specific drives and directories that you want to retain. 




