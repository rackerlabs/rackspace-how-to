---
permalink: installing-froxlor-on-debian-10/
audit_date:
title: 'Installing Froxlor on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Froxlor is an open-source server management software designed to simplify server management through a web interface. This guide will walk you through installing Froxlor on a Debian 10 server.

###Prerequisites:

A Cloud Server Running Debian 10
SSH Access as root or an equally privileged user
Enable Official Froxlor repo

Install https support for apt:

sudo apt install apt-transport-https gnupg
Add gpg key:

wget -O - https://deb.froxlor.org/froxlor.gpg | sudo apt-key add -
Enable repo:

sudo echo "deb https://deb.froxlor.org/debian buster main" > /etc/apt/sources.list.d/froxlor.listdeb https://deb.froxlor.org/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/froxlor.list
Update package list:

sudo apt update
Install Froxlor
With the repo enabled, simply install Froxlor with apt.

apt install froxlor
Configure Database and Web Server
Froxlor expects the document root of your webserver to be in /var/www/. We’ll need to edit Apache’s configuration file to reflect this.

Open Apache configuration file:

nano /etc/apache2/sites-enabled/000-default.conf
Here, you’ll want to find this line:

DocumentRoot /var/www/html
And change it to this:

DocumentRoot /var/www
Once done, restart the Apache service to reload the configuration change.

systemctl restart apache2
Install MySQL-client to access your database from the command line:

apt install mysql-client
Once the client is installed, you can access your local database with the MySQL command:

mysql
In the MySQL prompt, run these two commands to set the root password. Make sure to replace <PASSWORD> with the password you choose.

alter user 'root'@'localhost' identified via mysql_native_password;
alter user 'root'@'localhost' identified by '<PASSWORD>';
Exit MySQL:

exit
Finish Installation In Browser
In your web browser, navigate to http://<Internet_IP_address>/froxlor

Click Start install.


All dependencies should be installed and ready to go. Click Click here to continue.


Select your language and input your details. Make sure you give the same MySQL root password you set earlier. Click Click here to continue.

Froxlor will then finish the install. Once done, click Click here to login.

You’ll be greeted with a login screen. Log in and Froxlor is ready to go!
