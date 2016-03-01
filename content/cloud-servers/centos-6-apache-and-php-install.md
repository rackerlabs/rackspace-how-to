---
node_id: 92
title: CentOS 6 - Apache and PHP Install
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Kelly Holcomb
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates how to install Apache and PHP on CentOS 6. CentOS 6 comes with Apache 2.2.3 and PHP 5.1.6, and you can install them by using the default CentOS Package Manager, `yum`. The advantages of using `yum` (as opposed to installing by using source code) are that you get any security updates (if and when they are distributed) and dependencies are automatically taken care of.

### Install Apache

1. Run the following command:

        sudo yum install httpd mod_ssl

2. Because the server does not start automatically when you install Apache, you have to start it manually.

        sudo /usr/sbin/apachectl start

  The following message is displayed:

        Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1 for ServerName

 The IP address (shown in this example as 127.0.0.1) is used as the server name by default. In the following steps, set the server name for the next time the server is started.

3. Open the main Apache configuration file.

        sudo nano /etc/httpd/conf/httpd.conf

4. Toward the end of the file, locate the section that starts with `ServerName` and gives an example.

        #ServerName www.example.com:80

5. Enter your cloud server host name or a fully qualified domain name. In the following example, the host name is `demo`.

        ServerName demo

6. Reload Apache.

        sudo /usr/sbin/apachectl restart

### Open the port to run Apache

In some versions of CentOS, a firewall is installed by default that blocks access to port 80, on which Apache runs.

1. To open the port, run the following command:

        sudo iptables -I INPUT -p tcp --dport 80 -j ACCEPT

2. After adding that instruction, save your firewall rules so your web server will be accessible the next time you reboot.

        sudo service iptables save

### Test the Apache installation

Navigate to your Cloud Server IP address (for example, `http://123.45.67.89`).

If the default CentOS Apache welcome screen is displayed, the installation was successful.

<img alt=" centos_apache_welcome.jpg" height="342" src="http://c458924.r24.cf2.rackcdn.com/Cent0SWelcome01.png" width="490" />

### Run chkconfig
Now that Apache is installed and working, ensure that it is set to start automatically when the server is rebooted.

1. Run the following command:

        sudo /sbin/chkconfig httpd on

2. Test to confirm that the setting works.

        sudo /sbin/chkconfig --list httpd
        httpd           0:off        1:off  2:on    3:on    4:on    5:on    6:off

### Install PHP

1. Run the following command:

        sudo yum install php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml

  The preceding command does not install all the modules available, just a few common ones.

2. Reload Apache.

        sudo /usr/sbin/apachectl restart
