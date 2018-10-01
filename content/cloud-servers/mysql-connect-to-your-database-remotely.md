---
permalink: mysql-connect-to-your-database-remotely/
audit_date: '2016-06-23'
title: Connect to a MySQL database remotely
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-10-01'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to set up a user on your MySQL&reg; server in order
to connect to a [MySQL
database](https://www.rackspace.com/cloud/databases) remotely.

In order to perform these steps, you must have local server access to log in as
the `root` MySQL user.

### Retrieve your IP address

You need to know the Internet Protocol (IP) address of the computer from which
you are connecting. You can retrieve this information by visiting one of the
following sites:

-   <https://icanhazip.com>
-   <https://www.whatismyip.com>

### Grant access

Perform the following steps to grant access to a user from a remote host:

1. Log in to your MySQL server locally as the `root` user by using the
   following command:

        # mysql -u root -p

    You are prompted for your MySQL root password.

    **Note**: If you gain access to MySQL without entering a password,
    consider running the `mysql_secure_installation` script, which sets a
    MySQL root password and updates other settings to increase
    security. [Microsoft SQL Server Managed
    Services](https://www.rackspace.com/managed-hosting/database-services/microsoft-sql) can help you manage your SQL server instances.

2. Use a `GRANT` command in the following format to enable access for the
   remote user. Ensure that you change `1.2.3.4` to the IP address that you
   obtained above, and `my_password` to the password that you
   want `fooUser` to use:

        mysql> GRANT ALL ON fooDatabase.* TO fooUser@'1.2.3.4' IDENTIFIED BY 'my_password';

    This statement grants `ALL` permissions to the new user when the user
    connects from the specified IP address by using the specified password.

### Test the connection remotely

To test the connection remotely, access the MySQL server from another
Linux&reg; server. The following example uses `44.55.66.77` as the IP address
of the MySQL server:

    # mysql -u fooUser -p -h 44.55.66.77
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 17
    Server version: 5.0.45 Source distribution

    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

    mysql> _

### Considerations

When you set up a remote user, consider the following information:

 - A local user is different from a remote user. For example,
   `fooUser@localhost` is not the same as `fooUser@1.2.3.4`. If you want
   both users to have the same permissions, you need to duplicate permissions.

 - We don't recommend granting `ALL` permissions. For standard users, we
   recommend granting `GRANT SELECT,INSERT,UPDATE,DELETE` permissions.

 - To grant access to only a specific table, you can use the `database.table`
   command. For example, in the preceding step, you could use `fooDatabase.fooTable` instead of `fooDatabase`.

 - If you're using iptables, you need to add an entry to your firewall rule
   for Transmission Control Protocol (TCP) port 3306. You can use the name
   `mysql` for the port number.
