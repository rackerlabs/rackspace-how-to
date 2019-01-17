---
permalink: resetting-the-root-password-from-rescue-mode
audit_date:
title: Resetting the Root User Password from Rescue Mode
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

If you are not able to reset the password for your Linux cloud server using the control panel you will need to place the server into rescue mode and chroot the file system of the server and run passwd to update the root password.

1. Place server into rescue mode

2. Connect to the rescue mode server using ssh root@<ip address of the server>

If you get this message when you try to connect from a Mac OS X or a Linux system:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!

Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.

The fingerprint for the RSA key sent by the remote host is

<RSA Key>.

Please contact your system administrator.

Add correct host key in ~/home/<user name>/.ssh/known_hosts to get rid of this message.

Offending key in /root/.ssh/known_hosts:<line number>

You will need to edit the .ssh/know_host file to remove the line for the servers IP address.

If you are connecting from a Mac OS X or a Linux system you will need to edit the ~/home/<user name>/.ssh/known_hosts :

3. It is always suggested to run 'fsck' (File System check) everytime you get.  It will save you hassles of it automatically running during a reboot, causing boot time to take longer than expected.

This could be either /dev/xvdb1 or /dev/sdb1 depending on if you are running a Legacy Cloud Server or not.  (Legacy in this context is a Cloud Server running on XenClassic for the hypervisor.  The original release that the current FirstGen servers were setup with XenClassic as the Hypervisor.  Since that release, all Cloud Servers, First and Next Generations, have a XenServer Hypervisor.)

**Note** /dev/xvdb1 will be used in the reset of the example:

    fsck -fyv /dev/xvdb1

This will force a file system check (f flag), automatically respond 'yes' to any questions prompted(y flag), and display a verbose output at the very end(v flag).

Mounting the file system:

a. Make a temporary directory:

    mkdir /mnt/rescue

b. Mount to that temp directory

    mount /dev/xvdb1 /mnt/rescue

    chroot /mnt/rescue

4. We are going to use 'chroot'.  chroot allows you to set the root of the system in a temporary environment.  This is good for recovery, or if you are brave enough to build your own Linux based system from scratch.

5. Now that we are chroot-ed into your original drive, all you have to do is run 'passwd' to update your root password on the original Cloud Server's hard drive.

    passwd

(This will prompt you for your new password twice, and then update the appropriate files.)

6. Exit out of chroot mode.

    exit

7. Unmount your original drive

    umount /mnt/rescue

8. Exit out of SSH and Exit Rescue Mode.
9. You will need to edit the .ssh/know_host file to remove the line for the servers IP address.

If you are connecting from a Mac OS X or a Linux system you will need to edit the ~/home/<user name>/.ssh/known_hosts :

With this, you will be able to use the password set in step 5 when your Cloud Server boots back up outside of Rescue Mode.

This is only needed if nova-agent isn't properly running/not responding inside the Guest Operating system.  nova-agent is the service (/etc/init.d/nova-agent) that connects the Guest Operating system to Rackspace's Cloud Control Panel for things like Reset Password and creating a new Cloud Server from an Image.  If nova-agent is the case, give us a call, setup a ticket, or jump into Online Chat.  We verify everything and give you the appropriate instructions on how to get it updated/fixed.
