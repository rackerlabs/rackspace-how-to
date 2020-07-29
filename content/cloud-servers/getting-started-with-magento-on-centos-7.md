---
permalink: getting-started-with-magento-on-centos-7/
audit_date:
title: 'Getting Started with Magento on CentOS 7'
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

###Installing LAMP:

Setting up the LAMP stack

LAMP is an acronym for Linux, Apache, MySQL, PHP. These are all requirements for a Magento server, and this part of the guide will go through installing and making the necessary configurations.

1) First, we will install the PHP 7.2.x using the IUS community repository. Set up the IUS repository by running:

# curl https://setup.ius.io | sudo bash
2) Now that we’ve added our repository, we can download PHP and it’s modules that Magento will require. The following command strings together a list of packages we’ll install.

# sudo yum -y install php72u php72u-pdo php72u-opcache php72u-xml php72u-gd php72u-devel php72u-intl php72u-mbstring php72u-json php72u-iconv php72u-mysqlnd php72u-fpm php72u-bcmath php72u-soap unzip
3) Being Magento requires a certain amount of resources to be allocated to PHP, we’ll need to increase our PHP memory limit. Navigate into /etc and open php.ini with your text editor of choice. In our example, we’ll be using vi as our text editor. Once inside the file, enter the following command to search for ‘memory_limit’:

/memory_limit
This should take you straight to the line memory_limit = followed by an integer. We’ll want to change that integer to at least 4096M. If your server has more RAM, you can raise this, but it should not be required. Once you’ve made the change, save and exit.

4) Now that the installations have finished, we’ll prepare for our MariaDB installation. Use the following commands to add the necessary repo, download, and install MariaDB:

# curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
# sudo yum -y install MariaDB-server MariaDB-client
# sudo mysql_secure_installation
After running mysql_Secure_installation, you’ll be prompted with instructions for configuring your MariaDB install. It will first ask for a root password, and since this is our first time running MariaDB we won’t have one. You can press ENTER and it will prompt you for whether you’d like to add a password for the root user, which is recommended. Continue following along with the instructions in the prompts until you’re returned to the normal server command prompt and then run these commands to ensure that MariaDB starts automatically on bootup and that it’s running now:

# sudo systemctl enable mariadb
# sudo systemctl start mariadb
5) Open the MySQL port in your firewall so that we can establish a connection with your Cloud Database later:

# sudo firewall-cmd --add-service=mysql --permanent
6) We’ll have to create a database, a database user, and the permissions for that user in order for Magento to operate and connect to the database:

# mysqladmin create magento
# mysql -e "CREATE USER 'magento_admin'@'%' IDENTIFIED BY 'strongmagentopassword';"
# mysql -e "GRANT ALL PRIVILEGES ON magento.* TO 'magento_admin'@'%' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"
7) We’ll also need Apache, our web service, running in order to display our Magento site and accept our connection. Use the following commands to install, open the firewall for web traffic, start, and set start on boot:

# sudo yum -y install httpd
# sudo firewall-cmd --add-service=http --permanent
# sudo systemctl start httpd
# sudo systemctl enable httpd
Now our LAMP stack is all set up and ready to serve Magento once we install it.

###Installing Magento

1) Run the following command sto install composer. Composer is a dependency management tool for use with PHP projects:

# sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# sudo php composer-setup.php --install-dir=/usr/bin/ --filename=composer
2) For us to install Magento, we’ll need to get an access key directly from Magento. To do this, we’ll have to sign up/log-in to the Magento Marketplace and navigate to My Profile > Access Keys under the Marketplace tab.

3) Next we’ll click ‘Create A New Access Key’ which will generate a public and private key labeled with a name we choose. Copy these keys, or leave your browser up on this page as we’ll need both keys momentarily.

4) Back inside your server, we will want to move into our /var/www directory to prepare to install Magento via composer. Use the following commands:

# cd /var/www

# sudo composer create-project --repository=https://repo.magento.com/ magento/project-community-edition magento
After running the second command above, you’ll be prompted for a username and password. The username you enter should be the public key from the Magento Access Keys, and the password should be the private key. After these are entered, it will likely take some time for Composer to run through the Magento install.

5) Once you are returned to the command line. You’ll need to alter the file permissions for Magento and provide Apache ownership:

# cd /var/www/magento
# sudo find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
# sudo find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
# sudo chmod u+x bin/magento
# sudo chown -R apache:apache /var/www/magento
6) The next thing to do is to create a vhost for our Magento site within Apache. We’ll use our text editor of choice to open up the following file: /etc/httpd/conf.d/magento.conf and place the block of code below into it. Be sure to replace examplesite.com with your hostname of choice:

<VirtualHost *:80>
        ServerName examplesite.com
        DocumentRoot /var/www/magento
        ErrorLog /var/log/httpd/magento_error.log
        CustomLog /var/log/httpd/magento_access.log combined

        <Directory /var/www/magento >
                Options FollowSymLinks
                AllowOverride All
        </Directory>
</VirtualHost>
7) The last thing to do within the server for now, is to restart Apache:

# sudo systemctl restart httpd
We’ve now installed Magento onto our LAMP stack on our server. The remainder of the setup can be done within a web browser.

###Installing Magento in the Browser

Navigate in your browser to the URL you provided in your vhost config on step 6 above. If you have not already pointed your DNS to the IP of your server, you’ll have to do that first. If Magento was installed successfully you should be greeted with a page similar to the one shown here.

 This Magento Wizard will take you through a six-step process finalizing the install and configuration of your Magento site. You’ll be prompted to enter the database name, username, and password we used earlier in this guide. Through this wizard, you’ll be prompted for language, time zone, and other configuration details.

Once the installation completes, you can go back to your hostname to see your storefront.
