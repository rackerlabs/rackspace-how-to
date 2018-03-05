---
permalink: converting-your-server-from-pv-to-pvhvm/
audit_date: '2018-03-05'
title: Converting your server from PV to PVHVM
type: article
article created_date: '2018-02-21' 
created_by: Brian King
last_modified_date: '2018-03-05' 
last_modified_by: Cat Lookabaugh 
product: Cloud Servers 
product_url: cloud-servers 
---

XenServer, which is the virtualization platform used by the Rackspace public cloud, supports multiple 
virtualization modes. For better performance and security, convert your Rackspace cloud server from 
the older paravirtualization (PV) mode to the newer paravirtualization with full hardware 
virtualization (PVHVM) mode. Newer distributions, such as CentOS 7 and Ubuntu 16, are only offered 
as PVHVM, so conversion is unnecessary.

In general, PVHVM offers better performance than PV, especially for disk and network I/O operations.

The following operating systems can be converted from PV to PVHVM:

- Ubuntu 12/14
- RHEL/CentOS 6
- Debian 7

If your server cannot be converted, we recommend that you deploy a new server from an existing base image and 
migrate your data to the new server.

To learn more about the conversion process, see [this Rackspace Community article](https://community.rackspace.com/general/f/general-discussion-forum/8315/rackspace-public-cloud-converting-pv-instance-to-pvhvm).

Some advantages and disadavantages of PVHVM are described in the following sections.

### Performance ### 

PVHVM performance considerations include the following: 

-  Network and disk I/O are faster with PVHVM images because Quick Emulator (QEMU) emulation is bypassed. 
-  PVHVM requires a bit more memory overhead than PV.  
-  Work-optimized Rackspace servers, such as Compute, I/O, and Memory, require PVHVM images.

If you try to create a work-optimized server by using a non-PVHVM image, the following error message is 
displayed: 

`Image cannot be built with provided flavor.`

### File system ### 

File system considerations include the following: 

-  The lower-performance ext3 filesystem is used for all PV Linux images. 
-  The higher-performance ext4 filesystem is used on PVHVM Linux images.

### Boot loader ### 

Boot loader considerations include the following: 

-  PV images boot by using pygrub. 
-  PVHVM images boot by using the boot loader in the master boot record of the operating system.

### Disk configuration ### 

Automatic disk configuration can be used with PV images but not with PVHVM images. 

If you try to use automatic disk configurtion with a PVHVM image, the following error message is 
displayed:

`ERROR: Requested image $UUID has automatic disk resize disabled. (HTTP 400)`
