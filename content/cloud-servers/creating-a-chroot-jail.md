---
permalink: creating-a-chroot-jail
audit_date:
title: Creating a Chroot Jail
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

How to create chroot jail on the directory /var/www/vhost/domain.com
group: sftponly
user: ftpuploader
This will work on ===>> CentOS 6.3
This will not work on CentOS5/RHEL5
Why is it important to give the permission only on this directory?
It is important to avoid that your employees have access to the entire server, or you contract a 3rd part company to develop your website and you want that them to have access only on this directory to upload the files.
------------------------------------------------------------------------------------------------------------------------
### Create a group/user to upload the files.
# groupadd sftponly

1 domain managed by 1 or more users:
# useradd -d /var/www/vhosts/domain.com -s /bin/false -G sftponly ftpuploader
# passwd ftpuploader
-------------------------------------------------------------------------------------------------------------------
### Start the process

Comment out the following line in /etc/ssh/sshd_config

#Subsystem sftp /usr/lib/openssh/sftp-server

Add the following directly after the commented line:

Subsystem sftp internal-sftp
1 domain managed by 1 or more users:
Add the following set of lines to the very bottom of the file:

 Match Group sftponly
     ChrootDirectory %h
     X11Forwarding no
     AllowTCPForwarding no
     ForceCommand internal-sftp
# service sshd restart

Check the permissions of the directory

#ls -la
drwxr-xr-x 2 root root 4096 Apr 28 22:00 domain.com 

(You can notice that the owner is the root and the group root)  you do not have permission to write on this directory.

Now, lets create the html folder

#mkdir html
# pwd

/var/www/vhosts/domain.com/html
#ls -la
drwxr-xr-x 2 root root 4096 Apr 30 22:49 html
# chown root:sftponly html

# chmod 775 html
#ls -la
drwxrwxr-x 2 root sftponly 4096 Apr 30 22:49 htm
Now your user ftpuploader can upload the files into this directory "html"
Note: If you change the permission or group owner for the "domain.com" directory your ftp will not connect anymore, because as you set up the home directory chroot the user will have permission only under this directory.
In particular, remember that any chroot environment requires that the chroot directory is owned by root:root.

Another note on permissions: acls set on the chroot directory will break the chrooted sftp users login
Cleanup

From here, the chroot environment is configured. There are several things you should do to ensure the environment is ready:
1. Ensure that apache DocumentRoots are properly configured to subdirectories of the chroot jails
2. Ensure that the chroot user has write access to the specified DocumentRoot
3. Log in via sftp and verify that the chroot jail works properly

Error Logging

Oftentimes incorrectly configured chroot environments will result in the chrooted user no being able to log in. These authorization failures should be logged to the following locations:
* CentOS/RHEL: /var/log/secure
