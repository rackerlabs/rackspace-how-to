---
permalink: creating-a-chroot-jail
audit_date: '2019-01-29'
title: Creating a chroot jail
created_date: '2019-01-29'
created_by: Rackspace Community
last_modified_date: '2019-01-29'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article instructs you on how to configure a **chroot jail** using both Debian and RPM Package Manager (RPM) based distributions.

The instructions in this article create the chroot jail using the following example group and user names:

  **group: sftponly**

  **user: ftpuploader**


### Create a group for jailed users

Use the following instructions to create a group for jailed users:

1. Create the group using the following command:

   `groupadd sftponly`

   **Note:** This group will be used to restrict or **jail** users added to it to their home directory.

2. Verify that the following subsystem has been created in the /etc/ssh/sshd_config file prior to creating the user:

    `less /etc/ssh/sshd_config`

    `Subsystem:

    Subsystem     sftp   internal-sftp

    Match Group sftponly

        ChrootDirectory %h

        X11Forwarding no

        AllowTCPForwarding no

        ForceCommand internal-sftp`


    If this subsystem is not present in the sshd_config file, proceed to step 3 of this section. If the subsystem is present you should proceed to [creating a user](#creating-a-user).

3. If the subsystem the previous step is not present you will need to edit the file with the following actions:

  1. Comment out the following line:

       `Subsystem       sftp    /usr/libexec/openssh/sftp-server`

  2. Add the following to the end of the config file:

      `Subsystem     sftp   internal-sftp

       Match Group sftponly

        ChrootDirectory %h

        X11Forwarding no

        AllowTCPForwarding no

        ForceCommand internal-sftp`

4. Verify the syntax is correct in the new configuration and reload sshd using the following commands:

   `sshd –t`
   `service sshd reload`

### Create a Secure File Transfer Protocol (SFTP) user

Create a home directory for the SFTP user using the following command:

   `mkdir -p /home/chroot/ftpuploader/public`

#### Instructions on creating an SFTP using an RPM or DEB based distribution

Create a new user with a home directory, no shell access, and add it to the group **sftponly** using the following command:

   `useradd -d /home/chroot/ftpuploader -s /sbin/nologin -G sftponly ftpuploader`

If you already have an SFTP user created then you need to set the user's shell access to **/bin/false** and add them to group **sftponly** using the followinf command:

   `usermod -s /sbin/nologin -G sftponly ftpuploader`

Now, set a new password for the SFTP user using the following command:

   `Passwd ftpuploader`


### Change permissions and ownership of the home directory using RPM and DEP based distributions:


1. `chown root:root /home/chroot/ftpuploader/`

2. `chown ftpuploader:sftponly /home/chroot/ftpuploader/public`

3. `chmod 711 /home/chroot/`

4. `chmod 755 /home/chroot/ftpuploader/`

5. `chmod 755 /home/chroot/ftpuploader/public`

**Note:**In the above commands the group will be **sftponly** if the user is going to be part of the **sftponly** group.
