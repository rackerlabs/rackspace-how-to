---
permalink: wordpress-security-best-practices-linux
audit_date:
title: Wordpress Security Best Practices (Linux)
created_date: '2019-01-14'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Wordpress is a great CMS system, especially for brand new bloggers, or those with little coding knowledge. However, with the number of installations out there, Wordpress has become a big target for attackers. The good news is that there are many steps that can be easily taken to harden your Wordpress Installation.
Linux Users and Permissions

It's very common for those new to Wordpress to set their permissions wide open (777) as soon as they see a Permission Denied error from Wordpress. When you do this, it allows any user (most importantly the web server process) the ability to modify the files in your wordpress install. To lock this down, I recommend that you create one user for each wordpress install, as the FTP User for the site. We will assume that you have a single site, and name this server "wp-user". To create this user:
sudo useradd wp-user -d /home/wp-user -m -s /bin/false
Two things of note: The user does not have a shell (there is no reason for this user to log in to a shell) and we did not set a password for the user. This is as I normally recommend SSH Key access only. If you plan on using password authentication for FTP, you will need to create this password (make sure its strong).
Setting Permissions

Normally, best practice is for the document root of your site to be owned by a user other than the web service's system user, and to deny write permissions to the web service. The web service only needs read permission to serve content, and giving write or execute permission only leaves an attack vector to the outside world. Unfortunately, as Wordpress needs the ability to upload files, and update it's own code, we have to bend these rules slightly. We will start with ownership. Ownership for the entire directory should be:
wp-user:www-data
This means that 'wp-user' has user ownership, and 'www-data' (the system user for the apache web server) has group ownership. Depending on your operating system, this user may also be named 'httpd' or 'apache'. If you are using nginx, the user will be 'nginx'. To accomplish this, you can run:
sudo chown -R wp-user:www-data /var/www/example.com/
Base permissions for your wordpress install should be:


755 (drwxr-xr-x) for folders
644 (-rw-r--r--) for files
This means that the wp-user will be able to modify anything, but the web server has read-only access. To accomplsh this you can run this, with the assumption that the document root for your site is /var/www/example.com/:
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
These directories are used for wordpress updates, theme and plugin updates, and blog attachment uploads (most commonly images).
Wordpress Admin User

Just as your linux installation comes with a "root" user, your Wordpress installation comes with an "admin" user. And the admin user is plagued by the same issue, when attackers attempt to brute force, this is an administrative user that exists in most every install. The easiest way to close this attack vector is to remove the "admin" user. You can easily create a user with a different name, give them administrator priveleges, and then delete the "admin" user.
Secure Updates

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
