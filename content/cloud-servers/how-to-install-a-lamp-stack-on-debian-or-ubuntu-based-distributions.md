---
permalink: how-to-install-a-lamp-stack-on-debian-or-ubuntu-based-distributions/
audit_date: 
title: 'Install a LAMP stack on Debian/Ubuntu based distributions'
type: article
created_date: '2020-03-11'
created_by: Chris Silva
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
This article provides instructions for installing a LAMP (Linux, Apache, MySQL, PHP) stack
on your Debian/Ubuntu based server. Linux (Debian or Ubuntu) is your operating
system, and Apache is your web daemon, which serves information that is
stored in your MySQL database through PHP scripting for your users. By
the end of this article, you will have a fully operational LAMP server,
ready to serve out multiple virtual hosts.
### Prerequisites
- Basic understanding of Secure Shell (SSH).
- Sudo or admin level access to your server.
- A Cloud Server with Ubuntu 16.04+ or Debian 9+.

**IMPORTANT**:
Before moving forward with the LAMP installation, ensure you've applied system updates to ensure you're installing the latest versions of the LAMP components.

### Install the LAMP stack
Log on to your server via SSH and then complete the following steps for
your preferred set up method.

**One-line command method**
1. Use the following one-line command for an expedient set up of your LAMP stack on your server:

        sudo sh -c "apt install apache2 mysql-server php -y; systemctl start mysql && mysql_secure_installation && systemctl restart mysql && systemctl start apache2 && systemctl enable apache2 && systemctl enable mysql && ufw allow http && ufw allow https"
2.  Provide answers for the following system prompts:

    **IMPORTANT**: During the initial setup, MySQL provies the option to utilize the **VALIDATE PASSWORD** plugin which allows you to set acceptable password parameters based on length and complexity. If you want to enable this feature, select **YES** and choose the level of security to implement. 

    - **Set root password**: You decide, but make it secure.
    - **Do you wish to continue with the password provided?**: Only shows if you implemented the VALIDATE PASSWORD plugin.
    - **Remove anonymous users? [Y/n]**: Select **Yes**.
    - **Disallow root login remotely? [Y/n]**: Select **Yes**.
    - **Remove test database and access to it? [Y/n]**: Select **Yes**.
    - **Reload privilege tables now? [Y/n]**: Select **Yes**.


 **Individual commands method**

The following steps break the preceding one-line command into individual
steps.
1.  Install the necessary packages:

        apt install apache2 mysql-server php -y
        
2.  Run the following command to start and secure the MySQL server:

        sudo sh -c "systemctl start mysql && mysql_secure_installation"

3.  Provide answers for the following system prompts:

    **IMPORTANT**: During the initial setup, MySQL provies the option to utilize the **VALIDATE PASSWORD** plugin which allows you to set acceptable password parameters based on length and complexity. If you want to enable this feature, select **YES** and choose the level of security to implement.

    - **Set root password**: You decide, but make it secure.
    - **Do you wish to continue with the password provided?**: Only shows if you implemented the VALIDATE PASSWORD plugin.
    - **Remove anonymous users? [Y/n]**: Select **Yes**.
    - **Disallow root login remotely? [Y/n]**: Select **Yes**.
    - **Remove test database and access to it? [Y/n]**: Select **Yes**.
    - **Reload privilege tables now? [Y/n]**: Select **Yes**.
    
4.  Enter the following command to restart mysqld, start httpd, and
    configure httpd and mysqld to start on boot.
    
        sudo sh -c "systemctl restart mysql && systemctl start apache2 && systemctl enable apache2 && systemctl enable mysql"
        
5.  Allow web traffic through the firewall:
    
        sudo sh -c "ufw allow http && ufw allow https"
    This command allows port 80 (web) and port 443 (secure web) inbound traffic through the firewall, and saves the rule for reboots.

The installation is complete. To test it, browse to ***http://serverIpAddress/***.
