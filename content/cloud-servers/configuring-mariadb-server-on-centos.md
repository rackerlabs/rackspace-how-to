---
permalink: configure-mariadb-server-on-centos/
audit_date: '2018-05-30'
title: Configure MariaDB server on CentOS
type: article
created_date: '2011-07-29'
created_by: Jered Heeschen
last_modified_date: '2018-05-30'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The [previous article](/how-to/installing-mariadb-server-on-centos)
covered a basic MariaDB&reg; server setup on CentOS Linux, including setting the root
password, creating a database, and creating a user for the database. Now
let's look at MariaDB in a little more detail to tweak its
configuration and be ready in case something goes wrong.

### Find the config files

By default, you'll find MariaDB's configuration file at the following location:

    /etc/my.cnf

If it's not there you can use `mysqld` to look for the configuration
file by running the following command:

    /usr/libexec/mysqld --help --verbose

You'll get a lot of text back. The first part describes the options
that you can send to the server when you launch it. The second part is all
of the configuration information that was set when the server was compiled.

Near the start of the output, find a couple lines that look similar to the following lines:

    Default options are read from the following files in the given order:
    /etc/mysql/my.cnf /etc/my.cnf ~/.my.cnf

The server works down the list until it finds a configuration file.

### my.cnf

Open the **my.cnf** file and have a look inside.

Any lines starting with `#` are comments, and they mostly document what
the different settings are for. You'll find details like the location of log files and where the database files
are kept.

#### Config groups

There are lines in the config file that just contain a word in square
brackets, like **[client]** or **[mysqld]**. Those are *config groups*
and they tell the programs that read the configuration file which parts
they should pay attention to.

MariaDB is technically a collection of tools that includes the server (**mysqld**), the client (**mysql**), and some other tools. Programs look in **my.cnf** to see how they should behave.

Basically, the **mysql** configuration section controls the client, and the **mysqld** section controls the server.

### Log files

If something goes wrong, the best place to start troubleshooting any
program is its logs. By default MariaDB stores its log files in the
following directory:

    /var/log/mariadb

**Note**: You might need to use `sudo` to get a listing of the files in that
directory.

If you don't find the logs in the default directory, you need to
check MariaDB's configuration. Look in the **my.cnf** file and look for a
`log_error` line, as in:

    log_error = /var/log/mariadb/mariadb.log

If you don't see a line like that, create one in the **mysqld** section so that
MariaDB will use its own error log. We recommend using the location in the
example and creating the **/var/log/mariadb** directory if it doesn't already
exist. Apply the change by restarting MariaDB with the following command:

    systemctl restart mariadb

Make sure that the log directory you choose can be written to by the user
controlling the MariaDB process.

#### Network settings

There might be a **port** setting under both the client and server configuration
sections. The port under the server section controls the port that the
server listens to. By default, it is 3306, but you can change it to
anything you'd like.

The port in the client section tells the client the port to connect to
by default. You generally want the two port settings to match up.

If you don't see the port entries in the configuration file, that means
the ports are using the default. If you want to change the port, add
the lines in the appropriate categories, as shown in the following example:

    [client]
    port = 3306

    [mysqld]
    port = 3306

The other network setting to look for is the **bind-address** value. It
usually is set to the address for localhost, 127.0.0.1. By binding to
localhost, the server makes sure no one can connect to it from outside of
the local machine.

If you're running your MariaDB server on a different machine from your
application you want to bind to a remotely accessible address instead
of localhost. Change the **bind-address** setting to match your public IP
address (or, even better, to a backend IP address on a network that fewer
machines can access).

If you don't see a **bind-address** entry, you should put one into the
**mysqld** category to help control access to the server, similar to the following example:

    [mysqld]
    bind-address = 127.0.0.1

Remember to account for the client's hostname when you set up your
database users and to configure your firewall if you're running
iptables.

### mysqld and mysqld_safe

Behind the scenes there are actually two versions of the MariaDB server,
**mysqld** and **mysqld_safe**. Both read the same configuration sections. The
main difference is that **mysqld_safe** launches with a few safety
features enabled to make it easier to recover from a crash or other
problem.

Both **mysqld** and **mysqld_safe** will read config entries in the **mysqld**
section. If you include a **mysqld_safe** section, then only **mysqld_safe**
reads those values.

By default the **mysql** service launches **mysqld_safe**. You should only change this if you are really sure about what you're doing.

### mysqladmin

The **mysqladmin** tool enables you to perform some administrative functions from the command line. This tool is not covered in this article because this article covers the basics to get you up and running.
You can look at this tool in more depth later to see what it can do,
particularly if you need to build scripts that perform functions like
checking the status of the server or creating and dropping databases.

### Backups

When it comes to making backups of your databases
(apart from the approach to back up the entire machine), you have a few
options. The main options
are copying the database files and using **mysqldump**.

#### File copy

By default, MariaDB creates a directory for each database in its data
directory that looks similar to the following example:

    /var/lib/mysql

After you've found the data directory, don't make a copy of it immediately. When the database server is active, it might be writing new
values to tables at any time. If it writes to a table halfway
through your copy, some files will change and lead to a corrupt backup.
If you're trying to plan for disaster recovery, this is not a good thing.

To make sure the database files are copied cleanly, shut the
MariaDB server down entirely before the copy. That's safe but isn't always
ideal.

Another approach you can take is to lock the database as read-only for
the duration of the copy. Then when you're done, release the lock. This
way your applications can still read data while you're backing up files.

Lock the databases to read-only by running the following command from the command line:

    mysql -u root -p -e "FLUSH TABLES WITH READ LOCK;"

To unlock the database when you're done, run this command:

    mysql -u root -p -e "UNLOCK TABLES;"

The options **-e** with the **mysql** client tells the client to run
the query in quotes as if it were entered in with the **mysql** shell.

If you're setting these commands up in a script, you can put
the password in quotes right after **-p** with no space between the two,
as in the following example:

    mysql -u root -p"password" -e "FLUSH TABLES WITH READ LOCK;"
    mysql -u root -p"password" -e "UNLOCK TABLES;"

**Note:** Make sure that you set the permissions on that file to restrict read
access to protect the password.

#### mysqldump

Another approach to backing up your database is to use the **mysqldump**
tool. Rather than copying the database files directly, **mysqldump**
generates a text file that represents the database. By default, the text
file contains a list of SQL statements that you would use to recreate the
database, but you can also export the database in another format like
CSV or XML. You can read the [**mysqldump** man page](https://dev.mysql.com/doc/refman/5.5/en/mysqldump.html) to see all its
options.

The statements generated by **mysqldump** go to standard output.
You want to specify a file to redirect the output to when you run it.
For example:

    mysqldump -u root -p demodb > dbbackup.sql

That command tells **mysqldump** to recreate the **demodb** database in
SQL statements and to write them to the file **dbbackup.sql**. Note that
the username and password options function the same as the **mysql** client,
so you can include the password directly after **-p** in a script.

#### Restore from mysqldump

Restoring a database copied with **mysqldump** looks similar to what was used to create it, but you use **mysql** instead of **mysqldump**, as shown
in the following command:

    mysql -u root -p demodb < dbbackup.sql

You also change from using a greater-than to a less-than sign, which switches
the command from redirecting its output to telling it to read its input
from the existing file. The input is sent to the **mysql** command
and causes the instructions in the copy made with **mysqldump** to recreate the database.

By default, the SQL statements that are generated add to
existing database tables without overwriting them. If you're restoring a
backup over an existing database, you should drop the database's tables
first, or drop and recreate the database itself. You can change that
behavior by using the **--add-drop-table** option with the command that
creates the **mysqldump**. Doing so causes **mysqldump** to add a command to the
backup files that it writes that drops tables before recreating them.

### Database engine

The last concept to cover in this article is the *database engine*.
The engine is the process that's churning away behind the scenes,
writing to and reading from files. You won't usually need to know
anything other than that it's there, but sometimes you want to run an
application that's been optimized for a particular database engine.

The engine type is set when a table is created. Tables are usually
created by the application that's going to use them.

To see the engine used by your database's tables, you can run the
following command in the MariaDB shell, changing **demodb** to the name
of your database:

    SHOW TABLE STATUS FROM demodb;

#### Choosing an engine

Ideally you won't need to choose an engine. If you're not very familiar
with MariaDB, that's the safest way to go. Let the application
handle this, and if you're writing the application, use the default
engine until you're more comfortable with your options.

The database engines used most often with MariaDB are **MyISAM** and
**InnoDB**.

#### MyISAM

Because MyISAM has been the default in MySQL for a while, it's the most
compatible with MariaDB. Certain types of searches
perform better on MyISAM than InnoDB. Just because it's the older of the
two doesn't mean that it can't be the best for a given application type.

#### InnoDB

InnoDB is more fault-tolerant than MyISAM and handles crashes and
recovery with a much smaller chance of database corruption. This is a
good thing.

However, for best performance, InnoDB requires a lot of tweaking for your environment and access patterns. If you have a
DBA, this work might not be a problem. But if you're a developer who wants a
database up and running for a test server, you probably won't want to
deal with tuning InnoDB.

### Summary

At this point, you should have a good understanding of MariaDB. For more information, see the [MariaDB documentation site](https://mariadb.com/kb/en/library/documentation/).
