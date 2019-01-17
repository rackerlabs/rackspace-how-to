---
permalink: mount-partition-chroot-into-primary-filesystem-rescue-mode
audit_date:
title: Mount Partition and Chroot into Primary Filesystem from Rescue Mode
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### Begin investigation of a server in rescue mode
Determine what your main partition is by running:
fdisk -l
Mount the partition.
**Note** Now depending on your version of base image you have built from It will be one of the two: Xen Classic uses sdb1 and Xen Server probably has xvdb1. (Note: with fdisk -l choose the largest partition)I am assuming you are using Xen Server. 

mount /dev/xvdb1 /mnt
Navigate to /mnt and see your filesystem with in the directory /mnt.
Sometimes there is a need to install a new kernel, remove a bad package, or just need to have xvdb1 as the / directory.
To do this:
First mount the necessary filesystem directories.
mount -t proc none /mnt/proc
mount --rbind /sys /mnt/sys
mount --rbind /dev /mnt/dev
Set up Networking for your chrooted session:
ln -s /etc/resolv.conf /mnt/etc/resolv.conf
chroot /mnt /bin/bash
The filesystem is now mounted as **/**.
