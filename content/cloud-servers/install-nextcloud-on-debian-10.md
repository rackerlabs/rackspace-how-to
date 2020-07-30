---
permalink: install-nextcloud-on-debian-10/
audit_date: '2020-07-24'
title: 'Install Nextcloud on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-24'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Nextcloud&reg; is a file-sharing software similar to Google&reg; Drive or Dropbox&reg;. Because Nextcloud
is open source, you have full control, and you can install the server on your machine. This article
describes how to install Nextcloud on a Debian&reg; 10 cloud server.

### Prerequisites

- A cloud server running Debian 10
- Access to the root or admin user

### Install and configure a LAMP stack

Before you install Nextcloud, you must have a LAMP (Linux&reg;, Apache&reg;, MySQL&reg; or MariaDB&reg;, and PHP) stack on your server.

At the command line, enter the following commands to install Apache, MariaDB, and PHP:

    apt install apache2 mariadb-server libapache2-mod-php7.3 unzip

    apt install php7.3-gd php7.3-json php7.3-mysql php7.3-curl php7.3-mbstring

    apt install php7.3-intl php-imagick php7.3-xml php7.3-zip


After you install MariaDB, you should run the following command to secure your database:

    mysql_secure_installation


This command enables you to set a root password, disallow remote root logins, and delete the test database.

Configure your database by using the following steps:

1. Enter your MariaDB installation by using the following command:

       mysql

2. Create a database for Nextcloud. Replace <database> with a database name of your choice. We
   recommend choosing a database name that clearly indicates the purpose of the database.

       CREATE DATABASE <database>;

3. Create a user for the new database. Replace <dbUser> with a username and <PASSWORD> with a
   secure password of your choice.

       CREATE USER '<dbUser>'@'localhost' IDENTIFIED BY '<PASSWORD>';

4. Give the <dbUser> user access to the <database> database:

       GRANT ALL PRIVILEGES ON <database>.* TO '<dbUser>'@'localhost';

5. Flush privileges:

       FLUSH PRIVILEGES;

6. Exit MariaDB:

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

5. Give ownership to the webserver:

       chown -R www-data:www-data nextcloud/

6. Restart Apache:

       systemctl restart apache2

7. In the web browser on your local machine, navigate to `http://<internet_ip_address>/nextcloud`.

   Here, you can create the admin user and configure database access. For the admin
   account, choose any secure username and password combination. For the database, enter the same
   credentials that you configured earlier.

Nextcloud then installs the base system as well as a few applications you might find useful. After this
finishes, the Nextcloud panel displays and you are ready to upload some files.
