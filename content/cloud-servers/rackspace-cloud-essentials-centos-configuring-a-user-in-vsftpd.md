---
permalink: rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd/
audit_date:
title: Rackspace Cloud Essentials - CentOS - Configuring a user in vsftpd
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2015-12-30'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Rackspace Cloud Essentials - CentOS - Installing vsftpd](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd)

This article shows you how to create a system user in vstfpd and
chrooting (jail - isolation to their home directory) them if necessary.

### Add your system user

Yes, it is this simple, creating a new user for ftp access in vsftpd is
as easy as creating a new valid linux system user.

    useradd test
    passwd test

### Disable SSH access for FTP users

The default user creation script will give a user the /bin/bash shell,
which can be a little too powerful. If you don't want your users
logging into your server via SSH, we need to know how to block this
access.  If you change the shell to /bin/false, the users will only be
able to login via ftp or mail if you have that setup. Here is how to
modify your users:

    usermod -s /sbin/nologin test

### Chroot a user

Alright and probably the most important part of this article is the
ability to lock a user down to their own home directory so they don't go
around mucking with things they aren't supposed to. When a user logs
in they will be unable to move up a level in the directory structure.

That pretty much covers it for vsftpd, and at this point you should be
able to create a new system user, set them up for vsftpd and do some
basic tweaks to their access level.

### Next steps

Return to the [Cloud Servers introduction page](/how-to/cloud-servers) and choose the applicable option for DNS & Domain Management.
