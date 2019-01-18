---
permalink: bind-mounts-in-linux
audit_date:
title: Bind Mounts in Linux
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Bind Mounts allow you to mount an already mounted filesystem to another location within the filesystem.

We generally use bind mounts at Rackspace to restrict access to certain users to certain parts of a website. We can mount the directories in which access is needed to the home directory of the user.

[Example]
mount --bind /path/to/domain /path/to/home/directory
The issue with bind mounts is that they are not persistent across reboots unless you create an entry in your fstab. I have created an fstab entry below for reference.

[FSTAB]
/path/to/domain /path/to/home/directory none bind,nobootwait 0 0
You will notice that "nobootwait" was added to the options section of the fstab. This will make sure that the system boots even if the bind mount directory has been removed from the system. If this option is not added then you will see a message on the console that says, "Continue to wait; or Press S to skip mounting or M for manual recovery". This message will continue until the option to skip is initiated or you perform a manual recovery.
