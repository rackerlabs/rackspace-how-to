---
permalink: installing-mariadb-server-on-centos/
audit_date: '2018-03-22'
title: Install a MariaDB server on CentOS
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2018-03-22'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

With the release of CentOS 7, MariaDB replaced MySQL as the default  database system. MariaDB was created by the original developers of MySQL, and is an enhanced, drop-in replacement for MySQL with library binary equivalency and exact matching with MySQL APIs and commands.

This article describes a basic installation of a MariaDB database server on CentOS Linux. You might need to install other packages to let applications use MariaDB, such as extensions for PHP. Check your application documentation for details.

### Install the database server

Follow the steps in this section to install the core database server.

#### Install MariaDB

Install the MariaDB server through the CentOS package manager (yum) by running the following command at a command prompt:

    sudo yum install mariadb-server

#### Allow remote access

Run the following command to allow remote access:

    firewall-cmd --zone=public --add-service=mysql --permanent

### Set the root password

Because you have just installed the MariaDB database server, the root
account has no password set. Use the following command to set the root password and other important settings:

    /usr/bin/mysql_secure_installation

### Start and stop the database service

After the installation is complete, you can start the database service by using the commands in this section. If the system is already started, a message informs you that the service is already running.

Use the following command to start MariaDB:

    sudo systemctl start mariadb.service

Use the following command to stop MariaDB:

    sudo systemctl stop mariadb.service

### Launch at reboot

To ensure that the database server launches after a reboot, you must
enable the `chkconfig` utility. Use the following command to do this:

    sudo systemctl enable mariadb.service

### Start the MariaDB shell

There is more than one way to work with a MariaDB server, but this article
focuses on the most basic and compatible approach: the `mariadb` shell.

1. At the command prompt, run the following command to launch the shell and enter it as the root user:

        /usr/bin/mysql -u root -p

2. When you're prompted for a password, enter the one that you set at
installation, or if you haven't set one, press **Enter** to submit no
password.

   The following shell prompt should appear:

       MariaDB [(none)]>

### View users

MariaDB and MySQL store user information in their own databases. The name of the database is **mysql**. Inside that database, the user information is in a table, a dataset that is named **user**. If you want to see what users are set up in the MySQL user table, run the following command:

    SELECT User, Host, Password FROM mysql.user;

The following list describes the parts of that command:

- **SELECT** tells MySQL that you are asking for data.
- **User, Host, Password** tells MySQL what fields you want it to look in. Fields are categories for the data in a table. In this case, you are looking for the username, the host associated with the username, and the encrypted password entry.
- **FROM mysql.user** tells MySQL to get the data from the **mysql** database and the **user** table.
- A semicolon **(;)** ends the command.

#### User hosts

The following example is the output for the preceding query:

    SELECT User, Host, Password FROM mysql.user;
    +------------------+-----------+-------------------------------------------+
    | User             | Host      | Password                                  |
    +------------------+-----------+-------------------------------------------+
    | root             | localhost | *756FEC25AC0E1823C9838EE1A9A6730A20ACDA21 |
    | root             | 127.0.0.1 | *756FEC25AC0E1823C9838EE1A9A6730A20ACDA21 |
    | root             | ::1       | *756FEC25AC0E1823C9838EE1A9A6730A20ACDA21 |
    +------------------+-----------+-------------------------------------------+

Users are associated with a host, specifically the host to which they
connect. The root user in this example is defined for **localhost**, for the IP address of **localhost**, and the hostname of the server. You usually need to set a user for only the host from which you typically connect.

If you're running your application on the same computer as the MariaDB server, the host that it connects to by default is **localhost**. Any new users that you create must have **localhost** in their **host** field.

If your application connects remotely, the **host** entry that MariaDB looks for is the IP address or DNS hostname of the remote computer (the one from which the client is coming).

### Create a database

There is a difference between a *database server* and a *database*,
even though those terms are often used interchangeably. MariaDB is a
database server, meaning that it tracks databases and controls
access to them. The database stores the data, and it is the database that applications are trying to access when they interact with MariaDB.

Some applications create a database as part of their setup process, but others require you to create a database and tell the application about it.

To create a database, log in to the `mariadb` shell and run the
following command, replacing `demodb` with the name of the database that you want to create:

    CREATE DATABASE demodb;

The database is created. You can verify its creation by running a query to list all databases. The following example shows the query and example output:

    SHOW DATABASES;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | demodb             |
    | mysql              |
    +--------------------+
    3 rows in set (0.00 sec)

### Manage users and privileges

Use the instructions in this section to add users for the database and to grant and revoke privileges.

#### Add users and privileges

When applications connect to the database using the root user, they
usually have more privileges than they need. You can create a new user that applications can use to connect to the new database. In the
following example, a user named **demouser** is created.

To create a new user, run the following command in the `mariadb` shell:

    CREATE USER 'demouser'@'localhost' IDENTIFIED BY 'demopassword';

You can verify that the user was created by running a SELECT query
again:

    SELECT User, Host, Password FROM mysql.user;
    +----------+-----------+------------------------------------------+
    | User     | Host      | Password                                 |
    +----------+-----------+------------------------------------------+
    | root     | localhost | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root     | demohost  | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root     | 127.0.0.1 | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | demouser | localhost | 0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6 |
    +----------+-----------+------------------------------------------+

#### Grant database user privileges

Right after you create a new user, it has no privileges. The user can be used to log in to MariaDB, but it can't be used to make any database changes.

1. Give the user full privileges for your new database by running
the following command:

       GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;

2. Flush the privileges to make the change take effect.

       FLUSH PRIVILEGES;

3. To verify that the privileges were set, run the following command:

       SHOW GRANTS FOR 'demouser'@'localhost';

   MariaDB returns the commands needed to reproduce that user's privileges if you were to rebuild the server. `USAGE on \*.\*` means that the user gets no privileges on anything by default. That command is overridden by the second command, which is the grant that you ran for the new database.

        +-----------------------------------------------------------------------------------------------------------------+
        | Grants for demouser@localhost                                                                                   |
        +-----------------------------------------------------------------------------------------------------------------+
        | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
        | GRANT ALL PRIVILEGES ON `demodb`.* TO 'demouser'@'localhost'                                                    |
        +-----------------------------------------------------------------------------------------------------------------+
        2 rows in set (0.00 sec)

#### Revoke privileges

Sometimes you might need to revoke (remove) privileges from a user. For example, suppose that you were granting `ALL` privileges to 'demouser'@'localhost', but you accidentally granted privileges to all other databases, too, as shown in the following commands:

    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON *.* TO 'demouser'@'localhost'                                                           |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

To correct the mistake, you can use a `REVOKE` statement, followed by `GRANT` statement to apply the correct privileges.

    REVOKE ALL ON *.* FROM demouser@localhost;
    GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;
    SHOW GRANTS FOR 'demouser'@'localhost';

    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON 'demodb'TO 'demouser'@'localhost'                                                           |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

Now your user has the correct privileges, and your database server is slightly more secure (granting privileges like `ALL on *.*` is deemed as a very bad practice). You should also read official MariaDB documentation regarding possible privilege choices, to grant only those privileges truly needed, rather than using `ALL`.

### Summary

If you're just creating a database and a user, you are done. The
concepts covered in this article should give you a solid start from which to
learn more.
