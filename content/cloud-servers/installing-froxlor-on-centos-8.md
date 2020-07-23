---
permalink: installing-froxlor-on-centos-8/
audit_date:
title: 'Installing Froxlor on CentOS 8'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Froxlor is an open-source server management software designed to simplify server management through a web interface. This guide will walk you through installing Froxlor on a CentOS 8 server.

### Prerequisites:

A Cloud Server Running CentOS 8
SSH Access as root or an equally privileged user
Install LAMP Stack
Before installing Froxlor, we’ll first install the LAMP (Linux Apache MariaDB PHP) stack with DNF:

dnf install httpd mariadb-server @php php-posix php-bcmath php-zip php-mysqlnd php-pdo
Next, we’ll start and enable Apache and MariaDB:

systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariad
Access your local MariaDB installation with the MySQL command:

###mysql

In the MySQL prompt, run these two commands to set the root password. Make sure to replace <PASSWORD> with the password you choose.

alter user 'root'@'localhost' identified via mysql_native_password;
alter user 'root'@'localhost' identified by 'VhfbAQHmY3h2yJQ7VrdK';
Exit MariaDB:

exit
Install Froxlor
We’ll download and install Froxlor in the /var/www/html/  directory. Change directory:

cd /var/www/html

###Download Froxlor:

wget http://files.froxlor.org/releases/froxlor-latest.tar.gz

Extract files:

sudo tar -xzf froxlor-latest.tar.gz

Delete the tarball:

rm froxlor-latest.tar.gz

Change ownership to apache:

chown -R apache:apache /var/www/html/froxlor

###Firewall

Before we can proceed, we need to open up ports 80 and 443 in the firewall.

Open port 80:

firewall-cmd --zone=public --add-service=http --permanent
Open port 443:

firewall-cmd --zone=public --add-service=https --permanent
Reload firewall:

firewall-cmd --reload
Finish Installation In Browser
In your web browser, navigate to http://<Internet_IP_address>/froxlor

Click Start install.

All dependencies should be installed and ready to go. Click Click here to continue.

Select your language and input your details. Make sure you give the same MySQL root password you set earlier. Click Click here to continue.

Froxlor will then finish the install. Once done, click Click here to login.

You’ll be greeted with a login screen. Log in and Froxlor is ready to go!
