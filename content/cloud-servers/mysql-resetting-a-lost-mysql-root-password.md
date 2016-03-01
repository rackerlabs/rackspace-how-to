---
node_id: 405
title: MySQL - Resetting a lost MySQL root password
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

The MySQL root password allows full access to the MySQL database and
allows for all actions to be undertaken including creating new users,
new databases, setting access rules and so on.

Losing one can be a difficult issue to encounter. Luckily, resetting the
root password is easy as long as you have sudo access to the Server.

### Not the Server root user

A common issue is confusing the Server root user with the MySQL root
user.

The Server root user is the server's main user. The MySQL root user has
complete control over MySQL only. The two 'root' users are not connected
in any way.

### Stop MySQL

The first thing to do is stop MySQL. If you are using Ubuntu or Debian
the command is as follows:

    sudo /etc/init.d/mysql stop

For CentOS, Fedora, and RHEL the command is:

    sudo /etc/init.d/mysqld stop

### Safe mode

Next we need to start MySQL in safe mode - that is to say, we will start
MySQL but skip the user privileges table. Again, note that you will need
to have sudo access for these commands so you don't need to worry about
any user being able to reset the MySQL root password:

    sudo mysqld_safe --skip-grant-tables &

**Note**: The ampersand (&) at the end of the command is required.

### Login

All we need to do now is to log into MySQL and set the password.

    mysql -uroot

Note: No password is required at this stage as when we started MySQL we
skipped the user privileges table.

Next, instruct MySQL which database to use:

    use mysql;

### Reset Password

Enter the new password for the root user as follows:

    update user set password=PASSWORD("mynewpassword") where User='root';

and finally, flush the privileges:

    flush privileges;

### Restart

Now the password has been reset, we need to restart MySQL by logging
out:

    quit

and simply stopping and starting MySQL.

#### On Ubuntu and Debian:

    sudo /etc/init.d/mysql stop
    ...
    sudo /etc/init.d/mysql start

#### On CentOS and Fedora and RHEL:

    sudo /etc/init.d/mysqld stop
    ...
    sudo /etc/init.d/mysqld start

### Login

Test the new password by logging in:

    mysql -u root -p

You will be prompted for your new password.
