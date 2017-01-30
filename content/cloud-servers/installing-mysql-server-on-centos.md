---
permalink: installing-mysql-server-on-centos/
audit_date: '2016-06-27'
title: Install a MySQL server on CentOS
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2016-06-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

MySQL is an open-source relational database that is free and widely used. It
is a good choice if you know that you need a database but don't know much
about all of the available options.

This article describes a basic installation of a MySQL database server
on CentOS Linux. You might need to install other packages to let applications
use MySQL, like extensions for PHP. Check your application documentation for
details.

**Note:** CentOS 7 has replaced MySQL with MariaDB. To reflect this,
instructions for MariaDB procedures are included in this article.

  - Install the database application
  - Start and stop the database service
  - Start the mysql shell
  - Set the root password
  - View users
  - Create a database
  - Manage users and permissions
  - Summary

### Install the database server

Follow the steps in this section to install the core database server.

#### Install MySQL

1. Install the MySQL database through the CentOS package manager (yum) by
   running the following commands at a command prompt:

        sudo yum install mysql-server
        sudo /sbin/service mysqld start

2. Run the following command:

        sudo /usr/bin/mysql_secure_installation

3. Press **Enter** to give no password for root when prompted for it.

4. To apply some reasonable security to your new MySQL server answer **yes**
   to all the prompts. In order, those prompts enable you set the root
   password, remove anonymous users, disable remote root logins, delete the
   test database that the installer included, and then reload the privileges
   so that your changes will take effect.

#### Install MariaDB

Install the MariaDB server through the CentOS package manager (yum) by running
the following command at a command prompt:

    sudo yum install mariadb-server mariadb

#### Allow remote access

If you have iptables enabled and want to connect to the MySQL database
from another computer, you must open a port in your server's firewall
(the default port is 3306). You don't need to do this if the application
that uses MySQL is running on the same server.

If you need to open a port, add the following rules in iptables to open
port 3306:

    iptables -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

**Note:** If you edit the iptables rules file rather than using the command
line to add rules, omit the `iptables` command at the beginning of each line
when you add them to the file.

### Start and stop the database service

After the installation is complete, you can start the database service by
using the commands in this section. If the system is already started, a message
informs you that the service is already running.

#### Start and stop MySQL

Use the following command to start MySQL:

    sudo /sbin/service mysqld start

Use the following command to stop MySQL:

    sudo /sbin/service mysqld stop

#### Start and stop MariaDB

Use the following command to start MariaDB:

    sudo systemctl start mariadb.service

Use the following command to stop MariaDB:

    sudo systemctl stop mariadb.service

### Launch at reboot

To ensure that the database server launches after a reboot, you must
enable the chkconfig utility. Use the following commands to do this.

Enable chkconfig on MySQL

    sudo chkconfig mysqld on

Enable chkconfig on MariaDB

    sudo systemctl enable mariadb.service

### Start the mysql shell

There is more than one way to work with a MySQL server, but this article
focuses on the most basic and compatible approach: the `mysql` shell.

1. At the command prompt, run the following command to launch the `mysql`
shell and enter it as the root user:

        /usr/bin/mysql -u root -p

2. When you're prompted for a password, enter the one that you set at
installation or, if you haven't set one, press **Enter** to submit no
password. 

  The following `mysql` shell prompt should appear:

        mysql>

### Set the root password

Because you have just installed the MySQL database server, the root
account within MySQL has no password set yet. If you are logged in to the
database server, set the root password by running the following command:

    /usr/bin/mysqladmin -u root password 'new-password'

If you are not logged in to the database server you can remotely set the
root password by specifying the hostname of your database server:

    /usr/bin/mysqladmin -u root --password='new-password' -h hostname-of-your-server 'new-password'

**Note:** The rest of this article shows SQL commands in all capitals, but you can
also type them in lowercase. The commands are shown capitalized by
convention, to make them stand out from field names and other data.

### View users

MySQL stores user information in its own database. The name of the database
is **mysql**. Inside that database, the user information is in a table, a
dataset, named **user**. If you want to see what users are set up in the
MySQL user table, run the following command:

    SELECT User, Host, Password FROM mysql.user;

The following list describes the parts of that command:

-   **SELECT** tells MySQL that you are asking for data.

-   **User, Host, Password** tells MySQL what fields you want it to
    look in. Fields are categories for the data in a table. In this
    case, you are looking for the username, the host associated with the
    username, and the encrypted password entry.

-   **FROM mysql.user** tells MySQL to get the data from the **mysql**
    database and the **user** table.
-   **;** (a semicolon) ends the command.

**Note:** All SQL queries end in a semicolon. MySQL does not process a query
until you type a semicolon.

#### User hosts

Following is example output for the preceding query:

    SELECT User, Host, Password FROM mysql.user;
    +------------------+-----------+------------------------------------------+
    | User             | Host      | Password                                 |
    +------------------+-----------+------------------------------------------+
    | root             | localhost | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | demohost  | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | 127.0.0.1 | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    |                  | %         |                                          |
    +------------------+-----------+------------------------------------------+

Users are associated with a host, specifically the host to which they
connect. The root user in this example is defined for **localhost**, for
the IP address of **localhost**, and the hostname of the server (**demohost**
in this example). You usually need to set a user for only one host, the
one from which you typically connect.

If you're running your application on the same computer as the MySQL
server, the host that it connects to by default is **localhost**. Any new users
that you create must have **localhost** in their **host** field.

If your application connects remotely, the **host** entry that MySQL looks
for is the IP address or DNS hostname of the remote computer (the one
from which the client is coming).

A special value for the host is `%`, as you can see in the preceding
output for the blank, or anonymous, user (see the following section).
The `%` symbol is a wildcard that applies to any host value.

#### Anonymous users

In the example output, one entry has a host value but no username or
password. That's an *anonymous user*. When a client connects with no
username specified, it's trying to connect as an anonymous user.

You usually don't want any anonymous users, but some MySQL installations
include one by default. If you see one, you should either delete the
user (refer to the username with empty quotes, like '') or set a
password for it.

### Create a database

There is a difference between a *database server* and a *database*,
even though those terms are often used interchangeably. MySQL is a
database server, meaning that it tracks databases and controls
access to them. The database stores the data, and it is the database that
applications are trying to access when they interact with MySQL.

Some applications create a database as part of their setup process, but
others require you to create a database and tell the application about
it.

To create a database, log in to the `mysql` shell and run the
following command, replacing `demodb` with the name of the database that
you want to create:

    CREATE DATABASE demodb;

The database is created. You can verify its creation by running a query
to list all databases. The following example shows the query and example
output:

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
Use the instructions in this section to add users for the database and grant
and revoke privileges.

#### Add users and privileges

When applications connect to the database using the root user, they
usually have more privileges than they need. You can create a new user
that applications can use to connect to the new database. In the
following example, a user named **demouser** is created.

To create a new user, run the following command in the `mysql` shell:

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

Right after you create a new user, it has no privileges. The user can be
used to log in to MySQL, but it can't be used to make any database
changes.

1. Give the user full privileges for your new database by running
the following command:

        GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;

2. Flush the privileges to make the change take effect.

        FLUSH PRIVILEGES;

3. To verify that the privileges were set, run the following command:

        SHOW GRANTS FOR 'demouser'@'localhost';

   MySQL returns the commands needed to reproduce that user's privileges
   if you were to rebuild the server. The `USAGE on \*.\*` part 
   means that the user gets no privileges on anything by default. That
   command is overridden by the second command, which is the grant you ran
   for the new database.

        +-----------------------------------------------------------------------------------------------------------------+
        | Grants for demouser@localhost                                                                                   |
        +-----------------------------------------------------------------------------------------------------------------+
        | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
        | GRANT ALL PRIVILEGES ON `demodb`.* TO 'demouser'@'localhost'                                                    |
        +-----------------------------------------------------------------------------------------------------------------+
        2 rows in set (0.00 sec)

#### Revoke privileges

Sometimes you might need to revoke (remove) privileges from a user. For
example: suppose that you were granting `ALL` privileges to
'demouser'@'localhost', but you accidentally granted privileges to all other
databases, too:

    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON *.* TO 'demouser'@'localhost'                                                           |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

To correct the mistake, you can use a `REVOKE` statement, followed by `GRANT`
statement to apply the correct privileges.

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

Now your user has the correct privileges, and therefore your database server
is slightly more secure (granting privileges like `ALL on *.*` is deemed
as a very bad practice). You should also read official MySQL
documentation regarding possible privilege choices, to grant only those
privileges truly needed, rather than using `ALL`.

### Summary

If you're just creating a database and a user, you are done. The
concepts covered here should give you a solid grounding from which to
learn more.

### Next section

[Configure MySQL server on CentOS](/how-to/configuring-mysql-server-on-centos)
