---
node_id: 1523
title: About Cloud Server images
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Creating an image lets you have saved images for later use as a
template or master image. You can then use the saved images to easily
restore a server to a known configuration or rapidly deploy additional
servers with an identical configuration. Using the [Cloud Control
Panel](http://mycloud.rackspace.com), you can create images
on-demand.

**Note**: Because images are not automatically verified they should not
be used as a back-up solution.

### For all server types

Please take note of the following limitations when creating server
images:

-   Cloud Server images are good for storing configuration and static
    data but **are not a reliable way to back up a
    dynamic database.** We recommend using standard backup tools such as
    mysqldump or the SQL Server Management Studio for this task. We also
    recommend backing up your database before creating an image of your
    Cloud Server.

-   **Cloud Server images cannot be transferred between accounts**, and
    you cannot build a server using an image from another account - even
    if you own both accounts.

-   ISOs and images from non-Rackspace servers cannot be uploaded to
    Cloud Files and used to build a new Cloud Server.

-   Image creation goes through several stages, from preparing the
    server data for the imaging and the actual copy of the image to
    Cloud Files. The process can take several hours if the disk is
    extremely large.

-   Image creation can have a delayed start if there are a large number
    of image requests at one time for a group of servers. The number of
    concurrent images are limited in order to keep the disk activity of
    multiple images from affecting performance on a host. If the image
    takes longer than 24 hours to complete contact Rackspace
    Cloud support.

-   If the image process fails more than once and you're sure you aren't
    past the image limits, contact Rackspace Cloud support. Our admins
    may be able to succeed where our automated processes do not.

### Linux Servers

-   When an image creation is attempted the system runs a process that
    tries to reclaim space that has been freed by deleting files
    and images. That process continues even if the image creation
    process is aborted because of disk limits at the time the
    process begins. That means that in some cases, trying an image
    creation process again about a half hour after it fails could result
    in a successful image process thanks to that cleanup operation.

### Windows Servers

-   On a Windows Cloud Server, current or previous disk usage
    cannot exceed **160GB**. Due to limitations with the Windows
    filesystem, the underlying virtual hard disk cannot shrink once it
    has expanded. Therefore, if you have resized your server larger than
    160GB, our imaging system will not be able to take an image of
    the server. We recommend taking an On-Demand image of your
    configuration before you reach 160GB of data on a Windows machine
    for this reason.

-   If you take a snapshot of a Windows Cloud Server that is configured
    to be a Domain Controller (DC), you will be unable to restore from
    that image. Our build system relies on the local Administrator
    account to perform configuration tasks, and that account becomes
    disabled once a server is promoted to be a DC. If you wish to create
    a image of a server that is also a Domain Controller, you must first
    demote it from being a DC before performing the image
    creation process.
