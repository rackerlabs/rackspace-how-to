---
permalink: rescue-mode/
audit_date: '2018-10-12'
title: Rescue mode
type: article
created_date: '2012-03-27'
created_by: Rackspace Support
last_modified_date: '2018-10-17'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If your Linux&reg; system has become non-bootable or is suffering from
critical system errors, you can use rescue mode to recover your
system data. These problems might be caused by file system corruption,
boot file corruption, or other configuration errors. If your
system encounters a problem during the boot process, you typically boot
into a maintenance mode environment called single user mode that enables you
to log in with your root password and check for any errors.

However, single user mode has the following drawbacks:

-   Your system is read-only, and you cannot make corrective changes.
-   Most services (such as networking) are disabled. This situation prevents
    you from copying your data to another server.
-   You have to access your server by using the console, which is
    slower than using a traditional Secure Shell (SSH) login.

You can avoid working with single user mode by bringing your server up
in rescue mode through the Rackspace Cloud Control Panel.

### What is rescue mode?

Rescue mode grants the root user full access to your non-bootable
server's file system. You can use rescue mode to modify problems in
configuration files or to copy data from your Cloud Server to a remote
location. Using rescue mode through the Cloud Control Panel is similar to
booting into single user mode with networking enabled.

**Put your server in rescue mode**

Use the following steps to put your server in rescue mode:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/),
    then click **Servers > Cloud Servers** in the top navigation bar.

2.  From the list of your servers, click the gear icon next to the server
    that you want to bring up in rescue mode and select **Enter Rescue
    Mode** from the drop-down menu.

3.  Read the text in the rescue mode pop-over and then click **Enter
    Rescue Mode**.

4.  The temporary password displays. Copy the password to a safe
    location. It does not display again after you close this message.

5.  After you copy the temporary password, click **Dismiss Password**.

The server begins to enter rescue mode and displays an orange **Status**
field next to the server name. The initial status is **Preparing
Rescue**.

When the rescue mode build is complete, the status turns red and
displays **Rescue**.

**Note**: The rescue environment is limited to 24 hours. You have one day to
correct the problems on your server before it automatically reverts to its
original state.

### Connect to your server in rescue mode

You can use an SSH client to connect to your server by using the public
Internet Protocol (IP) address and the temporary root password to log in to rescue mode.

### Troubleshoot your server in rescue mode

Before you can access the files on your server, you need to mount the
server's file system. To accomplish this task, you need to look at your
partitions to determine your file system's device.

**Note**: If you plan on using `fsck` on this file system, do not mount the
file system.

After you log in to your server in rescue mode, run the following command:

    fdisk -l

Your output should look similar to the following output:

<img src="{% asset_path cloud-servers/rescue-mode/fdisk.png %}" alt="" />

Several disks appear in the output. A disk entry looks
like similar to the following example:

    Disk /dev/sdb1: 2147 MB

The portion after `Disk` that looks like a file path is the device.

In the example output in the screenshot, the device for the server's file
system is `/dev/sda1`.

The device can be different depending on the distribution image that was used
to build your server.

The example output in the screenshot shows the device and the size of the
disk. It contains the following blocks:

1.  **First block (about 2 GB)**: The rescue mode file system.
2.  **Second block (10.2 GB)**: The server's file system. The size of this
    block depends on the size of your server.
3.  **Third block**: The swap space.

Identify the block for your server's file system and find the device name.

After you know your file system's device, you can assign it to a directory and
mount it for access.

Run the following command, replacing `/dev/diskdevice` with your file system
device:

    mount /dev/diskdevice /mnt

For example, if your file system device is `/dev/sda1`, the command is:

    mount /dev/sda1 /mnt

After you complete this step, you can access your files through the `/mnt`
directory.

**Note**: You must precede file paths with `/mnt`. For example, if you need
to correct the `/etc/fstab` file, you access that file by using the
following path:

    /mnt/etc/fstab

If you edit this file in rescue mode, you change the `fstab` file
for the rescue mode file system, rather your normal file system.

### Exiting rescue mode

To exit rescue mode, go to the **Server Details** page in the
Cloud Control Panel and click **Exit Rescue Mode**.

### Next steps

- [Host key fingerprints](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console)

### Related articles

For more information, see the following article:

- [Rebuild a Cloud Server](/how-to/rebuild-a-cloud-server)
