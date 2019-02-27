---
permalink: set-up-sftp-users-in-rhel-centos-ubuntu-and-debian/
audit_date: '2019-01-18'
title: Set up SFTP users in RHEL 6, CentOS 6, Ubuntu, and Debian
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-22'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to create secured SSH File Transfer Protocol (SFTP) users that are restricted or jailed to their home directories.

**WARNING**: Do not try to jail the root user. Only jail additional users so that you don't prevent the root user from performing operations correctly.

Before you begin, review the following best practices:

- The home directory of the SFTP user must be owned by `root:root`. Other directories 
  can (and should) be owned (and writable) by the user.

- It's important to ensure the chroot user has write access to the specified DocumentRoot.

- It's important to log in and test that the SFTP user is working correctly.

- It's important to ensure that the SFTP user added is added to the SFTP group.

- These instructions are for adding a single domain (SFTP user), but you could potentially 
  use them to manage multiple domains.

**Important**: The steps in this article do not work with RHEL&reg; 7 or CentOS&reg; 7. As with any proper chroot operation, this configuration does not provide write access to the chroot directory. Only subdirectories of the chroot jail are writable. This is due to the way that root permissions are interpreted at the higher-level directories in which the SFTP user is contained. 

Use the following steps to create secured SFTP users that are jailed to their home directories:

1. Add the SFTP group that you want to use for SFTP access by running the following command:

       groupadd sftponly

2. Add the SFTP user by running the following command, replacing `myuser` with the username:

       useradd -d /var/www/vhosts/domain.com -s /bin/false -G sftponly myuser

3. Create a password for the user by running the following command, replacing `myuser` with the username:

       passwd myuser

4. Open the `sshd_config` file that holds the SSH and SFTP configuration by running the following command:

       nano /etc/ssh/sshd_config

5. Comment out the following line by adding a hash symbol (#) at the beginning, as shown in the following example:

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

Next, you need to verify that the file permissions on the file system are correct so that the SFTP jail works correctly.

1. Verify that the `SFTPROOT` directory (the home directory that you set when you added the SSH user) has the right `user:root group:root` permissions by running the following command:

       chown root:root /var/www/vhosts/mywebsite.com/

2. To verify that the SFTP login works, connect to SFTP by running the following command, replacing `myuser` with the user that you have chosen, as shown in the following example:

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

   **Note**: Use the `cd` command to go to the HTML directory (which is located at `/var/www/vhosts/mywebsite.com/html` 
   because the website 'documentroot' is one level below the SSH SFTP user's `root` directory. You should use this setup 
   because your `www-data` users (the web server's users) have root `user:group` permissions on its files.

4. Test the ability to upload files by running the following commands:

       sftp> cd html
       sftp> put test.php
       Uploading test.php to /html/test.php
       test.php                                                                                                                                                                                                                                        
       100%    12K     20.0KB/s   00:00

5. Test the ability to download files by running the following command:

       sftp> get test.php
       Fetching /test.php to test.php

6. Display the present working directory by running the following command:

       sftp> pwd

       Remote working directory: /html

   SFTP only sees the files in the `/var/www/vhosts/mywebsite.com/` directory, and considers 
   this directory the highest-level, root ('/') directory.

7. Use the following steps to connect to SFTP and set up your SFTP client:

    1. Install [Cyberduck&reg;](https://cyberduck.io/download/).
    2. Open the Cyberduck application.
    3. At the top of the window, click the icon for **Open Connection**.
    4. In the drop-down menu, select **SFTP (SSH File Transfer Protocol)**. 
    5. In the **Server** field, enter the Internet Protocol (IP) address for the server.
    6. Enter the username and password that you use to connect to SFTP. 
    7. Click **Connect**.

**Important**: Always test your website after you change file permissions.
