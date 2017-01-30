---
permalink: mysql-connect-to-your-database-remotely/
audit_date: '2016-06-23'
title: Connect to a MySQL database remotely
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-10-03'
last_modified_by: Ben Sampson
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to set up a user on your MySQL server to connect
remotely.

To perform these steps, you must have local server access to login as the
'root' MySQL user.

### Get your IP address

You need to know the IP address of the computer from which you are connecting.
To get this you can go to one of the following sites:

-   <https://icanhazip.com>
-   <https://www.whatismyip.com>

### Grant access

Perform the following steps to grant access to a user from a remote host.

1. Log in locally to your MySQL server as the root user. You can do this by
   typing the following command:

    # mysql -u root -p

   You will be prompted for your MySQL root password. (If you get into MySQL
   without a password, consider runing the 'mysql_secure_installation,' script,
   which sets a MySQL root password and updates other settings to increase
   security).

2. Issue the GRANT command which enables access for the remote user. The
   following example creates a new user (fooUser) that will have full access
   to the fooDatabase database.

   Be sure that this statement is not complete and will need some
   items changed. Please change **1.2.3.4** to the IP address that we
   obtained above. You will also need to change **my_password** with the
   password that you would like to use for **fooUser**.

    mysql> GRANT ALL ON fooDatabase.* TO fooUser@'1.2.3.4' IDENTIFIED BY 'my_password';

   This statement grants ALL permissions to the newly created user with the
   specified password when the user connects from the specified IP address.

### Test the connection remotely

To test the connection remotely, you can access the MySQL server from another
Linux server, as follows. In this example, IP address of the MySQL server is
44.55.66.77.

    # mysql -u fooUser -p -h 44.55.66.77
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 17
    Server version: 5.0.45 Source distribution

    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

    mysql> _

### Considerations

When setting up remote users, consider the following items:

 - A local user is not the same thing as a remote user. For example
   **fooUser@localhost** is not the same as **fooUser@1.2.3.4**. If you want
   both users to have the same permissions, you need to duplicate permissions.

 - WE do not recommend granting ALL permissions. For a normal user, we
   recommend using `GRANT SELECT,INSERT,UPDATE,DELETE`.

 - To grant access to only a specific table, you can use `database.table`.
   For example, in the receding step, you could use `fooDatabase.fooTable`
   instead of `fooDatabase`.* In respect to our example
   above you could put .

 - If you are using iptables you will need to create an entry in your
   firewall for TCP port 3306. When you create the firewall rule you can
   simply use the name `mysql` for the port number. Search our wiki for
   *iptables* and you will find a list of common rule sets which
   include an entry for MySQL.
