---
permalink: create-a-linux-swap-file/
audit_date:
title: Create a Linux Swap File
type: article
created_date: '2013-10-29'
created_by: Trey Hoehne
last_modified_date: '2015-08-19'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Swap is space on a disk that is reserved to be used as virtual memory.
When a Linux server runs out of memory, the kernel can move inactive
processes into swap to make room for active processes in the working
memory.

A swap partition is not present on Cloud Servers by default, but swap
can be added to a server by allocating a swap file. The performance of a
swap file is similar to that of a swap partition while making it easier
to control the swap size without repartitioning a volume. How
aggressively the server will use this swap space can be controlled by
modifying the system's swappiness value.

The steps below discuss the creation of a swap file on Linux and
modifying the system swappiness value.

### How do I add swap?

To add 1GB of swap to your server, for example, follow these steps:

1.  Create the file to be used for swap.

        sudo fallocate -l 1G /mnt/1GB.swap

    If fallocate fails or is not installed, run the following command.

        sudo dd if=/dev/zero of=/mnt/1GB.swap bs=1024 count=1048576

2.  Format the file for swap.

        sudo mkswap /mnt/1GB.swap

3.  Add the file to the system as a swap file.

        sudo swapon /mnt/1GB.swap

4.  Add this line to the end of /etc/fstab to make the change permanent.

        /mnt/1GB.swap  none  swap  sw 0  0

5.  To change the swappiness value edit /etc/sysctl.conf and add the
    following line.

        vm.swappiness=10

    Start with a value of 10 and increase if needed. A typical default
    value for swappiness is 60. The higher the number (up to 100), the
    more often swap is utilized.

    How much swappiness affects performance depends on how your memory
    is being used, so experiment to find an optimal value. At 0 the swap
    file will only be used when the system runs completely out
    of memory. Higher values let the system swap idle processes out to
    allow the system to free memory for disk caching, potentially
    improving overall system performance.

6.  Check that the swap file was created.

        sudo swapon -s

7.  Reboot the server to ensure that the changes go into effect.

**Note:** By following these instructions on a newly created Rackspace
server, the resulting swap file is world-readable. To prevent the file
from being world-readable, you should set up the correct permissions on
the swap partition/file by running the following command to change the
permission:

    chmod 600 /mnt/1GB.swap

In most cases, the only user that needs access to the swap partition is
the root user.

