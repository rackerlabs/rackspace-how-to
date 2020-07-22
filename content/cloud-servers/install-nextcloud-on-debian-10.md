---
permalink: install-nextcloud-on-debian-10/
audit_date:
title: 'Install Nextcloud on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Nextcloud is a file sharing software similar to Google drive or Dropbox. The difference is you have full control as Nextcloud is open source and the server can be installed on your own machine. In this article, we’ll be installing Nextcloud on a Debian 10 Cloud Server.

### Prerequisites

A Cloud Server running Debian 10

Access to the root or admin user

Install LAMP Stack
First thing to do is install and configure the LAMP (Linux Apache Mariadb PHP)  stack on your server.

### Step 1: Install software
apt install apache2 mariadb-server libapache2-mod-php7.3 unzip

apt install php7.3-gd php7.3-json php7.3-mysql php7.3-curl php7.3-mbstring

apt install php7.3-intl php-imagick php7.3-xml php7.3-zip

###Step 2: MySQL secure installation
It’s a good idea to always run the mysql_secure_installation command right after installing MariaDB or MySQL in order to set a root password, disallow remote root logins, and delete the test database.

mysql_secure_installation
Step 3: Database configuration
Enter your MariaDB installation.

mysql
Create a nextcloud database.

CREATE DATABASE nextcloud;
Create a nextcloud user. Make sure to replace <PASSWORD> with a secure password of your choosing.

CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY '<PASSWORD>';
Give nextcloud user access to the nextcloud database.

GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
Flush privileges.

FLUSH PRIVILEGES;
Exit MariaDB.

exit

### Install Nextcloud

Now that we have our base LAMP stack set up, we can move on to installing Nextcloud itself.

### Step 1: Download and prepare Nextcloud

Change to the document root directory.

cd /var/www/html/
Download the latest version of Nextcloud.

wget https://download.nextcloud.com/server/releases/latest.zip
Decompress the file.

unzip latest.zip
Remove the compressed file.

rm latest.zip
Give ownership to the web server.

chown -R www-data:www-data nextcloud/
Restart Apache.

systemctl restart apache2

### Step 2: Install Nextcloud through web browser

In your web browser on your local machine, navigate to http://<internet_ip_address>/nextcloud

Here, you’ll be able to create your admin user and configure database access. As far as the admin account, choose any secure username/password combination. For the database, enter the same credentials we configured earlier in the Database configuration step. It should be nextcloud as the user and database and the password you set.

Nextcloud will then install the base system as well as a few apps you may find useful. Once this is done, you’ll be greeted with the Nextcloud panel and will be ready to upload some files!
