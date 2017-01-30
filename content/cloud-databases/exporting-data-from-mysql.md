---
permalink: exporting-data-from-mysql/
audit_date:
title: Export Data from MySQL
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-20'
last_modified_by: Mike Asthalter
product: Cloud Databases
product_url: cloud-databases
---

Use the following MySQL command to export your database.

    mysqldump -u root -p database_name > database_name.sql

database\_name is the name of your existing database. database\_name.sql
will be the name of the exported database file.

If your database resides on a remote host (as it would if you're using
Cloud Databases), specify the hostname with the "-h" option, as in:

    mysqldump -h host_name -u username -p database_name > database_name.sql

**Note**: Insert the username you created for username in this command.

It's also possible to set the "MYSQL\_HOST" environment variable to the
remote host's address so you don't have to enter it on the command line.

If you want to import this data to another database, see our article on
[Importing Data.](/how-to/importing-data-into-cloud-databases)

### External Links

[MYSQL Documentation](http://dev.mysql.com/doc/)
