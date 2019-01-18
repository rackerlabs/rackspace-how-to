---
permalink: set-up-sftp-users-in-rhel-centos-ubuntu-and-debian/
audit_date:
title: Set up SFTP users in RHEL 6, CentOS 6, Ubuntu, and Debian
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to create secured SSH File Transfer Protocol (SFTP) users that are jailed to their home directories.

**WARNING**: Do not try to jail the root user. Only jail additional users so that you don't prevent the root user from performing operations correctly.

Before you begin, you should be familiar with the following best practices:

- The home directory of the SFTP user must be owned by `root:root`. Other directories 
  can (and should) be owned (and writable) by the user.

- It's important to ensure the chroot user has write access to the specified DocumentRoot.

- It's important to login and test the SFTP user is working correctly

- It's important to ensure that the SFTP user added is added to the SFTP group

- These instructions are for adding a single domain (SFTP user), but could potentially 
  be used to manage multiple domains.

**Important**: The steps in this article do not work with RHEL 7 or CentOS 7. As with any proper `chroot` operation, this configuration does not provide write access to the chroot directory. Only subdirectories of the `chroot` jail are writable. This is due to the way that root permissions are interpreted at the higher level directories that the SFTP user is contained. 

Use the following steps to create secured SSH File Transfer Protocol (SFTP) users that are jailed to their home directories:

1. Add the SFTP group that you want to use for SFTP access by running the following command:

       groupadd sftponly

2. Add the SFTP user by running the following command, replacing `myuser` with the username:

       useradd -d /var/www/vhosts/domain.com -s /bin/false -G sftponly myuser

3. Create a password for the user by running the following command, replacing `myuser` with the username:

       passwd myuser

4. Ensure that the following line is commented out in the solid-state hybrid drive (SSHD) configuration file at `/etc/ssh/sshd_config`:



5. Open the `sshd_config` file that holds the SSH and SFTP configuration by running the following command:

       nano /etc/ssh/sshd_config

6. Ensure that the following line begins with a hash symbol (#):

       #Subsystem sftp /usr/lib/openssh/sftp-server

7. Add the following line directly below the line that you just commented out:

       Subsystem sftp internal-sftp 
 
8. Add the following code to the bottom of the file:

       Match Group sftponly
            ChrootDirectory %h
            X11Forwarding no
            AllowTCPForwarding no
            ForceCommand internal-sftp

9. Run the `sshd` command to test the changes, then restart the service. 

   **Important**: If this step is performed incorrectly, it might break your SSHD configuration.

       sshd -t
       service sshd restart

### Ensure that the file permissions on the file system are correct

Next, you need to verify that the file permissions on the file system are correct so that the "SFTP jail" works correctly.

1. Verify that the `SFTPROOT` directory (the home directory that you set when you added the SSH user) has the right `user:root group:root` permissions by running the following command:

       chown root:root /var/www/vhosts/mywebsite.com/

2. To verify that the SFTP login works, connect to SFTP by using the myuser account, replacing `myuser` with the user that you have chosen, as shown in the following example:

       sftp myuser@localhost
       myuser@localhost's password:
       Connected to localhost.

3. Test the directory listing by running the following command:

       sftp> ls -al

   The output should be similar to the following example:

       drwxr-xr-x    3 0        0            4096 Sep 28 08:09 .
       drwxr-xr-x    3 0        0            4096 Sep 28 08:09 ..
       drwxr-xr-x    2 5001     33           4096 Sep 28 08:52 html
       -rw-r--r--    1 0        0               0 Sep 28 08:09 test.php

### EXTRA INFORMATION / DETAIL
Use the `cd` command to go to the HTML directory (which is located at `/var/www/vhosts/mywebsite.com/html` because the website 'documentroot' is one level below the SSH SFTP user's `root` directory. You should use this setup because your `www-data` users (the webservers users) have root `user:group` permissions on its files.

# Test putting files (uploading)

sftp> cd html
sftp> put test.php
Uploading test.php to /html/test.php
test.php                                                                                                                                                                                                                                    100%    12K     20.0KB/s   00:00

# Test getting files (downloading files)

sftp> get test.php
Fetching /test.php to test.php

# Show the 'present working directory' , for illustration purposes, as you can see SFTP only sees the stuff inside /var/www/vhosts/mywebsite.com/ and considers this directory as the 'highest' level or '/' root.
sftp> pwd
Remote working directory: /html
**Connecting to SFTP (SFTP Client Setup)**

A. Install Cyberduck from https://cyberduck.io/?l=en
B. Open
C. Click **Open Connections**
D. Select 'SFTP (SSH File Transfer Protocol) from the top drop down menu. 
E. Insert the server IP address in the 'server' box, and the username and passowrd your using for connecting to SFTP. 
F. Click **connect**.

It's important to remember that making permissions changes to your folders that you test your website after doing this work.
