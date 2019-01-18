---
permalink: sftp-chrooted-bind-mount-user
audit_date:
title: SFTP Chrooted Bind Mount User
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

** This article is intended for an admin or developer.  If you have any questions in regards to setting up a SFTP user using a bind mount please contact support first. ***
There are a few reasons why you might want bind mount a chrooted SFTP user on your RHEL and CentOS 6 (OpenSSh is 4.9p1 or newer) server(s).

**Notes**
1. The user will only be able to use SFTP and won't have full shell access over SSH.
2. They will be jailed to their home directory and will have no way of breaking out of it.
3. From the user's perspective, their home directory is / on the server.
4. This is often needed for a developer that may need write access to one (or more) Apache document root(s) or some other directory for the purpose of uploading or editing web content.

This guide will walk you through chrooting the user to their home directory and creating a bind mount within for any of the external (document root) directories that they need access.  A bind mount is the only way to give the user access to data outside of their chroot directory. 
You will not be able to symlink data outside of the chroot into it (example: ln -s /home/user/http /var/www/http) because once the user is chrooted, the file system will have no knowledge of any data outside of the chroot which will break the symlink. You could, however, move the document root directory to the users home directory and then symlink it to the the original location (ln -s /var/www/html /home/user1/html) as an alternative.
Note that sshd offers a few dynamic variables for you to use in the config for chrooting:
* %u – username of the user logging in
* %h – $HOME of the user logging in
sshd is very strict with regards to how permissions must be set. One of these restrictions is that the user can't write to the top level of the chroot.  Please make sure to choose an appropriate top level for the chroot, for example:
* Set ChrootDirectory to %h - user will not be able to write to their home path. They will need either a subfolder they can write to (e.g. "uploads"), or a bind mount to another location they can write to (e.g. /var/www/html)
* Set ChrootDirectory to /home/chroot - user will be able to write to their home path, but the top level of the chroot will be protected with filesystem permissions, not the chroot jail

The first option uses the chroot to guarantee security instead of relying on filesystem permissions. The second allows writing to the home directory, but means the chroot is shared with other users and only filesystem permissions stop information disclosure. The right option depends on your needs.

1. Create a group in which we will assign any user that needs to be jailed to their home directory:

# groupadd sftponly

2. Create the user. The shell should be set to /bin/false and the user needs to be assigned to the group that was created above:

# mkdir -p /home/chroot/$NEWUSER
# useradd -d /$NEWUSER -s /bin/false -G sftponly $NEWUSER    # Note: homedir is relative to the chroot
# passwd $NEWUSER

3. Update /etc/ssh/sshd_config

1. Comment out the following line:
Subsystem       sftp    /usr/libexec/openssh/sftp-server

2. Add the following to the end of the file:

Subsystem     sftp   internal-sftp
Match Group sftponly
ChrootDirectory /home/chroot   # OR     ChrootDirectory %h
X11Forwarding no
AllowTCPForwarding no
ForceCommand internal-sftp
3. Test the configuration, and reload sshd:

# sshd -t
# service sshd reload

### Setup the user's chrooted homedir:

1. If ChrootDirectory is /home/chroot:

# chmod 711 /home/chroot            # This prevents chrooted users from seeing other chrooted users' homedirs
# chmod 755 /home/chroot/$NEWUSER
# chown $NEWUSER:sftponly /home/chroot/$NEWUSER

2. If ChrootDirectory is %h:

# chown root:root /home/chroot/$NEWUSER

### Create bind mounts to any path outside the chroot that the user needs to access:

1. Add the following to /etc/fstab:

/var/www/html   /home/chroot/$NEWUSER/www        none    bind    0 0

2. Mount the directory:

# mkdir /home/chroot/$NEWUSER/www
# mount /home/chroot/$NEWUSER/www

* Permissions.  Update the filesystem permissions on directories the user will be accessing.  You will need to take into consideration other users that currently have read/write access to make sure you don't inadvertently remove their permissions. This can be done several different ways: changing user ownership, changing group ownership/permissions, adding facls, etc.

1. Example w/ facls:

# setfacl -Rm u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/
# setfacl -Rm d:u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/

### Potential problems

Directory permissions

1. The built-in chroot function of sftp is very particular about permissions, and if they're "not secure enough", you'll get this error when you try to login:
root@ftp01[ ~ ]# sftp $NEWUSER@localhost
Connecting to localhost...
chroottest@localhost's password: 
Write failed: Broken pipe
Couldn't read packet: Connection reset by peer

2. You may also be able to login, but you can't upload files.  The error looks like this: 
sftp> put test
Uploading test to /$NEWUSER/test
Couldn't get handle: Permission denied
In both cases the problem is directory permissions.  Here's what a known-good directory structure looks like:
root@ftp01[ ~ ]# ls -ld / /home /home/chroot /home/chroot/$NEWUSERdrwxr-xr-x. 28 root     root     4096 Aug 22 10:31 /
drwxr-xr-x. 18 root     root     4096 Oct 10 10:49 /home
drwx--x--x   3 root     root     4096 Oct 10 10:49 /home/chroot
drwxr-xr-x   3 $NEWUSER $NEWUSER 4096 Oct 10 11:40 /home/chroot/$NEWUSER
root@ftp01[ ~ ]#
SCP does not work
It just doesn't. This user will only work with sftp. Just be sure you're using an sftp client, not rsh, scp, ftp, etc, and everything should work fine.
