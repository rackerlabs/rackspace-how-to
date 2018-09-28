---
permalink: centos-6-apache-and-php-install/
audit_date: '2018-09-28'
title: Install Apache and PHP on CentOS 6
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2018-09-28'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates how to install Apache&reg; and PHP on CentOS 6.
CentOS 6 comes with Apache 2.2.3 and PHP 5.1.6. You can install them by using
the default CentOS package manager yum. The advantages of using yum to perform
the installation (instead of using source code) is that yum also automatically
installs future security updates and handles dependencies.

### Install Apache

Use the following steps to install Apache:

1. Run the following command:

        sudo yum install httpd mod_ssl

2. Because the server doesn't start automatically when you install Apache, you
   must start it manually by using the following command:

        sudo /usr/sbin/apachectl start

    The following message displays:

         Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1 for ServerName

3. Open the main Apache configuration file by using the following command:

        sudo nano /etc/httpd/conf/httpd.conf

4. Toward the end of the file, locate the section that starts with
   `ServerName` and provides an example name, which is shown in the following
   code:

        #ServerName www.example.com:80

5. Enter your Cloud Server host name or a fully-qualified domain name. In the
   following example, the host name is `demo`:

        ServerName demo

6. Reload Apache by using the following command:

        sudo /usr/sbin/apachectl restart

### Open the port to run Apache

Apache runs on port 80. In some versions of CentOS, a firewall that is
installed by default blocks access to this port. Perform the following steps to
open the port:

1. Run the following command:

        sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT

2. Use the following command to save your firewall rules so that your web
   server is accessible the next time that you reboot:

        sudo service iptables save

### Test the Apache installation

Navigate to your Cloud Server IP address (for example, `http://123.45.67.89`).

If the default CentOS Apache welcome screen displays, the installation was
successful. Contact [Rackspace Support](https://www.rackspace.com/support)
if you have any problems.

### Configure Apache to run automatically

After Apache is installed and working, use the following steps to set it to
start automatically when the server is rebooted:

1. Run the following command:

        sudo /sbin/chkconfig httpd on

2. Run the following test to confirm that the setting works:

        sudo /sbin/chkconfig --list httpd
        httpd           0:off        1:off  2:on    3:on    4:on    5:on    6:off

### Install PHP

1. Run the following command:

        sudo yum install php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml

    **Note**: The preceding command only installs some common modules, rather
    than all available modules.

2. Use the following command to reload Apache:

        sudo /usr/sbin/apachectl restart
