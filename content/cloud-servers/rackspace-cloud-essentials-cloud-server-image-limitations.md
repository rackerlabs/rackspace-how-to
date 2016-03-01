---
node_id: 1177
title: Rackspace Cloud Essentials - Cloud Server Image Limitations
type: article
created_date: '2011-08-05'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)

In the preceding article in this series you learned how to [restore servers from an image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).
These images are ideal for use as templates or "gold images", so that
you can easily restore to a known configuration or rapidly deploy
additional Cloud Servers. This system was designed primarily to speed
deployment of new servers and not as a robust backup solution. As such,
there are a number of practical limitations in place:

-   Cloud Server images are good for storing configuration and static
    data but **are not a reliable way to back up a dynamic database!**
    We recommend using standard backup tools such as mysqldump or the
    SQL Server Management Studio for this task. Backing up your database
    is recommended before creating an image of your Cloud Server. If you
    do want to create an image of a server that contains a database, you
    must take the database down, initiate the image creation, and
    restart the database when the server reaches the appropriate
    task state. For details on the task monitoring process, see [Using Task States With Server Imaging](/how-to/using-task-states-with-server-imaging).
    For instructions on using Cloud Backup to back up a database,
    see [Rackspace Cloud Backup - Backing up Databases](/how-to/rackspace-cloud-backup-backing-up-databases).

-   Cloud Server images do not include Cloud Block Storage volumes in
    their data, even if the volume is used as the boot volume.  For
    information on making snapshots of Cloud Block Storage volumes,
    see [Create and Use Cloud Block Storage Snapshots](/how-to/create-and-use-cloud-block-storage-snapshots).

-   I/O-optimized Cloud Servers images only capture the system
    disk, **not any attached data disks**. Our Cloud Backup service can
    back up data disks to Cloud Files; see [Getting Started with Rackspace Cloud Backup](/how-to/cloud-backup)
    for details and instructions.

-   While you can import images into the Rackspace open cloud using
    Cloud Images, you'll only be able to boot a server from such an
    image if it's been properly prepared for use in the Rackspace
    open cloud.

    **Note**: Image import is not available for the First-Generation
    Cloud servers. All servers based on the OpenStack architecture can
    have images exported and imported between accounts. For more
    information, see the [Cloud Images FAQ](/how-to/cloud-images-faq).

-   While you can download First-Generation cloud images and images
    exported from the Rackspace open cloud, whether those images will
    work in another cloud or in your local virtualization solution
    depends upon the target cloud or local solution.  Consult your
    vendor for details.

    **Note**: Not all images may be exported from the Rackspace open
    cloud.  For more information, see the [Cloud Images FAQ](/how-to/cloud-images-faq).

-   Images go through several stages, from preparing the server data for
    the imaging and the actual copy of the image to Cloud Files. The
    imaging process can take several hours, and can fail if you're very
    close to the maximum disk size for images or if you have an
    extremely large number of files.

    You can monitor the tasks involved in this process. For information
    on the task monitoring process, see [Using Task States With Server Imaging](/how-to/using-task-states-with-server-imaging).

-   Imaging processes can have their start delayed if there are a large
    number of image requests at one time for a group of servers. The
    number of concurrent images are limited in order to keep the disk
    activity of multiple images from affecting performance on a host. If
    the image takes longer than 24 hours to complete, contact Rackspace
    Cloud support.

-   If your image fails more than once and you're sure you aren't
    exceeding the image limits, contact Rackspace Cloud support. Our
    admins may be able to succeed where our automated processes do not.

### Linux-specific limitations

-   On a First-Generation Linux Cloud Server current volume size cannot
    be more than **250GB** and current inode usage should not be more
    than 3 million. Exceeding those limits will cause an image request
    to fail (though in most cases we can help you work around the
    inode limit). You can check how much disk space you are currently
    using by running the command "**df -h**", and your inode usage can
    be viewed with "**df -i**". There are no limits on image disk size
    or inode usage for Standard Cloud Servers at this time. General
    Purpose and I/O servers cannot be built from images with system
    volumes larger than 40GB.

-   If you reduce your disk usage below the limits an image still may
    not succeed. The total size of your instance's virtual disk includes
    space allocated behind the scenes to track changes between images as
    well as space that used to be allocated to deleted files. As a
    result, having several images or having grown the disk in the past
    can cause the virtual disk size to exceed the limit even if the
    current filesystem inside of an instance is below the limit.

-   When an image is attempted the system runs a process that tries to
    reclaim space that has been freed by deleting files and images. That
    process continues even if the image is aborted because of disk
    limits at the time the image begins. That means that in some cases,
    trying an image again about a half hour after it fails could result
    in a successful image thanks to that cleanup operation.

### Windows-specific limitations

-   On a First-Generation **Windows** Cloud Server, current ***or
    previous*** disk usage cannot exceed **250GB**. Due to limitations
    with the Windows filesystem, the underlying virtual hard disk cannot
    shrink once it has expanded. Therefore, if you have resized your
    server larger than 250GB, our Imaging system will not be able to
    take an image of the server. We recommend taking an On-Demand image
    of your configuration before you reach 250GB of data on a
    first-generation Windows machine for this reason.  There are no
    limits on image disk size for Standard Windows Cloud Servers at this
    time. General Purpose and I/O servers cannot be built from images
    with system volumes larger than 40GB.

-   If you take an image of a Windows Cloud Server that is configured to
    be a Domain Controller (DC), you will be unable to restore from
    that image. Our build system relies on the local Administrator
    account to perform configuration tasks, and that account becomes
    disabled once a server is promoted to be a DC. If you wish to create
    an image of a server that is also a Domain Controller, you must
    first demote it from being a DC before performing the image.

As we continue developing our services some of these potential issues
will go away. Right now, however, this represents the practical
experience of our Fanatical Support staff, and we feel it is important
to share it with you and set correct expectations. Now that you know how
to create and connect to a server, configure security, and save your
work - the next step is to upload your content to the server for use
with your web applications.

### Next section

[Remote Connection from Windows to a Linux Server](/how-to/connecting-to-linux-from-windows-by-using-putty)
