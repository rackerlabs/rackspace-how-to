---
permalink: swap-space-on-cloud-servers/
audit_date: '2019-01-22'
title: Swap space on cloud servers
type: article
created_date: '2019-01-31'
created_by: Rackspace Community
last_modified_date: '2019-01-31'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---
As of October 28, 2013, cloud servers built by using our base Linux&reg;
images are created without a dedicated swap partition and with _swappiness_
(a measure of how the Linux kernel tries to use swap memory) set to 0. Any
Linux cloud servers that you have built from older base images or server
images retain any swap partition with which the images were originally
created.

### What is swap space?

Swap space is space on the hard disk that is reserved for use as virtual memory.
When a cloud server runs out of memory, the Linux kernel moves inactive
processes into swap space to make room for active ones in working memory. How
aggressively your cloud server uses swap space is determined by the value for
swappiness, which ranges from 0 to 100. A setting of 100 aggressively moves
processes, while a setting of 0 swaps only to avoid an out-of-memory condition.

### Why remove swap space?

In a multitenant cloud environment, certain resources are shared among
customers. In the case of swap, the key resource that sharing affects is
_disk IOPS_. IOPS stands for input/output operations per second, which is the
number of read and write operations performed on the disk per
second. When an application performs any sort of
read or write operation on the physical hard disks, the application 
consumes disk IOPS.

If cloud servers that are running on the same physical host run more processes
than their allotted random access memory (RAM), they begin to use swap space
heavily. When this occurs, a large portion of the available disk IOPS pool is
consumed, creating the _noisy neighbor effect_ in which other virtual
machines can monopolize the disk and affect your performance.

To provide the best service and consistent performance and to align
with industry standard practice, we have removed the swap partition that we
previously gave to each virtual machine by default. We believe that this change
enables a better customer experience.
