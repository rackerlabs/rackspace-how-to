---
permalink: setting-up-sftp-users-in-rhel-centos-ubuntu-debian
audit_date:
title: Setting Up SFTP Users in RHEL 6, CentOS 6, Ubuntu & Debian
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article is for creating secured sftp users jailed to their home directory; some people may just need a user account with no locked down permissions. This article explains how to lock it down and make secure.

**WARNING: Do not try to jail the root user, only additional users (other than root!) or you can prevent root from performing operations correctly.**

1. It's important to remember that making permissions changes to your folders that you test your website after doing this work.

2. The home directory of the sFTP user needs to be owned by root:root. Other directories below can (and should) be owned (and writable) by the user.

3. It's important to ensure the chroot user has write access to the specified DocumentRoot. This can be tested by

4. It's important to login and test the SFTP user is working correctly

5. It's important to ensure that the SFTP user added is added to the SFTP group

6. These instructions are for adding a single domain (SFTP user), but could potentially be used to manage multiple domains (a second tutorial is under-way explaining this)
**THIS WILL NOT WORK WITH RHEL7/CENTOS 7**
As with any proper chroot, this configuration does not provide write access to the chroot directory. Only subdirectories of the chroot jail will be writable. It's important for you to understand why this is, and it is to do with the way that root permissions are interpreted at the higher level directories that the SFTP user is contained. Now for the setup;
**ADD SFTP GROUP**
# Add the sftp group which will be used for SFTP access
groupadd sftponly

**ADD SFTP USER**
# Add SFTP User, replacing 'myuser' with your username of choice.

useradd -d /var/www/vhosts/domain.com -s /bin/false -G sftponly myuser

**Create a password for your username, (without one you cannot authenticate)**
# Create password for user (replace myuser with your username of choice)
passwd myuser

**Ensure the following line is commented out in your sshd configuration file ( File Location: /etc/ssh/sshd_config)**
# Edit the sshd_config file which holds the SSH/SFTP configuration
nano /etc/ssh/sshd_config

# Ensure this below Line has a hash symbol, # in front of it
#Subsystem sftp /usr/lib/openssh/sftp-server

# Ensure that this below line is added directly below the line you just commented out with a hash symbol #

Subsystem sftp internal-sftp 
 
**Add the following to the bottom of the same file (it must be at the very bottom)**
Match Group sftponly
     ChrootDirectory %h
     X11Forwarding no
     AllowTCPForwarding no
     ForceCommand internal-sftp
**Test the changes with sshd before restarting the service, please note it's important you do this correctly, or may break your sshd configuration**
sshd -t
service sshd restart


Now, we've added the important necessities for the SFTP SSHD Server, which handles the request, but for this to be properly configured, we need to ensure that the file permissions on the filesystem are correct, otherwise the 'SFTP Jail' will not work correctly.

**Ensure that the SFTPROOT (the home directory we set when adding the SSH User) has the right user:root group:root permissions.**
chown root:root /var/www/vhosts/mywebsite.com/
**Test SFTP login is working**
# Connect to SFTP using the myuser, replace myuser with the user you've chosen

sftp myuser@localhost
myuser@localhost's password:
Connected to localhost.

# Test Directory Listing
sftp> ls -al
drwxr-xr-x    3 0        0            4096 Sep 28 08:09 .
drwxr-xr-x    3 0        0            4096 Sep 28 08:09 ..
drwxr-xr-x    2 5001     33           4096 Sep 28 08:52 html
-rw-r--r--    1 0        0               0 Sep 28 08:09 test.php

# EXTRA INFORMATION / DETAIL
# cd into the html directory (/var/www/vhosts/mywebsite.com/html, as you can see the website 'documentroot', is one level underneath the SSH SFTP users 'root'. It should be this way to prevent your www-data users (the webservers user) having root user:group permissions on it's files. So essentially the folder up from your webroot, should be chowned root:root , but html underneath it should have permissions more like myuser:www-data

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
