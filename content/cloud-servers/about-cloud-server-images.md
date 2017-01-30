---
permalink: about-cloud-server-images/
audit_date:
title: About Cloud Server images
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-06-10'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Creating an image enables you to have saved images for later use as a
template or master image. You can then use the saved images to easily
restore a server to a known configuration or rapidly deploy additional
servers with an identical configuration. Using the [Cloud Control Panel](http://mycloud.rackspace.com), you can create images on-demand.

**Note:** Because images are not automatically verified they should not
be used as a back-up solution.

### Limitations for all server types

Please take note of the following limitations when creating server
images:

-   Cloud Server images are good for storing configuration and static
    data but **are not a reliable way to back up a
    dynamic database.**

    Standard backup tools such as `mysqldump` or the SQL Server Management Studio are more suitable for backing up databases. Be sure to always back up your database before you create an image of your
    Cloud Server.

-   **Cloud Server images cannot be transferred between accounts**.
    You can, however, share images between accounts **in the same region**. This allows you to build a server from the shared image, and then create a copy of the newly created server.

-   Image creation can take several hours if the disk is extremely large, so be sure to allot an appropriate amount of time to create an image of your server.

-   Image creation can have a delayed start if there are a large number
    of image requests at one time for a group of servers. The number of
    concurrent images are limited in order to keep the disk activity of
    multiple images from affecting performance on a host. If the image
    takes longer than 24 hours to complete contact Rackspace
    Support.

-   If the image process fails more than once and you're sure you haven't
    exceeded the image limits, contact Rackspace Support.

-   **If you are using a boot from volume server, you cannot create an image of it**. You can, however, create snapshots and clones of a boot from volume server.

### Limitations for Linux servers

-   When an image creation is initiated, the system runs a process that
    attempts to reclaim space that has been freed by deleting files
    and images. That process continues even if the image creation
    process is aborted because of disk limits at the time the
    process begins. That means that in some cases, trying to create an image again about a half hour after it fails could result in a successful image process thanks to that cleanup operation.

### Limitations for Windows servers

-   On a Windows Cloud Server, current or previous disk usage
    cannot exceed **160GB**. Due to limitations with the Windows
    filesystem, the underlying virtual hard disk cannot shrink once it
    has expanded. Therefore, if you have resized your server larger than
    160GB, our imaging system will not be able to take an image of
    the server. We recommend taking an image of your
    configuration before you reach 160GB of data on a Windows machine
    for this reason.

-   If you take a snapshot of a Windows Cloud Server that is configured
    to be a Domain Controller (DC), you will be unable to restore from
    that image. Our build system relies on the local administrator
    account to perform configuration tasks, and that account becomes
    disabled once a server is promoted to be a DC. If you wish to create
    a image of a server that is also a DC, you must first
    demote it from being a DC before performing the image
    creation process.

### Other limitations

-   ISOs cannot be uploaded to Cloud Files and used to build a new Cloud Server.

-   Importing images to Rackspace must follow the steps [Preparing an image for import into the Rackspace OpenCloud](/how-to/preparing-an-image-for-import-into-the-rackspace-opencloud), and must follow the General Requirements to be successful.
