---
permalink: install-a-lamp-stack-on-fedora-31/
audit_date: '2020-07-24'
title: 'Install a LAMP stack on Fedora 31'
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

You need a Linux-based server running Fedora 31

### Install a LAMP stack

Perform the following steps to install a LAMP stack:

1. To set up the repositories, including the Remi repositories, and download the latest version of PHP, run the following commands:

       sudo dnf -y install https://rpms.remirepo.net/fedora/remi-release-31.rpm
       sudo dnf config-manager --set-enabled remi
       sudo dnf install dnf-plugins-core
       sudo yum install php73

2. To download all the software required for LAMP, run the following command. When prompted, press **Y** to install the packages.

       sudo dnf install httpd mariadb mariadb-server php

3. To verify that the PHP version is v7.3.x, run the following command:

       sudo php -v

4. To start Apache, set it to start on boot, and open the firewall for web traffic, run the following commands:

       sudo systemctl start httpd
       sudo systemctl enable httpd
       sudo firewall-cmd --add-service=http --permanent
       sudo firewall-cmd --reload

5. To start the MariaDB database and configure it to start on server boot, run the following commands:

       sudo systemctl start mariadb.service
       sudo systemctl enable mariadb.service

You should now be able to navigate to the IP address of your server in a browser and see the Apache test
page to confirm you’ve configured the server correctly. The LAMP stack is all set up and ready to act as
a base for our application after you install it. Because the applications you choose to use , especially
with PHP, often require additional modules, be prepared to install those modules as needed.
