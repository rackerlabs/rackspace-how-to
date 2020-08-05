---
permalink: install-a-lamp-stack-on-centos-8/
audit_date: '2020-07-24'
title: 'Install a LAMP stack on CentOS 8'
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

You need a Linux-based server running CentOS&reg; 8.

### Install a LAMP stack

Perform the following steps to install a LAMP stack:

1. To install the Apache web service, which serves as a base for our application, use the following command:

       dnf -y install @httpd

2. To configure Apache to start on boot and modify the software firewall, use the following commands:

       systemctl enable --now httpd
       firewall-cmd --add-service={http,https} --permanent
       firewall-cmd --reload

3. To install MySQL for the database and set it to start on boot, use the following commands:

       dnf install @mysql:8.0
       systemctl enable --now mysqld

4. To install PHP and some often required PHP modules, use the following commands:

       dnf install -y @php
       dnf install -y php php-{cli,mysqlnd,json,opcache,xml,mbstring,gd,curl}

5. To verify the PHP installation and display the PHP version, use the following command:

       php -v

You should now be able to navigate to the IP address of your server in a browser and see the Apache test
page to confirm you’ve configured the server correctly. The LAMP stack is all set up and ready to act as
a base for our application after you install it. Because the applications you choose to use , especially
with PHP, often require additional modules, be prepared to install those modules as needed.
