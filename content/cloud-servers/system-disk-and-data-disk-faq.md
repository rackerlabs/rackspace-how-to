---
permalink: system-disk-and-data-disk-faq/
audit_date:
title: System Disk and Data Disk FAQ
type: article
created_date: '2013-10-02'
created_by: Ross Diaz
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Explaining the System Disk and Data Disk Architecture

Some Cloud Servers use an architecture that pairs a *system disk* with a
separate *data disk(s)*. The benefits of implementing this architecture
include improved provisioning times, as well as more flexibility for
local data storage and disaster recovery.  Server images don't include
data disks, but they will include local system disks<span>. This means
that you will need to use a separate method for saving information
located on the data disk(s).</span>

### Saving Your Configuration Using System Images

You can retain the operating system and configuration information from
your system disk by using our Cloud Servers imaging feature, but it will
not save any information from the data disk(s). To save your data
disk(s) you have the option of using [Rackspace Cloud
Backup](/how-to/cloud-backup), which is a
granular file level backup system that you can configure to save only
the files and folders you wish to keep.

### How Do I Back up a Data Disk?

Since system images will only save data from the system disk, you will
need to use a backup solution like the Rackspace Cloud Backup service to
retain information from the data disk(s)..

### What About Scaling and Resizing?

Servers can be scaled by either hosting your application
on a load-balanced cluster (horizontal scaling) or by recreating the
server with a different server flavor.

Horizontal scaling is the most flexible approach, but it requires that
your application be able to work in a clustered environment.  With
horizontal scaling in place you can add and remove servers on demand,
either manually or with our [Auto Scale
features](/how-to/rackspace-auto-scale).

To recreate the server you can take an image of your server and build a
new server with a different size, or migrate data to a new server using
a tool like rsync.  If you use a Cloud Block Storage volume as your
server's boot device, you can also clone your boot volume and use the
clone to create a new server (see [Boot a server from a Cloud Block
Storage
volume](/how-to/boot-a-server-from-a-cloud-block-storage-volume)).
Note that the server IP address is not preserved with any of these
approaches.  If you require a persistent IP address, consider a load
balancer or other proxying solution so the IP address is maintained
separately from your application servers.
