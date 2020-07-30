---
permalink: import-a-mysql-databases/
audit_date: '2020-04-02'
title: 'Import a MySQL Database'
type: article
created_date: '2020-03-25'
created_by: James Andrade
last_modified_date: '2020-04-02'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Before you import a MySQL&reg; backup, you can create a **.my.cnf** file with the root credentials. This file enables you to avoid having to input the password when you restore the databases and also helps if you want to create a cron job script to backup MySQL daily.

Store your MySQL root password in **/root/.my.cnf**, as shown in the following example, and use `chmod 600` to set appropriate permisssions for the file.

    [client]
    user=root
    password=yourmysqlrootpassword

### Restore commands

Use the following command to restore a single database:

    $ mysql [database_name] < /path/to/backup/backupfile.sql

Use the following command to restore all databases. The tables need to exist, or backup needs to contain CREATE TABLE statements:

    $ mysql < /path/to/backup/alldatabases.sql
