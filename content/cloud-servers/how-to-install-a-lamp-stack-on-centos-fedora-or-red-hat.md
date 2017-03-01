---
permalink: how-to-install-a-lamp-stack-on-centos-fedora-or-red-hat/
audit_date:
title: 'Install a LAMP stack on CentOS, Fedora, or Red Hat'
type: article
created_date: '2014-08-04'
created_by: Rackspace Support
last_modified_date: '2014-08-19'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for installing a LAMP (Linux, Apache, MySQL, PHP) stack 
on your server. Linux (CentOS, Fedora, or Red Hat Enterprise Linux) is your operating
system, and Apache is your web daemon, which serves information that is
stored in your MySQL database through PHP scripting for your users. By
the end of this article, you will have a fully operational LAMP server,
ready to serve out multiple virtual hosts.

### Prerequisites

-   Basic understanding of SSH.
-   A Cloud Server with CentOS 6, Fedora 21, or Red Hat Enterprise Linux 6.

### Install the LAMP stack

Log on to your server via SSH and then complete the following steps for
your preferred set up method.

**One-line command method**

Use the following one-line command for an expedient set up of your LAMP
server on your server operating system:

    sudo sh -c "yum install httpd httpd-devel mysql mysql-server mysql-devel php php-mysql php-common php-gd php-mbstring php-mcrypt php-devel php-xml -y; service mysqld start && mysql_secure_installation && service mysqld restart && service httpd start && chkconfig httpd on && chkconfig mysqld on &&iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT && /etc/init.d/iptables save"


**Individual commands method**

The following steps break the preceding one-line command into individual
steps.

1.  Install the necessary packages:

        sudo yum install httpd httpd-devel mysql mysql-server mysql-devel php php-mysql php-common php-gd php-mbstring php-mcrypt php-devel php-xml -y

2.  Run the following command to start and secure the MySQL server:

        sudo sh -c "service mysqld start && mysql_secure_installation"

3.  Provide answers for the following system prompts:

    -   **Current mysql password**: Leave blank.
    -   **New password**: You decide, but make it secure.
    -   **Delete test data?**: Select **Yes**.
    -   **Remove anonymous-user accounts?**: Select **Yes**.
    -   **Allow remote users?**: Select **No**.

4.  Enter the following command to restart mysqld, start httpd, and
    configure httpd and mysqld to start on boot.

        sudo sh -c "service mysqld restart && service httpd start && chkconfig httpd on && chkconfig mysqld on"

5.  Allow web traffic through the firewall:

        sudo sh -c "iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT && service iptables save"

    This command allows port 80 (web) inbound traffic through the
    firewall, and saves the rule for reboots.

The installation is complete. To test it, browse to
***http://serverIpAddress/***.
