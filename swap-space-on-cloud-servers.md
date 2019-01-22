---
permalink: swap-space-on-cloud-servers
audit_date:
title: Swap Space on Cloud Servers
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
As of October 28, 2013, Cloud Servers built using our base Linux images are created without a dedicated swap partition and “swappiness” (a measure of how the Linux kernel will try to use swap memory) set to 0. Any Linux Cloud Servers built from older base images or server images retain any swap partition the images were originally created with.
What is swap?

Swap is space on the hard disk that is reserved to be used as virtual memory. When a Cloud Server runs out of memory the Linux kernel moves inactive processes into swap to make room for active ones in working memory. How aggressively your Cloud Server does this is determined by the value for swappiness, which is in a range of 0 to 100. A setting of 100 will aggressively move processes, while a setting of 0 will swap only to avoid an out of memory condition.
Why remove swap?

In a multi-tenant cloud environment certain resources are shared amongst customers, and in the case of swap the key resource affected is “disk IOPS” (IOPS stands for “Input/Output Operations per Second”; literally the number of read/write operations that can be performed on the disk per second). Disk IOPS are consumed whenever an application performs any sort of read or write to the physical hard disks.
If Cloud Servers running on the same physical host are running more processes than their allotted RAM, they will begin to heavily utilize swap. This has the side effect of consuming a large portion of the available disk IOPS pool, thereby causing what we refer to as the “noisy neighbor effect". Put plainly, this means that other virtual machines can monopolize the disk and affect your performance, much like a noisy neighbor in the real world can disrupt your quiet dinner plans.
Prior to the change described above, a separate partition, solely dedicated to swap memory, would be given to each virtual machine by default. In order to provide the best service and consistent performance, as well as aligning to industry standard practice, we have removed this default swap partition. We believe this will lead to better customer experiences across the board.
