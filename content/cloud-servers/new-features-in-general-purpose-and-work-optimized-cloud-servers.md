---
permalink: new-features-in-general-purpose-and-work-optimized-cloud-servers/
audit_date: '2017-05-08'
title: New features in General Purpose and work-optimized Cloud Servers
type: article
created_date: '2013-09-30'
created_by: Rackspace Support
last_modified_date: '2017-05-04'
last_modified_by: Brian King
product: Cloud Servers
product_url: cloud-servers
---

This article describes some of the major features and benefits of the
General Purpose and work-optimized flavors of Cloud
Servers compared to the Standard server class. General Purpose and work-optimized servers have been updated to align
with industry standards, improve server imaging, and consistently
allocate adequate disk resources for each server.

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

### Disk structure

General Purpose and I/O flavors use faster solid state
drives (SSD). I/O flavors also have secondary data disks, which are not captured during an imaging operation. For more information about data disk imaging limitations, see the article [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).

You can back up the data on your data disk or disks by leveraging either
Rackspace Cloud Backup or Rackspace Cloud Block Storage which
can used to increase the storage capacity of your server, if
needed. For a comparison of the two data disk backup options, see [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).

### Faster server provisioning

The following features noticeably reduce the time to provision General
Purpose and work-optimized servers:

-   Dedicated 10-gigabit Ethernet (10 GigE) for networking on the host
    computer
-   SSDs
-   No requirement to format the entire disk (system disk only) when
    building your servers

### Higher memory capacity

General purpose and work-optimized flavors feature a maximum of 240 GB RAM per server, as compated to only 30 GB in the Standard
server class.

### Compute

General Purpose and work-optimized flavors provide more processing
power: up to 32 vCPUs or virtual cores, compared to a maximum 8 vCPUs on
the largest-size server in the Standard server class. For information,
see [Work-optimized server types](#work-optimized-server-types).

### Faster networking

General Purpose and work-optimized servers provide more network
bandwidth: 40 GigE to each *host server*, the
physical machine that houses your virtual server. Each host server
gets 20 GigE for management and Cloud Block Storage, and 20 GigE for the
server's public network, ServiceNet, and network traffic. This bandwidth
dramatically improves the interoperability of servers with complementary
services such as Cloud Block Storage over the Standard server class.

### Higher maximum IOPS

Separating the operating system from the data provides higher maximum
input/output operations per second (IOPS). For example, a 1 GB General
Purpose server with 20 GB of system disk and no data disk can process
about 20k IOPS. A 120 GB I/O-optimized server with a 40 GB system disk
and 1200 (or 4x300) GB data disks can perform about 80k IOPS. Compare
this with the Standard server class for Cloud Servers, which can process
approximately only 2k IOPS.

### Resizing

Standard servers can resize up or down, but General Purpose servers can resize only up, and work-optimized servers
cannot dynamically resize at all.

Along with the rest of the OpenStack community, Rackspace is reducing
support for this feature because it does not align with the
industry-standard method of scaling. Rather than resize one server for
vertical scaling, we instead recommend employing *horizontal
scaling*, adding or removing the number of servers managed by a load
balancer to manage your available resources to suit your needs.

For information about reducing the size of your General Purpose server
or changing the size of your work-optimized server, see [Upgrading resources for General Purpose or I/O optimized Cloud Servers](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

### (I/O flavors only) Preparing the data disk for use

Because I/O-optimized servers have a separate system disk and data disk, you must prepare your data disk by formatting and
mounting it to your server before you can use it. Follow the
instructions in these articles to prepare your data disk for use:

-   [Preparing Data Disks on Windows Cloud Servers](/how-to/preparing-data-disks-on-windows-cloud-servers)
-   [Preparing Data Disks on Linux Cloud Servers](/how-to/preparing-data-disks-on-linux-cloud-servers)

### No 512 MB RAM servers

The 512 MB RAM cloud server is not available for General Purpose and
work-optimized flavors. For a server that uses shared CPU and networking
resources, maintaining the bursting capabilites of the 512 MB size places too much stress on
the host, and could potentially negatively impact other servers on the host computer.
