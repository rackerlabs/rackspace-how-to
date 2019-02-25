---
permalink: create-a-chroot-jail/
audit_date: '2019-01-31'
title: Create a chroot jail
type: article
created_date: '2019-01-31'
created_by: Rackspace Community
last_modified_date: '2019-01-31'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to configure a chroot jail by using both Debian&reg; and RPM Package Manager (RPM)-based distributions.

These instructions create the chroot jail by using the following example group and user names:

  - Group: **sftponly**

  - User: **ftpuploader**


### Create a group for jailed users

Use the following instructions to create a group for jailed users:

1. Create the jailed group by using the following command:

       groupadd sftponly

   **Note:** This group is used to restrict or jail users to their home directory.


2. Open **/etc/ssh/sshd_config** in a text editor and edit the file by using the following steps:

    1. Comment out the following line by placing a number sign (`#`) before the line:
      
        Before:

           Subsystem       sftp    /usr/libexec/openssh/sftp-server
         
        After:
         
           #Subsystem       sftp    /usr/libexec/openssh/sftp-server

    2. Add the following lines to the end of the configuration file:

           Subsystem     sftp   internal-sftp

           Match Group sftponly

              ChrootDirectory %h

              X11Forwarding no

              AllowTCPForwarding no

              ForceCommand internal-sftp`

3. Verify that the syntax is correct in the new configuration and reload **sshd** by using the following commands:

       sshd –t
       service sshd reload

### Create a Secure File Transfer Protocol user

Use the following steps to create a Secure File Transfer Protocol (SFTP) user:

1. Create a home directory for the SFTP user by using the following command:

    `mkdir -p /home/chroot/ftpuploader/public`


2. Create a new user with a home directory that has no shell access, and add it to the group **sftponly** by using the following command:

    `useradd -d /home/chroot/ftpuploader -s /sbin/nologin -G sftponly ftpuploader`

3. If you already have an SFTP user created, then you need to set the user's shell access to **/sbin/nologin** and add them to group **sftponly** by using the following command:

    `usermod -s /sbin/nologin -G sftponly ftpuploader`

4. Now, set a new password for the SFTP user by using the following command:

    `Passwd ftpuploader`


5. Change permissions and ownership of the home directory using RPM and Debian-based distributions as shown in the following code:


       chown root:root /home/chroot/ftpuploader/
       chown ftpuploader:sftponly /home/chroot/ftpuploader/public
       chmod 711 /home/chroot/
       chmod 755 /home/chroot/ftpuploader/
       chmod 755 /home/chroot/ftpuploader/public

**Note:** In the preceeding commands, the group is **sftponly** if the user is going to be part of the **sftponly** group.



