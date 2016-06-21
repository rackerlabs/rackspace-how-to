---
permalink: migrating-mysql-50-to-51/
audit_date:
title: Migrate MySQL 5.0 to 5.1
type: article
created_date: '2012-05-15'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

### Now available in Cloud Sites - MySQL 5.1!

Read on to learn the process of migrating your current Cloud Sites
running MySQL 5.0 to begin running on a MySQL 5.1 database.

Migrating your sites to a newer version of MySQL will require a
maintenance period during which your sites will be unavailable.  To
minimize the impact of the migration, you just need to plan ahead and
control the timing and presentation of your site during the process.Here
is an easy-to-follow, five-step process for migrating a MySQL 5.0
database to a MySQL 5.1 database:

1. Begin by putting up a splash page on your site stating that you are
   currently migrating and then revoke all user access to the database
   to be migrated. You can successfully revoke access to the database
   by using your administrative privileges to rename the configuration
   file containing your database link information to a filename with
   the `.mig` extension.

   An example would be naming the **config.php** file to **config.php.mig**.
   After the filename is changed, wait for user transactions to be completed or
   kill them. Threads can be killed with the `KILL` statement.

   To learn more, consult the MySQL documentation from their website and see the
   section [KILL Syntax](http://dev.mysql.com/doc/refman/5.0/en/kill.html).
   To determine if all user connections have been completed or successfully
   killed, use the command `SHOW FULL PROCESSLIST`.

   To learn more about this command, please consult the MySQL documentation
   from their website and look for the section
   [SHOW PROCESSLIST Syntax](http://dev.mysql.com/doc/refman/5.0/en/show-processlist.html).

2. Back up your current MySQL 5.0 database.

   You may wish to use the the process described in the How-to article:
   [How to backup your MySQL database with phpMyAdmin](/how-to/backup-your-mysql-database-with-phpmyadmin).

3. Provision a new MySQL 5.1 database to contain the newly migrated database.  

   For the steps on how to do this, follow the instructions in our How-to
   article: [Adding a MySQL Database](/how-to/rackspace-cloud-sites-essentials-mysql-databases).

4. Import your saved database backup into your newly provisioned MySQL 5.1 database.

   As needed, use the steps in the article, [PHPmyAdmin Database Management Interface](/how-to/rackspace-cloud-sites-essentials-phpmyadmin-database-management-interface)
   to handle imports for databases which are less than 16MB in size without issue.
   If you are importing more than 16MB of data, use the directions in the [Cloud Sites FAQ](/how-to/cloud-sites-faq).

5. Modify all references in your code/configuration files from the old database
   server host name, IP address, username, and password to the respective new
   locations and values on the newly provisioned and migrated database server.

6. Rename the config file back to its original name without the *.mig*
   extension.  Assuming your new user information is valid, the site should
   begin processing against the new database in the same manner as before.
