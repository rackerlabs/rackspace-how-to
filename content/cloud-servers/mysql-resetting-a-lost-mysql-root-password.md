---
permalink: mysql-resetting-a-lost-mysql-root-password/
audit_date: '2016-06-13'
title: Reset a MySQL root password
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-12-21'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

The MySQL root password allows the root user to have full access to the [MySQL database](https://www.rackspace.com/cloud/databases). You must have (Linux) root or (Windows) Administrator access to the [Cloud Server](https://www.rackspace.com/cloud) to reset the MySQL root password.

**Note:** The Cloud Server (Linux) root or (Windows) Administrator account password is not the same as the MySQL password.  The Cloud Server password allows access to the server. The MySQL root password allows access only to the MySQL database.

Use the following steps to reset a MySQL root password by using the command line interface.

### Stop the MySQL service

(Ubuntu and Debian) Run the following command:

    sudo /etc/init.d/mysql stop

(CentOS, Fedora, and Red Hat Enterprise Linux) Run the following command:

    sudo /etc/init.d/mysqld stop

### Start MySQL without a password

Run the following command. The ampersand (&) at the end of the command is required.

    sudo mysqld_safe --skip-grant-tables &

### Connect to MySQL

Run the following command:

    mysql -uroot

### Set a new MySQL root password

Run the following command:

    use mysql;

    update user set authentication_string=PASSWORD("mynewpassword") where User='root';

    flush privileges;

    quit

### Stop and start the MySQL service

(Ubuntu and Debian) Run the following commands:

    sudo /etc/init.d/mysql stop
    ...
    sudo /etc/init.d/mysql start

(CentOS, Fedora, and Red Hat Enterprise Linux) Run the following commands:

    sudo /etc/init.d/mysqld stop
    ...
    sudo /etc/init.d/mysqld start

### Log in to the database

Test the new password by logging in to the database.

    mysql -u root -p

Enter your new password when prompted.


<script type="application/ld+json">
   {
   "@context": "http://schema.org/",
   "@type": "HowTo",
   "name":"Reset a MySQL root password",
   "description": "The MySQL root password allows the root user to have full access to the MySQL databases. This article shows you do to reset a MySQL root password by using the command line interface.",
   "step": [
   	{
   	"@type": "HowToSection",
   	"name": "Stop the MySQL service",
       "position": "1",
   	"itemListElement": "To stop MySQL for Ubuntu and Debian, run the following command: sudo /etc/init.d/mysql stop"
   	},{
   	"@type": "HowToSection",
   	"name": "Start MySQL and connect",
       "position": "2",
   	"itemListElement": [
   		{
           "@type": "HowToStep",
           "position": "1",
   		"text": "To start MySQL without a password, run the following command: sudo mysqld_safe --skip-grant-tables &"
   		},{
           "@type": "HowToStep",
           "position": "2",
           "text": "To connect to MySQL, run the following command: mysql -uroot"
   		}]
   	},{
   	"@type": "HowToSection",
   	"name": "Reset the MySQL password",
       "position": "3",
   	"itemListElement": "To set a new MySQL root password, run the following command:"
   }]}
</script>
