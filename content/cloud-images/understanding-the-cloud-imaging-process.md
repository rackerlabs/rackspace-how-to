---
permalink: understanding-the-cloud-imaging-process/
audit_date: '2019-01-21'
title: Understanding the Cloud Imaging process
type: article
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Cat Lookabaugh
product: Cloud Images
product_url: cloud-images
---

This article explains how data on a disk becomes an image and how that affects
the image creation and upload processes.

The Rackspace cloud, and many others, uses a file format know as Virtual Hard
Disk (VHD). The VHD format has been around for some time and was part of a
product known as Virtual PC created by Connectix&reg; (later purchased by
Microsoft&reg;). The VHD file format is readable and supported by almost every
hypervisor available today, including XenServer&reg;, VMware&reg;,
Virtual Box&reg;, Hyper-V&reg;, and Kernal-based Virtual Machine (KVM). VHD is
a proven method for images and instance data in the Cloud.

### How data is stored on a disk

It's important to understand how a hard drive works in a normal computer before
considering how VHDs store data in the cloud. A physical disk inside your computer
holds your data. On the disk itself, a size-dependent number of sectors exists
where data can be written. When you put a file system on a hard drive,
the system maps these sectors and tracks where your data is physically stored on
the hard disk. When you click on a picture of your family, your computer can
pull together the specific bits of data that make up your image. When you delete
this image, the sectors where the data was written are placed on a list of
sectors available for new information storage. However, those sectors might not
be immediately changed, so your data might still persist even though you can no
longer see the picture on your computer.

### How VHDs work

The VHD format works in much the same way as your computer hard drive. A cloud
server hard drive is made up of two or more VHD files, known as a *Virtual Disk
Image (VDI) chain*. With a VDI chain, you start with a base VHD called the
*Parent VHD*. This is the base information for your instance. When you build a
new server from a base image, such as Red Hat Enterprise&reg; Linux 6.4, your
initial parent VHD is a read-only base Red Hat image. A *Child VHD* also exists
on which your instance actively performs read and write operations. Changes that
you make to your server are written directly to the child VHD. When you look at
data in your instance, the system must determine whether the child VHD has a
version of this file. If the file has changed, the data for the file comes from
the child VHD. If the file has not changed, the child references the data from
its parent, and the data is read from the base VHD. This is important because
when you add, remove, or modify a file in your instance, these actions add data
to the child instance, which increases the size of the VDI chain.

### Illustrating the VDI chain

To understand how data is stored in VDI chain, consider an example from a cloud
server. For example, when you run `df -h`, the output looks similar to the
following example:

    [root@awol-server ~]# df -h

    Filesystem      Size     Used    Avail   Use%  Mounted on
    /dev/xvda1       79G     5.3G    70G     7%     /
    tmpfs           935M     0       935M     0%    /dev/shm

This output shows a server with a 79 GB capacity with 5.3 GB used.

Looking at disk usage in the following example doesn't show the data on the
server. Instead, it shows that the physical usage of the VDI chain is doubled.

    base copy                                   ----     5.3 GiB  -   false     xxxxx-xxxx-xxxx-xxxx-xxxxxxxx
    |--instance-xxxxx-xxxx-xxxx-xxxx-xxxxxxxx   xvda    10.6 GiB  -   false     xxxxx-xxxx-xxxx-xxxx-xxxxxxxx

You can see that the instance has 5 GB of usage.  But if you look at the
VDI chain, there is really 5 GB of usage and 5 GB of changes, which is
reasonable considering this is an actively used server.  In the preceding
example, however, you see the line for the `base copy` and below that is
`instance`, which is the active child.  When there are changes, the line
below the `base copy` shows a higher value, which indicates the real
size of the complete VDI chain.

The following example shows that the base image has coalesced all of the changes,
and there is now an active child that does not yet show any change.  The third
line is a snapshot, which shows an inactive child that is used along with the
base (or parent) VHD as a read-only copy of your server that is uploaded to
Cloud Files. This is then used as your parent and active child when you build
your image.

    base copy                                   ----    10.6 GiB  -   false     xxxxx-xxxx-xxxx-xxxx-xxxxxxxx
    |--instance-xxxxx-xxxx-xxxx-xxxx-xxxxxxxx   xvda    10.6 GiB  -   false     xxxxx-xxxx-xxxx-xxxx-xxxxxxxx
    |--instance-xxxxx-xxxx-xxxx-xxxx-xxxxxxxx   ----    10.6 GiB  -   true      xxxxx-xxxx-xxxx-xxxx-xxxxxxxx


### How the VDI chain affects images

Because each change increases the size of the VDI chain, this affects the
creation of images. When you use the API to create an image, the first thing
that happens is a process called a *coalesce*, which flattens the VDI chain
that exists on the host. The process combines the data on the parent VHD and the
active child, which creates a new base file. The process does not merge the
changes and make the VDI smaller, but it instead adds the change data to the
parent VHD and creates a new VHD. The new VHD becomes the new parent, which also
creates a new child VHD. Finally, the base VHD is duplicated to create a
snapshot. The snapshot becomes your image file, which is then compressed and
uploaded to Cloud Files.

### The image build process in the MyCloud portal

The Rackspace MyCloud portal displays percentages during image creation. These
percentages are not exact measurements of the entire image progress, but they
indicate specific steps, which are explained in the following list:

**0%**: Your image is queued for creation or is preparing to start. If the image
stays at **0%** for more than a few hours, reach out to Rackspace Support to
investigate a possible failure.

**25%**: Your image is currently creating. Depending on the size of the VDI
chain, this might take some time to complete.

**50%**: Your image is now uploading to Cloud Files. This step in the imaging
process generally takes the longest to complete. At this point, the image is
created, and the host server is pushing the data in compressed segments to
a Cloud Files container. Depending on the size of the VDI chain, the upload
could take several hours. If you are concerned, Support technicians can verify
that the process is moving, but they are not able to see how much is left to
upload.
