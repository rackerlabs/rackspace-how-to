---
permalink: creating-and-editing-users-in-mysql
audit_date:
title: Creating and Editing Users in MySQL
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
--- 

### Login

First thing is to log into your Cloud Server via the terminal or PuTTY, etc and then log into MySQL:
mysql -u root -p
You will be prompted for your MySQL root password (note this is not the same as the Cloud Server root password).
New user

Let's jump straight in and create a new user. In this example the username will be 'test'. We'll also set a password for the new user:
CREATE USER 'test'@'localhost' IDENTIFIED BY 'newpassword';
Next we need to flush the privileges which reloads the 'user' table in MySQL - do this each time you add or edit users.
FLUSH PRIVILEGES;
Done.
Permissions - Select

At this stage, our new user ('test') can't do anything as he has no permissions set.
We can start by assigning 'select' permissions on all the available databases. This will allow him to read them but not edit or delete.
Of course, this is just an example of how to set permissions - you may not want a user to have select permissions on all the databases. Please adjust for your needs.
GRANT SELECT ON * . * TO 'test'@'localhost';
Permissions - All

Create a new database and allow 'test' to have full access to it. When done he will be able to create, read, update and delete records as needed.
This is the type of permission set that could be used when setting a user and database for a web application. There would be no need to have the user access any other database.
CREATE DATABASE mytestdb;
Now we have the database and the user, we can assign the privileges:
GRANT ALL PRIVILEGES ON `mytestdb` . * TO 'test'@'localhost';
Note the backticks (`) surrounding the database name.
Flush the privileges:
FLUSH PRIVILEGES;

### Log in as the new user

Logging into MySQL as the new user takes exactly the same format as when we logged in earlier:
mysql -u test -p
You will be prompted for the 'test' user password.
Once logged in, we can try to create a new database:
CREATE DATABASE mytestdb2;
You will get an error like this:
ERROR 1044 (42000): Access denied for user 'test'@'localhost' to database 'mytestdb2'
Which is good news as we granted 'select' privileges to everything and 'all' privileges on the 'mytestdb' database only.
Looks like everything is working very well.

### Dropping a user

There may come a point where we have to part ways with 'test'. In a similar manner to dropping databases, we can simply 'drop' the user.
You will need to be logged into MySQL as the root user for this:
DROP USER 'test'@'localhost';
