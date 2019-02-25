---
permalink: bind-mounts-in-linux/
audit_date: '2019-02-05'
title: Bind mounts in Linux
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-05'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

Bind mounts in Linux&reg; enable you to mount an already-mounted file system to another location within the file system. Generally, bind mounts are used when restricting the access of specified users to designated parts of a website by replicating the website's directory into a jailed user's home directory.

#### Configure a bind mount

This section provides steps for how to grant a user access to a directory by using bind mounting to bind the directory to that user's home directory. 

Configure a bind mount by using the following command:

    mount --bind /path/to/domain /path/to/home/directory

**Warning:** Bind mounts are not persistent when you restart your server unless you create an entry for the bind mount in your server's File Systems Table (**fstab**).

#### Add a bind mount to the File Systems Table

Add an **fstab** entry for the bind mount by using the following command:

    /path/to/domain /path/to/home/directory none bind,nobootwait 0 0

If the **nobootwait** option is not included in the **fstab** entry, you see the following message in the server console:

    Continue to wait; or Press S to skip mounting or M for manual recovery. 
    
Adding **nobootwait** to the options section of the **fstab** configuration ensures that the system boots even if the bind mount directory has been removed from the system. 

