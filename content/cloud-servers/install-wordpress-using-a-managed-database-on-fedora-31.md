---
permalink: install-wordpress-using-a-managed-database-on-fedora-31/
audit_date: '2020-07-24'
title: 'Install WordPress using a managed database on Fedora 31'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date: '2020-08-03'
last_modified_by: Rose Morales
product: Cloud Server
product_url: cloud-server
---

WordPress&reg; is a simple content management system based on PHP&reg; and MySQL&reg; and has features that simplify the setup and customization of a website or blog, which is part of what makes it so popular. It is estimated that about one-third of the sites on the internet run on WordPress. In addition to its ease of use, there are several plugins that provide additional features.

This guide describes how to install WordPress, using a remote database separate from our server, to scale in the future.

### Prerequisites

- A Linux&reg; server running the Fedora distribution version 31
- A user with SSH administrator privileges

### Sudo user creation

Sudo users are beneficial because they allow normal users to operate within the server with root user permissions.

1. Log into your server and run the following command to create a new user. Replace `username` with the username you want.

    adduser username

2. Run the following command to set the password.

    passwd username

3. Type your selected password, hit **Enter** and confirm it. There will be no feedback for characters entered.

4. In Fedora, the ‘wheel’ group provides sudo privileges.

    usermod -aG wheel username

5. Use the `su` command to switch to our new user and test the sudo access.

    su - username

6. You can try running a command now. When using a sudo user, you will have to place `sudo` before all your commands. Example:
 
    sudo ls -lah

    **Note**: If this is the first time you’ve used sudo in a session, you’re required to enter a password. Once you’ve entered the password the command can proceed and provide the output.

### Setting up a LAMP stack

LAMP is an acronym for Linux, Apache, MySQL, PHP. These are all requirements for a WordPress server.

1. Download all the software required for LAMP and PHP features.

    sudo dnf install httpd mariadb  php php-common php-mysqlnd php-gd php-xml php-mbstring

    **Note**: Press Yes (y) to proceed on each prompt.

2. Use the following commands to start apache and set it to start on boot:

    sudo systemctl start httpd
    sudo systemctl enable httpd

### WordPress installation

1. To install WordPress, we first download the package that contains all the necessary files. Move to the temporary directory to download the tar file. Use the wget command to download the package from the official URL provided by WordPress:

    sudo cd /tmp
    sudo wget http://wordpress.org/latest.tar.gz

2. Extract and place it in our apache web directory.

    sudo tar -xvzf latest.tar.gz -C /var/www/html

3. This creates a WordPress folder at /var/www/html/wordpress, run the following command to provide apache ownership of that folder.

    chown -R apache /var/www/html/wordpress

4. It is recommended to configure a vhost to serve WordPress to add more sites in the future. To set up the vhost, open the /etc/httpd/conf/httpd.conf file with a text editor and add the following code to the end of your file. Remember to change the fields to match your site’s hostname and name log files. In this case, we’ll use wordpress.domain.com as an example.

    ServerAdmin username@wordpress.domain.com
    DocumentRoot /var/www/html/wordpress
    ServerName wordpress.domain.com
    ServerAlias wordpress.domain.com
    ErrorLog /var/log/httpd/wordpressdomain-error-log
    CustomLog /var/log/httpd/wordpressdomain-acces-log common

5. Open the HTTP (`80`) port for apache so it can listen for requests over the web.

    sudo firewall-cmd --add-service=http --permanent

### WordPress configuration

1. Navigate to the WordPress directory.

    sudo cd /var/www/html/wordpress

2. Within this directory WordPress provides a sample config file, rename it to serve as our working config file.

    sudo mv wp-config-sample.php wp-config.php

3. Open the wp-config.php file with our text editor of choice. Once opened find the following block of code:

    `// ** MySQL settings - You can get this info from your web host ** //
    /** The name of the database for WordPress */
    define( 'DB_NAME', 'database_name_here' );`

    `/** MySQL database username */
    define( 'DB_USER', 'username_here' );`

    `/** MySQL database password */
    define( 'DB_PASSWORD', 'password_here' );`

    `/** MySQL hostname */
    define( 'DB_HOST', 'localhost' );`

4. Replace the values for **‘database_name_here’**, **‘username_here’**, **‘password_here’**, and **‘localhost’** with the matching values that you used for your database and the value for ‘localhost’ with the database's IP address. Once these changes are made, it should resemble something like this:

    `// ** MySQL settings - You can get this info from your web host ** //
    /** The name of the database for WordPress */
    define( 'DB_NAME', 'wordpress' );`

    `/** MySQL database username */
    define( 'DB_USER', 'wpadmin' );`

    `/** MySQL database password */
    define( 'DB_PASSWORD', 'Password!' );`

    `/** MySQL hostname */
    define( 'DB_HOST', '12.34.56.78' );`

5. Add the following lines to the file replacing `http://example.com` with your site’s URL to prevent error 404.

    define('WP_SITEURL', 'http://example.com');
    define('WP_HOME', 'http://example.com');

6. Restart apache, and reload the firewall rules.

    sudo systemctl restart httpd
    sudo firewall-cmd --reload

### Test installation

1. Navigate to http://your.ip.address.here/wp-admin/ to be greeted with a WordPress login page.

2. Enter the username of the user you created on your server, and the password. You should now visualize the WordPress Dashboard where you can begin configuring and customizing your WordPress site.
