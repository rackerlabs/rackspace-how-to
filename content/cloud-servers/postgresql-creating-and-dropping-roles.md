---
permalink: postgresql-creating-and-dropping-roles/
audit_date:
title: Create and Drop Roles in PostgreSQL
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

For testing and production use of our database server, we'll want to
create additional roles, as it's not recommended to work regularly in
our databases as the default superuser role.

However, to create additional roles we do need to run some commands as
the postgres superuser role. This will require a login as the Linux user
named "postgres".

First, we need to login to our slice as a normal Linux user, then:


    # sudo su - postgres

### Connect with psql

Now connect to the database server using the
[psql](http://www.postgresql.org/docs/8.3/static/app-psql.html "http://www.postgresql.org/docs/8.3/static/app-psql.html")
client, as the postgres role:

    postgres@demo:~$ psql -U postgres
    ...
    Welcome to psql 8.3.6, the PostgreSQL interactive terminal.

    Type:  \copyright for distribution terms
           \h for help with SQL commands
           \? for help with psql commands
           \g or terminate with semicolon to execute query
           \q to quit

    postgres=#

### Create a role

Connected with the psql client, we'll create a role that has the LOGIN
attribute and a non-empty MD5-encrypted password:

    postgres=#CREATE ROLE demorole1 WITH LOGIN ENCRYPTED PASSWORD 'password1';

Note the required trailing semicolon ( ; ) at the end of the SQL
statement. The single-quotes ( ' ' ) are not part of the password, but
must enclose it.

Did it work? We can check using `\du` command:

    postgres=# \du
                                   List of roles
     Role name | Superuser | Create role | Create DB | Connections | Member of
    -----------+-----------+-------------+-----------+-------------+-----------
     demorole1 | no        | no          | no        | no limit    | {}
     postgres  | yes       | yes         | yes       | no limit    | {}
    (2 rows)

### Drop a role

What if we want to drop (delete, remove) a role? Easy:

    postgres=# DROP ROLE demorole1;

If we check with the `\du` command we'll see that `demorole1` is no
longer listed.

### Alternative method: createuser and dropuser

Alternatively, we can create and drop database roles using the
[createuser](http://www.postgresql.org/docs/8.3/static/app-createuser.html "http://www.postgresql.org/docs/8.3/static/app-createuser.html")
and
[dropuser](http://www.postgresql.org/docs/8.3/static/app-dropuser.html "http://www.postgresql.org/docs/8.3/static/app-dropuser.html")
shell commands, which are basically "wrappers" for the CREATE and DROP
SQL statements. They are included in a standard postgres installation.

With our present setup, we can only run these commands (successfully) as
the postgres Linux user. We're still connected with the psql client, so
let's exit with Ctrl-D or the `\q` command:

    postgres=# \q
    ...
    postgres@demo:~$

Good, we have a shell prompt as the postgres Linux user.

#### createuser

With
[createuser](http://www.postgresql.org/docs/8.3/static/app-createuser.html "http://www.postgresql.org/docs/8.3/static/app-createuser.html")
we'll create a non-superuser role that has the LOGIN attribute.

    postgres@demo:~$ createuser -PE demorole2

With the `-P` flag we're prompted to set a password for the new role,
and the `-E` flag indicates the password should be stored as an
MD5-encrypted string.

    Enter password for new role:
    Enter it again:
    ...
    postgres@demo:~$

Having supplied and confirmed the password, we're returned to a shell
prompt. If we reconnect with psql and run the `\du` command, we'll get
this:

    postgres=# \du
                                   List of roles
     Role name | Superuser | Create role | Create DB | Connections | Member of
    -----------+-----------+-------------+-----------+-------------+-----------
     demorole2 | no        | no          | no        | no limit    | {}
     postgres  | yes       | yes         | yes       | no limit    | {}
    (2 rows)

#### dropuser

We can drop (delete, remove) a role with the
[dropuser](http://www.postgresql.org/docs/8.3/static/app-dropuser.html "http://www.postgresql.org/docs/8.3/static/app-dropuser.html")
shell command:

    postgres@demo:~$ dropuser -i demorole2
    ...
    Role "demorole2" will be permanently removed.
    Are you sure? (y/n) y
    ...
    postgres@demo:~$

The `-i` flag provides a confirmation prompt, which is a good safety
measure when running a potentially destructive command.

### Creating a superuser

On occasion, we'll want to create additional superuser roles, e.g. when
we have a database programmer whom we trust to administer our postgres
server.

We can do this with the `createuser` shell command and the `-s` flag:

    postgres@demo:~$ createuser -sPE mysuperuser

Alternatively, we can do the same thing from within a psql session, when
we're connected as the postgres role (or another existing superuser):

    postgres=#CREATE ROLE mysuperuser2 WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD 'mysuperpass2';

We've set the LOGIN attribute and a non-empty password, an important step if
this superuser role will be specified for local and remote connections
to the database. We've also set the CREATEDB and CREATEROLE attributes.
With those attributes specified, our SQL statement will match the action
of the `createuser -sPE` command.
