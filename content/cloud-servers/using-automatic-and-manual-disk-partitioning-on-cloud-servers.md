---
permalink: using-automatic-and-manual-disk-partitioning-on-cloud-servers/
audit_date:
title: Automatic and manual disk partitioning on Cloud Servers
type: article
created_date: '2013-07-09'
created_by: Trey Hoehne
last_modified_date: '2016-09-12'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

When you use the Cloud Control Panel to create a Cloud Server that uses
Linux, two disk partition options are available: Manual and
Automatic. **Unless you know for certain that you will need to partition
your server's main or system disk, we strongly advise that you use the
Automatic option**.

The partitioning setting affects whether you have free space for more
partitions on the local boot drive of a server after it is created.

-   **Automatic**: Selecting this option increases the time it takes for
    the cloud server to build and become available for use. This creates
    just one partition that is expanded during the build process to take
    advantage of all the allotted disk space a server has available
    to it.
-   **Manual**: Selecting this option decreases the time it takes for
    your cloud server to build and become available for use. This option
    only creates a partition for the operating system (20 GB) and leaves
    any remaining disk space unpartitioned.

The selected disk partition option is used when you resize a server up,
and it is inherited by snapshots created from the server. The disk
partition option is also referred to as Disk Config or Disk
Configuration in the Cloud Servers API documentation.

Not all systems support changing the partitioning setting.  System disks
that are 20G or smaller do not support manual partitioning.  A server
booting from a Cloud Block Storage volume does not support partitioning.

### Partitioning Options on the Control Panel

The disk partition option is located at the bottom of the Create Server
page, under Advanced Options.

**<img src="{% asset_path cloud-servers/using-automatic-and-manual-disk-partitioning-on-cloud-servers/Screen%20Shot%202013-07-30%20at%203.25.55%20PM.png %}" alt="Screen shot showing new disk options" width="603" height="414" />**



You can view the current Disk Partition mode of a Cloud Server on the
Server Details page.

### Additional Details

The base image you use to create a Cloud Server is built with a 20 GB
partition and host machine resources that vary depending on the
configuration that you select.

Disk Partition determines what happens to that extra virtual disk space.
By using the Automatic option the initial 20 GB partition is expanded to
include all of the available virtual disk. This increases the amount of
time it takes for the server build to complete as the extra space must
be formatted and then the root partition expanded. If you use the Manual
option then that extra disk space is left unformatted and not used by
the operating system, resulting in a faster build time.

#### Resizing

Changing the Disk Partition from Manual to Auto or Auto to Manual is not
advised. It is recommended to use only one Disk Configuration option for
the life of that Cloud Server. **Resizing a server down with the Manual
Disk Partition option is not currently supported for servers that can be
resized (standard Cloud Servers only).**

#### Snapshots

A snapshot will inherit the Disk Partition option of the server it was
imaged from. Any servers built from that snapshot will have the same
Disk Partition option set.

When viewing the details of a saved image from the API you will be able
to note 'auto\_disk\_config' in the details returned. This can be set to
TRUE, FALSE, or DISABLED. DISABLED is reserved for Windows and FreeBSD
images as their disk expansion is handled via an independent process. A
value of TRUE will indicate a Disk Configuration of Automatic, and FALSE
will indicate Manual Disk Configuration. You will always have the option
of overriding the Disk Partition option at build via the API or Control
Panel unless the image's 'auto\_disk\_config' is DISABLED.

### Windows Manual Disk Partitioning

Disk partitions can be created and expanded via the Server Management
interface.

1.  Open the Server Management interface.

    -   On Windows Server 2008, right-click the computer's icon and
        select Manage.

    -   On Windows Server 2012, click the Server Manager button on
        the taskbar.

2.  Navigate to the list of the system's attached storage volumes.

    -   On Windows Server 2008, select Storage in the left panel, then
        select Disk Management.

    -   On Windows Server 2012, select File and Storage Services in the
        left panel, then select Disks.

3.  To add a new partition with available space, run the New Volume
    Wizard to format it as NTFS and assign it a drive letter.

    -   On Windows Server 2008, right-click the disk's unallocated space
        in the lower pane and select "New Simple Volume".

    -   On Windows Server 2012, right-click the disk and select
        "New Volume".

4.  To extend a partition, right-click the partition in the lower pane
    and select Extend from the menu.

### Linux Manual Disk Partitioning

Partitioning on Linux from the command line is a bit more complex. We're
going to build an Ubuntu 12.10 image, select a server size of 2 GB which
comes with 80 GB of virtual disk space, and the Manual Disk Partition
option. When that server comes online the operating system will have 20
GB out of the total 80 GB virtual disk available to it. You will see the
additional 60 GB as unpartitioned space.

Here's what this looks like on a 2 GB server created with the Manual
Disk Partition option using different tools. Some of the following
examples may display disk space in a less familiar format using the
concept of sectors. In these cases the output will note total sectors
available followed by what sectors a partition will span. The cfdisk
example shows this concept by noting the first, last, and total sectors
spanned by the partition.

Using df -h to check:

    root@server:~#df -h /dev/xvda1
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/xvda1       20G  920M   18G   5% /

Using cfdisk to check:

    root@server:~#  cfdisk -P s /dev/xvda
    Partition Table for /dev/xvda

                   First       Last
     # Type       Sector      Sector   Offset    Length   Filesystem Type (ID) Flag
    -- ------- ----------- ----------- ------ ----------- -------------------- ----
       Pri/Log           0        2047*     0#       2048*Free Space           None
     1 Primary        2048*   41943039*     0    41940992*Linux (83)           None
       Pri/Log    41943040*  167772159*     0   125829120*Free Space           None

Using fdisk to check:

    root@server:~# fdisk -l /dev/xvda

    Disk /dev/xvda: 85.9 GB, 85899345920 bytes
    151 heads, 48 sectors/track, 23147 cylinders, total 167772160 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0x0922c629

        Device Boot      Start         End      Blocks   Id  System
    /dev/xvda1            2048    41943039    20970496   83  Linux

Using parted to check:

    root@server:~# parted
    GNU Parted 2.3
    Using /dev/xvda
    Welcome to GNU Parted! Type 'help' to view a list of commands.
    (parted) print free
    Model: Xen Virtual Block Device (xvd)
    Disk /dev/xvda: 85.9GB
    Sector size (logical/physical): 512B/512B
    Partition Table: msdos

    Number  Start   End     Size    Type     File system  Flags
            32.3kB  1049kB  1016kB           Free Space
     1      1049kB  21.5GB  21.5GB  primary  ext3
            21.5GB  85.9GB  64.4GB           Free Space

    (parted)

### Using the unpartitioned space

In order to take advantage of the 60 GB of unpartitioned space a new
partition can be created. It's worth noting that with Linux there are a
range of options available to manipulate partitions and filesystems.
This example will be using *fdisk*.

#### Adding a new partition

For this example we'll be using *fdisk* to create a new
partition, *partx* so the kernel can read the partition table without a
reboot, *mkfs* to format it, and then edit */etc/fstab* to make our
changes permanent.

First start *fdisk *on /dev/xvda and then hit '*m*' to list out all of
the available options and then '*p*' to look at the existing partition
table:

    root@manualtest8:~# fdisk /dev/xvda

    Command (m for help): m
    Command action
       a   toggle a bootable flag
       b   edit bsd disklabel
       c   toggle the dos compatibility flag
       d   delete a partition
       l   list known partition types
       m   print this menu
       n   add a new partition
       o   create a new empty DOS partition table
       p   print the partition table
       q   quit without saving changes
       s   create a new empty Sun disklabel
       t   change a partition's system id
       u   change display/entry units
       v   verify the partition table
       w   write table to disk and exit
       x   extra functionality (experts only)

    Command (m for help): p

    Disk /dev/xvda: 42.9 GB, 42949672960 bytes
    151 heads, 48 sectors/track, 11573 cylinders, total 83886080 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0x0922c629

        Device Boot      Start         End      Blocks   Id  System
    /dev/xvda1            2048    41943039    20970496   83  Linux

We can see that our primary partition doesn't encompass all of the
available sectors available to us. So now we'll create our new partition
with the '*n*' option. For the next prompts we can simply hit enter to
select the default options of primary, a partition number of 2 and let
it encompass all of the free sectors.

    Command (m for help): n
    Partition type:
       p   primary (1 primary, 0 extended, 3 free)
       e   extended
    Select (default p): p
    Partition number (1-4, default 2): 2
    First sector (41943040-83886079, default 41943040):
    Using default value 41943040
    Last sector, +sectors or +size{K,M,G} (41943040-83886079, default 83886079):
    Using default value 83886079

If at any point you hit the wrong key or enter the wrong option you can
hit '*q*' to quit without saving any changes. Once everything is correct
we can hit '*w*' to write our changes.

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.

    WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
    The kernel still uses the old table. The new table will be used at
    the next reboot or after you run partprobe(8) or kpartx(8)
    Syncing disks.

Now you'll notice from the error we're asked to either reboot for the
changes we made to the partition table to go into effect or we can use
*partprobe* or *partx*. In this example we'll use *partx*.

    root@server:~# partx

Running *partx* will not return any output, but if you're curious you
can check if your new partition is there, and see the new *xvda2*.

    cat /proc/partitions
    major minor  #blocks  name

     202        0   41943040 xvda
     202        1   20970496 xvda1
     202        2   20971520 xvda2
     202       32    1048576 xvdc
     202       33    1000000 xvdc1

Now let's format the new partition as *ext3* to match our root
partition.

    oot@server:~# mkfs -t ext3 /dev/xvda2
    mke2fs 1.42.5 (29-Jul-2012)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    Stride=0 blocks, Stripe width=0 blocks
    1310720 inodes, 5242880 blocks
    262144 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    160 block groups
    32768 blocks per group, 32768 fragments per group
    8192 inodes per group
    Superblock backups stored on blocks:
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
            4096000

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done

We'll then create a new directory and mount our partition there.

    root@server:~# mkdir /data
    root@server:~# mount /dev/xvda2 /data

The very last step is to make the changes permanent by adding the
following to */etc/fstab*.

    /dev/xvda2 /data ext3 defaults 0 0

*/dev/xvda2* is the new partition we created, */data* is the mount
point, *ext3* is the file type, defaults is a mount option and the last
two zeroes tell it to be ignored by *dump* and *fsck*.

#### Resizing a partition

To resize a partition with parted, use the *resize* command.  The first
argument is the partition number, and the last two arguments are the
beginning and end of the new partition, in megabytes.

    resize 3 20480 30720
