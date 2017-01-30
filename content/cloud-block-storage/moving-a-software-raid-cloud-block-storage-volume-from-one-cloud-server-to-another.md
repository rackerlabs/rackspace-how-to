---
permalink: moving-a-software-raid-cloud-block-storage-volume-from-one-cloud-server-to-another/
audit_date:
title: Move a Cloud Block Storage volume between servers
type: article
created_date: '2014-02-14'
created_by: Trenton Guthrie
last_modified_date: '2016-06-06'
last_modified_by: Nate Archer
product: Cloud Block Storage
product_url: cloud-block-storage
---

This article describes how to move a software RAID Cloud Block Storage
volume from one Cloud server to another. You might want to perform this
task when you need to build to a larger General Purpose server.

### Prerequisites

Before you can perform this task, you must have a software RAID volume.
For information about creating a RAID volume, see [Configure a software RAID on a Linux General Purpose Cloud server](/how-to/configuring-a-software-raid-on-a-linux-general-purpose-cloud-server).

### Detach the RAID volume

You must detach the volume from the source server before you can move it
to the destination server.

1. Run `cat mdstat` to see the name of the **md** device, as seen in the
following example:

       cat /proc/mdstat
       Personalities : [raid1]
       md0 : active raid1 xvdc[1] xvdb[0]
       157155200 blocks super 1.2 [2/2] [UU]

  In this example, the **md** device is `md0`.

2. Run the `mount` command to find the mount point.

       mount
       /dev/md0 on /raid type ext3 (rw)

  In this example, the volume mounted is **/raid**.

### Unmount the RAID volume

1. Unmount the volume, as shown in the following example:

        unmount /raid

2. Use `mdadm` to deactivate the **md** device, as shown in the following
example:

       mdadm --stop /dev/md0
       mdadm: stopped /dev/md0

3. In the [Cloud Control Panel](http://mycloud.rackspace.com), navigate to the
details page for the server from which you want to detach the Cloud
Block Storage volumes that composed the RAID.

4. In the **Storage Volumes** section of the server details page, click the
Actions gear next to each volume that you want to detach, and select
**Detach Volume**.

5. In the warning pop-up box, click **Detach Volume**.

### Attach the RAID volume

1. Attach the RAID volume to the **Destination** server.


2. Run `fdisk -l` to see the device IDs of the newly attached Cloud Block
Storage volumes.

       Disk /dev/xvdb: 161.1 GB, 161061273600 bytes
       255 heads, 63 sectors/track, 19581 cylinders
       Units = cylinders of 16065 * 512 = 8225280 bytes
       Sector size (logical/physical): 512 bytes / 512 bytes
       I/O size (minimum/optimal): 512 bytes / 512 bytes
       Disk identifier: 0x00000000
       Disk /dev/xvdc: 161.1 GB, 161061273600 bytes
       255 heads, 63 sectors/track, 19581 cylinders
       Units = cylinders of 16065 * 512 = 8225280 bytes
       Sector size (logical/physical): 512 bytes / 512 bytes
       I/O size (minimum/optimal): 512 bytes / 512 bytes
       Disk identifier: 0x00000000

### Recreate the RAID volume

1. Install `mdadm` on destination server if it is not already installed.

  For Redhat, CentOS, Fedora, and Scientific Linux (SL):

       sudo yum install mdadm

  For Ubuntu or Debian:

       sudo apt-get update
       sudo apt-get install mdadm

2. Reassemble the volumes in the RAID.

       mdadm --assemble --scan
       mdadm: /dev/md/0 has been started with 2 drives.

3. Remount the RAID.

       mkdir /newraid
       mount /dev/md0p1 /newraid
