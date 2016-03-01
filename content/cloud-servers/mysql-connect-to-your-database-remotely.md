---
node_id: 397
title: MySQL - Connect to your database remotely
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This tutorial will walk you through setting up a user on your MySQL
server to connect remotely.

The following items are assumed:

-   You have access to login as the 'root' MySQL user

### Getting your IP address

You will need to know what the IP address you are connecting from. To
find this you can go to one of the following sites:

-   <http://www.ipchicken.com>
-   <http://www.whatismyip.com>

### Granting access

Granting access to a user from a remote host is fairly simple and can be
accomplished from just a few steps. First you will need to login to your
MySQL server as the *root* user. You can do this by typing the following
command:

    # mysql -u root -p

This will prompt you for your MySQL root password.

Once you are logged into MySQL you need to issue the GRANT command that
will enable access for your remote user. In this example we will be
creating a brand new user (fooUser) that will have full access to the
*fooDatabase* database.

Keep in mind that this statement is not complete and will need some
items changed. Please change **1.2.3.4** to the IP address that we
obtained above. You will also need to change **my_password** with the
password that you would like to use for **fooUser**.

    mysql> GRANT ALL ON fooDatabase.* TO fooUser@'1.2.3.4' IDENTIFIED BY 'my_password';

This statement will grant ALL permissions to the newly created user
*fooUser* with a password of 'my_password' when they connect from the
IP address *1.2.3.4*.

### Testing remotely

Now you can test your connection remotely. You can access your MySQL
server from another Linux server:

    # mysql -u fooUser -p -h 44.55.66.77
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 17
    Server version: 5.0.45 Source distribution

    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

    mysql> _

Note that the IP of our MySQL server is 44.55.66.77 in this example.

### Notes

There are a few things to note when setting up these remote users:

-   When setting up users a local user is not the same thing as a
    remote user. For instance fooUser@localhost is not the same
    as fooUser@1.2.3.4. You will have to duplicate permissions if you
    want them to have the same permissions.
-   Granting ALL permissions is **not advised**. Using *GRANT
    SELECT,INSERT,UPDATE,DELETE* is a wise alternative for a
    normal user.
-   If you would like to grant only to a specific table you can use
    *database.table* instead of *database.\**. In respect to our example
    above you could put *fooDatabase.fooTable*.
-   If you are using **iptables** you will need to make an entry in your
    firewall for TCP port 3306. When creating your firewall rule you can
    simply use the name 'mysql' for the port number. Search our wiki for
    *iptables* and you will find a list of common rule sets which
    include an entry for MySQL.
