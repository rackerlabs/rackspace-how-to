---
permalink: cloud-image-creation-format-and-process/
audit_date: '2017-05-04'
title: Cloud image creation format and process
type: article
created_date: '2016-10-20'
created_by: Reese McJunkin
last_modified_date: '2017-05-04'
last_modified_by: Brian King
product: Cloud Images
product_url: cloud-images
---

When you create server images, you need to consider many things, from disk
storage to scheduling to how long the process takes. This article addresses
some of those topics.

### Disk storage

Rackspace cloud servers, with the exception of the OnMetal and Boot from
Volume flavors, use a format known as Virtual Hard Disk (VHD) to store their
system disks. When a server writes to the disk, the VHD writes each difference
between the original, base hard drive and the current system. Because of this,
deleting files from a server's hard disk actually causes the underlying VHD
to grow slightly. In the Rackspace Cloud, VHDs can only get larger, and they
are generally slightly larger than the underlying file system at its largest
point. For example:

| **Build** | **current 'df –h' size** | **VHD size** |
| --- | --- | --- |
| Base cloud server Build | 1.8 GB | 2.5 GB |
| Cloud server, with 100 GB | 100 GB | 108 GB |
| Cloud server, which used to have 100 GB | 5 GB | 115 GB |

For more information about the VHD format and the imaging process, see
[Understanding the Cloud Imaging Process](https://community.rackspace.com/products/f/25/t/3778).

### Image creation process

The following steps outline high level process of creating a cloud server image.
For a more in-depth guide, see
[Understanding the Cloud Imaging Process](https://community.rackspace.com/products/f/25/t/3778).

1. The image is queued for creation or is preparing to start.  During this
time, the coalesce is preformed to eliminate duplicate data between the
back-end VHDs. The API reports 25% progress.

2. The image is being created. This step saves, compresses, and uploads the
back-end VHD file to Cloud Files. This step generally takes the longest to
complete, because the data is transferred to Cloud Files. The API reports 50%
progress.

3. The image creation and upload is complete, and the image process is cleaned
up on the back-end. The API reports 100% progress.

### Image creation duration

A rule of thumb is once the image creation or upload starts (Image creation
steps 2 and 3), this generally takes 2 minutes per GB of data on the underlying
VHD. This is based on how much data the servers file system contained when it
was at its largest.  Several factors affect imaging time:

- **Daily and weekly imaging**: During image creation, a coalesce is the backend
operation performed during step 1 that attempts to merge duplicated data in
the VHD chain. If a large amount of differential data exists between the VHDs,
this process can take some time to complete, and the image creation starts
after this process is done.

- **File system size**: The system size is how much disk space is used on
your Cloud Server, at its largest.

- **File system activity**: Reads are not highly impactful, but writes can
make the image coalesce and creation take much longer.

- **Cloud server age**: Older servers tend to have larger VHDs,which take
longer to image.

- **Cloud server flavor**: Because the public cloud is a shared environment,
resources such as disk and network are shared. Resource constraints on older
flavors can slow the imaging process. Newer Rackspace Cloud flavors, such as
General Purpose, Performance, and I/O, have greater I/O and network resources,
improving performance.

### Reasons that image creation fails

If the image creation fails, one of the following issues might be the reason.

**Age of the server** - Older flavor classes, such as Standard and Classic,
exist on older hardware that has limited network bandwidth for imaging
operations. This limit causes imaging to take longer to complete. To work
around this issue, you can [migrate to a newer flavor type](/how-to/migrating-to-a-general-purpose-or-io-server), such as General
Purpose, or use a file-level backup tool such as Cloud Backup.

**Coalesce timeout** - If you do not image your cloud server frequently, or if
a large amount of data is changed, added, or modified, the completion time of
the coalesce process can increase. If a timeout is reached, you can wait and
then send the image creation request again. If you see this issue repeatedly,
you might need to limit file system activity while imaging. If image creation
continues to fail, Rackspace Support can trigger the coalesce process outside
of a Cloud Server Image.

If neither of these failure scenarios applies, you can check the
[System Status](https://status.rackspace.com/) to determine if a larger
system issue is affecting your imaging attempt.

