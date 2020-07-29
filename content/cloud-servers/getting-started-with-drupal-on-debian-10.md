---
permalink: getting-started-with-drupal-on-debian-10/
audit_date:
title: 'Getting Started with Drupal on Debian 10'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Drupal is a free and open-source content management framework written in PHP and distributed under the GNU General Public License. Drupal currently provides a back-end framework for 2.8% of the top one million sites on the web.

###Update Your Server

Before installing Drupal, you’ll want to make sure your server’s package management repositories are fully up to date. Run this command to get the latest package listings and update installed packages to their latest versions:

apt update && apt upgrade

###Prerequisites

Before you can get Drupal up and running, you’ll need to have a LAMP stack already setup on your VM. LAMP stands for Linux, Apache, MySQL, PHP. There are many guides on installing LAMP stacks, but below are the steps for installing Apache, MySQL, and PHP for Drupal on Debian 10.

First, we’ll install Apache and Apache Utils:

apt install apache2 apache2-utils

Now, run the following commands to start Apache and also to have it start on boot.

systemctl start apache2 && systemctl enable apache2

Now, we can open our firewall to web traffic:

iptables -I INPUT -p tcp --dport 80 -j ACCEPT

Next, we’ll give the Apache user access to the directories it needs:

chown www-data:www-data /var/www/html/ -R

Next, install PHP and the modules Drupal requires:

apt install php7.3 libapache2-mod-php7.3 php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-fdomdocument php-gd

Once this is done, we need to edit Apache’s default site configuration file. We can open the file with vi as shown below:

vi /etc/apache2/sites-enabled/000-default.conf

When you have the file opened, add the following piece of code just below the DocumentRoot /var/www/html line and apply the changes to the file before exiting:

<Directory /var/www/html/>
    Options Indexes FollowSymLinks
    AllowOverride All
</Directory>

Finally, we’ll restart Apache:

systemctl restart apache2

###Installing Drupal

First, let’s make sure we’re in the spot that we want to install Drupal:

cd /var/www/html

Next, use wget to download the latest Drupal tar file from their website:

wget https://www.drupal.org/download-latest/tar.gz

After downloading the tar file to /var/www/html we’ll need to unpack it:

tar xf tar.gz

Let’s prevent the old default index.html file from being displayed in our browser by renaming it:

mv index.html indexhtml.old

Now we’ll move the contents of the folder unpacked in the tar file into our /var/www/html path:

mv -v drupal-8.8.2/* /var/www/html

###Installing and Configuring the MySQL Database

Once we’ve got our Drupal files in the right place, we need to set up the MySQL Database Drupal will use. The following command will install 

MariaDB, which is a drop-in replacement for MySQL.

apt install mariadb-server mariadb-client

Now, lets create our database, which will be named ‘drupal’:

mysqladmin create drupal

Now we need to create a database user Drupal will log in with and a password. In this case, the user’s name is ‘administrator’ and the password is ‘password135’, be sure to replace these with your own:

mysql -e "CREATE USER 'administrator'@'%' IDENTIFIED BY 'password135';"

Next, we need to grant the administrator user the proper privileges to the drupal database:

mysql -e "GRANT ALL PRIVILEGES ON drupal.* TO 'administrator'@'%' WITH GRANT OPTION;"

Finally, we’ll start MariaDB and set it to start on boot:

systemctl start mariadb && systemctl enable mariadb

###Conclusion

Now that we have taken care of the configuration of the server, the database, and the installation, we can navigate to our site in the browser to complete the configuration of Drupal. If you have a hostname pointing to your server already, you can navigate to that. If not, you should be able to pull up the site by navigating to your server’s public IP.

If everything was done correctly you should see the following page:

This is the Drupal Configuration Wizard. You’ll now just follow the prompts to complete the setup of your Drupal site. When you get to the ‘Database Configuration’ section, remember to use the database name, username, and password you entered into the MySQL commands from earlier.

You should now have a working Drupal site running on your server. You can continue to use the Drupal interface to configure and work with your new Drupal site.
