---
permalink: rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd/
audit_date:
title: Rackspace Cloud Essentials - Configure a user in vsftpd for CentOS
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2016-06-15'
last_modified_by: Aaron Davis
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Rackspace Cloud Essentials - Install vsftpd for CentOS](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd)

This article describes how to create system users in vstfpd and
chroot them (isolate or "jail" them to their home directory) if necessary.

Create a new user for FTP access in vsftpd by creating a new valid Linux system user.

    useradd test
    passwd test

### Disable SSH access for FTP users

The default user creation script gives a user the `/bin/bash` shell,
which can be a little too powerful. If you don't want your users
to log in to your server via SSH, you can block this access. When you 
change the shell to `/bin/false`, the users can log in only
via FTP or mail if you have that set up. 

Modify the user access as follows:

    usermod -s /sbin/nologin test

### Chroot a user

For VSftpd you can chroot a user by editing the file /etc/vsftpd/vsftpd.conf.  You will want to edit the following.  

    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd/vsftpd.chroot_list

You will need to create a vsftp.chroot_list file and put users in it who ARE NOT chrooted. Everyone is chrooted by default. You need to create the file even if it's going to be empty:

    touch /etc/vsftpd/vsftpd.chroot_list
    
Once the file is created and you have setup your users all you need to do is restart vsftpd.

    service vsftpd restart

### Next steps

Return to the [Cloud Servers introduction page](/how-to/cloud-servers) and choose the applicable option for DNS and domain management.
