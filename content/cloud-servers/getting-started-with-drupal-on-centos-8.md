---
permalink: getting-started-with-drupal-on-centos-8/
audit_date:
title: 'Getting Started with Drupal on CentOS 8'
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

1) First, we’ll install our Apache web service which will serve our Drupal site:

# dnf -y install @httpd

2) Once this is done, we will set it to start on boot and adjust our software firewall:

# systemctl enable --now httpd
# firewall-cmd --add-service={http,https} --permanent
# firewall-cmd --reload

3) Next we’ll install MySQL for our database and set it to start on boot:

# dnf install @mysql:8.0
# systemctl enable --now mysqld

4) Next, we’ll install PHP and Drupal’s required PHP modules:

# dnf install -y @php
# dnf install -y php php-{cli,mysqlnd,json,opcache,xml,mbstring,gd,curl}

After this is done, you can check to ensure we’re running PHP and have it display our version of PHP:

# php -v

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
