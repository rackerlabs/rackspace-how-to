---
permalink: importing-data-into-cloud-databases/
audit_date: '2017-02-13'
title: Import data into Cloud Databases
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-02-13'
last_modified_by: Laura Santamaria
product: Cloud Databases
product_url: cloud-databases
---

There are many ways to import data from MySQL, Percona, or MariaDB databases to
a MySQL database. This article describes the recommended process for importing
data to Rackspace Cloud Databases.

**Warning:** For imports of very large datasets or imports to mission critical
database instances, we recommend working with the Cloud Databases support team,
which is included in the cost of the database, to plan and determine the best
course of action for your particular database.

You can import from databases on Rackspace's public cloud, on another cloud, or
in your own data center. If you are importing the data from a location without
Rackspace ServiceNet access, such as another cloud or your data center, you must
either create a cloud server to copy your import file to or enable external
access on your database by using either a high availability (HA) instance group
or a [Rackspace Cloud Load Balancer](/how-to/connect-to-a-cloud-databases-instance#lb).

**Important:** Before you begin, read through the Best practices and Limitations
sections of this article.

### Create a Cloud Databases instance to receive the data

1.  Use the [Cloud Control Panel](http://mycloud.rackspace.com),
    [API](https://developer.rackspace.com/docs/cloud-databases/v1/api-reference/database-instances/#create-database-instance),
    or [command-line client](https://developer.rackspace.com/docs/cloud-databases/v1/getting-started/create-use-database/#creating-a-database-instance-database-and-a-user)
    to create a Cloud Databases instance with an empty database and a username
    and password to access it.

      **Note:** If you want to enable external access by using an HA instance
      group, you must pick that option when creating the database. See
      [Manage Cloud Databases HA instance groups in the Cloud Control Panel](https://support.rackspace.com/how-to/manage-cloud-databases-ha-groups-in-the-cloud-control-panel/)
      for more detailed instructions.

2.  If you need to change any configuration parameters, do so by using
    [configuration groups](/how-to/managing-cloud-databases-configuration-groups-in-the-cloud-control-panel)
    on the new database instance.

      **Important:** Changing configuration parameters *after* the import could have unexpected effects on the data and applications connecting to it.

3. Proceed to one of the following sections depending on how you want to import the data:

    - Import data by using a Rackspace Cloud Server
    - Import to a database with public access (HA group or Cloud Load Balancer)

### Import data by using a Rackspace Cloud Server

1.  After you create the database instance, view its details in the Cloud
    Control Panel and copy the hostname. The hostname is a long string of
    numbers and letters with `rackspaceclouddb.com` at the end. You will need
    the hostname in a later step.

2.  On the machine where your existing database is located, run the
    following MySQL command to export the database:

        mysqldump -u {username} -p {database_name} > {database_name}.sql

    - `username` is the username you use to access the existing database.

    - `database_name` is the name of the existing database.

    - `database_name.sql` is the name of the exported database file.

    **Note**: If you are exporting from a Cloud Databases instance, see
    [exporting data](/how-to/exporting-data-from-mysql) for information about
    how to perform this action.

3.  Use SFTP to copy the exported **.sql** file to the cloud server that will
    access your new database.

4.  Use `ssh` to log in to the server.

5.  If you don't have a MySQL client installed on your server, install one.

    - On Ubuntu and Debian, install the client with the following command:

            sudo apt-get install mysql-client

    - On Fedora and CentOS, install the client with the following command:

            sudo yum install mysql

6.  Run the following MySQL import command:

        mysql -h {hostname} -u {username} -p {database_name} < {database_name}.sql

    - `hostname` is the long public hostname for the database instance that you
      copied in step 1.

    - `username` is the username you use to access the database.

    - `database_name` is the name of the new database in Cloud Databases.

    - `database_name.sql` is the name of the exported database file.

  The database is imported and ready to accept new data.

### Import to a database with public access (HA group or Cloud Load Balancer)

1.  After you create the database instance, view its details in the Cloud
    Control Panel and copy the hostname. The public hostname for an HA instance
    is a long string of numbers and letters with `publb.rackspaceclouddb.com` at
    the end. You will need the hostname in a later step.

2.  On the machine where your existing database is located, run the following
    MySQL command to export the database:

         mysqldump -u {username} -p {database_name} > {database_name}.sql

    - `username` is the username you use to access the existing database.

    - `database_name` is the name of the existing database.

    - `database_name.sql` is the name of the exported database file.

    **Note**: If you are exporting from a Cloud Databases instance, see
    [exporting data](/how-to/exporting-data-from-mysql) for information about
    how to perform this action.

3.  Run the following MySQL import command:

         mysql -h {hostname} -u {username} -p {database_name} < {database_name}.sql

    - `hostname` is the long public hostname for the database instance that you
      copied in step 1.

    - `username` is the username you use to access the database.

    - `database_name` is the name of the new database.

    - `database_name.sql` is the name of the exported database.

  The database is imported and ready to accept new data.

### Best practices

Large imports to new HA or replicated Cloud Databases instances should use a
single instance for the import and then convert to HA or add replicas after
import. Importing to a replicated database or HA group causes every transaction
to be replicated and can fill up `binlogs` quickly and place additional load on
the new instance. It is more efficient to import to a single instance and then
convert.

If you are importing between MySQL versions, such as from MySQL 5.1 to MySQL
5.6, or between different MySQL-based databases, such as from MySQL to MariaDB,
review the release notes of the destination datastore to learn about possible
issues that might modify the expected behavior of your application.

For an example of how to upgrade between versions of MySQL, see
[Upgrade a Cloud Databases instance from MySQL 5.1 to MySQL 5.6](/how-to/upgrade-a-cloud-databases-instance-from-mysql-51-to-mysql-56).

### Limitations

-   A full instance export (with users and settings) requires root access on
    both the original and new database instances. Import or export of individual
    databases does not require root access.

-   Attempts to export or import the `mysql` system database tables (for
    example, `mysql.user`) can possibly lead to issues with the functionality of
    your database instance and require support intervention to recover.

-   Imports of views, triggers, procedures, or functions that have a definer
    other than the database user who is importing data will fail because of a
    requirement for `SUPER` privilege.

### External links

[MYSQL documentation](http://dev.mysql.com/doc/)

[MariaDB documentation](https://mariadb.com/kb/en/mariadb/documentation/)

[Percona Server documentation](https://www.percona.com/software/mysql-database/percona-server)
