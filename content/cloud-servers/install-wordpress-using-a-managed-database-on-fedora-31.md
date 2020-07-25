---
permalink: install-wordpress-using-a-managed-database-on-fedora-31/
audit_date:
title: 'Install WordPress using a Managed Database on Fedora 31'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

WordPress is a simple content management system based on PHP and MySQL. It is estimated that about one-third of the sites on the internet run on WordPress. WordPress has many features that simplify the setup and customization of a website or blog, which is part of what makes it so popular. In addition to its ease of use, there are many plugins that can add additional features. This guide will walk you through a quick and easy install of WordPress, in this case, we’ll be using a remote database separate from our web server, to allow us to scale easily in the future.

###Prerequisites: 

• A Cloud Server Running Fedora 31
• SSH Access as root or equally privileged user

###Configure Web Server

This article assumes that while you have SSH access as root to your Fedora 31 VM, you’ve not made any other changes. So we’ll be going through the process of creating a sudo user, setting up LAMP, installing and configuring WordPress, and adjusting our firewall rules.

###Creating the sudo user

Sudo users are beneficial because they would allow normal users to operate within the server as if they were a root user. This section of the guide will take you through setting up a sudo user.

1) Log into your server as the root user over SSH and run the following command to create a new user. Replace ‘userbob’ with the username you want to be created.

# adduser userbob
2) Next, run the following command to set the password for our newly created user:

# passwd userbob
You’ll be prompted twice for the password, and like when you log into SSH, you’ll see no feedback for characters entered as the password.

3) Once you are returned to the command line, it’s time to add our new user to the group which has sudo privileges. In Fedora, there is always a ‘wheel’ group that provides sudo privileges to any users within it.

# usermod -aG wheel userbob
4) Now, you can use the su command to switch to our new user so that we can test their sudo access:

# su - userbob
You can try running a command now, but when using a sudo user, you will have to prepend all your commands with ‘sudo’. Example:
 

# sudo ls -lah
If this is the first time you’ve used sudo in a session, you’ll be required to enter your password for the account you’re sudo’ing as. Once you’ve entered the password the command should proceed and provide the output.

Setting up the LAMP stack

LAMP is an acronym for Linux, Apache, MySQL, PHP. These are all requirements for a WordPress server, and this part of the guide will go through installing and making the necessary configurations.

1) Download all the software required for LAMP and PHP features that WordPress will require. The following command strings together a list of packages we’ll install.

sudo dnf install httpd mariadb  php php-common php-mysqlnd php-gd php-xml php-mbstring
You’ll be prompted a few times to enter Yes(y) or No(n) as the packages are installed. Press Y to install them.

2) We’ll also need apache, our web service, running in order to display our WordPress site and accept our connection. Use the following commands to start apache and set it to start on boot:

# sudo systemctl start httpd
# sudo systemctl enable httpd
Now our LAMP stack is all set up and ready to serve WordPress once we install it.

###Installing and Configuring WordPress

1) To install WordPress, we first need to download the package that contains all the necessary files. It’s recommended that we move to our temporary directory to download the tar file. We’ll then use the wget command to download the package from the URL provided by WordPress:

# sudo cd /tmp
# sudo wget http://wordpress.org/latest.tar.gz
2) Now that we’ve downloaded the package, we will want to extract it and place it in our apache web directory:

# sudo tar -xvzf latest.tar.gz -C /var/www/html
3) Now that we’ve created a WordPress folder at /var/www/html/wordpress, we will want to allow apache ownership of that folder. We’ll use this command to make that change:

# chown -R apache /var/www/html/wordpress
4) While configuring a vhost to serve WordPress is not required, it will it easier to add more sites in the future if necessary. To set up our vhost, we’ll have to open the /etc/httpd/conf/httpd.conf file with a text editor. Once the file is opened, add the following code to the end of your file, but be sure to change the fields to match your own site’s hostname and name log files. In our case, we’ll be using wordpress.domain.com as an example.

<VirtualHost *:80>
  ServerAdmin username@wordpress.domain.com
  DocumentRoot /var/www/html/wordpress
  ServerName wordpress.domain.com
  ServerAlias wordpress.domain.com
  ErrorLog /var/log/httpd/wordpressdomain-error-log
  CustomLog /var/log/httpd/wordpressdomain-acces-log common
</VirtualHost>
Be sure to save the file upon exit.

5) Now open port 80 for apache so that it can listen for requests over the web:

# sudo firewall-cmd --add-service=http --permanent

###Configuring the WordPress Install

Our final task is to configure our WordPress install to use our remote database. The following steps will quickly guide you through this.

1) Navigate to the WordPress directory:

# sudo cd /var/www/html/wordpress
2) Within this directory, WordPress provides a sample config file, but the easiest thing to do is just to rename it and then edit it to be a working config file. The following command will rename the config file:

# sudo mv wp-config-sample.php wp-config.php
3) Now we need to open the wp-config.php file with our text editor of choice. Once the file is opened you’ll see a following block of code:

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** MySQL database username */
define( 'DB_USER', 'username_here' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password_here' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );
We’re interested in changing the ‘database_name_here’, ‘username_here’, ‘password_here’, and ‘localhost’ of this block of code. ‘database_name_here’, ‘username_here’, and ‘password_here’ need to be replaced with the matching values that you used for your database. The ‘localhost’ will need to be replaced with the IP of your database. 

Once these changes are made, it should resemble something like this:

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wpadmin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'Password!' );

/** MySQL hostname */
define( 'DB_HOST', '12.34.56.78' );
Also, add the following lines to the file as well, and replace http://example.com with your site’s URL. This will prevent you receiving 404 not found and WordPress trying to redirect you to use your server’s IP address.

define('WP_SITEURL', 'http://example.com');
define('WP_HOME', 'http://example.com');
Save the file upon exit. 

The final thing we’ll do is restart apache, and reload our firewall rules:

# sudo systemctl restart httpd
# sudo firewall-cmd --reload
Now, when you navigate to http://your.ip.address.here/wp-admin/ you should be greeted with a WordPress login page. Enter the username of the user you created on your server, and their password. You should now be passed into the WordPress Dashboard where you can begin configuring and customizing your WordPress site.
