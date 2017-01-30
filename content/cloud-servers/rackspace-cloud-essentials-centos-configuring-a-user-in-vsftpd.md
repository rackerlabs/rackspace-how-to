---
permalink: rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd/
audit_date: '2016-06-27'
title: Rackspace Cloud Essentials - Configure a user in vsftpd for CentOS
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2016-07-08'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Rackspace Cloud Essentials - Install vsftpd for CentOS](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd)

This article describes how to create system users in vstfpd and
`chroot` them (isolate or "jail" them to their home directory) if necessary.

### Add a system user

Create a new user for FTP access in vsftpd by creating a new valid Linux system
user with the following commands:

    useradd test
    passwd test

### Disable SSH access for FTP users

The default user creation script gives a user the `/bin/bash` shell,
which can be a little too powerful. If you don't want your users
to log in to your server via SSH, you can block this access. When you
change the shell to `/bin/false`, the users can log in only
via FTP or mail if you have that set up.

Modify the user access with the following command:

    usermod -s /sbin/nologin test

### Chroot a user

Now you can configure vsftpd to be able to `chroot` (commonly referred to as
jailing) users to their home directories for security and privacy. When you
`chroot` users, they can’t move up a level in the directory structure after they
log in.

With vsftpd, you can chroot a user by editing the following in the
file `/etc/vsftpd/vsftpd.conf`:  

    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd/vsftpd.chroot_list

You must create a **vsftp.chroot_list** file and enter users who do *not*
use `chroot`. Every user uses `chroot` by default. Therefore, create a **chroot_list** file,
even if the file is going to remain empty:

    touch /etc/vsftpd/vsftpd.chroot_list

After the file is created and you have set up your **chroot_list**, restart vsftpd with the following command:

    service vsftpd restart
