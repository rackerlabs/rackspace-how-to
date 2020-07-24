---
permalink: install-nextcloud-on-debian-10/
audit_date: '2020-07-24'
title: 'Install Nextcloud on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-24'
last_modified_by: Stephanie Fillmon
product: Cloud Product
product_url: cloud-product
---

Nextcloud is a file sharing software similar to Google drive or Dropbox. Because Nextcloud is open source, you
have full control and the server can be installed on your own machine. This article describes how
to install Nextcloud on a Debian 10 Cloud Server.

### Prerequisites

- A Cloud Server running Debian 10
- Access to the root or admin user

### Install and configure a LAMP stack

Before you install Nextcloud, you must have a LAMP (Linux, Apache, MySQL or MariaDB, and PHP) stack on your server.

At the command line, enter the following commands to install Apache, MySQL, and PHP:

    apt install apache2 mariadb-server libapache2-mod-php7.3 unzip

    apt install php7.3-gd php7.3-json php7.3-mysql php7.3-curl php7.3-mbstring

    apt install php7.3-intl php-imagick php7.3-xml php7.3-zip


After you install MySQL or MariaDB, you should run the following command to secure your database:

    mysql_secure_installation


This command enables you to set a root password, disallow remote root logins, and delete the test database.

Configure your database by using the following steps:

1. Enter your MySQL or MariaDB installation by using the following command:

       mysql

2. Create a database for Nextcloud:

       CREATE DATABASE nextcloud;

3. Create a `nextcloud` user. Replace <PASSWORD> with a secure password of your choosing.

       CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY '<PASSWORD>';

4. Give nextcloud user access to the nextcloud database:

       GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';

5. Flush privileges:

       FLUSH PRIVILEGES;

6. Exit MySQL or MariaDB:

       exit

Take note of these credential settings. You need them to access the database in Nextcloud.

### Install Nextcloud

Now that we have our base LAMP stack set up, we can move on to installing Nextcloud itself.
Use the commands in the following steps to download and install Nextcloud:

1. Change to the document root directory.:

       cd /var/www/html/

2. Download the latest version of Nextcloud:

       wget https://download.nextcloud.com/server/releases/latest.zip

3. Decompress the file:

       unzip latest.zip

4. Remove the compressed file:

       rm latest.zip

5. Give ownership to the web server:

       chown -R www-data:www-data nextcloud/

6. Restart Apache:

       systemctl restart apache2

7. In your web browser on your local machine, navigate to http://<internet_ip_address>/nextcloud

   Here, you can create create your admin user and configure database access. For the admin
   account, choose any secure username and password combination. For the database, enter the same
   credentials that you configured earlier. It should be nextcloud as
   the user and database and the password you set.

Nextcloud then installs the base system as well as a few applicationss you might find useful. After this is
finished, you’ll be greeted with the Nextcloud panel and will be ready to upload some files.
