---
permalink: getting-started-with-magento-on-ubuntu-18-04/
audit_date:
title: 'Getting Started with Magento on Ubuntu 18.04'
type: article
created_date: '2020-07-29'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Magento is an open-source e-commerce platform written in PHP. It is one of the most popular open e-commerce systems on the web today. Magento provides e-commerce merchants a shopping cart system, and control over the look, feel, and functionality of their site. Magento also offers marketing, SEO (search engine optimization), and catalog-management tools to site administrators.

###Requirements:
• Access to a Cloud Server with at least 4GB RAM

###Creating Magento Sudo User
Issue the commands below to add a sudo user with full root privileges, and then switch to the user. We’ll use this user to install and run Magento:

# sudo adduser magento
# sudo usermod -aG sudo magento
# su magento
Installing LAMP:
Update Your Server
Before installing Drupal, you’ll want to make sure your server’s package management repositories are fully up to date. Run this command to get the latest package listings and update installed packages to their latest versions:

# sudo apt update
Prerequisites
Before you can get Magento up and running, you’ll need to have a LAMP stack already setup on your VM. LAMP stands for Linux, Apache, MySQL, PHP. There are many guides on installing LAMP stacks but we’ll quickly go through the process here specifically for our Magento setup.

First, we’ll install Apache, set it to start on boot, and start the service:

# sudo apt install apache2
# sudo systemctl start apache2.service
# sudo systemctl enable apache2.service
Next, we’ll begin installing MariaDB, which is the database that our Magento site will use. These commands will install MariaDB, start the service, and set it to start automatically on boot:

# sudo apt-get install mariadb-server mariadb-client
# sudo systemctl start mariadb.service
# sudo systemctl enable mariadb.service
Now, we can finalize the MariaDB installation by running through MariaDB’s install wizard:

# sudo mysql_secure_installation
When going through the installer, which is optional, you can just answer yes to all the prompts for this guide.

Next, we’ll install PHP, which is the scripting language that Magento uses. We’ll need to add Ondrej’s repository, which maintains PHP packages for us to download and use:

# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:ondrej/php
# sudo apt update
Next, install the PHP modules Magento requires:

# sudo apt install php7.1 libapache2-mod-php7.1 php7.1-common php7.1-gmp php7.1-curl php7.1-soap php7.1-bcmath php7.1-intl php7.1-mbstring php7.1-xmlrpc php7.1-mcrypt php7.1-mysql php7.1-gd php7.1-xml php7.1-cli php7.1-zip
Once this is done, we need to edit PHP’s configuration file. We can open the file with vi as shown below:

# sudo vi /etc/php/7.1/apache2/php.ini
When you have the file opened, search for, and replace the values of the ‘short_open_tag’ and ‘memory_limit’ variables with the values below. Once you’ve made the changes save and close the file:

short_open_tag = On
memory_limit = 4096M
Finally, we’ll restart Apache once more.

# sudo systemctl restart apache2
Now we’ll set up our database and database user within MariaDB. Execute the following commands to add our database, the user, and to grant the proper permissions to the user:

# sudo mysql -u root -p

CREATE DATABASE magento;

CREATE USER 'magentoadmin'@'localhost' IDENTIFIED BY 'magentopassword';

GRANT ALL ON magento.* TO 'magentoadmin'@'localhost' IDENTIFIED BY 'magentopassword' WITH GRANT OPTION;

FLUSH PRIVILEGES;
Installing Magento
1) Run the following commands to download and install Composer. Composer is a dependency management tool for use with PHP projects:

# sudo apt install curl git
# curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
2) For us to install Magento, we’ll need to get an access key directly from Magento. To do this, we’ll have to sign up/log-in to the Magento Marketplace and navigate to My Profile > Access Keys under the Marketplace tab.

3) Next, we’ll click ‘Create A New Access Key’ which will generate a public and private key labeled with a name we choose. Copy these keys, or leave your browser up on this page as we’ll need both keys momentarily.

4) Back inside your server, we will want to move into our /var/www directory to prepare to install Magento via Composer. Use the following commands:

# cd /var/www/html
# sudo composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento2
After running the second command above, you’ll be prompted for a username and password. The username you enter should be the public key from the Magento Access Keys, and the password should be the private key. After these are entered, it will likely take some time for Composer to run through the Magento install.

5) Once you are returned to the command line. You’ll need to alter the file permissions for Magento and provide Apache ownership:

# cd /var/www/html/magento2
# sudo bin/magento setup:install --base-url=http://example.com/ --db-host=localhost --db-name=magento --db-user=magentoadmin --db-password=magentopassword --admin-firstname=Admin --admin-lastname=User --admin-email=admin@magentoexample.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1
6) The next thing to do is to create a virtual host (vhost) for our Magento site within Apache. We’ll use our text editor of choice to open up the following file: /etc/apache2/sites-available/magento2.conf and place the block of code below into it. Be sure to replace examplesite.com with your hostname of choice, then save and edit:

<VirtualHost *:80>
     ServerAdmin admin@magentoexample.com
     DocumentRoot /var/www/html/magento2/
     ServerName magentoexample.com
     ServerAlias www.magentoexample.com

     <Directory /var/www/html/magento2/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
     </Directory>

     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
7) The next step is to set the permissions for the directories used by Magento using the following commands:

# sudo chown -R www-data:www-data /var/www/html/magento2/
# sudo chmod -R 755 /var/www/html/magento2/
8) Finally, we just need to enable the site and rewrite module within Apache:

# sudo a2ensite magento2.conf
# sudo a2enmod rewrite
Viewing Magento in the Browser
Now navigate in your browser to the URL you provided in your vhost config on step 6 above. If you have not already pointed your DNS to the IP of your server, you’ll have to do that first. If Magento was installed successfully you should be greeted with a page similar to the one shown here indicating a successful Magento installation.
