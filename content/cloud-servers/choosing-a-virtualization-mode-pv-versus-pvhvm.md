---
permalink: choosing-a-virtualization-mode-pv-versus-pvhvm/
audit_date:
title: Choosing a virtualization mode (PV versus PVHVM)
type: article
created_date: '2014-01-21'
created_by: Amanda Clark
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Paravirtualization and hardware virtualization are modes of
virtualization used by the hypervisor to run the virtual machine. This
article compares paravirtualization (PV) with a mode that combines
aspects of paravirtualization with full hardware virtualization
(PVHVM).

In general, PVHVM offers better performance than PV, especially for disk
and network IO, but is not well supported in Linux operating systems
with a kernel version earlier than 2.6.36. The availability of PV and
PVHVM images in the Rackspace Cloud is determined by the effectiveness
of each virtualization mode for that particular operating system.

If both PV and PVHVM options are available for the OS that you choose to
use, consider the following factors when choosing between them.

### Performance

-   Network and disk IO are faster with PVHVM images because QEMU
    emulation is bypassed.
-   PVHVM requires a bit more memory overhead than PV. If your
    application is memory intensive, or if it is optimized for PV Memory
    Management Units, PV might be a better choice.
-   If you are striving for performance optimization, test both
    options to determine which one performs better for your application.
-   Work-optimized servers (Compute, I/O, and Memory) require
    PVHVM images. If you try to create a work-optimized server by using
    a non-PVHVM image, the following error message is displayed:
    `Image cannot be built with provided flavor.`

### File system

-   Ext3 is used for all Linux PV Linux images.
-   Ext4 is used for all Arch, Fedora, Gentoo, and Ubuntu
    PVHVM images.

### Boot loader

-   PV images boot via pygrub.
-   PVHVM images boot via the boot loader in the master boot
    record of the operating system.

### Disk configuration

Automatic disk configuration can be used with PV images but fails
with PVHVM images. The error message looks as follows:

`ERROR: Requested image $UUID has automatic disk resize disabled. (HTTP 400)`
