---
permalink: preparing-data-disks-on-linux-cloud-servers/
audit_date: '2019-03-01'
title: Prepare data disks on Linux Cloud Servers
type: article
created_date: '2013-10-31'
created_by: Jered Heeschen
last_modified_date: '2019-03-01'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

The data disks attached to some flavors of Linux&reg; Cloud Servers are
unformatted when created. Before you can use them to store data on Linux, you
have to format them, determine their mount points, and add them to the system's
 **fstab** file.

**Note:** If your server has a data disk attached to it, the data disk is listed
in your server's **Details** page in the [Cloud Control Panel](https://login.rackspace.com).

Use the following instructions to prepare data disks efficiently for standalone
use.

1. List the volumes attached to your server by running the following `fdisk`
   command:

        sudo fdisk -l

   In the volume list, the device `/dev/xvda` is the system disk. Other volumes
   listed are your data or Cloud Block Storage disks.

2. To partition the disk, run the following `fdisk` utility and specify the disk,
   which produces the output similar to that which is shown:

        root@nosnetdfw:~# fdisk /dev/xvde

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

3. Enter `n` to create a new partition, as shown in the following example,
   which includes the results:

        Command (m for help): n

        Command action
           e   extended
           p   primary partition (1-4)

4. Enter `p` to create a new partition to indicate a primary partition, as
   shown in the following example with its results:

        p

        Partition number (1-4):

5. Because this is the first and only partition that you are creating on the
   volume, enter `l`, as shown in the following example along with its results:

        Partition number (1-4): 1

        First cylinder (1-13054, default 1):

6. To accept the default start cylinder, which is `1`, press **Enter**. The
   following example shows the expected output:

        Using default value 1
        Last cylinder, +cylinders or +size{K,M,G} (1-13054, default 13054):

7. Press **Enter** to select the last cylinder of the disk to ensure that the
   partition uses up the entire disk. The last partition is the default. The
   following example shows the expected output:

        Using default value 13054

        Command (m for help):

8. Enter `w` to write the partition, as shown in the following example along
   with the output:

        Command (m for help): w

        The partition table has been altered!

        Calling ioctl() to re-read partition table.
        Syncing disks.

9. Your data disk is ready. It was attached at `/dev/xvde` and you
   created one partition on it, so now your available disk appears at
   `/dev/xvde1`. Run the following command to list the disks:

        root@nosnetdfw:~# fdisk -l


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

10. Run the following command to format the main partition of each attached data
   disk, substituting the device and partition number for `/dev/xvde1`:

        sudo mkfs -t ext3 /dev/xvde1


11. Create mount points for each data disk as needed.

   You must assign directories as mount points for the data disks in order for
   the system to use them for storage. If a data disk is meant to hold a
   database, for example, its mount point is the database's storage location
   (for example, `/var/lib/mysql`).

   If the directory does not yet have an assigned disk, create one with the
   following command:

        sudo mkdir -p /path/to/directory

12. Assign disks to mount points by adding them to the **/etc/fstab** file.

    Edit the file with your favorite text editor. The following example uses
    the **nano** editor:

        sudo nano /etc/fstab

    Add a line for each disk with the associated device name, partition number,
    and the mount directory as shown in the following example:

         /dev/xvde1   path/to/directory  ext3    defaults,noatime,nofail      0      0

13. Mount any new drives by running the following command:

        sudo mount -a

14. Confirm that the data disks are mounted by running the following disk space
    check command:

        df -h

    If any disks are missing, check the configuration lines in **/etc/fstab**
    to make sure the device names and options are correct.
