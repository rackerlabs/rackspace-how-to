---
permalink: sftp-chrooted-bind-mount-user/
audit_date:
title: Bind Mount a SFTP Chrooted User
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-08'
last_modified_by: Erik Wilson
product: Cloud Servers
product_url: cloud-servers
---

This article is intended for an administrator or developer. If you have questions about how to set up an SFTP user using a bind mount, contact Support.
Bind mounting a chrooted SFTP user on your RHEL and CentOS 6 (OpenSSh is 4.9p1 or later) servers creates the following conditions:

* The user can only use SFTP and does not have full shell access over SSH.
* The user is jailed to their home directory and has no way of breaking out of it.
* From the user's perspective, their home directory is on the server.
* This is often needed for a developer that may need write access to one (or more) Apache document root(s) or some other directory for the purpose of uploading or editing web content.

This article describes how to chroot the user to their home directory and create a bind mount within that home directory for any of the external (document root) directories that they need access.
A bind mount is the only way to give the user access to data outside of their chroot directory.
You will not be able to symlink data outside of the chroot into it (for example, ln -s /home/user/http /var/www/http).
After the user is chrooted, the file system has no knowledge of any data outside of the chroot. This breaks the symlink.
As an alternative, you can move the document root directory to the users home directory and then symlink it to the the original location (ln -s /var/www/html /home/user1/html).

SSHD offers some dynamic variables in the configuration for chrooting:
* %u – username of the user logging in
* %h – $HOME of the user logging in

SSHD is very strict with regards to how permissions must be set. One of these restrictions is that the user cannot write to the top level of the chroot.
You must choose an appropriate top level for the chroot, for example:
* Set ChrootDirectory to %h - The user cannot write to their home path. They need either a subfolder they can write to (for example "uploads"), or a bind mount to another location they can write to (for example /var/www/html).
* Set ChrootDirectory to /home/chroot - The user can write to their home path, but the top level of the chroot is protected with filesystem permissions, not the chroot jail.

The first option uses the chroot to guarantee security instead of relying on filesystem permissions.
The second option allows writing to the home directory, but means the chroot is shared with other users and only filesystem permissions stop information disclosure.
The right option depends on your needs.

### Bind mount a SFTP chrooted user

1. Create a group in which we will assign any user that needs to be jailed to their home directory:

   `# groupadd sftponly`

2. Create the user. The shell should be set to /bin/false and the user needs to be assigned to the group that was created above:

   `# mkdir -p /home/chroot/$NEWUSER`
   `# useradd -d /$NEWUSER -s /bin/false -G sftponly $NEWUSER    # Note: homedir is relative to the chroot`
   `# passwd $NEWUSER`

3. Update /etc/ssh/sshd_config.

    1. Comment out the following line:

       `Subsystem       sftp    /usr/libexec/openssh/sftp-server`

    2. Add the following lines to the end of the file:

       `Subsystem     sftp   internal-sftp`
       `Match Group sftponly`
       `ChrootDirectory /home/chroot   # OR     ChrootDirectory %h`
       `X11Forwarding no`
       `AllowTCPForwarding no`
       `ForceCommand internal-sftp`

    3. Test the configuration, and then reload the SSHD:

       `# sshd -t`
       `# service sshd reload`

#### Set up the user's chrooted homedir

1. If the ChrootDirectory is /home/chroot run the following commands:

   `# chmod 711 /home/chroot            # This prevents chrooted users from seeing other chrooted users' homedirs`
   `# chmod 755 /home/chroot/$NEWUSER`
   `# chown $NEWUSER:sftponly /home/chroot/$NEWUSER`

2. If the ChrootDirectory is %h run the following command:

   `# chown root:root /home/chroot/$NEWUSER`

#### Create bind mounts to any path outside the chroot that the user needs to access

1. Add the following line to /etc/fstab:

   `/var/www/html   /home/chroot/$NEWUSER/www        none    bind    0 0`

2. Mount the directory:

   `# mkdir /home/chroot/$NEWUSER/www`
   `# mount /home/chroot/$NEWUSER/www`

#### Update permissions

Update the filesystem permissions on the directories the user accesses.
Take into consideration other users that currently have read/write access to make sure you
do not inadvertently remove their permissions. This can be done several different ways, for example,
changing user ownership, changing group ownership/permissions, or adding FACLs.

The following example shows commands for adding FACLs:

`# setfacl -Rm u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/`
`# setfacl -Rm d:u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/`

### Potential problems

The following problems can occur.

#### Directory permissions

1. The built-in chroot function of SFTP is very strict about permissions, and if
   they are not secure enough, you recieve this error when you try to log in:

   `root@ftp01[ ~ ]# sftp $NEWUSER@localhost`
   `Connecting to localhost...`
   `chroottest@localhost's password:`
   `Write failed: Broken pipe`
   `Couldn't read packet: Connection reset by peer`

2. You may also be able to login, but you cannot upload files. You recieve the
   following error:

    `sftp> put test`
    `Uploading test to /$NEWUSER/test`
    `Couldn't get handle: Permission denied`
    `In both cases the problem is directory permissions.  Here's what a known-good directory structure looks like:`
    `root@ftp01[ ~ ]# ls -ld / /home /home/chroot /home/chroot/$NEWUSERdrwxr-xr-x. 28 root     root     4096 Aug 22 10:31 /`
    `drwxr-xr-x. 18 root     root     4096 Oct 10 10:49 /home`
    `drwx--x--x   3 root     root     4096 Oct 10 10:49 /home/chroot`
    `drwxr-xr-x   3 $NEWUSER $NEWUSER 4096 Oct 10 11:40 /home/chroot/$NEWUSER`
    `root@ftp01[ ~ ]#`

#### SCP does not work

This user only works with SFTP. It will not work with other protoccalls (for example,
RSH, SCP, FTP).

