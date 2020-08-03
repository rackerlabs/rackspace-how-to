---
permalink: install-froxlor-on-debian-10/
audit_date: '2020-07-22'
title: 'Install Froxlor on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-31'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

Froxlor is an open-source server management software designed to simplify server management through a web interface.
This guide describes how to install Froxlor on a Debian&reg; 10 server.

### Prerequisites:

- A Linux&reg; server running distribution Debian version 10
- A user with SSH administrator privileges

### Froxlor installation

1. Enable HTTPS (`443`) for Advanced Package Tool (APT), for versions of apt before 1.5. Later versions include https support by default.

        sudo apt install apt-transport-https gnupg

2. Add GNU Privacy Guard (gpg) key.

        wget -O - https://deb.froxlor.org/froxlor.gpg | sudo apt-key add -

3. Enable repository.

        sudo echo "deb https://deb.froxlor.org/debian buster main" > /etc/apt/sources.list.d/froxlor.listdeb https://deb.froxlor.org/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/froxlor.list

4. Update package list.

        sudo apt update

5. Install Froxlor using apt.

        apt install froxlor

### Configure Database and Web Server

Froxlor expects the server's root document to be in **/var/www/**. Edit the Apache&reg; configuration file to reflect this change.

1. Open the Apache configuration file.

        nano /etc/apache2/sites-enabled/000-default.conf

2. Find line **DocumentRoot /var/www/html** and replace it with **DocumentRoot /var/www**.

3. Restart the Apache service to reload the configuration change.

        systemctl restart apache2

4. Install MySQL-client to access your database from the command line.

        apt install mysql-client

5. Access the local database with the MySQL command.

        mysql

6. Run the following commands to set the root password. Make sure to replace `<PASSWORD>` with the password you choose.

        alter user 'root'@'localhost' identified via mysql_native_password;
        alter user 'root'@'localhost' identified by '<PASSWORD>';

7. Exit MySQL.

        exit

8. In your web browser, navigate to http://<Internet_IP_address>/froxlor

9. Click **Start install**.

10. Click **Click here to continue**.

11. Select a language and input your details. Make sure you give the same MySQL root password you set earlier.

12. Click **Click here to continue**.

13. Click **Click here to login**.

14. Log in and proceed with [Foxlor's initial setup](https://support.rackspace.com/how-to/froxlor-initial-setup-and-overview/).
