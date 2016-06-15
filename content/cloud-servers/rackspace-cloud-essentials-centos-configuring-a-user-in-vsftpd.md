---
permalink: rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd/
audit_date:
title: Rackspace Cloud Essentials - Configure a user in vsftpd for CentOS
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2016-06-15'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Rackspace Cloud Essentials - Install vsftpd for CentOS](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd)

This article describes how to create system users in vstfpd and
chroot them (isolate or "jail" them to their home directory) if necessary.

### Add a system user

If you don't already have a group for your sftp users, add a group.

    groupadd sftp

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

Now you can configure vsftpd to be able to chroot (commonly referred to as jailing) 
users to their home directories for security and privacy. When you chroot users, 
they can’t move up a level in the directory structure after they log in.

Change the user's group to the 'sftp' group:-

    usermod -g sftp test

Set the user's shell to /bin/false:-

    usermod -s /bin/false test

Edit the subsystem in sshd_config (/etc/ssh/):

    #Subsystem sftp /usr/lib/openssh/sftp-server
    Subsystem sftp internal-sftp

Add the following to the bottom of the `sshd_config` file:

    Match group sftp
        X11Forwarding no
        ChrootDirectory %h
        AllowTcpForwarding no
        ForceCommand internal-sftp

Change access for the the following directories to root:root:

    /var
    /var/www
    /var/www/vhosts
    /var/www/vhosts/domain.com

Restart the sshd:

    service sshd restart

Test the restrictions. Attempt to log in to the server via SFTP with the user test.

    Authentication log:
    Using username "test".

A successful test will return an `Authentication failed` message.

### Next steps

Return to the [Cloud Servers introduction page](/how-to/cloud-servers) and choose the applicable option for DNS and domain management.
