---
permalink: wordpress-security-best-practices-linux/
audit_date: '2019-01-15'
title: Wordpress Security Best Practices (Linux)
created_date: '2019-01-15'
created_by: Shaun Crumpler
last_modified_date: '2019-01-15'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

WordPress is a great content management system (CMS), especially if you're new to blogging or coding. However, due to the high number of WordPress installations, Wordpress has become a target for attackers. The good news is that there are many steps that you can take to make your WordPress installation more secure.

### Linux users and permissions

It's common for users who are new to WordPress to set their permissions wide open (set 777 permissions) when they see a 
`Permission Denied` error from WordPress. This configuration allows any user (most importantly the web server process) to 
modify the files in your WordPress installation. To lock this down, we recommend that you create one user for each WordPress 
installation as the file transfer protocol (FTP) user for the site. This article assumes that you have a single site, and that 
you name this server **wp-user**. 

Use the following command to create this user:

    sudo useradd wp-user -d /home/wp-user -m -s /bin/false

**Note**: We recommend that you use Secure Shell (SSH) Key authentication only. If you plan to use password authentication for FTP, you will nneed to create a strong password for the user.

### Set permissions

The best practice for permissions is for a user other than the web service's system user to own the document root of your site, and to deny write permissions to the web service. The web service needs only read permission to serve content, and assigning write or execute permission to it leaves an attack vector for outsiders. Unfortunately, because WordPress needs the ability to upload files and update its own code, you need to bend these rules slightly. 

For example, ownership for the entire directory should be `wp-user:www-data`.

This setting means that `wp-user` has user ownership, and `www-data` (the system user for the Apache&reg; web server) has group ownership. Depending on your operating system, this user might also be named `httpd` or `apache`. If you are using nginx, the user is `nginx`. To set permissions, run the following command:

sudo chown -R wp-user:www-data /var/www/example.com/

The base permissions for your WordPress installation should be similar to the following examples:

755 (drwxr-xr-x) for folders
644 (-rw-r--r--) for files

This means that the wp-user is able to modify anything, but the web server has read-only access. To accomplsh this you can run this, with the assumption that the document root for your site is /var/www/example.com/:

find /var/www/example.com/ -type d -exec sudo chmod  755 {} \;
find /var/www/example.com/ -type f -exec sudo chmod 644 {} \;

This means that the wp-user will be able to modify anything, but the web server has read-only access. This is common practice for static sites, but as we discussed, there are some files wordpress will need to be able to access and execute in order to function correctly. These are the exceptions, assuming the same document root:

find /var/www/example.com/wp-content/uploads -type d -exec sudo chmod 775 {} \;
find /var/www/example.com/wp-content/upgrade -type d -exec sudo chmod 775 {} \;
find /var/www/example.com/wp-content/themes -type d -exec sudo chmod 775 {} \;
find /var/www/example.com/wp-content/plugins -type d -exec sudo chmod 775 {} \;

find /var/www/example.com/wp-content/uploads -type f -exec sudo chmod 664 {} \;
find /var/www/example.com/wp-content/upgrade -type f -exec sudo chmod 664 {} \;
find /var/www/example.com/wp-content/themes -type f -exec sudo chmod 664 {} \;
find /var/www/example.com/wp-content/plugins -type f -exec sudo chmod 664 {} \;

sudo chmod 775 /var/www/example.com/wp-config.php

These directories are used for WordPress updates, theme and plugin updates, and blog attachment uploads (most commonly images).

### Wordpress Admin user

Similar to how your Linux&reg; installation comes with a root user, your WordPress installation comes with an **admin** user. The admin user is plagued by the same issue, when attackers attempt a brute-force attack, this is an administrative user that exists in most every install. The easiest way to close this attack vector is to remove the admin user. We recommend that you create a user with a different name, give them administrator privileges, and then delete the admin user.

### Secure Updates

FTP is inherently insecure, especially when using password authentication. It is much more secure to set-up password-less ssh-key updates.First we will need to make sure that we have the proper packages installed. On Ubuntu or Debian, this can be done by issuing the following:
sudo apt-get update; sudo apt-get install php5-dev libssh2-php libssh2-1-dev
After this we will set up our SSH access. We will need to do these steps as 'wp-user'; since we disallowed login as wp-user, we will need to open a shell with the sudo command:
sudo -u wp-user /bin/bash

After this, you can move to the wp-user home directory and set up SSH keys:
cd ~
ssh-keygen -t rsa -b 4096
mkdir ~/.ssh; cd ~/.ssh
echo 'from="127.0.0.1"' `cat ~/.ssh/id_rsa.pub` > authorized_keys
exit
After this make sure permissions are set correctly:
sudo chmod 700 /home/wp-user/.ssh
sudo chmod 040 /home/wp-user/.ssh/*
sudo chmod 644 /home/wp-user/.ssh/authorized_keys
After this, just add the following to your /var/www/example.com/wp-config.php
define('FTP_PUBKEY','/home/wp-user/id_rsa.pub');
define('FTP_PRIVKEY','/home/wp-user/id_rsa');
define('FTP_USER','wp-user');
define('FTP_PASS','');
define('FTP_HOST','127.0.0.1:22');
And you should be able to update wordpress, plugins, and themes without being prompted for login information.
Plugins

Best Practice is to use as few plugins as possible to achieve your desired result. There a few that I recommend to promote security:
* Login Security Solution <https://wordpress.org/plugins/login-security-solution/> - This is an all in one plugin that provides the ability to set strict password requirements, set password expiration periods, and get email notifications for repeated failed logins
* Disable XML-RPC <https://wordpress.org/plugins/disable-xml-rpc/> - While it is possible to lock down XML-RPC via an .htaccess file, unless you have a compelling reason to need remote control of your wordpress install, it is better to simply disable it to prevent pingback attacks.
* Disqus <https://wordpress.org/plugins/disqus-comment-system/> - The built in user and comment system for wordpress is decent, but it is very prone to spam. As such, I usually disable open registration ("Settings > "General" > uncheck "Anyone can register"), and use Disqus to moderate comments, and allow users to authenticate against their facebook or google accounts.
