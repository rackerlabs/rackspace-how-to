---
permalink: configuring-mariadb-server-on-centos/
audit_date: '2018-05-22'
title: Configure MariaDB server on CentOS
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2018-05-22'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

In the [previous article](/how-to/installing-mariadb-server-on-centos)
we covered a basic MariaDB server setup on CentOS Linux. We set the root
password, created a database, and created a user for the database. Now
let's look at MariaDB in a little more detail so we can tweak its
configuration and be ready in case something goes wrong.

### Finding the config files

By default you'll find MariaDB's configuration file at:

    /etc/my.cnf

If it's not there, however, you can ask mysqld where it looks for its
config. Run the command:

    /usr/libexec/mysqld --help --verbose

You'll get a flood of text back. The first part describes the options
you can send to the server when you launch it. The second part is all
the configuration stuff that was set when the server was compiled.

What we're looking for shows up near the start of the output. Find a
couple lines that look similar to the following:

    Default options are read from the following files in the given order:
    /etc/mysql/my.cnf /etc/my.cnf ~/.my.cnf

And there we are. The server works down that list until it finds a
configuration file.

### my.cnf

With the location in hand, open the **my.cnf** file and have a look inside.

    /etc/my.cnf

Any lines starting with `#` are comments, and they mostly document what
the different settings are for. They're good to read through. You'll
find details like the location of log files and where the database files
are kept.

#### Config groups

There are lines in the config file that just contain a word in square
brackets, like **[client]** or **[mysqld]**. Those are *config groups*
and they tell the programs that read the configuration file which parts
they should pay attention to.

See, while we've been focusing on the server part of MySQL, it's
technically a collection of tools. That includes the server (mysqld),
the client (mysql), and some other tools we'll talk about in a bit.
Those programs look in my.cnf to see how they should behave.

There's a bit more to it, but basically: The **client** config section
controls the mysql client, and the **mysqld** section controls the server
config.

### Log files

If something does go wrong the best place to start troubleshooting any
program is its logs. By default MariaDB stores its log files in the
directory:

    /var/log/mariadb

**Note**: You might need to use `sudo` to get a listing of the files in that
directory.

If you don't find the logs in the default directory you'll need to
check MariaDB's config. Look in the **my.cnf** file and look for a
`log_error` line, as in:

    log_error = /var/log/mariadb/mariadb.log

If you don't see a line like that, create one in the **mysqld** section so that
MariaDB will use its own error log. We recommend using the location in the
example, creating the **/var/log/mariadb** directory if it doesn't already
exist. Apply the change by restarting MariaDB with the following command:

    systemctl restart mariadb

Make sure that the log directory you choose can be written to by the user
controlling the MariaDB process.

#### Network settings

There might be a "port" setting under both the client and server config
sections. The port under the server section controls what port the
server will listen to. By default that's 3306 but you can change it to
anything you'd like.

The port in the client section tells the client what port to connect to
by default. You'll generally want the two port settings to match up.

If you don't see the port entries in the config file that just means
they're using the default. If you want to change the port you would add
the lines in the appropriate categories:

    [client]
    port = 3306

    [mysqld]
    port = 3306

The other network setting to look for is the "bind-address" value. That
usually gets set to the address for localhost, 127.0.0.1. By binding to
localhost the server makes sure no one can connect to it from outside
the local machine.

If you're running your MariaDB server on a different machine from your
application you'll want to bind to a remotely-accessible address instead
of localhost. Change the bind-address setting to match your public IP
address (or, better, a backend IP address on a network that fewer
machines can access).

If you don't see a "bind-address" entry you should put one into the
"mysqld" category to help control access to the server:

    [mysqld]
    bind-address = 127.0.0.1

Remember to account for the client's hostname when you set up your
database users and to poke a hole in your firewall if you're running
iptables.

### mysqld and mysqld_safe

Behind the scenes there are actually two versions of the MariaDB server,
"mysqld" and "mysqld_safe". Both read the same config sections. The
main difference is that mysqld_safe launches with a few more safety
features enabled to make it easier to recover from a crash or other
problem.

Both mysqld and mysqld_safe will read config entries in the "mysqld"
section. If you include a "mysqld_safe" section, then only mysqld_safe
will read those values in.

By default the mysql service launches "mysqld_safe". That's a good
thing, and you should only look to change that if you really know what
you're doing.

### mysqladmin

The mysqladmin tool lets you perform some administrative functions from
the command line. We won't talk much about it here because we're just
trying to get you up and running with enough basics to get by. It's
worth looking at the tool in more depth later to see what it can do,
particularly if you need to build scripts that perform functions like
checking the status of the server or creating and dropping databases.

### Backups

You have a few options when it comes to making backups of your databases
apart from the usual "back up the whole machine" approach. The main two
are copying the database files and using mysqldump.

#### File copy

By default MariaDB creates a directory for each database in its data
directory:

    /var/lib/mysql

Once you've found the data directory, hold off a moment before making a
copy of it. When the database server is active it could be writing new
values to tables at any time. That means if it writes to a table halfway
through your copy some files will change and lead to a corrupt backup.
Not a good thing if you're trying to plan for disaster recovery.

To make sure the database files are copied cleanly you can shut the
MariaDB server down entirely before the copy. That's safe but isn't always
ideal.

Another approach you can take is to lock the database as read-only for
the duration of the copy. Then when you're done, release the lock. That
way your applications can still read data while you're backing up files.

Lock the databases to read-only by running, from the command line:

    mysql -u root -p -e "FLUSH TABLES WITH READ LOCK;"

To unlock the database when you're done, run:

    mysql -u root -p -e "UNLOCK TABLES;"

We're using a new option with the mysql client, "-e". That tells the
client to run the query in quotes as if we'd entered it in the mysql
shell proper.

Note that if you're setting these commands up in a script you can put
the password in quotes right after "-p" with no space between the two,
as in:

    mysql -u root -p"password" -e "FLUSH TABLES WITH READ LOCK;"
    mysql -u root -p"password" -e "UNLOCK TABLES;"

Just make sure you set the permissions on that file to restrict read
access. We don't want just anyone to be able to see that password.

#### mysqldump

Another approach to backing up your database is to use the "mysqldump"
tool. Rather than copying the database files directly, mysqldump
generates a text file that represents the database. By default the text
file contains a list of SQL statements you would use to recreate the
database, but you can also export the database in another format like
CSV or XML. You can read the man page for mysqldump to see all its
options.

The statements generated by mysqldump go straight to standard output.
You'll want to specify a file to redirect the output to when you run it.
For example:

    mysqldump -u root -p demodb > dbbackup.sql

That command will tell mysqldump to recreate the "demodb" database in
SQL statements and to write them to the file "dbbackup.sql". Note that
the username and password options function the same as the mysql client,
so you can include the password directly after "-p" in a script.

#### Restore from mysqldump

Restoring a mysqldumped database looks similar to what was used to
create it, but we use plain old "mysql" instead of "mysqldump":

    mysql -u root -p demodb < dbbackup.sql

We also change from a greater-than to a less-than sign. That switches
the command from redirecting its output to telling it to read its input
from the existing file. That input is sent to the "mysql" command,
causing the mysqldumped instructions to recreate the database.

Note that by default the SQL statements generated would just add to
existing database tables, not overwrite them. If you're restoring a
backup over an existing database you should drop the database's tables
first, or drop and recreate the database itself. You can change that
behavior by using the "--add-drop-table" option with the command that
creates the mysqldump. That causes mysqldump to add a command to the
backup files it writes that will drop tables before recreating them.

### Database engine

The last concept we'll talk about here is that of the *database engine*.
The engine is the process that's churning away behind the scenes,
writing to and reading data from files. You won't usually need to know
anything other than that it's there, but sometimes you'll want to run an
application that's been optimized for a particular database engine.

The engine type is set when a table is created. Tables are usually
created by the application that's going to use them, which is why we
aren't going to get into that syntax here.

To see the engine used by your database's tables you can run the
following command in the MariaDB shell, changing "<demodb>" to the name
of your database:

    SHOW TABLE STATUS FROM demodb;

#### Choosing an engine

Ideally you won't need to choose an engine. If you're not very familiar
with MariaDB that's certainly the safest way to go - let the application
do its thing, and if you're writing the application, use the default
engine until you're more comfortable with your options.

The two database engines used most often with MariaDB are "MyISAM" and
"InnoDB".

#### MyISAM

Because MyISAM has been the default in MySQL for a while it's the most
compatible with MariaDB. Certain types of searches
perform better on MyISAM than InnoDB. Just because it's the older of the
two doesn't mean it can't be the best for a given application type.

#### InnoDB

InnoDB is more fault-tolerant than MyISAM and handles crashes and
recovery with a much smaller chance of database corruption. This is a
good thing.

The main trouble with InnoDB is that for best performance it requires a
lot of tweaking for your environment and access patterns. If you have a
DBA that's no problem, but if you're a developer who just wants a
database up and running for a test server you probably won't want to
deal with tuning InnoDB.

### Summary

Now you should have a greater understanding of MariaDB. More information is
available at the [MariaDB documentation site](https://mariadb.com/kb/en/library/documentation/).
