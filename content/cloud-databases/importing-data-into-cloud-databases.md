---
permalink: importing-data-into-cloud-databases/
audit_date:
title: Import data into Cloud Databases
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-02-09'
last_modified_by: Laura Santamaria
product: Cloud Databases
product_url: cloud-databases
---

There are a number of ways to import existing data from MySQL, Percona, or
MariaDB databases to a MySQL database, but the recommended process for a
Rackspace Cloud Database is outlined here.

**Warning:** For imports of very large datasets or imports to mission critical
database instances, we recommend utilizing the Cloud Databases support team,
which is included in the cost of the database, to plan and determine the best
course of action for your particular database.

You can import from databases on Rackspace's public cloud, on another cloud, or
in your own data center. If the data is being imported from a location without
Rackspace ServiceNet access such as another cloud or your data center, you
either need to create a Cloud Server to copy your import file to or to enable
external access on your database by either a Cloud Databases High Availability
(HA) instance group or with a
[Rackspace Cloud Load Balancer](/how-to/connect-to-a-cloud-databases-instance#lb).

### Create a Cloud Database instance to receive the data

1.  Use the [Cloud Control Panel](http://mycloud.rackspace.com),
    [API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-api-reference),
    or [command line client](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#id3)
    to create a Cloud Database instance with an empty database and a username
    and password to access it.

2.  If you need to change any configuration parameters, do so by
    [configuration groups](/how-to/managing-cloud-databases-configuration-groups-in-the-cloud-control-panel)
    on the new database instance.

    **Important:** Changing configuration parameters after the import could have
    unexpected effects on the data and application connecting to it.

### Import using a Rackspace Cloud Server

1.  Once you have a database instance created, click on it and take note of the
    hostname. The hostname is a string of numbers and letters with
    `rackspaceclouddb.com` at the end.

      <img src="{% asset_path cloud-databases/importing-data-into-cloud-databases/Hostname%20of%20Database.png %}" alt="Database Hostname" width="600" />

2.  On the machine where your existing database is currently located, run the
    following MySQL command to export your database:

        mysqldump -u {username} -p {database_name} > {database_name}.sql

    - `username` is the username you use to access the original database.

    - `database_name` is the name of your existing database.

    - `database_name.sql` is the name of the exported database file.

    **Note**: If you are creating a dump from a Cloud Databases, see
    [exporting data](/how-to/exporting-data-from-mysql) for information on how
    to perform this dump.

3.  Use SFTP to copy the exported **.sql** file to the Cloud Server that will
    access your Cloud Database.

4.  With the **.sql** file copied to your Cloud Server, use `ssh` to log in to
    the Cloud Server.

5.  If you don't have a MySQL client installed on your server, install it now.

    - On Ubuntu and Debian, install the client with the following command:

            sudo apt-get install mysql-client

    - On Fedora and CentOS, install the client with this command:

            sudo yum install mysql

6.  Run the following MySQL import command, substituting the long public
    hostname for the `hostname` in the command:

        mysql -h {hostname} -u {username} -p {database_name} < {database_name}.sql

    - `username` is the username you use to access the database.

    - `database_name` is the name of the new database on your Cloud Database.

    - `database_name.sql` is the name of the exported database.

  The database is imported and ready to accept new data.

### Importing to a Cloud Database with public access (HA group or Cloud Load Balancer)

1.  Once you have a database instance created, take note of the hostname on the
    Control Panel. The public hostname for an HA instance looks like a long
    string of numbers and letters followed by `publb.rackspaceclouddb.com`.

    <img src="{% asset_path cloud-databases/importing-data-into-cloud-databases/HA_Group_Details_KC.png %}" width="600" />

2.  On the machine where your existing database is currently located, run the
    following MySQL command to export your database:

         mysqldump -u {username} -p {database_name} > {database_name}.sql

    - `database_name` is the name of your existing database.

    - `database_name.sql` is the name of the exported database file.

    - `username` is the username you use to access the original database.

    **Note**: If you are creating a dump from a Cloud Databases instance, see
    [exporting data](/how-to/exporting-data-from-mysql) for information on how to perform this dump.

3.  Run the following MySQL import command, substituting the long public
    hostname for the `hostname` in the command:

         mysql -h {hostname} -u {username} -p {database_name} < {database_name}.sql

    - `username` is the username you use to access the database.

    - `database_name` is the name of the new database.

    - `database_name.sql` is the name of the exported database.

  The database is imported and ready to accept new data.

### Best Practices

Large imports to new HA or replicated Cloud Databases instances should utilize a
single instance for the import and then convert to HA or add replicas after
import. Importing to a replicated database or HA group causes every transaction
to be replicated and can fill up `binlogs` quickly and place additional load on
the new instance. It is more efficient to import to a single instance then
convert.

If importing between MySQL versions or between different MySQL-based databases
such as from MySQL 5.1 to MySQL 5.6 or from MySQL to MariaDB, always review the
release notes of the destination datastore to ensure that there are no possible
issues that may modify the expected behavior of your application. See
[upgrading a database instance](/how-to/upgrade-a-cloud-databases-instance-from-mysql-51-to-mysql-56)
for an example on how to upgrade from MySQL 5.1 to 5.6.

### Limitations

-   A full instance export (with users and settings) requires root access on
    both the original and new database instances. Import or export of individual
    databases does not require root access.

-   Attempts to export or import the `mysql` system database tables (for
    example, `mysql.user`) can possibly lead to issues with functionality of
    your database instance and require support intervention to recover.

-   Imports of `VIEW`s, `TRIGGER`s, `PROCEDURE`s, or `FUNCTION`s that have a
    definer other than the database user importing data will fail due to a
    requirement for `SUPER` privilege.

### External Links

[MYSQL documentation](http://dev.mysql.com/doc/)

[MariaDB documentation](https://mariadb.com/kb/en/mariadb/documentation/)

[Percona Server documentation](https://www.percona.com/software/mysql-database/percona-server)
