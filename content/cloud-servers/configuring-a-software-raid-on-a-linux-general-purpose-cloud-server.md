---
permalink: configuring-a-software-raid-on-a-linux-general-purpose-cloud-server/
audit_date:
title: Configure a Software RAID on a Linux General Purpose Cloud Server
type: article
created_date: '2013-11-03'
created_by: Tim Pownall
last_modified_date: '2014-12-11'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This article will demonstrate how to put multiple data disks on a
General Purpose server into a RAID level 0. We will mount a single data
disk and perform read and write tests, then continue by putting two data
disks into a RAID 0.

A RAID 0 stripes (combines) two disks to look like one drive to the
system, usually increasing performance (particularly read access). While a RAID level of 0 only stripes the disks and offers no data
redundancy, the hypervisor (host server) is backed by a RAID 10. This
RAID 10 provides redundancy for your data on the backend.

### Prerequisites

Creating a RAID level 0 requires a General Purpose server with at least
two data disks.

To configure the RAID we will use the mdadm software RAID utility, which
may need to be installed.

#### Redhat/Centos/Fedora/Scientific Linux mdadm installation

    sudo yum install mdadm

#### Ubuntu/Debian mdadm installation

    sudo apt-get update
    sudo apt-get install mdadm

### Identifying available data disks

Disks on Linux are referenced using their device name. The/dev/xvda
device is your system disk and contains your operating system. We will
use the `fdisk` utility to identify your data disk devices (usually
/dev/xvde and /dev/xvdf).

    sudo fdisk -l

The output will list full details about the disks attached to the
system. One disk entry would look like this:

    Disk /dev/xvde: 322.1 GB, 322122547200 bytes
    255 heads, 63 sectors/track, 39162 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0x000ea711

        Device Boot      Start         End      Blocks   Id  System
        /dev/xvde1             1       37349   300000000   83  Linux

The first line shows the device name and size.  The last line of the
block shows any partitions currently configured on the drive, with their
device names (like /dev/xvde1).

### Creating the RAID 0

Now that we have the device names of our data disks we can start to
provision the RAID 0 with the following commands.

    sudo mdadm --create /dev/md0 --level=0 --raid-devices=2 /dev/xvde /dev/xvdf

You will get a warning if any partitions exist on the disks being
provisioned. Confirm that the partitions can be overwritten and mdadm
will create the RAID.

Verify the RAID 0 by checking the /proc/mdstat system file.

    cat /proc/mdstat

The file's contents should look something like this:

    Personalities : [raid0]
        md0 : active raid0 xvdf[1] xvde[0]
              629144576 blocks super 1.2 512k chunks

         unused devices: <none>

The beginning of the second line in the example shows the device name
(md0), which means we can reference the array as /dev/md0.

### Partitioning the RAID 0

Once the array is created we can partition it to make a file system. We'll use the fdisk utility to create a single partition on the RAID 0.

    sudo fdisk /dev/md0

After displaying some information about the device we're editing (the
array), you'll see a command prompt.

We'll need to create a new partition using all available disk space,
then write the changes to the array's partition table.

Start by entering "n" for new partition, then "p" for a primary
partition, and "1" for the partition number. Just hit enter when asked
for the starting and ending cylinders so `fdisk` will use the defaults,
filling the disk with the single partition. Once the partition is
created enter "w" to write the changes to the disk.

The process will look something like this:

    Command (m for help): n

    Command action
       e   extended
       p   primary partition (1-4)
    p
    Partition number (1-4): 1
    First cylinder (1-157286144, default 257):
    Using default value 257
    Last cylinder, +cylinders or +size{K,M,G} (257-157286144, default 157286144):
    Using default value 157286144

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.
    Syncing disks.

After writing the partition table, `fdisk` should exit. Running `fdisk`
again should let you see the array and its new partition (along with the
partition's device name).

    sudo fdisk -l

### Creating the file system on the RAID 0

For the purposes of this article we'll use ext4 for our demonstration
and performance testing.

**Note:**  If you use ext4 on your array, make sure your system supports
it. Recent distributions support ext4 by default, but if you're using
an older base operating system (like CentOS 5.3) the included kernel and
disk formatting utility may not support ext4. In this case, it's safer
to use ext3 (with the `mkfs.ext3` command).

Creating the file system will be easy and seamless. Run the appropriate
`mkfs` command for the file system (`mkfs.ext4` to format as ext4, for
example) on the array's partition, usually **/dev/md0p1**.

    sudo mkfs.ext4 /dev/md0p1

With the new file system created you are free to mount the array to any
mount point that you would like. Edit your **/etc/fstab** file to add a
line for the new disk. If we wanted to mount the disk on our example
system on **/var/lib/mysql**, we would add the following line:

    /dev/md0p1          /var/lib/mysql  ext4    defaults,noatime      0      2

To mount the RAID 0 after saving the fstab file, run:

    sudo mount -a

### Performance testing

For the performance testing on our example RAID 0 we ran several read
and write tests, with the following results (including commands and
output):

    RAID level 0 with data disk 60 GB performance server

    [READ] /dev/md0

    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.166875 s, 307 MB/s

    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.16641 s, 308 MB/s

    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.166675 s, 307 MB/s

    [Write] /dev/md0

    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.343796 s, 149 MB/s

    [root@performance-60GB ~]# rm -fv /mnt/speed.file
    removed `/mnt/speed.file'

    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.343648 s, 149 MB/s

    [root@performance-60GB ~]# rm -fv /mnt/speed.file
    removed `/mnt/speed.file'
    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.345652 s, 148 MB/s

    [root@performance-60GB ~]# cat /proc/mdstat
    Personalities : [raid0]
    md0 : active raid0 xvde[1] xvdf[0]
          629144576 blocks super 1.2 512k chunks

    unused devices: <none>


    No RAID level 0


    [READ]

    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.195058 s, 262 MB/s
    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.198602 s, 258 MB/s

    [root@performance-60GB ~]# echo 3 > /proc/sys/vm/drop_caches

    [root@performance-60GB ~]# dd if=/mnt/speed.file of=/dev/null bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.199001 s, 257 MB/s


    [WRITE]

    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.337723 s, 152 MB/s

    [root@performance-60GB ~]# rm -fv /mnt/speed.file
    removed `/mnt/speed.file'

    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.34109 s, 150 MB/s

    [root@performance-60GB ~]# rm -fv /mnt/speed.file
    removed `/mnt/speed.file'

    [root@performance-60GB ~]# dd if=/dev/zero of=/mnt/speed.file bs=1024 count=50000
    50000+0 records in
    50000+0 records out
    51200000 bytes (51 MB) copied, 0.33958 s, 151 MB/s

    Data Results :

    RAID 0 -

    Read Avg : 307 MB/s
    Write Avg : 148 MB/s

    No RAID -

    Read Avg : 259 MB/s
    Write Avg : 151 MB/s

Our results from the testing showed a 16% increase in reads while
utilizing (2) SSDs in a RAID 0, with a 2% decrease in write performance.
The performance gains from the reads is substantial enough to warrant
utilizing the RAID 0 for most purposes, but if you're running an
application that performs more writes than reads you may benefit more
from using the data disks stand-alone instead of going with the RAID 0
option.
