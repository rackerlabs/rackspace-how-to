---
permalink: getting-started-with-magento-on-fedora-31/
audit_date:
title: 'Getting Started with Magento on Fedora 31'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Magento is an open-source e-commerce platform written in PHP. It is one of the most popular open e-commerce systems on the web today. Magento provides e-commerce merchants a shopping cart system, and control over the look, feel, and functionality of their site. Magento also offers marketing, SEO (search engine optimization), and catalog-management tools to site administrators.

###Requirements:
• Access to a Cloud Server with at least 4GB RAM

###Configure Web Server

This article assumes that while you have SSH access as root to your Fedora 31 VM, you’ve not made any other changes. So we’ll be going through the process of creating a sudo user, setting up LAMP, installing and configuring Magento, and adjusting our firewall rules.

###Creating the sudo user

Sudo users are beneficial because they would allow normal users to operate within the server as if they were a root user. This section of the guide will take you through setting up a sudo user.

1) Log into your server as the root user over SSH and run the following command to create a new user. Replace ‘magento’ with the username you want to be created.

# adduser magento
2) Next, run the following command to set the password for our newly created user:

# passwd magento
You’ll be prompted twice for the password, and like when you log into SSH, you’ll see no feedback for characters entered as the password.

3) Once you are returned to the command line, it’s time to add our new user to the group which has sudo privileges. In Fedora, there is always a ‘wheel’ group that provides sudo privileges to any users within it.

# usermod -aG wheel magento
4) Now, you can use the su command to switch to our new user so that we can test their sudo access:

# su - magento
You can try running a command now, but when using a sudo user, you will have to prepend all your commands with ‘sudo’. Example:

# sudo ls -lah
If this is the first time you’ve used sudo in a session, you’ll be required to enter your password for the account you’re sudo’ing as. Once you’ve entered the password the command should proceed and provide the output.

###Setting up the LAMP stack

LAMP is an acronym for Linux, Apache, MySQL, PHP. These are all requirements for a Magento server, and this part of the guide will go through installing and making the necessary configurations.

1) First, we need to set up our repositories so that we can download the latest version of PHP which Magento supports, 7.3. The following commands will install the Remi repo which will supply this:

# sudo dnf -y install https://rpms.remirepo.net/fedora/remi-release-31.rpm
# sudo dnf config-manager --set-enabled remi
# sudo dnf install dnf-plugins-core
# sudo yum install php73
2) Now we need to Download all the software required for LAMP and PHP modules that Magento will require. The following command strings together a list of packages we’ll install.

# sudo dnf install httpd mariadb mariadb-server php php-common php-gmp php-curl php-soap php-bcmath php-intl php-mbstring php-xmlrpc php-mysql php-gd php-xml php-cli php-zip
You’ll be prompted a few times to enter Yes(y) or No(n) as the packages are installed. Press Y to install them.

3) Make sure our version of PHP is v7.3.x with the following command.

# sudo php -v
4) We’ll also need apache, our web service, running in order to display our Magento site and accept our connection. Use the following commands to start Apache, set it to start on boot, and open the firewall for web traffic:

# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo firewall-cmd --add-service=http --permanent
# sudo firewall-cmd --reload
5) We’ll also need a database and user for Magento to utilize. The following commands will start our MariaDB database, set it to start on server boot, add a user, a database, and provide the user proper privileges to that database:

# sudo systemctl start mariadb.service
# sudo systemctl enable mariadb.service
# mysqladmin create magento
# mysql -e "CREATE USER 'magento_admin'@'%' IDENTIFIED BY 'strongmagentopassword';"
# mysql -e "GRANT ALL PRIVILEGES ON magento.* TO 'magento_admin'@'%' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"
6) Because the installation service for Magento  is memory intensive, we’ll want to ensure that PHP has access to the memory requirements necessary to complete the install. Using our text editor of choice, we’ll be editing the /etc/php.ini file. In our example, we’ll use vi:

# sudo vi etc/php.ini

Within the php.ini file, search for the ‘memory_limit’ value and set it from 128M to 4096M. Once you make the change, save the file and exit. Now our LAMP stack is all set up and ready to serve Magento once we install it.

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

###Finish Installing Magento in the Browser

Navigate in your browser to the URL you provided in your vhost config on step 6 above. If you have not already pointed your DNS to the IP of your server, you’ll have to do that first. If Magento was installed successfully you should be greeted with a page similar to the one shown here.

 This Magento Wizard will take you through a six-step process finalizing the install and configuration of your Magento site. You’ll be prompted to enter the database name, username, and password we used earlier in this guide. Through this wizard, you’ll be prompted for language, time zone, and other configuration details.

Once the installation completes, you can go back to your hostname to see your storefront.
