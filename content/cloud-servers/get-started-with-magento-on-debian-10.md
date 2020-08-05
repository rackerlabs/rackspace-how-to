---
permalink: get-started-with-magento-on-debian-10/
audit_date: '2020-07-30'
title: 'Get started with Magento on Debian 10'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date: '2020-07-30'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Magento&reg;, written in PHP, is one of the most popular open e-commerce systems on the web today.
Magento provides e-commerce merchants with a shopping cart system and control over their site's look,
feel, and functionality. Magento also offers marketing, search engine optimization (SEO), and
catalog-management tools to site administrators.

This article describes how to install Magento with a LAMP stack. LAMP stands for Linux&reg;, Apache&reg;,
MySQL&reg; or MariaDB&reg;, PHP. 

### Requirements: 

You need access to a Debian&reg; 10 cloud server with at least 4 GB of RAM.

You also need to create a Magento user and update the package management repositories.

#### Create a Magento sudo user

Issue the following commands to add a sudo user with full root privileges, and then switch to the user.

    sudo adduser magento
    sudo usermod -aG sudo magento
    su magento

#### Update the package repositories

Ensure that your server's package management repositories are fully up to date. Run the following command
to get the latest package listings and update installed packages to their latest versions:

    sudo apt update

### Install LAMP

Before you can get Magento up and running, use the following steps to set up a LAMP stack on your virtual machine: 

#### 1. Install Apache

This section describes how to install Apache, set it to start on boot, and start the service. Then, it covers
how to add a firewall rule to allow traffic through port 80 and make that change persistent.

Run the following commands:

    sudo apt install apache2
    sudo systemctl start apache2.service
    sudo systemctl enable apache2.service
    sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT
    sudo iptables-save

#### 2. Install MariaDB

Use the following commands to install MariaDB, start the service, and set it to start automatically on boot:

    sudo apt-get install mariadb-server mariadb-client
    sudo systemctl start mariadb.service
    sudo systemctl enable mariadb.service

To finalize the MariaDB installation, run the following command to go through the MariaDB install wizard:

    sudo mysql_secure_installation

As you go through the installer, which is optional, you can just answer **yes** to all the prompts for this guide.

#### 3. Install PHP

Run the following command to install the PHP modules Magento requires:

    sudo apt install php7.3 libapache2-mod-php7.3 php7.3-common php7.3-gmp php7.3-curl php7.3-soap php7.3-bcmath php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-mysql php7.3-gd php7.3-xml php7.3-cli php7.3-zip

#### 4. Edit the PHP configuration file

To edit PHP's configuration file, run the following command to open the file with `vi`:

    sudo vi /etc/php/7.3/apache2/php.ini

In the file, search for and replace the values of the `short_open_tag` and `memory_limit` variables with the following values:

    short_open_tag = On 

    memory_limit = 4096M

Save and close the file.

#### 5. Restart Apache

To restart Apache, run the following command.

    sudo systemctl restart apache2

#### 6. Set up MariaDB

Run the following commands to add the MariaDB database, the user, and grant the proper permissions to the user:

    sudo mysql -u root -p
    CREATE DATABASE magento;
    CREATE USER 'magentoadmin'@'localhost' IDENTIFIED BY 'magentopassword';
    GRANT ALL ON magento.* TO 'magentoadmin' @ 'localhost' IDENTIFIED BY 'magentopassword' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

### Prepare and install  Magento

Run the following steps to install and set up Magento:

#### 1. Install Composer

Run the following commands to download and install Composer, a dependency management tool for PHP projects:

    sudo apt install curl git
    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

#### 2. Get an access key

To install Magento, you need to get an access key directly from Magento. 

1. Sign up and log in to the Magento Marketplace. 
2. Navigate to **My Profile > Access Keys** under the Marketplace tab.
3. Click **Create A New Access Key**, which generates a public and private key labeled with a name you choose. 
4. Copy these keys for future use.

#### 3. Install Magento

Run the following commands to install Magento via Composer on your server:

    cd /var/www/html
    sudo composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento2

When prompted for a username and password, enter the public key from the Magento Access Keys for the
user and enter the private key for the password. 

Composer takes a while to complete the Magento installation.

#### 4. Set Magento file permissions

Run the following commands to alter the file permissions for Magento and provide Apache ownership:

    cd /var/www/html/magento2
    sudo bin/magento setup:install --base-url=http://example.com/ --db-host=localhost --db-name=magento --db-user=magentoadmin --db-password=magentopassword --admin-firstname=Admin --admin-lastname=User --admin-email=admin@magentoexample.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1

#### 5. Create a virtual host

To create a virtual host (vhost) for the Magento site within Apache, use the text editor of choice to
open **/etc/apache2/sites-available/magento2.conf** and place the following block of code below in the file. 

Be sure to replace **examplesite.com** with your hostname of choice, then save and edit:

    <VirtualHost *:80> ServerAdmin admin@magentoexample.com DocumentRoot /var/www/html/magento2/ ServerName magentoexample.com ServerAlias www.magentoexample.com
    <Directory /var/www/html/magento2/>
       Options Indexes FollowSymLinks MultiViews
       AllowOverride All
       Order allow,deny
       allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

#### 6. Set directory permissions

To set the permissions for the directories used by Magento, run the following commands:

    sudo chown -R www-data:www-data /var/www/html/magento2/
    sudo chmod -R 755 /var/www/html/magento2/

#### 7. Enable the site

Run the following commands to enable the site and rewrite module within Apache:

    sudo a2ensite magento2.conf
    sudo a2enmod rewrite

### View Magento in the browser

Navigate in your browser to the URL you provided in the preceding vhost configuration step. If you have
not already pointed your DNS to your server's IP, do that first. If the Magento installation succeeded,
you should see a welcome page indicating a successful Magento installation.
