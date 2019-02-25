---
permalink: change-the-kernel-version-on-a-linux-cloud-server-by-using-rescue-mode/
audit_date: '2019-01-22'
title: Change the kernel version on a Linux cloud server by using rescue mode
type: article
created_date: '2019-01-24'
created_by: Rackspace Community
last_modified_date: '2019-01-25'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If a manual or automatic update to your Linux&reg; cloud server is preventing your
virtual machine (VM) from booting up properly, you can try to resolve the
issue by rolling back the Linux kernel with which your VM is booting. This article
walks you through this process.

### Enter rescue mode

Place your server into [rescue mode](/how-to/rescue-mode/).

**Important**: Ensure that you copy the temporary root
password that displays so that you can access your rescued server.

The server initially displays the status **Rescuing**. When a
red status bar that says **Rescue** displays, you can log in to
the server by using the steps in the following section.

### Log in to your server

Use the following steps to log in to your server:

1. Open a terminal and run the following Secure Shell (SSH) command to
   log in to the VM as the root user:

       ssh root@1.2.3.4

   **Important**: Ensure that you replace `1.2.3.4` with your own PublicNet
   Internet Protocol (IP). You do not need to specify the port because a
   rescued server defaults to port 22.

2. Enter your password press **Enter**.

### Mount your file system on the rescue instance

Use the following steps to mount your
file system on the rescue instance:

1. Run the following command:

       fdisk -l

   The output from this command displays the mounted system device for rescue,
   and then the unmounted file system of your server. In most cases, the file
   system for your server is `/dev/xvdb1`. For older systems, the file system
   for the server might be `/dev/sda1`.

2. After you have identified the file system as either `/dev/xvdb1` or `/dev/
   sda1`, run the following command to mount that file system:

       mount /dev/xvdb1 /mnt

### Change the kernel

Use the following steps to change the Linux kernel:

1. Change into the directory in which you mounted the file system by running the following
   command:

       cd /mnt/boot/grub

2. List the files that the directory contains by running the following command:

       ls

3. A list of files displays, including the **menu.lst** file. Run the
   following command to open this file in the vi text editor:

       vi menu.lst

   **Note**: You can use any text editor to open this file. This example uses
   the vi editor because it is the easiest one to operate from the emergency
   console and SSH.

   The file contains a number of lines of information regarding the kernel,
   the boot process configuration, and other details.

4.  Change the line that says `default=0` to `default=1`.

    **Note**: If you are using the vi text editor, press **i** on your
    keyboard to enter insert mode, then use the arrow keys to move down to the
    `0` after `default=`. Change this to `1`, then press **ESC** on your
    keyboard to exit insert mode.

5. Use the following command to save the change that you made to **menu.lst**:

       :wq!

   **Note**: Because the colon is already present, you do need to enter it in this command.

### Exit rescue mode

Use the following steps to exit rescue mode:

1. Finally, exit rescue mode to enable the VM to boot up by using the
   **menu.lst** file that you edited.

2. In the Cloud Control Panel, click **Exit Rescue Mode** at the top of the
   **Server Details** page. The server boots up and displays as **Active**.
