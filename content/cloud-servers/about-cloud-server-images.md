---
permalink: about-cloud-server-images/
audit_date:
title: About Cloud Server images
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-10-29'
last_modified_by: Brian King

product: Cloud Servers
product_url: cloud-servers
---

Creating an image enables you to have saved images for later use as a
template or master image. You can then use the saved images to easily
restore a server to a known configuration or rapidly deploy additional
servers with an identical configuration. Using the
[Cloud Control Panel](https://login.rackspace.com), you can create images on-demand.

**Note:** Because images are not automatically verified they should not
be used as a back-up solution.

### Considerations for all server types

Please take note of the following limitations when creating server
images:

-   Cloud Server images are good for storing configuration and static
    data but **are not a reliable way to back up a
    dynamic database.**

    Standard backup tools such as `mysqldump` or the SQL Server Management
    Studio are more suitable for backing up databases. Be sure to always back up
    your database before you create an image of your Cloud Server.


-   **Cloud Server images can be shared between accounts, but not between regions**.
    You can share images between accounts **in the same region**. This allows you to build a server from the shared image, and then create a copy of the newly created server. To move images between regions, see [Transfer images between regions of the Rackspace open cloud](/how-to/transferring-images-between-regions-of-the-rackspace-open-cloud).

-   Image creation can take several hours if the disk is extremely large, so be
    sure to allot an appropriate amount of time to create an image of your server.

-   Image creation can have a delayed start if there are a large number
    of image requests at one time for a group of servers. The number of
    concurrent images are limited in order to keep the disk activity of
    multiple images from affecting performance on a host. If the image
    takes longer than 24 hours to complete, contact Rackspace
    Support.

-   When an image creation is initiated, the system runs a process that
    attempts to reclaim space that has been freed by deleting files
    and images. That process continues even if the image creation
    process is aborted because of disk limits at the time the

    process begins. That means that in some cases, trying to create an image again after it fails could result in a successful image process thanks to that cleanup operation.

-   **If you are using a boot from volume server, you cannot create an image of it**. You can, however, create snapshots and clones of a boot from volume server.

### Considerations for Virtual Appliances
-   Turnkey virtual appliances typically do not support decloning.
    Thus, while an image will technically preserve the exact state of the appliance, any servers built from the image will not be able to set the following:

     * Hostname
     * IP configuration
     * Admin password
     * License key

    Instead of using Cloud Server Images, consult your appliance's vendor
 documentation for the recommended backup and restore procedures.

### Considerations for Windows servers

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

-   To be successful, images imported to Rackspace must conform to the general
    requirements described in
    [Preparing an image for import into the Rackspace OpenCloud](/how-to/preparing-an-image-for-import-into-the-rackspace-opencloud).
