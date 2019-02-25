---
permalink: bind-mount-an-sftp-user-after-using-chroot/
audit_date: '2019-07-18'
title: Bind mount an SFTP user after using chroot
type: article
created_date: '2019-07-18'
created_by: Rackspace Community
last_modified_date: '2019-02-08'
last_modified_by: Erik Wilson
product: Cloud Servers
product_url: cloud-servers
---

This article is intended for administrators or developers.

Bind mounting a Secure File Transfer Protocol (SFTP) user on which the chroot operation has been performed
on your Red Hat® Enterprise Linux® (RHEL®) and CentOS® 6 (OpenSSH is 4.9p1 or later) servers creates the following conditions:

* The user can only use SFTP and does not have full shell access over Secure Shell (SSH).
* The user is jailed to their home directory and has no way of breaking out of it.
* From the user's perspective, their home directory is on the server.
* This bind mounting is often needed for a developer that might need write access to one (or more) Apache® document root or roots or some other directory for the purpose of uploading or editing web content.


This article describes how to use the chroot operation to set the home directory for the user
and create a bind mount within that home directory for any of the external (document root) directories
to which they need access. A bind mount is the only way to give the user access to data outside of
their chroot directory. You are not able to use a symbolic link (symlink) to data outside of the chroot
directory into it (for example, `ln -s /home/user/http /var/www/http`). After the chroot operation,
the file system has no knowledge of any data outside of the chroot directory. This lack of knowledge breaks the symlink.
As an alternative, you can move the document root directory to the user’s home directory,
and then symlink it to the original location (for example, `ln -s /var/www/html /home/user1/html`).

The SSH daemon (SSHD) offers some dynamic variables in the configuration for the chroot operation:

* `%u`: username of the user logging in
* `%h`: $HOME of the user logging in

SSHD is very strict about how you must set permissions. One of these restrictions is that the user cannot write to the top level of the chroot directory.
You must choose an appropriate top level for the chroot directory, such as the following settings:

* Set ChrootDirectory to `%h`: The user cannot write to their home path. They need either a subfolder they can write to (for example uploads), or a bind mount to another location they can write to (for example `/var/www/html`).
* Set ChrootDirectory to `/home/chroot`: The user can write to their home path, but the top level of the chroot directory is protected with file system permissions, not the chroot jail.

The first option uses the chroot directory to guarantee security instead of relying on file system permissions.
The second option allows writing to the home directory but means the chroot directory is shared with other users, and
only file system permissions stop information disclosure. The right option depends on your needs.

### Bind mount an SFTP user after a chrooted operation

Use the following steps to bind mount the user:

1. Create a group to which you will assign any user that needs to be jailed to their home directory:

       # groupadd sftponly

2. Create the user. Set the shell to `/bin/false` and assign the user to the group that you created above:

       # mkdir -p /home/chroot/$NEWUSER
       # useradd -d /$NEWUSER -s /bin/false -G sftponly $NEWUSER    # Note: homedir is relative to the chroot
       # pass}wd $NEWUSER

3. Update the `/etc/ssh/sshd_config` file:

    1. Comment out the following line:

            Subsystem       sftp    /usr/libexec/openssh/sftp-server

    2. Add the following lines to the end of the file:

            Subsystem     sftp   internal-sftp
            Match Group sftponly
            ChrootDirectory /home/chroot   # OR     ChrootDirectory %h
            X11Forwarding no
            AllowTCPForwarding no
            ForceCommand internal-sftp

    3. Test the configuration, and then reload the SSHD:

            # sshd -t
            # service sshd reload

#### Set up the user's homedir afer the chroot operation

1. If the ChrootDirectory is `/home/chroot`, run the following commands:

        # chmod 711 /home/chroot            # This prevents chrooted users from seeing other chrooted users' homedirs
        # chmod 755 /home/chroot/$NEWUSER
        # chown $NEWUSER:sftponly /home/chroot/$NEWUSER

2. If the ChrootDirectory is `%h`, run the following command:

        # chown root:root /home/chroot/$NEWUSER

#### Create bind mounts to any path outside the chroot directory that the user needs to access

1. Add the following line to the `/etc/fstab` file:

        /var/www/html   /home/chroot/$NEWUSER/www        none    bind    0 0`

2. Mount the directory:

        # mkdir /home/chroot/$NEWUSER/www
        # mount /home/chroot/$NEWUSER/www

#### Update permissions

Update the file system permissions on the directories the user accesses.
Take into consideration other users that currently have read/write access to make sure you
do not inadvertently remove their permissions. You can complete this step in in several different ways,
such as changing user ownership, changing group ownership or permissions, or adding file access control lists (FACLs).

The following example shows commands for adding FACLs:

         # setfacl -Rm u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/
         # setfacl -Rm d:u:$NEWUSER:rwX /home/chroot/$NEWUSER/www/

### Potential problems

The following problems can occur.

#### Directory permissions

Directory permissions can cause the following problems:

* The built-in chroot function of SFTP is very strict about permissions.
   If the permissions are not secure enough, you receive the following error when you try to log in:

          root@ftp01[ ~ ]# sftp $NEWUSER@localhost
          Connecting to localhost...
          chroottest@localhost's password:
          Write failed: Broken pipe
          Couldn't read packet: Connection reset by peer

* You might be able to log in, but you cannot upload files. In this case you receive the
   following error:

          sftp> put test
          Uploading test to /$NEWUSER/test
          Couldn't get handle: Permission denied
          In both cases the problem is directory permissions.  Here's what a known-good directory structure looks like:
          root@ftp01[ ~ ]# ls -ld / /home /home/chroot /home/chroot/$NEWUSERdrwxr-xr-x. 28 root     root     4096 Aug 22 10:31 /
          drwxr-xr-x. 18 root     root     4096 Oct 10 10:49 /home
          drwx--x--x   3 root     root     4096 Oct 10 10:49 /home/chroot
          drwxr-xr-x   3 $NEWUSER $NEWUSER 4096 Oct 10 11:40 /home/chroot/$NEWUSER
          root@ftp01[ ~ ]#

#### SCP does not work

This type of user only works with SFTP and does not work with other protocols (for example, remote shell (RSH), secure contain protect (SCP), or File Transfer Protocol (FTP)).


