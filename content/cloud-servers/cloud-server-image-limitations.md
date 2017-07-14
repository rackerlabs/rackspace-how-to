---
permalink: cloud-server-image-limitations/
audit_date: '2016-12-13'
title: Cloud server image limitations
type: article
created_date: '2011-08-05'
created_by: Rackspace Support
last_modified_date: '2016-12-13'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

The previous article described how to [restore servers from an image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image). These images are ideal for use as templates or "gold images" that enable you to easily restore a server to a known configuration or rapidly deploy additional servers. However, this system was designed primarily to speed deployment of new servers and not as a robust backup solution. As a result, the system has a number of practical limitations:

-   Cloud server images are useful for storing configuration and static data, but they are not a reliable way to back up a dynamic database. We recommend using standard backup tools such as mysqldump or the SQL Server Management Studio for this task. We recommend backing up your database before creating an image of your server. If you want to create an image of a server that contains a database, you must take the database down, initiate the image creation, and restart the database when the server reaches the appropriate task state.  For more information about the task monitoring process, see [Using task states with server imaging](/how-to/using-task-states-with-server-imaging). For instructions on using Cloud Backup to back up a database, see [Rackspace Cloud Backup - Backing up Databases](/how-to/rackspace-cloud-backup-backing-up-databases).

-   Cloud server images do not include Cloud Block Storage volumes in their data, even if the volume is used as the boot volume.  For information about making snapshots of Cloud Block Storage volumes, see [Create and use Cloud Block Storage snapshots](/how-to/create-and-use-cloud-block-storage-snapshots).

-   I/O-optimized cloud servers images capture only the system
    disk, *not any attached data disks*. The Cloud Backup service can
    back up data disks to Cloud Files.

-   Although you can import images into the Rackspace open cloud by using Cloud Images, you can boot a server from such an image only if it's been properly prepared for use in the Rackspace open cloud.

    **Note**: All servers based on the OpenStack architecture can have images exported and imported between accounts. For more information, see the [Cloud Images FAQ](/how-to/cloud-images-faq).

-   While you can download images exported from the Rackspace open cloud, whether those images will work in another cloud or in your local virtualization solution depends upon the target cloud or local solution.  Consult your vendor for details.

    **Note**: Not all images may be exported from the Rackspace open cloud.  For more information, see the [Cloud Images FAQ](/how-to/cloud-images-faq).

-   Images go through several stages, from preparing the server data to the actual copy of the image to Cloud Files. The imaging process can take several hours, and can fail if the image very close to the maximum disk size for images or if the image have an extremely large number of files.

    You can monitor the tasks involved in this process. For information on the task monitoring process, see [Using task states with server imaging](/how-to/using-task-states-with-server-imaging).

-   The imaging process can be delayed if a large number of image requests are made at one time for a group of servers. The number of concurrent images is limited to keep the disk activity of multiple images from affecting performance on a host. If the image takes longer than 24 hours to complete, contact Rackspace Cloud support.


If your image fails more than once and you aren't exceeding the image limits, contact Rackspace Cloud support. Our admins might be able to succeed where our automated processes do not.

### Linux-specific limitations

-   There are no limits on image disk size or inode usage for Standard Cloud Servers at this time. General Purpose and I/O-optimized servers cannot be built from images with system volumes larger than 40 GB.

-   If you reduce your disk usage below the limits, the imaging process still might not succeed. The total size of your instance's virtual disk includes space allocated to track changes between images, and space that used to be allocated to deleted files. As a result, having several images or having grown the disk in the past can cause the virtual disk size to exceed the limit, even if the current file system inside of an instance is below the limit.

-   When you create an image, the system runs a process that tries to reclaim space that has been freed by deleting files and images. That process continues even if the image creation process is aborted because of disk limits at the time the image creation began. As a result, trying to create an image again about a half hour after the process first fails could result in a successful image because of that cleanup operation.

### Windows-specific limitations

-   Servers cannot be built from images with volumes larger than the disk size of the cloud server flavor selected to deploy the new server. For example, I/O-optimized servers cannot be built from images with system volumes larger than 40 GB.

-  If you take an image of a Windows cloud server that is configured to be a Domain Controller (DC), you cannot restore from that image. Our build system relies on the local Administrator account to perform configuration tasks, and that account becomes disabled when a server is promoted to be a DC. If you want to create an image of a server that is also a DC, you must first demote it from being a DC before creating the image.




