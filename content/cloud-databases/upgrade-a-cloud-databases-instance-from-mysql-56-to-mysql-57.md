---
permalink: upgrade-a-cloud-databases-instance-from-mysql-56-to-mysql-57/
audit_date: '2019-01-07'
title: Upgrade a Cloud Databases instance from MySQL 5.6 to MySQL 5.7
type: article
created_date: '2019-01-07'
created_by: Kate Dougherty
last_modified_date: '2019-01-07'
last_modified_by: Kate Dougherty
product: Cloud Databases
product_url: cloud-databases
---

This article shows you how to upgrade from a Cloud Databases MySQL&reg;
5.6 instance to a new MySQL 5.7 instance. The steps assume that you
haven't enabled the root database user on the source or destination
instance and that you're using the Rackspace [Cloud Control
Panel](http://login.rackspace.com) to manage your Cloud Databases.

Because database replication isn't available, this article includes some
additional steps to ensure that no content is lost during the migration
process. As a result, we recommend that you perform this upgrade during a
low-traffic period.

### Before you begin

Before you upgrade the instance, we recommend that you review the change
documentation from MySQL that appears in this section. The documentation
describes the changes that you can expect from a migration from version 5.6
to version 5.7, and helps you ensure that your application is prepared for the
changes in functionality between the two versions.

**Note**: This article shows you how to upgrade your MySQL instance directly
by using the <code>mysqldump</code> command, so you can disregard any mention
in the MySQL documentation of having to update table files or file structures
directly.

Review [Changes in MySQL 5.7](https://dev.mysql.com/doc/refman/5.7/en/upgrading-from-previous-series.html) to learn about changes between MySQL 5.6
and MySQL 5.7.

#### Back up the original Cloud Databases instance

It's important to back up the original instance first. If you discover any
structure discrepancies after you begin using the new MySQL 5.7 instance, you
can use the backup copy to rebuild your database in its previous MySQL 5.6
state.

Use the following steps to create a copy of the original instance:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Click **Databases > MySQL**.

    A list of your Cloud Databases instances appears.

4. Click the gear icon for the instance that you want to back up, then select
   **Create Backup**.

5. Enter a **Name** and **Description** for the backup, then click **Create
   Backup**.

#### Create the destination MySQL 5.7 instance

Use the following steps to create a new Cloud Databases instance:

1. In the Cloud Control Panel, click **Databases > MySQL Instance**.
2. In the **Identity** section of the **Create Instance** page, enter an
   **Instance Name** and select a **Region** from the drop-down list.
3. In the **Engine** section, choose **MySQL 5.7** for the instance type.
4. In the **Build** section, select the amount of memory that you want the
   server to use from the **RAM** drop-down list and choose a **Disk** size.
5. Click **Create Single Instance**.

**Note**: If your current database uses any custom **my.cnf configuration**
options, review the configuration of the new instance to ensure that those
options are updated before you import your database. This step is especially
important when your configuration options involve character set and collation
specifications. Custom **my.cnf** options can cause the imported content to
populate the new database instance in an unexpected way, leading to
discrepancies with table character data encoding.

### Rebuild databases and users for a new MySQL instance

This section explains how to generate lists of databases and users from the
MySQL 5.6 instance and recreate them on the MySQL 5.7 instance.

#### Rebuild databases on the MySQL 5.7 instance

Use the following steps to rebuild databases on the MySQL 5.7 instance:

1. In the Cloud Control Panel, click on the MySQL 5.6 instance.

    The list of databases displays on the **Instance Details** page.

2. Open the **Instance Details** page for the new MySQL 5.7 instance,
   click **Create Database**, and enter the name of a database from the 5.6
   instance. Repeat this step until you have recreated all of the databases.

#### Rebuild users on the MySQL 5.7 instance

To rebuild users on the MySQL 5.7 instance, you first have to reconfigure the
passwords for the database users. If your application is already configured
for a specific password, you should have the list of passwords before you
create the users so that you don't have to update the application
configuration later.

Use the following steps to rebuild users on the MySQL 5.7 instance:

1. In the Cloud Control Panel, click on the MySQL 5.6 instance.

    The list of users displays on the **Instance Details** page.

2. Open the **Instance Details** page for the new MySQL 5.7 instance, click
   **Create User**, and enter the name of a user from the 5.6 instance.
   Repeat this step until you have recreated all of the users.

### Configure the application for read-only or maintenance mode

Configure your application or website to a maintenance mode or read-only state
until the transfer is complete. This step prevents any new data from being
added to the MySQL 5.6 instance while you're finishing the upgrade and
transitioning to the new MySQL 5.7 instance.

**Note**: The following sections describe how to export your current
databases and import them to the new instance. During this process, the MySQL
5.6 database is in a read-only state, and any updates to the database could
potentially be lost to the new destination instance during the export and
import process.

### Export databases from MySQL 5.6 and import them into MySQL 5.7

This section describes two methods for exporting and importing the databases
by using the <code>mysqldump</code> command. This command locks the source
database instance as it exports the data. Before you begin, ensure that your
application is prepared for the database to be in a read-only state.

#### Export the list of databases and direct the output to the database instance

The following steps export a list of databases from your source instance and
redirect the output to the destination instance that you choose.

**Note**: To complete the following steps, both instances must have a user
who has full access to all of the databases that you want to export and import.

Use the following steps to export the list of databases and direct the output
to the database instance:

1. Log in to a cloud server that's available within the same data center as
   your source and destination database instances.

2. Run the <code>mysqldump</code> command, replacing the following items
   in each section of the command:

    - <code>source\_db_user</code>: The database that the user created on the
      source instance for the export
    - <code>source_password</code>: The password specified for the source
      database user
    - <code>xxxxx.rackspaceclouddb.com</code>: The host name of the source
      instance
    - <code>database 01 database 02 database 03</code>: A list of the databases
      that you're exporting and importing

3. Run the <code>mysqldump</code> command, replacing the following items in
   each section of the command:

    - <code>destination_db_user</code>: The database that the user created on
      the destination for the import
    - <code>destination_password</code>: The password specified for the
      destination database user
    - <code>yyyyy.rackspaceclouddb.com</code>: The host name of the
      destination instance

   The following code provides an example:

       mysqldump --user=source_db_user --host=xxxxx.rackspaceclouddb.com --password=source_password --no-create-db --databases database_01 database_02 database_03 | mysql
     --user=destination_db_user --host=yyyyy.rackspaceclouddb.com --password=destination_password

#### Export the list of databases to a file on the server before importing

This method follows the same concept as the preceding method, but instead of
redirecting the <code>mysqldump</code> export directly to the new instance,
you first create a copy of the data and compress it on a disk.
Then you import the content from this file to the destination instance.

Use the following steps to perform this task:

1. Log in to a cloud server that is available within the same data center as
   your source and destination database instances.

2. Run the <code>mysqldump</code> command, replacing the following items
   in each section of the command:

    - <code>source\_db_user</code>: The database that the user created on the
      source instance for the export
    - <code>source_password</code>: The password specified for the source
      database user
    - <code>xxxxx.rackspaceclouddb.com</code>: The host name of the source
      instance
    - <code>database 01 database 02 database 03</code>: A list of the databases
      that you're exporting and importing

   The following code provides an example:

       mysqldump --user=source_db_user --host=xxxxx.rackspaceclouddb.com --password=source_password --no-create-db --databases database_01 database_02 database_03 |
       gzip
       -1 > sourceDB.sql.gz

3. Run the <code>mysql</code> command, replacing the following items in
   each section of the command:

    - <code>destination_db_user</code>: The database that the user created on
      the destination for the import
    - <code>destination_password</code>: The password specified for the
      destination database user
    - <code>yyyyy.rackspaceclouddb.com</code>: The host name of the
      destination instance

    The following code provides an example:

        zcat sourceDB.sql.gz | mysql --user=destination_db_user --host=yyyyy.rackspaceclouddb.com --password=destination_password

### Verify the dataset on the MySQL 5.7 instance

Before you transition to the new MySQL 5.7 instance, check the database
content to verify that your data was imported and formatted in the way that
you expected. The <code>mysqldump</code> export creates a logical copy of your
database content. The destination MySQL 5.7 database instance uses this
logical copy of your data to rebuild the database table files, using the
updated file format that MySQL 5.7 implements. For this reason, it's important
to verify that certain configurations such as character sets and time zone
data are updated to match your previous 5.6 database instance.

**Note**: We recommend that you use a staging or test server for your
applications to verify functionality before you transition the applications
to the new MySQL 5.7 instance.

#### Transition applications to the MySQL 5.7 instance

When you have imported and verified your data, you can transition your
applications to the new database instance by using the new host name.

**Note**: You can also choose to [upgrade a Cloud Databases instance from
MySQL 5.6 to a newer version of MariaDB or Percona
database](/how-to/upgrade-a-cloud-databases-instance-from-mysql-56-to-newer-mariadb-or-percona/).
