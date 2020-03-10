---
permalink: how-to-install-a-lamp-stack-on-rhel-7-based-distributions/
audit_date: '2020-03-10'
title: 'Install a LAMP stack on RHEL 7 based distributions'
type: article
created_date: '2020-03-10'
created_by: Chris Silva
last_modified_date: '2020-03-10'
last_modified_by: Chris Silva
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install a LAMP (Linux&reg;, Apache&reg;, MySQL&reg;, PHP) stack
on your Red Hat&reg; Enterprise Linux (RHEL) 7 server. Linux is your operating
system, and Apache is your web daemon, which serves information
stored in your MySQL database through PHP scripting for your users. By
the end of this article, you will have a fully operational LAMP server,
ready to serve out multiple virtual hosts.

### Prerequisites

- Basic understanding of Secure Shell (SSH)
- Sudo or admininstrative access to your server
- A cloud server with CentOS&reg; 7, Fedora 30+, or RHEL 7

### Install the IUS Repositories

The Inline with Upstream Stable (IUS) repository provides newer versions of some software
found in the official CentOS and Red Hat repositories. The package names in the IUS
repository are different from the package names used in the official repositories, which
helps to avoid unintentional conflicts or software version updates. Additionally, in RHEL 7
distributions, the default version of PHP is PHP 5.6, which is no longer supported.
The IUS repositories contain versions of PHP up to 7.3, which is the latest 
version available for RHEL 7 distributions.

For more information the IUS Repository, see [Install EPEL and IUS repositories on CentOS and Red Hat](/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat).

To install the IUS release package, run the following command:

    sudo yum install https://$(rpm -E '%{?centos:centos}%{!?centos:rhel}%{rhel}').iuscommunity.org/ius-release.rpm

### Install the LAMP stack

Log in to your server by using SSH and then complete the following steps for
your preferred set up method.

**One-line command method**

1. Use the following one-line command for an expedient set up of your LAMP stack on your server:

        sudo sh -c "yum install httpd mariadb mariadb-server mod_php73 -y; systemctl start mariadb && mysql_secure_installation && systemctl restart mariadb && systemctl start httpd && systemctl enable httpd && systemctl enable mariadb && firewall-cmd --permanent --zone=public --add-service=http && firewall-cmd --permanent --zone=public --add-service=https && firewall-cmd --reload"
        
2.  Provide answers to the following system prompts:

    - **Enter current password for root (enter for none)**: Leave blank.
    - **Set root password? [Y/n]**: Select **Yes**.
    - **New password**: You decide, but make it secure.
    - **Remove anonymous users? [Y/n]**: Select **Yes**.
    - **Disallow root login remotely? [Y/n]**: Select **Yes**.
    - **Remove test database and access to it? [Y/n]**: Select **Yes**.
    - **Reload privilege tables now? [Y/n]**: Select **Yes**.


 **Individual commands method**

The following steps break the preceding one-line command into individual
steps:

1.  Install the necessary packages:

        sudo yum install httpd mariadb mariadb-server mod_php73 -y
        
2.  Run the following command to start and secure the MySQL server:

        sudo sh -c "systemctl start mariadb && mysql_secure_installation"
        
3.  Provide answers to the following system prompts:

    - **Enter current password for root (enter for none)**: Leave blank.
    - **Set root password? [Y/n]**: Select **Yes**.
    - **New password**: You decide, but make it secure.
    - **Remove anonymous users? [Y/n]**: Select **Yes**.
    - **Disallow root login remotely? [Y/n]**: Select **Yes**.
    - **Remove test database and access to it? [Y/n]**: Select **Yes**.
    - **Reload privilege tables now? [Y/n]**: Select **Yes**.
    
4.  Enter the following command to restart mysqld, start httpd, and
    configure httpd and mysqld to start on boot.
    
        sudo sh -c "systemctl restart mariadb && systemctl start httpd && systemctl enable httpd && systemctl enable mariadb"
        
5.  Allow web traffic through the firewall:
    
        sudo sh -c "firewall-cmd --permanent --zone=public --add-service=http && firewall-cmd --permanent --zone=public --add-service=https && firewall-cmd --reload"
        
    This command allows port 80 (web) and port 443 (secure web) inbound traffic through
    the firewall and saves the rule for reboots.

The installation is complete. To test that everything was installed correctly, open your
browser and navigate to **http://serverIpAddress/**.
