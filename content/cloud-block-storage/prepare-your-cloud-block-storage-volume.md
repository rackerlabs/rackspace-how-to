---
permalink: prepare-your-cloud-block-storage-volume/
audit_date:
title: Prepare your Cloud Block Storage volume
type: article
created_date: '2012-10-21'
created_by: David Hendler
last_modified_date: '2016-09-16'
last_modified_by: Kyle Laffoon
product: Cloud Block Storage
product_url: cloud-block-storage
---

**Previous section:** [Create and attach a Cloud Block Storage
volume](/how-to/create-and-attach-a-cloud-block-storage-volume)

After you have [created and attached](/how-to/create-and-attach-a-cloud-block-storage-volume)
your Cloud Block Storage volume, you must prepare it for use on your
server. To prepare your volume, you must partition, format, and mount
it.  After you have successfully completed these steps, your volume is
usable like a drive on your server.

### Prepare your volume for use with a Linux server

#### Use SSH to connect to your server.

When you created your server, you were given a password. You will need
that password for this step. If you do not have the password, go to the
Cloud Servers page of the Cloud Control Panel, click the gear icon next
to the server name, and select **Change Password**.

1.  On the Server Details page of the Control Panel, find the IP address
    for your server.

2.  Using SSH, log in to the server as root by using its IP address and
    root password.

        $ ssh root@198.61.222.58
        root@198.61.222.58's password:

        Linux nosnetdfw 2.6.32-31-server #61-Ubuntu SMP Fri Apr 8 19:44:42 UTC 2011 x86_64 GNU/Linux
        Ubuntu 10.04 LTS

        Welcome to the Ubuntu Server!
        * Documentation:  http://www.ubuntu.com/server/doc
        Last login: Thu Oct 18 02:26:38 2012 from 70.114.215.201

3. After you are logged in, list the disks on your server.
    Your volume is typically listed as the last drive in this list. In
    the following example, the 100 GB volume that was created in the
    [Create and Attach a Cloud Block Storage
    Volume](/how-to/create-and-attach-a-cloud-block-storage-volume)
    article is attached to /dev/xvdb. (It is shown as 107.4 GB because
    of the way that megabytes are counted.)

        root@nosnetdfw:~# fdisk -l

        Disk /dev/xvda: 42.9 GB, 42949672960 bytes
        255 heads, 63 sectors/track, 5221 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x000dc852

          Device Boot      Start         End      Blocks   Id  System
        /dev/xvda1               1        5222    41942016   83  Linux

        Disk /dev/xvdb: 107.4 GB, 107374182400 bytes
        255 heads, 63 sectors/track, 13054 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x00000000

        Disk /dev/xvdb doesn't contain a valid partition table

#### Partition the disk.

Partitioning the disk tells the server how much space on the drive you
want to use. To use all of it, we tell the server to start at the first
cylinder of the disk and go to the last.

1.  Run the fdisk utility and specify the disk.

        root@nosnetdfw:~# fdisk /dev/xvdb

        Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
        Building a new DOS disklabel with disk identifier 0x59a4ec2c.
        Changes will remain in memory only, until you decide to write them.
        After that, of course, the previous content won't be recoverable.

        Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

        WARNING: DOS-compatible mode is deprecated. It's strongly recommended to
             switch off the mode (command 'c') and change display units to
             sectors (command 'u').

2.  Enter **n** to create a new partition.

3.  Enter **p** to indicate a primary partition.

4.  To create only one partition on this disk, enter **1**.

        Partition number (1-4):
        First cylinder (1-13054, default 1):

5.  To accept the default start cylinder, which is 1, press **Enter**.

        Using default value 1
        Last cylinder, +cylinders or +size{K,M,G} (1-13054, default 13054):

6.  Press **Enter** to use the default, which is 1. Because you are
    using the entire volume for your partition, start the partition at
    the beginning.

        Using default value 13054

7.  Enter **w** to write the partition.

        w

        The partition table has been altered!

        Calling ioctl() to re-read partition table.
        Syncing disks.

8.  List the disks on your server again.
    Your Cloud Block Storage volume is ready as a disk. It was attached
    at /dev/xvdb and you created one partition on it, so now your
    available disk appears at /dev/xvdb1.

        root@nosnetdfw:~# fdisk -l

        Disk /dev/xvda: 42.9 GB, 42949672960 bytes
        255 heads, 63 sectors/track, 5221 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x000dc852

            Device Boot      Start         End      Blocks   Id  System
        /dev/xvda1               1        5222    41942016   83  Linux

        Disk /dev/xvdb: 107.4 GB, 107374182400 bytes
        255 heads, 63 sectors/track, 13054 cylinders
        Units = cylinders of 16065 * 512 = 8225280 bytes
        Sector size (logical/physical): 512 bytes / 512 bytes
        I/O size (minimum/optimal): 512 bytes / 512 bytes
        Disk identifier: 0x59a4ec2c

            Device Boot      Start         End      Blocks   Id  System
        /dev/xvdb1               1       13054   104856223+  83  Linux

#### Format the volume.

Formatting the volume enables the server to store information on it. In
the following example, ext3 is used. However, you can use other file
systems supported by your kernel, such as ext4, in place of ext3.

    root@nosnetdfw:~# mkfs -t ext3 /dev/xvdb1

    mke2fs 1.41.11 (14-Mar-2010)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    Stride=0 blocks, Stripe width=0 blocks
    6553600 inodes, 26214055 blocks
    1310702 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    800 block groups
    32768 blocks per group, 32768 fragments per group
    8192 inodes per group
    Superblock backups stored on blocks:
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
    4096000, 7962624, 11239424, 20480000, 23887872

    Writing inode tables: done
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done

    This filesystem will be automatically checked every 31 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.

#### Mount the volume.

After partitioning and formatting the volume, you must mount it on the
server. After the volume is mounted, it is available for use.

Run the **mnt** command and assign the volume a name for use on your
server. In the following example, the volume is named cbsvolume1.

    root@nosnetdfw:~# mkdir -p /mnt/cbsvolume1
    root@nosnetdfw:~# mount /dev/xvdb1 /mnt/cbsvolume1/

After the volume is mounted, the system does not send feedback. However,
you can check that your volume is ready by running the df command to
show your free disk space. Your new volume is listed last in the list of
available drives.

    root@nosnetdfw:~# df -h

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/xvda1             40G  632M   37G   2% /
    none                  493M  136K  493M   1% /dev
    none                  498M     0  498M   0% /dev/shm
    none                  498M   36K  498M   1% /var/run
    none                  498M     0  498M   0% /var/lock
    none                  498M     0  498M   0% /lib/init/rw
    none                   40G  632M   37G   2% /var/lib/ureadahead/debugfs
    /dev/xvdb1             99G  188M   94G   1% /mnt/cbsvolume1

Your drive is ready for use with your Linux server. However, you should
consider performing the following step to ensure that your volume
remains persistent after a server reboot.

**Note:** If you ever decide to move the volume to a different server, begin by un-mounting the volume. Use the **unmount** command to unmount the volume, and then repeat this **Mount the volume** process for the new endpoint.

#### Make the volume permanent.

This step is optional, but it keeps your volume attached to your server
after restarts.

Add your volume to the static file system information in the fstab file.

**Note**: In your fstab options, add the \_netdev option. This option
prevents attempts to mount the volume until all networking is running.

    root@nosnetdfw:~# nano /etc/fstab

    #
    # /etc/fstab
    # Created by anaconda on Tue May 29 20:13:27 2012
    #
    # Accessible filesystems, by reference, are maintained under '/dev/disk'
    # See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
    #
    /dev/xvda1          /               ext3    defaults,noatime,barrier=0 1 1

For this example, add the following line beneath /dev/xvda1... to add
the volume to the static file system:

    /dev/xvdb1 /mnt/cbsvolume1 ext3 defaults,noatime,_netdev,nofail 0 2

Now the volume persists on the server after server restarts.



### Prepare your volume for use with a Windows server

**Note**: In the examples in the procedure, a 100 GB volume is added to
a Windows Server 2012 server. The steps are similar for all Windows cloud servers.

#### Remotely connect to your Server.

When you created your server, you were given a password. You need that
password for this step. If you do not have the password, go to the Cloud
Servers page of the Cloud Control Panel, click the gear icon next to the
server name, and select **Change Password**.

1.  On the Server Details page of the Cloud Control Panel, find the IP
    address for your server.

2.  Using the server's IP address and password, use Remote Desktop to
    connect to the server as an administrator.

    When you first log in and view the Computer window, you will not see the
    Cloud Block Storage Volume that is attached to the server. In the
    following example, only the server's C drive is displayed.

3.  Open the Server Manager window by right-clicking on the Computer
    icon and selecting **Manage**.

4.  In the left pane of the Server Manager window, click **File and
    Storage Services**.

5.  In the left pane, click **Disks**.  In the following example, a 100
    GB volume is attached to the server. It is listed as Offline, it has
    100 GB of unallocated space, and its partition size is Unknown.

#### Partition and format the drive.

For Windows servers, you partition and format the volume by using the
New Volume Wizard. The mounting process, called "bringing it online" in
Windows terminology, is required before running this wizard.

1. To bring the volume online, in the Disks pane, right-click the
    offline drive and select **Bring Online** from the pop-up menu.

    **Note:** If you want to move the volume to a different server, begin by un-mounting the volume. Repeat this same step, but select **Offline** to unmount the volume, and then repeat this **Partition and format drive* process for the new endpoint.

2. In the Disks pane, right-click the drive and select **New Volume**
    from the pop-up menu. In Windows Server 2008, you right-click the
    unallocated drive and select **New Simple Volume**.

3. Click **Next**. In the Server and Disk page, the unformatted Cloud
    Block Storage volume is displayed.

4. Select the disk and click **Next**.  If the Offline or Uninitialized
    Disk message appears, click **OK**.

5. In the next three wizard pages, specify the drive size, the drive
    letter, and the format and name for the volume. Confirm your
    settings in the Confirmation page. In this example, the disk's full
    100 GB is used, it is assigned the drive letter D, it is formatted
    as NTFS, and it is named My New CBS Volume.


6. To complete the process, click **Create**.

   When you open the Computer window now, the new Cloud Block Storage
   volume is displayed like a regular hard drive.

   Your volume is now ready for use.

**Next steps**: [Create and use Cloud Block Storage snapshots](/how-to/create-and-use-cloud-block-storage-snapshots)
