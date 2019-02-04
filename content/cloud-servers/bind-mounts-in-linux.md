---
permalink: bind-mounts-in-linux/
audit_date: '2019-02-04'
title: Bind mounts in Linux
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-04'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

Bind Mounts allow you to mount an already mounted filesystem to another location within the filesystem.

Bind mounts restrict the access of specified users to designated parts of a website. You can grant a user access to a directory by bind mounting the directory to the home directory of the user.

#### Configure a bind mount by using the following command:

    `mount --bind /path/to/domain /path/to/home/directory`

**Warning:** Bind mounts are not persistent when restarting your server unless you create an entry for the bind mount in your server's File Systems Table (fstab).

#### Add a bind mount to the File Systems Table

Add an **fstab** entry for the bind mount by using the following command:

    `/path/to/domain /path/to/home/directory none bind,nobootwait 0 0`

Adding **nobootwait** to the options section of the **fstab** in `/path/to/domain /path/to/home/directory none bind,nobootwait 0 0` ensures that the system will boot even if the bind mount directory has been removed from the system. Without the **nobootwait** option you see a message on the console that says, `Continue to wait; or Press S to skip mounting or M for manual recovery`. This message persists until the option to skip is initiated or you perform a manual recovery.



