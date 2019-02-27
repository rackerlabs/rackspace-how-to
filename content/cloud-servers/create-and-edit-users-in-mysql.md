---
permalink: create-and-edit-users-in-mysql/
audit_date: '2019-01-23'
title: Create and edit users in MySQL
type: article
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-01-23'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to create and edit users in MySQL&reg;.

### Log in

1. [Log in to your cloud server](/how-to/connect-to-a-cloud-server/).
2. Log in to MySQL by running the following command:

       mysql -u root -p

You are prompted for your MySQL root password (note that this is not the same as
the Cloud Server root password).

### Create a new user

You can create a new user and set a password for the user at the same time, as
shown in the following example command, which creates a user with the username
`test`:

    CREATE USER 'test'@'localhost' IDENTIFIED BY 'newpassword';

Next, you need to flush the privileges, which reloads the `user` table in
MySQL. You must perform this step each time you add or edit a user.

The following example shows the command that you use to flush privileges:

    FLUSH PRIVILEGES;
    Done.
    Permissions - Select

### Set permissions for the new user

At this stage, your new user (`test`) has no permissions set and can't do
anything. You might want to start setting permissions by assigning `SELECT`
(read-only) permissions on all of the available databases. You can grant
select permissions by running the following command:

    GRANT SELECT ON * . * TO 'test'@'localhost';
    Permissions - All

Create a new database and allow `test` to have full access to it so that they
can create, read, update, and delete records, as shown in the following
example:

    CREATE DATABASE mytestdb;
    Now we have the database and the user, we can assign the privileges:
    GRANT ALL PRIVILEGES ON `mytestdb` . * TO 'test'@'localhost';

**Note**: You must include the backticks that surround the database name.

This is the type of permission that you might want to use when you are setting
up a user and a database for a web application. The user doesn't need to
access any other database.

Flush the privileges by running the following command:

    FLUSH PRIVILEGES;

### Log in as the new user

To verify that the permissions that you set work properly, log in to MySQL as
the new user by running the following command:

    mysql -u test -p

When you are prompted, enter the password for the `test` user.

After you are logged in as the `test` user, try to create a new database
by running the following command:

    CREATE DATABASE mytestdb2;

The following error message displays:

    ERROR 1044 (42000): Access denied for user 'test'@'localhost' to database 'mytestdb2'

This error occurs because the `test` user only has `ALL PRIVILEGES` for
the 'mytestdb' database, and `SELECT` privileges for everything else.

### Drop a user

If you need to drop a user, the process is similar to dropping a database. The
following example shows how to drop the `test` user:

    DROP USER 'test'@'localhost';

**Note**: You must be logged in to MySQL as the root user to perform this
action.
