---
permalink: create-a-database-user-with-read-only-access-for-sql-server-databases/
audit_date:
title: Create a database user with read-only access for SQL Server databases
type: article
created_date: '2011-03-23'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

This article explains how to log in to MyLittleAdmin and use that tool
to create additional database users that have limited access. You can
specify a read-only user this way. You must create an additional user
beforehand within the control panel of that database.

1.  Log in to MyLittleAdmin by using the credentials for the database.
    For more information about logging in and the credentials that you
    need, see [Rackspace Cloud Essentials - MyLittleAdmin Database Management Interface](/how-to/rackspace-cloud-sites-essentials-mylittleadmin-database-management-interface).
2.  In the Databases section of the left navigation pane, expand **User
    Databases**.
3.  Expand your database name.
4.  Expand **Security > Roles > Database Roles**.
5.  Click **db_datareader**.
6.  Select the corresponding user from the **Owner** menu.
7.  Click **Update**.

Alternately, you can limit a user's access by selecting the type of
roles that this user can perform. You can also provide this user in a
connection string for better security.
