---
permalink: preparing-data-disks-on-linux-cloud-servers/
audit_date:
title: Prepare Data Disks on Linux Cloud Servers
type: article
created_date: '2013-10-31'
created_by: Jered Heeschen
last_modified_date: '2016-01-11'
last_modified_by: Rose Coste
product: Cloud Servers
product_url: cloud-servers
---

The data disks attached to some flavors of Cloud Servers are unformatted when created. 
Before you can use them to hold data on Linux, they have to be prepared by formatting them, 
determining their mount points, and adding them to the system's `fstab` file.

**Note:** If your server has a data disk attached to it, the data disk will be listed in your server's Details page.

The following is a guide to preparing data disks efficiently for standalone use. To configure 
two data disks in a software RAID, see 
[Configuring a software RAID on a Linux General Purpose Cloud Server](/how-to/configuring-a-software-raid-on-a-linux-general-purpose-cloud-server).

1. List the volumes attached to your server by running the `fdisk` command.

        sudo fdisk -l

    In the volume list, the device `/dev/xvda` is the system disk. Other volumes listed will 
    be your data or Cloud Block Storage disks.

2. To partition the disk, run the `fdisk` utility and specify the disk.

    Example Input:

        root@nosnetdfw:~# fdisk /dev/xvde

    Example Output:

        Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
        Building a new DOS disklabel with disk identifier 0x59a4ec2c.
        Changes will remain in memory only, until you decide to write them.
        After that, of course, the previous content won't be recoverable.

        Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

        WARNING: DOS-compatible mode is deprecated. It's strongly recommended to
         switch off the mode (command 'c') and change display units to
         sectors (command 'u').

        Command (m for help): m
        Command action
        A. bootable flag
        B. edit bsd disklabel
        C. toggle the dos compatibility flag
        D. delete a partition
        E. list known partition types
        F. print this menu
        G. add a new partition
        H. create a new empty DOS partition table
        I. print the partition table
        J. quit without saving changes
        K. create a new empty Sun disklabel
        L. change a partition's system id
        M. change display/entry units
        N. verify the partition table
        O. write table to disk and exit
        P. extra functionality (experts only)

        Command (m for help):

3. Enter **n** to create a new partition.

    Example Input:

        Command (m for help): n

    Example Output:

        Command action
           e   extended
           p   primary partition (1-4)

4. Enter **p** to indicate a primary partition.

    Example Input:

        p

    Example Output:

        Partition number (1-4):

5. Because this is the first and only partition that you are creating on the volume, enter **1**.

    Example Input:

        Partition number (1-4): 1

    Example Output:

        First cylinder (1-13054, default 1):

6. To accept the default start cylinder, which is `1`, press **Enter**.

    Example Output:

        Using default value 1
        Last cylinder, +cylinders or +size{K,M,G} (1-13054, default 13054):

7. Press **Enter** to select the last cylinder of the disk for the partition to use up the 
   entire disk. The last partition is the default.

    Example Output:

        Using default value 13054

        Command (m for help):

8. Enter **w** to write the partition.

    Example Input:

        Command (m for help): w

    Example Output:

        The partition table has been altered!

        Calling ioctl() to re-read partition table.
        Syncing disks.

9. List the disks on your server again.

    Your data disk is ready as a disk. It was attached at `/dev/xvde` and you created one 
    partition on it, so now your available disk appears at `/dev/xvde1`.

    Example Input:

        root@nosnetdfw:~# fdisk -l

    Example Output:

        Disk /dev/xvda: 42.9 GB, 42949672960 bytes
        255 heads, 63 sectors/track, 5221 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x000dc852

            Device Boot      Start         End      Blocks   Id  System
        /dev/xvda1               1        5222    41942016   83  Linux

        Disk /dev/xvde: 107.4 GB, 107374182400 bytes
        255 heads, 63 sectors/track, 13054 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x59a4ec2c

            Device Boot      Start         End      Blocks   Id  System
        /dev/xvde1               1       13054   104856223+  83  Linux

9. Format the main partition of each attached data disk with the `mkfs` command.

        sudo mkfs -t ext3 /dev/xvde1

    Substitute the device and partition number for `/dev/xvde1` in the example.

10. Create mount points for each data disk as needed.

    Data disks must be assigned directories as mount points in order for the system to use 
    them for storage. If a data disk is meant to hold a database, for example, its mount 
    point should be the database's storage location (like `/var/lib/mysql`).

    If the directory does not yet have an assigned disk, create one with the `mkdir` command.

        sudo mkdir -p /path/to/directory

11. Assign disks to mount points by adding them to the `/etc/fstab` file.

    Edit the file with your favorite text editor, as in:

        sudo nano /etc/fstab

    Add a line for each disk listing its device name and partition number with the directory 
    to mount it to, following this format:

         /dev/xvde1   path/to/directory  ext3    defaults,noatime,nofail      0      0

12. Mount any new drives by running the `mount` command.

        sudo mount -a

13. Confirm that the data disks are mounted by running a disk space check.

        df -h

    If any disks are missing, check the configuration lines in `/etc/fstab` to make sure 
    the device names and options are correct.
