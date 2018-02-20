--- permalink: converting-virtualization-mode-pv-to-pvhvm/
audit_date: title: Converting your server from PV to HVM mode type:
article created_date: '2014-01-21' created_by: Amanda Clark
last_modified_date: '2018-02-15' last_modified_by: Brian King product:
Cloud Servers product_url: cloud-servers ---

XenServer (the virtualization platform used by Rackspace public cloud)
supports multiple virtualization modes. For better performance and
security, you may wish to convert your Rackspace cloud server from
the older PV mode to the newer PV-HVM mode. Newer distributions (such as
CentOS 7 and Ubuntu 16) are only offered as PV-HVM, so conversion is not
necessary.

In general, PVHVM offers better performance than PV, especially for disk
and network IO.

The following OSes can be converted from PV to PVHVM:

- Ubuntu 12/14

- RHEL/CentOS 6

- Debian 7

If your server cannot be converted, we recommend deploying a new server from an existing
base image and migrating your data.

More details about the conversion process can be found [in this Rackspace Community article](https://community.rackspace.com/general/f/general-discussion-forum/8315/rackspace-public-cloud-converting-pv-instance-to-pvhvm) .

### Performance
### 
-   Network and disk IO are faster with PVHVM images because QEMU
emulation is bypassed. 
-   PVHVM requires a bit more memory overhead
than PV.  
-  Work-optimized servers (Compute, I/O, and Memory) require PVHVM images.
If you try to create a work-optimized server by using a non-PVHVM image,
the following error message is displayed: `Image cannot be built with
provided flavor.`

### File system
### 
-  The lower-performance ext3 filesystem is used for all PV Linux images. 
-  The higher-performance ext4 filesystem is used on PV-HVM Linux images.

### Boot loader
### 
-   PV images boot via pygrub. 
-   PVHVM images boot via the boot loader in the master boot record of the operating system.

### Disk configuration
### 
Automatic disk configuration can be used with PV images but fails with
PVHVM images. The error message looks as follows:

`ERROR: Requested image $UUID has automatic disk resize disabled. (HTTP
400)`
