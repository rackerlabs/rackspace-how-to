---
permalink: create-a-linux-swap-file/
audit_date: '2018-11-27'
title: Create a Linux swap file
type: article
created_date: '2013-10-29'
created_by: Trey Hoehne
last_modified_date: '2018-11-29'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Swap is space on a disk that is reserved for use as virtual memory.
When a Linux&reg; server runs out of memory, the kernel can move inactive
processes into swap space to make room for active processes in the working
memory.

By default, a swap partition is not present on Cloud Servers, but you can add
swap to a server by allocating a swap file. The performance of a
swap file is similar to that of a swap partition. However, using a swap file
makes it easier to control the swap size without repartitioning a volume. You
can control how aggressively the server uses this swap space by modifying the
system's _swappiness value_.

The steps below show how to create a swap file on Linux and modify a system's
swappiness value.

### How do I add a swap file?

The following steps show how to add 1GB of swap to your server:

1.  Create the file that you want to use for swap by entering the following
    command:

        sudo fallocate -l 1G /mnt/1GB.swap

    If the `fallocate` command fails or isn't installed, run the following
    command:

        sudo dd if=/dev/zero of=/mnt/1GB.swap bs=1024 count=1048576

2.  Format the swap file by entering the following command:

        sudo mkswap /mnt/1GB.swap

3.  Add the file to the system as a swap file by entering the following
    command:

        sudo swapon /mnt/1GB.swap

4.  Add the following line to the end of `/etc/fstab` to make the change
    permanent:

        /mnt/1GB.swap  none  swap  sw 0  0

5.  To change the swappiness value, add the following line to the file at
    `/etc/sysctl.conf`:

        vm.swappiness=10

    Start with a value of 10 and increase if it necessary. A typical default
    value for swappiness is 60. The higher the number (up to 100), the
    more often the system uses swap.

    The degree to which swappiness affects performance depends on how your
    memory is currently used. We recommend that you experiment to find an
    optimal value. At 0, the system only uses the swap file when it runs
    entirely out of memory. Higher values enable the system to swap idle
    processes out in order to free memory for disk caching, potentially
    improving overall system performance.

6.  Check that the swap file was created by entering the following command:

        sudo swapon -s

7.  Reboot the server to ensure that the changes take effect.

**Note**: Following these instructions on a new Rackspace server makes the
resulting swap file world-readable. To prevent the file from being
world-readable, you should set up the correct permissions on
the swap file by running the following command:

    chmod 600 /mnt/1GB.swap

In most cases, the only user that needs access to the swap partition is
the root user.
