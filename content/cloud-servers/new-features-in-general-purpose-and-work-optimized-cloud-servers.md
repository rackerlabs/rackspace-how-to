---
permalink: new-features-in-general-purpose-and-work-optimized-cloud-servers/
audit_date:
title: New features in General Purpose and work-optimized Cloud Servers
type: article
created_date: '2013-09-30'
created_by: Rackspace Support
last_modified_date: '2016-01-05'
last_modified_by: Mike Asthalter
product: Cloud Servers
product_url: cloud-servers
---

This article describes some of the major features and benefits of the
General Purpose and work-optimized flavors (configurations) of Cloud
Servers compared to the Standard server class. Changes have been
implemented with General Purpose and work-optimized servers to align
with industry standards, improve server imaging, and consistently
allocate adequate disk resources for each server.

### Disk structure

The General Purpose and work-optimized flavors use faster solid state
drives (SSD) and separate the system disk from the data disk, with both
disks equally RAID 10 protected. With your operating system on a
separate disk from your data, you can more easily create an image of the
system disk because it is a fixed size and doesn't scale up as other
resources increase. For more information about data disk imaging
limitations, see the "Images capture the system disk only" section later in this article or, for the full procedure, see the
article [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).

You can back up the data on your data disk or disks by leveraging either
Rackspace Cloud Backup or Rackspace Cloud Block Storage (an option that
can also be used to increase the storage capacity of your server, if
needed). For a comparison of the two data disk backup options, see [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).

### Faster server provisioning

The following features noticeably reduce the time to provision General
Purpose and work-optimized servers:

-   Dedicated 10-gigabit Ethernet (10 GigE) for networking on the host
    computer
-   SSDs
-   No requirement to format the entire disk (system disk only) when
    building your servers

### Higher memory availability

The General Purpose and work-optimized flavors are available with RAM
selection of up to 120 GB per server (up from 30 GB in the Standard
server class).

### Compute

The General Purpose and work-optimized flavors provide more processing
power: up to 32 vCPUs or virtual cores, compared to a maximum 8 vCPUs on
the largest-size server in the Standard server class. For information,
see [Work-optimized server types](#SizeOptions).

### Faster networking

General Purpose and work-optimized servers provide more network
bandwidth: 40 gigabit Ethernet (40 GigE) to each *host server* (the
physical machine that houses your virtual server). Each host server
gets 20 GigE for management and Cloud Block Storage, and 20 GigE for the
server's public network, ServiceNet, and network traffic. This bandwidth
dramatically improves the interoperability of servers with complementary
services such as Cloud Block Storage over the Standard server class.

### Higher maximum IOPS

Separating the operating system from the data provides higher maximum
input/output operations per second (IOPS). For example, the 1 GB General
Purpose flavor with 20 GB of system disk and no data disk can process
about 20k IOPS. The 120 GB I/O-optimized flavor with a 40 GB system disk
and 1200 (or 4x300) GB data disks can perform about 80k IOPS. Compare
this with the Standard server class for Cloud Servers, which can process
approximately only 2k IOPS.

### Work-optimized server types

**I/O-optimized** servers are assigned networking resources and use
local high-speed SSD drives for storage. I/O-optimized servers work best
for applications that require frequent or sustained disk access, like
databases.

**Compute-optimized** servers have a high CPU allocation to optimize the
server for applications with high CPU demands, like web servers and
application servers. All disk storage for Compute-optimized servers is
on Cloud Block Storage.

**Memory-optimized** servers have larger allocations of low-latency RAM
for memory-intensive applications like caching servers, in-memory
analytics, and search indexes. All disk storage for Memory-optimized
servers is on Cloud Block Storage.

### Resizing

Standard servers can resize up or down, but General Purpose (formerly
Performance 1) servers can only resize up, and work-optimized servers
cannot dynamically resize at all.

Along with the rest of the OpenStack community, Rackspace is reducing
support for this feature because it does not align with the
industry-standard method of scaling. Rather than resize one server for
vertical scaling, we instead recommend employing *horizontal
scaling* (adding or removing the number of servers managed by a load
balancer) to manage your available resources to suit your needs.

For information about reducing the size of your General Purpose server
or changing the size of your work-optimized server, see [Upgrading resources for General Purpose or I/O optimized Cloud Servers](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

### Images capture the system disk only

Images of your system capture only your operating system's configuration
(your system disk). This makes the imaging process run more quickly and
reliably without placing undue strain on your server. To retain the
information stored on attached data disks for General Purpose and I/O
optimized flavors, you can use [Cloud Block Storage](/how-to/create-and-attach-a-cloud-block-storage-volume)
or [Cloud Backup](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
to save only the files and directories that you need. For a comparison
of the two options, see [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).
To learn more about Cloud Block Storage snapshots, which are useful for
diskless flavors like Compute and Memory, see [Create and Use Cloud Block Storage Snapshots](/how-to/create-and-use-cloud-block-storage-snapshots).

### Preparing the data disk for use

As a result of having a separate system disk and data disk for I/O
optimized servers, you must prepare your data disk by formatting and
mounting it to your server before you can use it. Follow the
instructions in these articles to prepare your data disk for use:** **

-   [Preparing Data Disks on Windows Cloud Servers](/how-to/preparing-data-disks-on-windows-cloud-servers)
-   [Preparing Data Disks on Linux Cloud Servers](/how-to/preparing-data-disks-on-linux-cloud-servers)

### No 512 MB RAM servers

The 512 MB RAM cloud server is not available for General Purpose and
work-optimized flavors. As a server that uses shared CPU and networking
resources, maintaining the 512 MB size would place too much stress on
the host because of the bursting capabilities, and potentially
negatively impact other servers on the host computer.
