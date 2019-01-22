---
permalink: troubleshooting-a-cloud-block-storage-volume-in-read-only-mode
audit_date:
title: Troubleshooting a Cloud Block Storage Volume in Read-Only Mode
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Block Storage
product_url: cloud-block-storage
---
If your Cloud Block Storage volume has entered read-only mode, you will need to unmount the volume, run a file system check, then remount the volume to get it back into read-write mode.

### Test write mode

First, we need to confirm that the volume has become a read-only volume. The fastest way to test this is to attempt to create or edit a file. On a Windows server, you can create a new file, either through the GUI or in PowerShell by using the New-Itemcmdlet.
New-Item c:\scripts\test_file.txt -type file
A volume in read-only mode will return an error.
On a linux system, you can use the touch command
touch test_file
Again, a read-only volume will return an error, and the server will need to be unmounted.
#### Unmount Volume from a Linux Server

Confirm in the Control Panel how the volume is presented to the cloud server.

At your server, use the df -h command to see how it is mounted.

Use the value under Mounted On in the unmount command.
Also, comment out second line (highlighted above) in /etc/fstab to
prevent the volume from trying to mount on the next boot.
Input:
# umount /dev/xvdb1/
Output:
The output is the prompt ready for the next command.
#
Unmount a Volume from a Windows Server

1. In the Server Manager, Select File and Storage Services > Disks.
2. 
Under the Disks window, right-click the Cloud Block

Storage Volume. Select Take Offline from the pop-up menu. If the

Take Disk Offline warning window displays, click Yes.
The Cloud Block Storage Volume no longer displays as a drive under

Computer.
Check the filesystem

After the volume is unmounted, run a filesystem check.
linux with ext3/4: fsck

windows: chkdsk
Address any errors
Mount the volume - Linux

Run the mnt command and assign the volume a name for use on your

server. In the following example, the volume is named cbsvolume1.
Example Input:
root@nosnetdfw:~# mkdir -p /mnt/cbsvolume1  
root@nosnetdfw:~# mount /dev/xvdb1 /mnt/cbsvolume1/
After the volume is mounted, the system does not send feedback. However,

you can check that your volume is ready by running the df command to

show your free disk space. Your new volume is listed last in the list of

available drives.
Example Input:
root@nosnetdfw:~# df -h
Example Output:
Filesystem            Size  Used Avail Use% Mounted on  
/dev/xvda1             40G  632M   37G   2% /  
none                  493M  136K  493M   1% /dev  
none                  498M     0  498M   0% /dev/shm  
none                  498M   36K  498M   1% /var/run  
none                  498M     0  498M   0% /var/lock  
none                  498M     0  498M   0% /lib/init/rw  
none                   40G  632M   37G   2% /var/lib/ureadahead/debugfs  
/dev/xvdb1             99G  188M   94G   1% /mnt/cbsvolume1
Your drive is ready for use with your Linux server. However, you should consider performing the following step to ensure that your volume remains persistent after a server reboot.
(Recommended) Make volume persistent after reboot

This step is optional, but it keeps your volume attached to your server after restarts.

1. Add your volume to the static file system information in the

fstab file.

Note: In your fstab options, add the _netdev option. This option prevents attempts to mount the volume until all networking is running.

Example Input:
root@nosnetdfw:~# nano /etc/fstab

Example Output:
#  
# /etc/fstab  
# Created by anaconda on Tue May 29 20:13:27 2012  
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'  
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info  
#
/dev/xvda1          /               ext3    defaults,noatime,barrier=0 1 1
For this example, add the following line beneath /dev/xvda1… to add

the volume to the static file system:

/dev/xvdb1 /mnt/cbsvolume1 ext3 defaults,noatime,_netdev,nofail 0 2

Now the volume persists on the server after server restarts.

Mount the volume - Windows

Open the Server Manager window by right-clicking on the Computer icon and selecting Manage.
The Server Manager window is displayed:

1. In the left pane of the Server Manager window, click File and Storage Services.

2. In the left pane, click Disks. In the following example, a 100 GB volume is attached to the server. It is listed as Offline, it has 100 GB of unallocated space, and its partition size is Unknown. Your volume has already been partitioned and formatted, and only needs to be remounted.

3 . To bring the volume online, in the Disks pane, right-click the offline drive and select Bring Online from the pop-up menu.
When you open the Computer window now, the new Cloud Block Storage volume is displayed like a regular hard drive.

The volume is now ready for use.
