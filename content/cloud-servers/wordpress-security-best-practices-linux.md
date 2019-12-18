---
permalink: wordpress-security-best-practices-linux/
audit_date: '2019-01-14'
title: Wordpress security best practices on Linux
type: article
created_date: '2019-01-15'
created_by: Rackspace Community
last_modified_date: '2019-01-15'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

WordPress&reg; is a great content management system (CMS), especially if you're new to blogging or coding. However, 
due to the  high number of WordPress installations, Wordpress has become a target for attackers. The good news is 
that there are many steps that you can take to make your WordPress installation more secure.

### Linux users and permissions

It's common for users who are new to WordPress to set their permissions wide open (set 777 permissions) when they see a 
`Permission Denied` error from WordPress. This configuration allows any user (most importantly the web server process) to 
modify the files in your WordPress installation. To lock this down, we recommend that you create one user for each WordPress 
installation as the file transfer protocol (FTP) user for the site. This article assumes that you have a single site and that 
you name this server `wp-user`. 

Use the following command to create this user:

    sudo useradd wp-user -d /home/wp-user -m -s /bin/false

**Note**: We recommend that you use Secure Shell (SSH) key authentication only. If you plan to use password authentication for FTP, you must create a strong password for the user.

### Set permissions

You should make a user other than the web service's system user the owner of the document root of your 
site. You should also deny write permissions to the web service. The web service only needs read permission to serve content, 
and assigning write or execute permissions to it leaves an attack vector for outsiders. However, because WordPress must be 
able to upload files and update its own code, you need to bend these rules slightly. 

For example, you should set the ownership of the entire directory as `wp-user:www-data`.

This setting means that `wp-user` has user ownership, and `www-data` (the system user for the Apache&reg; web server) has group ownership. Depending on your operating system, this user might also be named `httpd` or `apache`. If you are using nginx&reg;, the user is `nginx`. To set permissions, run the following command, replacing the example value `/var/www/example.com/` with the document root of your site:

    sudo chown -R wp-user:www-data /var/www/example.com/

Use the following base permissions for your WordPress installation:

- 755 (drwxr-xr-x) for folders
- 644 (-rw-r--r--) for files

These permissions grant `wp-user` the ability to modify anything, and the web server read-only access. 

The following example show how to assign these permissions:

    find /var/www/example.com/ -type d -exec sudo chmod  755 {} \;
    find /var/www/example.com/ -type f -exec sudo chmod 644 {} \;

These permissions grant `wp-user` the ability to modify anything, and the web server read-only access. While this is common 
practice for static sites, there are some files that WordPress must be able to access and execute to function correctly. The 
following list shows the exceptions and the permissions that you need to set, assuming the same document root:

- `find /var/www/example.com/wp-content/uploads -type d -exec sudo chmod 775 {} \;`
- `find /var/www/example.com/wp-content/upgrade -type d -exec sudo chmod 775 {} \;`
- `find /var/www/example.com/wp-content/themes -type d -exec sudo chmod 775 {} \;`
- `find /var/www/example.com/wp-content/plugins -type d -exec sudo chmod 775 {} \;`
- `find /var/www/example.com/wp-content/uploads -type f -exec sudo chmod 664 {} \;`
- `find /var/www/example.com/wp-content/upgrade -type f -exec sudo chmod 664 {} \;`
- `find /var/www/example.com/wp-content/themes -type f -exec sudo chmod 664 {} \;`
- `find /var/www/example.com/wp-content/plugins -type f -exec sudo chmod 664 {} \;`
- `sudo chmod 775 /var/www/example.com/wp-config.php`

WordPress uses these directories for system updates, theme and plugin updates, and blog attachment uploads (most commonly images).

### WordPress admin user

Similar to the Linux&reg; root user, your WordPress installation comes with an **admin** user. Because this is an administrative user that exists in almost every WordPress installation, hackers target it in brute-force attacks. The easiest way to close this attack vector is to remove the admin user. We recommend that you create a user with a different name, give that user administrator privileges, and then delete the admin user.

### Secure updates

FTP is inherently insecure, especially when you are using password-based authentication. It is much more secure to set up SSH key updates instead of using passwords. Use the following steps to set up SSH key updates:

1. Ensure that the necessary packages are installed on your system. On Ubuntu&reg; or Debian&reg;, run the following commands:

       sudo apt-get update
       sudo apt-get install php5-dev libssh2-php libssh2-1-dev

2. Set up your SSH access, performing the following  steps as `wp-user`. Because you disallowed login as `wp-user`, you must
   open a shell by using the following sudo command:

       sudo -u wp-user /bin/bash

3. Use the following commands to move to the `wp-user` home directory and set up SSH keys:

       cd ~
       ssh-keygen -t rsa -b 4096
       mkdir ~/.ssh; cd ~/.ssh
       echo 'from="127.0.0.1"' cat ~/.ssh/id_rsa.pub > authorized_keys
       exit
        
4. Next, ensure that you set permissions correctly by using the following commands:

       sudo chmod 700 /home/wp-user/.ssh
       sudo chmod 040 /home/wp-user/.ssh/*
       sudo chmod 644 /home/wp-user/.ssh/authorized_keys

5. Add the following lines to your **/var/www/example.com/wp-config.php** file:

       define('FTP_PUBKEY','/home/wp-user/id_rsa.pub');
       define('FTP_PRIVKEY','/home/wp-user/id_rsa');
       define('FTP_USER','wp-user');
       define('FTP_PASS','');
       define('FTP_HOST','127.0.0.1:22');

You should be able to update WordPress, plug-ins, and themes without being prompted for login information.

### Plug-ins

We recommend that you use as few plug-ins as possible to achieve the results that you want. However, we recommend that you use 
the following plug-ins to promote security:

- **[Login Security Solution](https://wordpress.org/plugins/login-security-solution)**: This is an all-in-one plug-in that enables you to set strict password requirements, set password expiration periods, and receive email notifications for repeated failed logins.
- **[Disable XML-RPC](https://wordpress.org/plugins/disable-xml-rpc)**: You can lock down XML-RPC by using an **.htaccess** file. However, unless you have a compelling reason to need remote control of your WordPress installation, it's better to disable it to prevent pingback attacks.
- **[Disqus](https://wordpress.org/plugins/disqus-comment-system)**: Because the built-in user comment system for WordPress is very prone to spam, we recommend that you disable open registration (by navigating to **Settings > General**, then unchecking **Anyone can register**), then using Disqus to moderate comments instead and have users authenticate against their Facebook&reg; or Google&reg; accounts.
