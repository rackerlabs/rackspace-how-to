---
permalink: getting-started-with-drupal-on-centos-7/
audit_date:
title: 'Getting Started with Drupal on CentOS 7'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Drupal is a free and open-source content management framework written in PHP and distributed under the GNU General Public License. Drupal currently provides a back-end framework for 2.8% of the top one million sites on the web.

###Setting up the LAMP stack

LAMP is an acronym for Linux, Apache, MySQL, PHP. These are all requirements for a Drupal server, and this part of the guide will go through installing and making the necessary configurations.

1) First, we will need to enable the Remi repository. The Remi Repo is a repository maintained by Remi Collet, and is used to provide a variety of up-to-date packages. Run the following command to install and enable the repository within our server.

# yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

2) For Drupal we’ll want to use PHP version 7.3 or above, so we will adjust our remi-repo to exclude the older php version(s). The easiest way to do this is to utilize the yum-utils package, which allows easy changes to our repos. Run the following commands to install yum-utils, and then disable php54 in favor of php73:

# yum install yum-utils
# yum-config-manager --disable remi-php54
# yum-config-manager --enable remi-php73

3) Now that we’ve adjusted our repository, we can download all the software required for LAMP and PHP features that Drupal will require. The following command strings together a list of packages we’ll install.

# yum install httpd mariadb mariadb-server php php-common php-mysql php-gd php-xml php-mbstring php-mcrypt php-fdomdocument php-gdsudo yum install httpd mariadb mariadb-server php php-common php-mysql php-gd php-xml php-mbstring php-mcryptsudo yum install httpd mariadb mariadb-server php php-common php-mysql php-gd php-xml php-mbstring php-mcrypt php-fdomdocument php-gd

You’ll be prompted a few times to enter Yes(y) or No(n) as the packages are installed. Press Y to install them.

4) Now that the installations have finished, we’ll start up our MySQL installation. Use the following command to start:

# systemctl start mariadb

After running mysql_Secure_installation, you’ll be prompted with instructions for configuring your MySQL install. It will first ask for a root password, and since this is our first time running MySQL we won’t have one, so you can press ENTER and it will prompt you for whether you’d like to add a password for the root user, which is recommended. Continue following along with the instructions in the prompts until you’re returned to the normal server command prompt and then run this command to ensure that MySQL starts automatically on boot up:

# systemctl enable mariadb

5) Open the MySQL port in your firewall so that we can establish a connection with your Cloud Database later:

# firewall-cmd --add-service=mysql --permanent

6) We’ll also need apache, our web service, running in order to display our Drupal site and accept our connection. Use the following commands to open the firewall for web traffic, start apache, and set it to start on boot:

# firewall-cmd --add-service=http --permanent
# systemctl start httpd
# systemctl enable httpd

Now our LAMP stack is all setup and ready to serve Drupal once we install it.

###Installing Drupal

First, let’s make sure we’re in the spot that we want to install Drupal:

# cd /var/www/html

Next, use wget to download the latest Drupal tar file from their website:

# wget https://www.drupal.org/download-latest/tar.gz

After downloading the tar file to /var/www/html we’ll need to unpack it:

# tar xf tar.gz

We’ll want to give the Apache user permissions to the /var/www/html directory and subfolders:

# chown -R apache.apache /var/www/html

Now we’ll move the contents of the folder unpacked in the tar file into our /var/www/html path:

# mv -v drupal-8.8.2/* /var/www/html

Once this is done, we need to edit Apache’s default site configuration file. We can open the file with vi as shown below:

# vi /etc/httpd/conf/httpd.conf

When you have the file opened, scroll down until you see a block of code which starts with <Directory />, replace it with following piece of code and apply the changes to the file before exiting:

<Directory />
    Options Indexes FollowSymLinks
    AllowOverride All
</Directory>
Configuring the MySQL Database
Once we’ve got our Drupal files in the right place, we need to set up the MySQL Database Drupal will use. In this case, our database will be named ‘drupal’:

# mysqladmin create drupal

Now we need to create a database user Drupal will log in with and a password. In this case, the user’s name is ‘administrator’ and the password is ‘password135’, be sure to replace these with your own:

# mysql -e "CREATE USER 'administrator'@'%' IDENTIFIED BY 'password135';"

Finally, we need to grant the administrator user the proper privileges to the drupal database:

# mysql -e "GRANT ALL PRIVILEGES ON drupal.* TO 'administrator'@'%' WITH GRANT OPTION;"

###Conclusion

Now that we have taken care of the configuration of the server, the database, and the installation, we can navigate to our site in the browser to complete the configuration of Drupal. If you have a hostname pointing to your server already, you can navigate to that. If not, you should be able to pull up the site by navigating to your server’s public IP.

If everything was done correctly you should see the following page:


This is the Drupal Configuration Wizard. You’ll now just follow the prompts to complete the setup of your Drupal site. When you get to the ‘Database Configuration’ section, remember to use the database name, username, and password you entered into the MySQL commands from earlier.

You should now have a working Drupal site running on your server. You can continue to use the Drupal interface to configure and work with your new Drupal site.
