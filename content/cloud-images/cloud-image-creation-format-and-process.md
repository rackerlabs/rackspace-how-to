---
permalink: cloud-image-creation-format-and-process/
audit_date:
title: Cloud image creation format and process
type: article
created_date: '2016-10-20'
created_by: Reese McJunkin
last_modified_date: '2016-10-20'
last_modified_by: Cat Lookabaugh
product: Cloud Images
product_url: cloud-images
---

### Disk storage

Rackspace Cloud Servers, with the exception of the OnMetal and "Boot from
Volume" flavors, use a format known as Virtual Hard Disk (VHD) to store their
system disks. When a server writes to the disk, the VHD writes each difference
between your original, base hard drive and the current system. Because of this,
deleting files off a server's hard disk actually causes the underlying VHD
to grow slightly. In the Rackspace Cloud, VHDs can only get larger, and they
will generally be slightly larger than the underlying filesystem at its largest
point. For example:

| **Build** | **current 'df –h' size** | **VHD size** |
| --- | --- | --- |
| Base Cloud Server Build | 1.8 GB | 2.5 GB |
| Cloud Server, with 100 GB | 100 GB | 108 GB |
| Cloud Server, which used to have 100 GB | 5 GB | 115 GB |

For more information on the VHD format and the imaging process, see
[Understanding the Cloud Imaging Process](https://community.rackspace.com/products/f/25/t/3778).

### Image creation process

The steps below outline the cloud Server imaging prices at a high level. For a
more in depth guide, see
[Understanding the Cloud Imaging Process](https://community.rackspace.com/products/f/25/t/3778).

1. The image is queued for creation or preparing to start, and a Coalesce is
preformed to attempt the elimination of duplicate data between the backend
VHDs. The API reports 0% progress.

2. The image is currently being created. This step saves the backend VHD file
and compresses it. The API reports 25% progress.

3. The image is being uploaded to Cloud Files. This step generally takes the
longest to complete, because the data is transferred from the backend
hypervisor to Cloud Files. The larger the VHD size, the longer it takes. The
API reports 50% progress.

### Image creation duration

A rule of thumb is once the image creation or upload starts (Image creation
steps 2 and 3), this generally takes 2 minutes per GB of data on the underlying
VHD. This is based on how much data the servers file system contained when it
was at it largest.  Several factors affect imaging time:

- **Daily / Weekly Imaging &amp; Coalescing**. A Coalesce is a backend
operation preformed during step 1, which attempts to merge duplicate data in
the VHD chain. If there is a large amount of differential data between the VHDs
this can take some time to complete, and the image creation starts once this is
done.

- **File System Size.** The system size is how much disk space is taken up on
your Cloud Server / How much at a did the server have when the file system was
at its largest

- **File System Activity**. Reads will not be highly impactful, but writes can
make the image coalesce and creation take much longer.

- **Cloud**  **Server Age.** Older servers tend to have larger VHDs.

- **Cloud Server Flavor.** Because the public cloud is a shared environment,
resources such as disk and network are shared. Newer Rackspace Cloud flavors
such as General Purpose, Performance, and I/O have greater I/O and network
resources.

### Reasons image creation fails

**Cloud Server Age** - Older flavor classes such as Standard and Classic exist
on older hardware that have limited network bandwidth for imaging operations.
This causes imaging to take longer to complete. There only ways around this are
to migrate to a newer flavor type, such as General Purpose, or to use a file
level backup tool such as Cloud Backup.

**Coalesce Timeout** - If you do not image your cloud server frequently, or if
you have a large amount of data being changed, added, or modified, these can
increase the completion time of the coalesce. If a timeout is reached, simply
wait and then issue the image creation request again. If you see this issue
repeatedly, it may be necessary to limit filesystem activity while imaging. If
image creation continues to fail, support can trigger a Coalesce outside of a
Cloud Server Image.

And as always, if none of these failure scenarios seem to apply, you can check
[System Status](https://status.rackspace.com/) to determine if there is a
larger issue affecting your imaging attempt.

