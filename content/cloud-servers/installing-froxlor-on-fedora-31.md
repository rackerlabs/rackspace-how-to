---
permalink: install-froxlor-on-fedora-31/
audit_date: '2020-07-22'
title: 'Install Froxlor on Fedora 31'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-27'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

Froxlor is an open-source server management software designed to simplify server management through a web interface. This guide describes how to install Froxlor on a Fedora&reg; 31 server.

### Prerequisites

- You need a Linux&reg; server running distribution Fedora version 31.
- A user with SSH administrator privileges.

### LAMP installation

Perform the following steps to install the LAMP:

1. We need to install LAMP first, the web service stack of Linux&reg; Apache&reg;, MariaDB&reg;, and PHP&reg;, using DNF command.

        dnf install httpd mariadb-server @php php-posix php-bcmath php-zip php-mysqlnd php-pdo

2. Start and enable the Apache and MariaDB service.

        systemctl start httpd
        systemctl enable httpd
        systemctl start mariadb
        systemctl enable mariad

3. Access your local MariaDB installation.

        mysql

4. Within the MySQL prompt, set the root password with these commands. Make sure to replace **<password>** with the password you choose.

       alter user 'root'@'localhost' identified via mysql_native_password;
       alter user 'root'@'localhost' identified by 'password';

5. Exit MariaDB.

       exit

### Install Froxlor

Perform the following steps to install Froxlor:

1. Change into directory **/var/www/html**.

        cd /var/www/html

2. Download Froxlor.

        wget http://files.froxlor.org/releases/froxlor-latest.tar.gz

3. Extract the files.

        sudo tar -xzf froxlor-latest.tar.gz

4. Delete the archive.

        rm froxlor-latest.tar.gz

5. Change ownership to Apache.

        chown -R apache:apache /var/www/html/froxlor

### Firewall configuration

Perform the following steps to configure the firewall:

1. Open up port for  HTTP (`80`) and HTTPS (`443`).

        firewall-cmd --zone=public --add-service=http --permanent
        firewall-cmd --zone=public --add-service=https --permanent

2. Reload firewall.

        firewall-cmd --reload

3. Navigate to **http://your.ip.address.here/froxlor** in your browser.

4. Select **Start install** to begin. 

5. Click on **Click here to continue**.

6. Select your language and fill your details. 

    **Note** Make sure you provide the same root password set earlier. 

7. Click on **Click here to continue**.

8. Select **Click here to login** and the **Login screen** appears. 

9. Log in, and Froxlor is ready to go!
