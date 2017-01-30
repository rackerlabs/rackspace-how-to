---
permalink: preparing-an-image-for-import-into-the-rackspace-opencloud/
audit_date:
title: Preparing an image for import into the Rackspace OpenCloud
type: article
created_date: '2014-02-16'
created_by: Cloud Images
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Images
product_url: cloud-images
---

You can use the Cloud Images service to import custom virtual machine
disk images into the Rackspace open cloud. For such images to boot
correctly, they must be prepared according to the following requirements
and instructions.

### General Requirements

-   The image must be a single file in the VHD file format.

    **Note**: A Cloud Files object, whether a Dynamic Large Object or a
    Static Large Object, is considered to be a single file for
    this purpose.

-   Images must not expand to a system disk larger than 40 GB.

-   If you have exported an image from the Rackspace OpenCloud it will
    already be in the VHD format required for import.

    **Note**: Images with system disks larger than 40 GB can be
    exported, but cannot be imported into the Rackspace open cloud.

### Microsoft Windows

Microsoft product use rights do not allow the use of License Mobility
for Windows licenses.

**Note:** Given the limitations related to this software
platform, image import is not available for Windows images.

### Preparing an image offline using XenServer

If you are preparing an image specifically for use in the Rackspace open
cloud, we recommend that you prepare it offline using a local
installation of XenServer.

For instructions for preparing an image on Linux, see the following
articles:

-   [Creating a CentOS 6.5 Image for the Rackspace open cloud](/how-to/creating-a-centos-65-image-for-the-rackspace-open-cloud)
-   [Creating an Ubuntu 13.10 Image for the Rackspace open cloud](/how-to/creating-an-ubuntu-1310-image-for-the-rackspace-open-cloud)

### Preparing an image online in another cloud

If you already have a server in another cloud, and you'd like to boot an
instance of it in the Rackspace open cloud, we recommend that you make a
copy of your server and make the necessary configuration and software
changes in the other cloud *before* you export an image of that server.
That's because it's a lot easier to work with a living server rather
than try to make offline modifications to a virtual machine image.

Basically, we suggest that you do the following:

1.  In the other cloud, create an image of the server you want to bring
    over to the Rackspace OpenCloud.
2.  In the other cloud, boot a new server from the image you
    just created.
3.  In the other cloud, make appropriate modifications to that new
    server so that it could work in the Rackspace OpenCloud.
4.  In the other cloud, create an image of the new server.
5.  In the other cloud, export the image you just created.
6.  Offline, convert the image to the VHD format.
7.  Offline, upload the image to your Rackspace Cloud Files account in
    the region in which you want to boot your server.
8.  Using Rackspace Cloud Images, import the image into the
    Rackspace OpenCloud.
9.  Boot a server from the imported image in the Rackspace OpenCloud.

Racker Mike Metral has put together a tutorial on the Rackspace DevOps
Blog that walks you through this process. His example shows you how
prepare a QCOW image and convert it to the VHD format so that you can
import it. Please see [Bootstrap Your QCOW Images for the Rackspace Public Cloud](https://developer.rackspace.com/blog/bootstrap-your-qcow-images-for-the-rackspace-public-cloud/).

### Alternative method

Preparing an image for import into the Rackspace OpenCloud is somewhat
complicated. As an alternative, consider using **boot.rackspace.com**, which
enables you to prepare an image directly inside the Rackspace OpenCloud.
For details, see the following posts in the Rackspace DevOps Blog:

-   [Introducing boot.rackspace.com](http://developer.rackspace.com/blog/introducing-boot-dot-rackspace-dot-com.html)
-   [Custom Images via boot.rackspace.com - Training Wheels Included](http://developer.rackspace.com/blog/custom-images-via-boot-dot-rackspace-dot-com-training-wheels-included.html)
