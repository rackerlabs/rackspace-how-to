---
node_id: 1162
title: Installing MySQL Server on Ubuntu
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2016-01-11'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Overview

MySQL is an open-source relational database. In a nutshell, for those
unfamiliar with it: A database is where an application keeps its stuff.

To break it down a little further, "relational database" is a term that
refers to how data is organized and accessed within the database. The
"SQL" part refers to the language used by application queries to
retrieve and store data ("Structured Query Language").

MySQL is free and widely used, meaning you can find a lot of application
support, tools, and community help for it. MySQL is a safe choice if you
know you need a database but don't know what to make of the options that
are out there.

This article covers a basic installation of a MySQL server on Ubuntu
Linux - just enough to get you started. Remember that you might need to
install other packages to let apps use MySQL, like extensions for PHP.
Check your application documentation for details.

### Installing MySQL

The easiest way to install the MySQL server is through the Ubuntu
package manager:

    sudo aptitude update
    sudo aptitude install mysql-server

The installer should ask you to set a root password. It's strongly
advised you do so, but if you miss your chance during the install we'll
show you how to set the root password a little further on.

### iptables

If you have iptables enabled and want to connect to MySQL from another
machine you'll need to open a port in your server's firewall (the
default port is 3306). You don't need to do this if the application
using MySQL is running on the same machine.

If you do need to open a port (again, only if you're accessing MySQL
from a different machine from the one you're installing on), you can use
the following rules in iptables to open port 3306:

    -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
    -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

### Launch MySQL

Now that MySQL is installed you can make sure it's running by trying to
launch it:

    sudo service mysql start

If you see a message that it's already running that's okay (it means
that, well, it's already running).

### Launching at boot

This should also have been done for you at install time, but just in
case:

    sudo /usr/sbin/update-rc.d mysql defaults

That makes sure your machine will launch the MySQL server when it
reboots.

### The MySQL shell

There is more than one way to manage a MySQL server, so we'll focus on
the most basic and compatible approach: The mysql shell.

At the command prompt, run:

    /usr/bin/mysql -u root -p

That will attempt to launch the mysql client and enter the shell as user
"root". When you're prompted for a password enter the one you set at
install time or, if you haven't set one, just hit enter to submit no
password.

You should be greeted by the mysql shell prompt:

    mysql>

### Setting the root password

If you got in by entering a blank password, or want to change the root
password you've set, you can do it by entering the following command in
the mysql shell. Replace the "password" in quotes with your desired
password:

    UPDATE mysql.user SET Password = PASSWORD('password') WHERE User = 'root';

It's kind of a mouthful. The reason for this is that MySQL keeps user
data in its own database, so to change the password we have to run an
SQL command to update the database.

Next we'll reload the stored user information to make our change go into
effect:

    FLUSH PRIVILEGES;

Note that we're using all-caps for SQL commands. If you type those
commands in lowercase they'll work too. By convention the commands are
written in all-caps to make them stand out from field names and other
data that's being manipulated.

### Looking at users

As mentioned in the previous section, MySQL stores the user information
in its own database. The name of the database is "mysql". Inside that
database the user information is in a "table", a dataset, named "User".

If you want to see what users are set up in MySQL you need to run a
query against the "user" table in the "mysql" database. Let's do that
now:

    SELECT User, Host, Password FROM mysql.user;

Breaking that down...

The "SELECT" command tells MySQL you're asking for data.

The "User, Host, Password" part tells MySQL what fields you want it to
look in. Fields are categories for the data in a table. In this case
we're looking for the username, the host associated with the username,
and the encrypted password entry.

Finally, the "FROM mysql.user" part of the command tells MySQL to get
the data from the "mysql" database and the "user" table.

And then the command ends with a semicolon

#### About that semicolon

All SQL queries end with a semicolon. MySQL will wait for you to keep
entering additions to a query until it sees a semicolon.

That means that you can break lines up into smaller parts to make them
easier to read. For example, the above command also works if you enter
it in multiple lines in the mysql shell, as in:

    mysql> SELECT User, Host, Password
        -> FROM mysql.user;

When you hit "enter" after the "Password" part you'll get a new line so
you can keep typing. The "->" indicates that the shell thinks you're
still in the middle of a statement. You can type a semicolon by itself
to end the command if you simply forgot it on the first line.

#### User hosts

Okay, with that important aside about the semicolon done, let's look at
the output of that query:

    SELECT User, Host, Password FROM mysql.user;
    +------------------+-----------+------------------------------------------+
    | User             | Host      | Password                                 |
    +------------------+-----------+------------------------------------------+
    | root             | localhost | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | demohost  | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | 127.0.0.1 | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | debian-sys-maint | localhost | 03C2F472E5290DDE27E889681C90EA91FD6800F3 |
    |                  | %         |                                          |
    +------------------+-----------+------------------------------------------+

As you can see, users are associated with a host - specifically, the
host they connect to. The "root" user in this case is defined for
localhost, for the IP address of localhost, and the hostname of the
server ("demohost" in this example). You'll usually only need to set a
user for one host, the one you typically connect from.

If you're running your application on the same machine as the MySQL
server the host it connects to by default will be "localhost". That
means any new users you create will need to have "localhost" in its
"host" field.

If your application connects remotely the "host" entry MySQL will look
for is the IP address or DNS hostname of the remote machine (the one the
client is coming from).

A special value for the host is "%", as you'll see for the blank user
(more on that shortly). That's a wildcard that applies to any host
value. You usually won't want to use that because it's more secure to
limit access specifically to trusted hosts.

#### Anonymous users

In the example output above you'll notice there's one entry that has a
host value but no username or password. That's an "anonymous user". When
a client connects with no username specified it's trying to connect as
an anonymous user.

You usually don't want one of those in there, but some MySQL
installations include one by default. If you see one of those you should
either delete the user (refer to the username with empty quotes, like
'') or set a password for it (we cover both tasks later in this series).

### Create a database

That covers some basic concepts surrounding users, so now let's look at
creating a database.

It's worth noting at this point that there is a difference between a
"database server" and an actual "database", even though you'll often see
those terms used interchangeably. MySQL itself is a database server,
meaning that it keeps track of databases and controls access to them. An
actual database is where all the data goes. That's what applications are
trying to get at when they talk to MySQL.

Some applications will create a database as part of their setup process,
while others require you to create a database yourself and tell the
application about it later. Fortunately it's an easy process.

To create a database, log into the mysql shell and run:

    CREATE DATABASE demodb;

That's all there is to it. Replace "demodb" with the name of the
database you want to create, of course. You can make sure it's there by
running a query to list all databases:

    SHOW DATABASES;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | demodb             |
    | mysql              |
    +--------------------+
    3 rows in set (0.00 sec)

### Add a database user

It's not a good idea to have applications connecting to the database
using the root user. That gives them more privileges than they need.
We'll create a user named "demouser" that applications can use to
connect to the new database.

To make the user run the following in the mysql shell:

    INSERT INTO mysql.user (User,Host,Password) VALUES('demouser','localhost',PASSWORD('demopassword'));

When you make changes to the user table in the mysql database you need
to tell MySQL to read the changes by flushing the privileges. To wit:

    FLUSH PRIVILEGES;

You can make sure the user is there by running that "select" query
again:

    SELECT User, Host, Password FROM mysql.user;
    +------------------+-----------+------------------------------------------+
    | User             | Host      | Password                                 |
    +------------------+-----------+------------------------------------------+
    | root             | localhost | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | demohost  | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | root             | 127.0.0.1 | 2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19 |
    | debian-sys-maint | localhost | 03C2F472E5290DDE27E889681C90EA91FD6800F3 |
    | demouser         | localhost | 0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6 |
    +------------------+-----------+------------------------------------------+

### Grant database user permissions

Right now our new user has no privileges. It can be used to log on, but
it can't be used to make any database changes. Let's give it full
permissions for our new database by running:

    GRANT ALL PRIVILEGES ON demodb.* to demouser@localhost;

And follow it up with the usual:

    FLUSH PRIVILEGES;

To check those privileges were set, we'll run:

    SHOW GRANTS FOR 'demouser'@'localhost';
    +-----------------------------------------------------------------------------------------------------------------+
    | Grants for demouser@localhost                                                                                   |
    +-----------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'demouser'@'localhost' IDENTIFIED BY PASSWORD '*0756A562377EDF6ED3AC45A00B356AAE6D3C6BB6' |
    | GRANT ALL PRIVILEGES ON `demodb`.* TO 'demouser'@'localhost'                                                    |
    +-----------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)

What you get back are the commands needed to reproduce that user's
permissions if you were to rebuild the server. The "USAGE on \*.\*" part
basically means they get no privileges on anything by default. Then that
gets overridden by the second command, which is the grant you ran for
the new database.

### Summary

And that's all you need if you're just creating a database and a user.
We were a bit long on concepts there but that should give you a solid
grounding from which to learn more. Good work.

### Next section

[Configuring MySQL server on Ubuntu](/how-to/configuring-mysql-server-on-ubuntu)
