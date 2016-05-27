---
permalink: self-migrating-a-mysql-4-database-to-mysql-5/
audit_date:
title: Self-Migrate a MySQL 4 Database to MySQL 5
type: article
created_date: '2011-10-05'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

Cloud Sites will be retiring MySQL 4 soon in favor of MySQL 5. Any sites
using MySQL 4 after November 1, 2011, will be automatically migrated to
MySQL 5.

Migrating affected sites between MySQL versions will of necessity
involve some site downtime. Our automated process is designed to
minimize the downtime and impact of the change, but performing the
migration yourself in advance of the cut-off date will give you control
over the timing and presentation of your site during the process.

The following steps walk through the process of manually migrating a
MySQL 4 database to a MySQL 5 database.

1.  Begin by putting a splash page up for your site stating that you
    are performing maintenance.

2.  Revoke all user access to the database to prevent changes during
    the migration.

    You can revoke access by using your administrative access to rename
    the config file that contains your database link information to a
    filename with the ".mig" extension.

    For example, the file:

        config.php

    ...would be renamed to:

        config.php.mig

3.  Once the filename is changed you can either wait for user
    transactions to complete normally or terminate them manually.

    To check for active transactions use the SQL command:

        SHOW FULL PROCESSLIST

    You can see more information about listing the processes in the
    MySQL manual [Section 12.4.5.27, "SHOW FULL PROCESSLISTSyntax"](http://dev.mysql.com/doc/refman/5.0/en/show-processlist.html).

    If you don't want to wait for active connections to conclude, those
    threads can be killed with the MySQLKILLstatement. For more details
    onKILL, see the MySQL Manual [Section 12.4.6.3, "KILLSyntax"](http://dev.mysql.com/doc/refman/5.0/en/kill.html).

4.  Back up your current MySQL 4 database.

    You may wish to use the method outlined in the How-To
    article [How to backup your MySQL Database with phpMyAdmin](/how-to/backup-your-mysql-database-with-phpmyadmin).

5.  Provision a new MySQL 5 database to contain the
    migrated database.

    For a guide to provisioning a new MySQL 5 database, see the
    How-To article [Adding a MySQL Database to a Website or Domain](/how-to/rackspace-cloud-sites-essentials-mysql-databases).

6.  Import your database into the newly-provisioned MySQL
    5 database.

    Databases that are less than 16 MB in size can be imported easily
    using the *Online Manager* (see [Working with a MySQL database](/how-to/rackspace-cloud-sites-essentials-phpmyadmin-database-management-interface)).

    If the data to be imported exceeds 16 MB, see the [Cloud Sites FAQ](/how-to/cloud-sites-faq).

7.  Update all database references in your website code and
    configuration files.

    Look for any references to the old database's host name, IP address,
    username and password data. Replace those entries with the
    newly-provisioned database's values.

8.  Remove the **.mig** extension from your config file's name.

    Assuming your new user information is valid the site should begin
    processing against the new database in the same manner as before.

This process can take a little while to complete. If your website has
been provisioned in excess of 15 minutes and you are still experiencing
a problem please do not hesitate to contact our technical support 24x7
via phone, chat or by submitting a ticket through your control panel.
