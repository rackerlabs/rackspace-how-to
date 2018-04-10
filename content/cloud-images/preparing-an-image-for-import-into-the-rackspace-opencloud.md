---
permalink: preparing-an-image-for-import-into-the-rackspace-opencloud/
audit_date: '2018-04-09'
title: Prepare an image for import into the Rackspace Open Cloud
type: article
created_date: '2014-02-16'
created_by: Cloud Images
last_modified_date: '2018-04-10'
last_modified_by: Kate Dougherty
product: Cloud Images
product_url: cloud-images
---

You can use the Cloud Images service to import custom virtual machine
disk images into the Rackspace Open Cloud. In order for these images to boot
correctly, they must be prepared according to the following requirements
and instructions.

### General requirements

Images must follow these general requirements:

-   The image must be a single file in the Virtual Hard Disk (VHD) file format.

    **Note**: A Cloud Files object, whether a Dynamic Large Object (DLO) or a
    Static Large Object (SLO), is considered to be a single file for
    this purpose.

-   Images must not expand to a system disk larger than 40 GB.

-   If you have exported an image from the Rackspace Open Cloud it will
    already be in the VHD format that is required for import.

    **Note**: Images with system disks larger than 40 GB can be
    exported, but cannot be imported into the Rackspace Open Cloud.

### Microsoft Windows

Microsoft product use rights do not allow the use of License Mobility
for Windows licenses.

**Note:** Because of the limitations related to this software
platform, import is not available for Windows images.

### Prepare an image offline using XenServer

If you are preparing an image specifically for use in the Rackspace Open
Cloud, we recommend that you prepare it offline using a local
installation of XenServer.

For instructions for preparing an image on Linux, see [Create a server image
for the Rackspace Open
Cloud](/how-to/creating-an-ubuntu-1310-image-for-the-rackspace-open-cloud).

### Prepare an image online in another cloud

If you already have a server in another cloud and you want to boot an
instance of it in the Rackspace Open Cloud, we recommend that you make a
copy of your server and make the necessary configuration and software
changes in the other cloud *before* you export an image of that server.
We recommend this approach because it's much easier to work with a living
server rather than to try to make offline modifications to a virtual machine
image.

We suggest that you take the following steps:

1.  In the other cloud, create an image of the server that you want to bring
    over to the Rackspace Open Cloud.
2.  In the other cloud, boot a new server from the image that you
    just created.
3.  In the other cloud, make appropriate modifications to the new
    server so that it can work in the Rackspace Open Cloud.
4.  In the other cloud, create an image of the new server.
5.  In the other cloud, export the image that you just created.
6.  Offline, convert the image to the VHD format.
7.  Offline, upload the image to your Rackspace Cloud Files account in
    the region in which you want to boot your server.
8.  Using Rackspace Cloud Images, import the image into the
    Rackspace Open Cloud.
9.  In the Rackspace Open Cloud, boot a server from the imported image.

For a tutorial on this process, see [Bootstrap Your QCOW Images for the
Rackspace Public
Cloud](https://developer.rackspace.com/blog/bootstrap-your-qcow-images-for-the-rackspace-public-cloud/). This tutorial walks through the process of preparing
a QEMU Copy on Write (QCOW) image and converting it to the VHD format so that
it can be imported.

### Use boot.rackspace.com as an alternative method

For a simpler method of preparing an image for import into the Rackspace Open
Cloud, consider using **boot.rackspace.com**. This method enables you to
prepare an image from directly inside the Rackspace Open Cloud.
For details, see the following posts from the Rackspace DevOps Blog:

-   [Introducing boot.rackspace.com](http://developer.rackspace.com/blog/introducing-boot-dot-rackspace-dot-com.html)
-   [Custom images via boot.rackspace.com - Training wheels included](http://developer.rackspace.com/blog/custom-images-via-boot-dot-rackspace-dot-com-training-wheels-included.html)
