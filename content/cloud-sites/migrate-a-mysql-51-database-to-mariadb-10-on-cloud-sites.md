---
permalink: migrate-a-mysql-51-database-to-mariadb-10-on-cloud-sites/
audit_date: '2016-07-29'
title: Migrate a MySQL 5.1 database to MariaDB 10 on Cloud Sites
type: article
created_date: '2015-02-09'
created_by: Thomas Hester
last_modified_date: '2016-07-29'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

Cloud Sites has added MariaDB 10.1 as a database option. Although it is a
different engine, it is fully compatible with the MySQL connections and
syntax. This upgrade is an effort to keep Cloud Sites up-to-date with
current software, security, and usability. New databases can be
provisioned with MariaDB, and users can migrate their databases from
MySQL 5.1 to MariaDB by creating a backup and then importing to a new
MariaDB database. This article provides the steps for such a migration.

**Notes:**

-   Currently, customers in ORD cannot perform MariaDB backups that call _mysqldump_
    because the version on the servers is incompatible with MariaDB 10.1.
    Support can perform these backups, if necessary.

### Availability of MariaDB

MariaDB 10.1 is now available in the ORD and DFW data centers. Migrations in ORD from MySQL 5.1 to MariaDB 10.1 will happen in September.

### MariaDB instead of MySQL 5.6

MariaDB has several features available on top of what is available for
MySQL 5.6. See the following links for more information:

- [MariaDB vs MySQL - features](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/)

- [About the MariaDB Knowledge Base](https://mariadb.com/kb/en/meta/about-the-mariadb-knowledge-base/)

- [MariaDB vs MySQL - compatibility](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-compatibility/)

### Migrate your database from MySQL to MariaDB

#### Phase 1: Create your MariaDB database in the Cloud Sites control panel

1.  Log in to the Cloud Sites Control Panel.

2.  Navigate to the site for which you want to add the database.

3.  Click the **Features** tab.

4.  Under Databases, click **Add**.

5.  Enter a unique name for the database, select **MariaDB 10.1** from the
    **Database Type** menu, and then click **Continue**.

6.  Enter the username and password to use for the database, and then
    click **Finish**.

    The **Features** tab is displayed again.

7.  Click on the newly created database to display the hostname
    information, which you will need in [Phase 3](#Phase 3).


#### Phase 2: Put your site into maintenance mode and export your current database

There are multiple ways to put a site into maintenance mode, or
otherwise take it offline temporarily, but those instructions are beyond
the scope of this article. The most simple method is to rename your
content folder in an FTP client and create a new content folder with an
**index.html** file that contains your maintenance message. After the
database migration is completed, you reverse this action.

Export your current MySQL database either by [using phpMyAdmin](/how-to/backup-your-mysql-database-with-phpmyadmin) or by [using a cron task](/how-to/how-do-i-schedule-a-cron-job-for-cloud-sites).

After it is exported, you will import the database backup to MariaDB by
using the same method that you used to export the file.

#### Phase 3: Update your connection strings to the new MariaDB settings

Open any files that contain the connection settings for your database,
and update them to the MariaDB settings from the database
information window that was displayed at the end of [Phase 1](#Phase 1).

#### Phase 4: Put your site back online

Take the site out of maintenance mode and refresh any caches on your
site to ensure that all references are updated for the new connections.
The data is the same as it was, but it is good practice to refresh after
a technology change to ensure that everything is up-to-date and works as
expected.
