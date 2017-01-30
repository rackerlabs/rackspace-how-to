---
permalink: upgrade-a-cloud-databases-instance-from-mysql-51-to-mysql-56/
audit_date:
title: Upgrade a Cloud Databases instance from MySQL 5.1 to MySQL 5.6
type: article
created_date: '2014-07-03'
created_by: Rose Contreras
last_modified_date: '2015-01-12'
last_modified_by: Kyle Laffoon
product: Cloud Databases
product_url: cloud-databases
---

This article shows you how to upgrade from a MySQL 5.1 instance to a new MySQL 5.6 instance. The steps assume that you have not enabled the root database user on the source or destination instance and that you are using the Rackspace Cloud Control Panel to manage your Cloud Databases.

Because database replication is not available, this article includes some additional steps to ensure that no content is lost during the migration process. As a result, we recommend that you perform this upgrade during a low-traffic period.

### Before you begin

Before you upgrade the instance, we recommend that you review the following change documentation from MySQL. The documentation previews the changes that you can expect from a migration from version 5.1 to 5.6, and it will help you ensure that your application is prepared for the change in functionality between the two versions. This article shows how to upgrade directly from MySQL 5.1 to 5.6 by using the <code>mysqldump</code> command, so you can disregard any mention in the MySQL documentation of having to update table files or file structures directly.

#### Upgrade MySQL 5.1 to MySQL 5.5

<a href="http://dev.mysql.com/doc/refman/5.5/en/upgrading-from-previous-series.html" rel="nofollow">http://dev.mysql.com/doc/refman/5.5/en/upgrading-from-previous-series.html</a>

#### Upgrade MySQL 5.5 to MySQL 5.6

<a href="http://dev.mysql.com/doc/refman/5.6/en/upgrading-from-previous-series.html" rel="nofollow">http://dev.mysql.com/doc/refman/5.6/en/upgrading-from-previous-series.html</a>

#### Back up the original Cloud Databases instance

Using the Rackspace Cloud Control Panel, create a copy of the original instance. If you discover any structure discrepancies after you begin using the new MySQL 5.6 instance, you can rebuild your database from this backup copy to its previous MySQL 5.1 state.

#### Create the destination MySQL 5.6 instance

Using the Rackspace Cloud Control Panel, create a new Cloud Databases instance and choose MySQL 5.6 for the instance type.

**Note:** If your current database uses any custom **my.cnf configuration** options, review the configuration of the new instance to ensure that those options are updated before importing your database. This is especially important when your configuration options involve character set and collation specifications. Custom **my.cnf** options can cause the imported content to not populate the new database instance as expected, leading to discrepancies with table character data encoding.

### Rebuild databases and users for a new MySQL instance

The following steps explain how to generate lists of databases and users from the MySQL 5.1 instance and re-create them on the MySQL 5.6 instance.

#### Rebuild databases on the MySQL 5.6 instance

1. In the Cloud Control Panel, click on the MySQL 5.1 instance. The list of databases is displayed on the Instance Details page.

2. pen the Instance Details page for the new MySQL 5.6 instance, click **Create Database**, and enter the name of a database from the 5.1 instance. Repeat this step until you have re-created all the databases.

#### Rebuild users on the MySQL 5.6 instance

This procedure requires you to reconfigure the passwords for the database users. If your application is already configured for a specific password, you should have the list of passwords before you create the users to prevent you from having to update the application configuration later.

1. In the Cloud Control Panel, click on the MySQL 5.1 instance. The list of users is displayed on the Instance Details page.

2. Open the Instance Details page for the new MySQL 5.6 instance, click **Create User**, and enter the name of a user from the 5.1 instance. Repeat this step until you have re-created all the users.

### Configure the application for read-only or maintenance mode

Configure your application or website to a maintenance mode or read-only state until the transfer has completed. Doing so prevents the addition of any new data to the MySQL 5.1 instance while you are finishing the upgrade and transitioning to the new MySQL 5.6 instance.

**Note:** The sections that follow describe how to export your current databases and import them to the new instance. During this process, the MySQL 5.1 database is in a read-only state, and any updates to the database could potentially be lost to the new destination instance during the export and import process.

### Export databases from MySQL 5.1 and import them to MySQL 5.6

This section provides two methods for exporting and importing the databases by using the <code>mysqldump</code> command. The <code>mysqldump</code> command locks the source database instance as it exports the data. Before you begin, ensure that your application is prepared for the database to be in a read-only state.

#### Export the list of databases and direct the output to the database instance

The following steps export a list of databases from your source instance and redirect the output to a destination instance that you choose.

**Note:** To accomplish the following steps, both instances must have a user with full access to all of the databases that you want to export and import.

1. Log in to a cloud server that is available within the same data center as your source and destination database instances.

2. Execute the following command, replacing the following items in each section of the command:

**<code>mysqldump</code>**

- <code>source\_db_user</code>: Database user created on the source instance for the purpose of exporting
- <code>source_password</code>: Password specified for the source database user
- <code>xxxxx.rackspaceclouddb.com</code>: Host name of thesource instance
- <code>database 01 database 02 database 03</code> List of the databases that you are exporting and importing


**<code>mysql</code>**

- <code>destination_db_user</code>: Database user created on the destination for the purpose of importing
- <code>destination_password</code>: Password specified for the destination database user
- <code>yyyyy.rackspaceclouddb.com</code>: Host name of destination instance

        mysqldump --user=source_db_user --host=xxxxx.rackspaceclouddb.com --password=source_password --no-create-db --databases database_01 database_02 database_03 | mysql
	    --user=destination_db_user --host=yyyyy.rackspaceclouddb.com --password=destination_password</pre>

#### Export the list of databases to a file on the server before importing

This method follows the same concept as the preceding method, but instead of redirecting the <code>mysqldump</code> export directly to the new instance, you first create a copy of the data and compress it on a disk. Then you import the content from this file to the destination instance.

1. Log in to a cloud server available within the same data center as your source and destination database instances.

2. Execute the following command, replacing the following items in each section of the command:

**<code>mysqldump</code>**

- <code>source\_db_user</code>: Database user created on the source instance for the purpose of exporting
- <code>source_password</code>: Password specified for source database user
- <code>xxxxx.rackspaceclouddb.com</code>: Host name of source instance
- <code>database 01 database 02 database 03</code>:List of the databases that you will be exporting and importing

        mysqldump --user=source_db_user --host=xxxxx.rackspaceclouddb.com --password=source_password --no-create-db --databases database_01 database_02 database_03 |
        gzip
        -1 &gt; sourceDB.sql.gz

3. Execute the following command, replacing the following items in each section of the command:
**<code>mysql</code>**

- <code>destination_db_user</code>: Database user created on the destination to be used for importing
- <code>destination_password</code>: Password specified for the destination database user
- <code>yyyyy.rackspaceclouddb.com</code>: Host name of destination instance

        zcat sourceDB.sql.gz | mysql --user=destination_db_user --host=yyyyy.rackspaceclouddb.com --password=destination_password</code>


### Verify the dataset on the MySQL 5.6 instance

Before you transition to the new MySQL 5.6 instance, check the database content to verify that your data was imported and formatted as expected. The <code>mysqldump</code> export creates a logical copy of your database content. The destination MySQL 5.6 database instance takes this logical copy of your data and uses it to rebuild the database table files, using the updated file format implemented by MySQL 5.6. For this reason, it is important to verify that certain configurations such as character sets and time zone data are updated to match your previous 5.1 database instance.

**Note:** For testing purposes, we recommend that you use a staging or test server for your applications to verify functionality before you transition the applications to the new MySQL 5.6 instance.

#### Transition applications to the MySQL 5.6 instance

When you have imported and verified your data, you can transition your applications to the new database instance by using the new host name.
