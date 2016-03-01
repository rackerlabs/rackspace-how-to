---
node_id: 1164
title: Installing MySQL Server on CentOS
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2016-01-15'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Overview

MySQL is an open-source relational database. For those unfamiliar with
these terms, a database is where an application keeps its data, and
relational refers to how the data is organized and accessed within the
database. SQL refers to the language used by application queries to
retrieve and store data: Structured Query Language.

MySQL is free and widely used, meaning that you can find a large amount
of application support, tools, and community help for it. MySQL is a
safe choice if you know that you need a database but don't know much
about all of the available the options.

This article describes a basic installation of a MySQL database server
on CentOS Linux, just enough to get you started. Remember that you might
need to install other packages to let applications use MySQL, like
extensions for PHP. Check your application documentation for details.

**Note:** CentOS 7 has replaced MySQL with MariaDB. To reflect this,
instructions for MariaDB procedures are included in this article.

### Installing the database application

Follow the steps below to install the database core server.

### MySQL installation

Install the MySQL server through the CentOS package manager by running
the following commands at a command prompt:

    sudo yum install mysql-server
    sudo /sbin/service mysqld start

Then, run the following command:

    sudo /usr/bin/mysql_secure_installation

Press enter to give no password for root when that program asks for it.
To apply some reasonable security to your new MySQL server answer "yes"
to all the questions that the program asks. In order, those questions
enable you set the root password, remove anonymous users, disable remote
root logins, delete the test database that the installer included, and
then reload the privileges so that your changes will take effect.

### MariaDB installation

    sudo yum install mariadb-server mariadb

### Allow remote access

If you have iptables enabled and want to connect to the MySQL database
from another machine, you need to open a port in your server's firewall
(the default port is 3306). You don't need to do this if the application
using MySQL is running on the same machine.

If you do need to open a port, you can use the following rules in
iptables to open port 3306:

    -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
    -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

**Note:** The `iptables` command was deliberately left out of the
iptables rules in the instructions above. Some people using
distributions that do not have their own iptables service might instead
have a rules file they can import using `iptables-restore`. The format
of the lines in that file would be similar to the format used above:
iptables options without the `iptables` command in front of them. For
this reason, the instructions in this article represent a compromise. It
is easy to paste the lines into a rules file, and they can be used with
the `iptables` command instead.

### Starting and stopping the database service

When you've completed the installation, you can start the service by
using the commands shown below. If the system is already started, you
will see a message telling you that the service is already running.

### Starting and stopping MySQL

Use the following command to start MySQL:

    sudo /sbin/service mysqld start

Use the following command to stop MySQL:

    sudo /sbin/service mysqld stop

### Starting and stopping MariaDB

Use the following command to start MariaDB:

    sudo systemctl start mariadb.service

Use the following command to stop MariaDB:

    sudo systemctl stop mariadb.service

### Launching at reboot

To ensure that the database server launches after a reboot, you must
enable the chkconfig utility. Use the following commands to do this.

**Enable chkconfig on MySQL**

    sudo chkconfig mysqld on

**Enable chkconfig on MariaDB**

    sudo systemctl enable mariadb.service

### The MySQL shell

There is more than one way to work with a MySQL server, but this article
focuses on the most basic and compatible approach: The `mysql` shell.
At the command prompt, run the following command to launch the `mysql`
shell and enter it as the root user:

    /usr/bin/mysql -u root -p

When you're prompted for a password, enter the one that you set at
installation or, if you haven't set one, just press enter to submit no
password. The following `mysql` shell prompt should appear:

    mysql>

### Set the root password

Since you have just installed your MySQL database server, the root
account within MySQL has no password set yet. You should change that by
running the following commands:

    /usr/bin/mysqladmin -u root password 'new-password'
    /usr/bin/mysqladmin -u root --password='new-password' -h hostname-of-your-server 'new-password'

**Note:** This article shows SQL commands in all capitals, but you can
also type them in lowercase. The commands are shown capitalized by
convention, to make them stand out from field names and other data
that's being manipulated.

### Viewing users

As mentioned in the preceding section, MySQL stores the user information
in its own database. The name of the database is "mysql". Inside that
database, the user information is in a "table", a dataset, named "User".
If you want to see what users are set up in MySQL table, or dataset,
named "user".

    SELECT User, Host, Password FROM mysql.user;

The list below lists the descriptions for the parts of that command:

-   **SELECT** - tells MySQL that you are asking for data.

-   **User, Host, Password** - tells MySQL what fields you want it to
    look in. Fields are categories for the data in a table. In this
    case, you are looking for the username, the host associated with the
    username, and the encrypted password entry.
-   **FROM mysql.user** - tells MySQL to get the data from the mysql
    database and the user table.
-   **;** - The command ends with a semicolon.

### Ending SQL queries with a semicolon

All SQL queries end in a semicolon. MySQL does not process a query until
you type a semicolon.

This means that you can break up queries onto multiple lines to make
them easier to read. For example, the preceding command also works if
you enter it on multiple lines in the `mysql` shell, as follows:

    mysql> SELECT User, Host, Password
        -> FROM mysql.user;

When you press enter after the Password part, you get a new line, so you
can keep typing. The `>` symbol indicates that you are still in the
middle of a statement. You can type a semicolon by itself to end a
command if you forget to type it on the same line as the command.

### User hosts

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
connect. The "root" user in this example is defined for localhost, for
the IP address of localhost, and the hostname of the server ("demohost"
in this example). You usually need to set a user for only one host, the
one from which you typically connect.

If you're running your application on the same machine as the MySQL
server the host it connects to by default is "localhost". Any new users
that you create must have "localhost" in their "host" field.

If your application connects remotely, the "host" entry that MySQL looks
for is the IP address or DNS hostname of the remote machine (the one
from which the client is coming).

A special value for the host is `%`, as you can see in the preceding
output for the blank, or anonymous, user (see the following section).
The `%` symbol is a wildcard that applies to any host value. You
usually don't want to use that because it's more secure to limit access
specifically to trusted hosts.

### Anonymous users

In the example output, one entry has a host value but no username or
password. That's an "anonymous user". When a client connects with no
username specified, it's trying to connect as an "anonymous" user.

You usually don't want any anonymous users, but some MySQL installations
include one by default. If you see one, you should either delete the
user (refer to the username with empty quotes, like '') or set a
password for it. Both tasks are covered later in this series of
articles.

### Create a database

There is a difference between database server and an actual database,
even though those terms are often used interchangeably. MySQL is a
database server, meaning that it keeps track of databases and controls
access to them. An actual database is where all the data goes is stored,
and it is the database that applications are trying to access when they
interact with MySQL.

Some applications create a database as part of their setup process, but
others require you to create a database and tell the application about
it. Fortunately, creating a database is simple.

To create a database, log in to the `mysql` shell and run the
following command, replacing demodb with the name of the database that
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

### Adding users and permissions

When applications connect to the database using the root user, they
usually have more privileges than they need. You can create a new user
that applications can use to connect to the new database. In the
following example, a user named demouser is created.

To create a new user, run the following command in the `mysql` shell:

    CREATE USER 'demouser'@'localhost' IDENTIFIED BY 'demopassword';

You can verify that the user was created by running that "SELECT" query
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

### Grant database user permissions

Right after you create a new user, it has no privileges. The user can be
used to log in to MySQL, but it can't be used to make any database
changes. Give the user full permissions for your new database by running
the following command:

    GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;

Then, flush the privileges to make the change take effect.

    FLUSH PRIVILEGES;

To verify that the privileges were set, run the following command:

    SHOW GRANTS FOR 'demouser'@'localhost';

MySQL returns the commands needed to reproduce that user's permissions
if you were to rebuild the server. The "USAGE on \*.\*" part basically
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

### Revoking privileges

Sometimes you might need to revoke (remove) privileges form a user, for
different reason. For example: you were granting `ALL` privileges to
'demouser'@'localhost', but by accident (can happen to the best of us
any time!) instead of granting them only on the demodb database, you
granted them to all other databases too:

    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON *.* TO 'demouser'@'localhost'                                                           |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

After realizing your mistake, you decided to do something to correct it.
The easiest way is to use a `REVOKE` statement, followed by `GRANT`
statement to apply correct privileges.

    REVOKE ALL ON *.* FROM demouser@localhost;
    GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;
    SHOW GRANTS FOR 'demouser'@'localhost';

    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON *.* TO 'demouser'@'localhost'                                                           |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

Now your user has correct permission, and therefore your database server
is slightly more secure (granting privileges like `ALL on *.*` is deemed
as a very bad practice). You should also read official MySQL
documentation regarding possible privilege choices, to grant only those
privileges truly needed, rather than using `ALL`.

### Summary

If you're just creating a database and a user, you are done. The
concepts covered here should give you a solid grounding from which to
learn more.

### Next section

[Configuring MySQL server on CentOS](/how-to/configuring-mysql-server-on-centos)
