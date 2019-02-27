---
permalink: reset-the-root-password-from-rescue-mode/
audit_date:
title: Reset the root user password from rescue mode
type: article
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If you're unable to reset the password for your Linux&reg; cloud server by
using the Cloud Control Panel, you can use the following steps to perform
this task by using rescue mode:

1. Place the server into rescue mode.

2. Connect to the server that is in rescue mode by  the following
   command, replacing `ip address of the server` with the Internet Protocol
   (IP) address for your server:

       ssh root@<ip address of the server>

   If the following message displays when you try to connect from a Mac&reg;
   OS X or Linux system, someone could be eavesdropping on you in a man-in-the-
   middle attack, or the RSA host key might have just been changed:

       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
       @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

   Contact your system administrator.

   Add the correct host key in your `~/home/<user name>/.ssh/known_hosts` file
   to prevent this message from displaying.
   
   The wrong key displays as the following line of code in the output:

       Offending key in **/root/.ssh/known_hosts**:running<line number>

   You need to edit the **.ssh/known_hosts** file to remove the line for the
   server's IP address.

   If you are connecting from a Mac OS X or Linux system you need to edit the
   file at `~/home/<user name>/.ssh/known_hosts`.

3. We recommend that you periodically run the file system check (`fsck`)
   command. Performing this step prevents the check from automatically
   running during a reboot, causing boot time to take longer than you expect.

   You run this check on `/dev/xvdb1` if your server is using the XenServer&reg;
   hypervisor, and `/dev/sdb1` if it is using Xen&reg; Classic.

   The following example reset command uses `/dev/xvdb1`:

       fsck -fyv /dev/xvdb1

   This command forces a file system check (`f` flag), automatically responds
   `yes` to any questions that the system prompts for (`y` flag), and displays
   a verbose output at the end (`v` flag).

4. Mount the file system by using the following steps:

   a. Make a temporary directory by running the following command:

           mkdir /mnt/rescue

   b. Mount the file system to that temporary directory by running the
      following command:

           mount /dev/xvdb1 /mnt/rescue

           chroot /mnt/rescue

   This example uses the `chroot` operation. This command enables you to set
   the root of the system in a temporary environment. Performing this step
   helps with recovery.

5. Run the `passwd` command to update your root password on the original cloud
   server's hard drive, as shown in the following example:

       passwd

   This command prompts you for your new password twice, and then
   updates the appropriate files.

6. Exit out of `chroot` mode by entering the following command:

       exit

7. Unmount your original drive by entering the following command:

       umount /mnt/rescue

8. Exit out of Secure Shell (SSH), then exit rescue mode.
9. Edit the **.ssh/know_host** file to remove the line
   for the server's IP address.

10. If you are connecting from a Mac OS X or Linux system, you need to edit the
    file at `~/home/<user name>/.ssh/known_hosts`.

When your cloud server boots back up outside of rescue mode, you can use the
password that you set in step 5 to log in.

You only need to perform this step if nova-agent isn't running properly or
isn't responding inside of the guest operating system (OS).  nova-agent is the
service that connects the guest OS to Rackspace's
Cloud Control Panel so that you can perform tasks such as resetting the
password and creating a new Cloud Server from an image. If you're experiencing
an issue with nova-agent, contact your account manager or Rackspace Support.
