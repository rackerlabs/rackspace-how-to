---
permalink: install-nextcloud-on-fedora-31/
audit_date: '2020-07-27'
title: 'Install Nextcloud on Fedora 31'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-27'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Nextcloud&reg; is a file-sharing software similar to Google&reg; Drive or Dropbox&reg;. Because Nextcloud
is open source, you have full control, and you can install the server on your machine. This article
describes how to install Nextcloud on a Fedora&reg; 31 cloud server.

### Prerequisites

- A Cloud Server running Fedora 31
- Access to the root or admin user

### Install and configure a LAMP stack

Before you install Nextcloud, you must have a LAMP (Linux&reg;, Apache&reg;, MySQL&reg; or MariaDB&reg;, and PHP) stack on your server.
This example uses MariaDB for the database in the stack.

At the command line, enter the following commands to install Apache, MariaDB, and PHP:

    dnf install httpd unzip

    dnf install php php-gd php-mbstring php-intl php-mysqlnd php-opcache php-json php-zip php-xml

    dnf install mariadb mariadb-server


After you install MariaDB, you should run `mysql_secure_installation` to set a root password, disallow remote root logins, and delete the test databases. Use the following commands to start MariaDB and secure the database:

    systemctl enable mariadb

    systemctl start mariadb

    mysql_secure_installation

Next, configure your database by using the following steps:

1. Enter your MariaDB installation by using the following command:

       mysql -p

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

       chown -R apache:apache nextcloud/

6. Restart Apache:

       systemctl enable httpd

       systemctl start httpd

7. Add the http and https services to your firewall:

       firewall-cmd --permanent --add-service=http

       firewall-cmd --permanent --add-service=https

       firewall-cmd --reload

8. In your web browser on your local machine, navigate to `http://<internet_ip_address>/nextcloud`.

   Here, you can create the admin user and configure database access. For the admin
   account, choose any secure username and password combination.

9. Click **Storage & database** and select **MySQL/MariaDB**.

   Enter the credentials that you configured in the previous section.

Nextcloud then installs the base system as well as a few applications you might find useful. After this
finishes, the Nextcloud panel displays, and you are ready to upload some files.
