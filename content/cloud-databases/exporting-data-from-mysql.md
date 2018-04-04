---
permalink: exporting-data-from-mysql/
audit_date: '2018-04-04'
title: Export Data from MySQL
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-04-04'
last_modified_by: Kate Dougherty
product: Cloud Databases
product_url: cloud-databases
---

To export your MySQL database, use the following MySQL command:

    mysqldump -u root -p database_name > database_name.sql

database\_name is the name of your existing database. database\_name.sql
is the name of the exported database file.

If your database resides on a remote host (as it would if you're using
Cloud Databases), specify the hostname with the "-h" option:

    mysqldump -h host_name -u username -p database_name > database_name.sql

**Note**: Insert the username you created in this command.

It's also possible to set the "MYSQL\_HOST" environment variable to the
remote host's address so that you don't have to enter it on the command line.

If you want to import this data to another database, see
[Importing Data.](/how-to/importing-data-into-cloud-databases)

### External links

The following external links provide additional information:

- [MYSQL Documentation](http://dev.mysql.com/doc/)
