---
permalink: managing-users-for-cloud-databases/
audit_date:
title: Managing Users for Cloud Databases
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Mike Asthalter
product: Cloud Databases
product_url: cloud-databases
---

You can perform the following user management operations for Cloud
Databases.

### Create Users with Host Parameters

 You can create a user in the Cloud Databases section of the Cloud
Control Panel by clicking on an existing instance name and then clicking
Create User in the Users section of the Instance Details page.


#### Creating Users

When you create a new user, consider the following requirements and
limitations.

-   All users have full privileges on the databases to which they
    are assigned.
-   User names cannot contain more than 16 characters.
-   There is no restriction on the number of characters in a
    user's password.
-   You can assign one or more databases to the user.
-   A database can be assigned to a user when created.

#### Valid Characters for User Names and Passwords

The following characters are valid for user names and passwords:

-   Letters, both uppercase and lowercase, are allowed.
-   Numbers, spaces, and the symbols @, ?,  and \# are allowed, but
    spaces are not allowed at the beginning or end of the user name
    or password.
-   The underscore symbol (\_) is allowed anywhere in the database name,
    user name, or password

#### Limitations on User Names and Passwords

The following characters are not allowed when you create user names or
passwords:

-   Single quotation marks
-   Double quotation marks
-   Back quotation marks
-   Semicolons
-   Commas
-   Backslashes
-   Forward slashes
-   Spaces at the beginning or end of the user name or password

#### Valid Characters for Host Names

 The host parameter should be a numeric IPv4 address that describes the
host from which the user must connect (such as 192.168.1.12) or the
symbol %. The symbol % serves as a wildcard to MySQL, and means "from
anywhere". Users created without a host parameter are given the default
value of %, which allows them to connect to the database from any host.

-   Valid host name - 111.111.111.11
-   Invalid host name - server1.test.com

### Modify User Accounts

You can perform the following operations to modify a user by clicking
the cog icon next to the user name:

-   Edit the user name and host
-   Change the user's password
-   Delete the user
-   Manage database access (grant or revoke access to
    specific databases)

### Manage Database Access for Users

Clicking the Manage Database Access command in the actions menu will let
you control user access to each database. To revoke a user's access to a
database, click the "-" button next to the database name in the list.


To grant a user access to a database, click the Add Access button. In
the list of databases for which the user does not already have access,
select the check boxes next to the appropriate database names and then
submit the changes to put them into effect.


**Note:** Through the Control Panel, users can only be granted or
revoked full permissions on a database. To add more specific
permissions, you must enable the root user as described in the following
section.

### Set Access-Level Permissions for Individual Users

Currently the Control Panel allows you to grant or revoke user access
for a given database, but all users are granted universal privileges on
the database by default. Because of security concerns or other
application needs, you may need to set specific privileges for a user
such as granting some users read-only access to a specific database for
reporting purposes. To completely control permissions for a user, you
must enable the root user for your database instance. After the root
user is enabled, you can log in to MySQL and manage the access
privileges for individual users.

There are two ways to enable root user on Cloud Databases. One way is by
using the [Trove Command Line
Tool](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#using-the-trove-client),
generally referred to as the CLI. Instructions for using this tool
follow. Another way to enable the root user is through the
[API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#enable-root-user).
Support for access-level control on Cloud Databases through our
Control Panel will be provided in the future.

#### Using the Trove Command Line Tool

In order to use the CLI, first you must [install the trove
client](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#id5).
After installing the trove client, you can enable the root user for the
database instance by using the following command, where &lt;instance&gt;
is the ID of the instance:

    $ trove root-enable <instance>

This command generates a password for the root user. Store this password
because  it is required to log in as a root user for the database
instance. After the root user is enabled, you have full control for
creating and managing user privileges.

*Example* - Database instance MySQLDBInstance01 has a database
DBStaging1 and a user DevUser1. You would like to set up read-only
permissions for DevUser1.

Step 1: List database instances to get the instance ID:

    $ trove list

Step 2: Enable the root user on MySQLDBInstance01, with instance ID
23a6481f-f98a-4fcd-b4a9-54d06f6f6e88:

    $ trove root-enable 23a6481f-f98a-4fcd-b4a9-54d06f6f6e88

A password is generated and returned for the root user.

Step 3: Log in to MySQL as a root user with the password generated in
the preceding step:

    $ mysql -u <root> -h <hostname> -p <password>

Step 4: In MySQL, set up read permissions for DevUser1 by using the
GRANT statement:

    $ GRANT SELECT on DBStaging1.* to 'DevUser1'@'hostname';

**Note:**  You can reset the root user password by making subsequent
calls to enable the root user.

#### Using the API

If you want to enable the root user via the API, you can follow the
examples located in our [API
documentation](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#enable-root-user).
