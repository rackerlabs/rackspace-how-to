---
permalink: install-a-lamp-stack-on-ubuntu-1804/
audit_date: '2020-07-24'
title: 'Installing a LAMP stack on Ubuntu 18.04'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

A LAMP stack is a collection of open-source software that you can use as a platform to create websites
and web applications. The term LAMP is an acronym standing for Linux&reg; operating system, the Apache&reg;
HTTP Server, the MySQL&reg; database system, and the PHP programming language.

### Prerequisites

You need a Linux-based server running Ubuntu 18.04.

### Install a LAMP stack

Perform the following steps to install a LAMP stack:

1. Before installing LAMP, ensure the package management repositories are fully up to date. Run the following
   command to get the latest package listings and update installed packages to their latest versions:

       sudo apt update

2. To install Apache, set it to start on boot, and start the service, run the following commands:

       sudo apt install apache2
       sudo systemctl start apache2.service
       sudo systemctl enable apache2.service

3. To install MariaDB, which is the database that this LAMP uses instead of MySQL, start the service, and set
   it to start automatically on boot, run the following commands:

       sudo apt-get install mariadb-server mariadb-client
       sudo systemctl start mariadb.service
       sudo systemctl enable mariadb.service

4. To finalize the MariaDB installation, use the following command to run through MariaDB’s install wizard:

       sudo mysql_secure_installation

   When going through the installer, which is optional, you can just answer yes to all the prompts for this guide.

5. To install PHP, which is the scripting language that the LAMP stack uses, run the following commands to add
   Ondrej’s repository, which maintains updated PHP packages for download and use:

       sudo apt-get install software-properties-common
       sudo add-apt-repository ppa:ondrej/php
       sudo apt update

6. To install the PHP, and other, modules that many web services require, run the following command:

       sudo apt install php7.1 libapache2-mod-php7.1 php7.1-common php7.1-gmp php7.1-curl php7.1-soap php7.1-bcmath php7.1-intl php7.1-mbstring php7.1-xmlrpc php7.1-mcrypt php7.1-mysql php7.1-gd php7.1-xml php7.1-cli php7.1-zip

7. To restart Apache, run the following command:

        sudo systemctl restart apache2

You should now be able to navigate to the IP address of your server in a browser and see the Apache test
page to confirm you’ve configured the server correctly. The LAMP stack is all set up and ready to act as
a base for our application after you install it. Because the applications you choose to use , especially
with PHP, often require additional modules, be prepared to install those modules as needed.
