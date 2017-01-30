---
permalink: mysql-master-master-replication/
audit_date:
title: Configure MySQL Master-Master Replication
type: article
created_date: '2011-06-07'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

**Note**: Rackspace Support cannot assist with master-master replication setups due to the complexity of configuration and likelihood of error.  As an alternative to direct MySQL master-master replication, consider either our [Cloud Databases](http://www.rackspace.com/cloud/databases/) service or a replication engine like [Tungsten](https://code.google.com/p/tungsten-replicator/) for more reliable data replication between database instances.

### MySQL Master-Master Replication

This article is about setting up [MySQL Master-Master database replication](http://dev.mysql.com/doc/refman/5.6/en/mysql-cluster-replication-multi-master.html) between two Cloud Servers. Master-Master data replication allows for replicated data, stored on multiple computers, to be updated by any authorized contributing member of the group. This allows for more open collaboration than [Master-Slave replication](/how-to/set-up-mysql-master-slave-replication) where any needed changes identified by a group member must to be submitted to the designated "master" of the node.

The operating system we will use is Debian 5 (Lenny), built from the Rackspace Cloud base image.

### Setup Outline

We will have two Cloud Servers, named debian501 and debian502 for the purpose of this exercise. Both servers have two IP addresses (one public, one private). We will configure the replication to be done over the private IP interface so that we don't incur any bandwidth charges.

### Creating the Cloud Servers

You will need to create two Linux Cloud Servers, using the Debian 5 base image. Use the following steps to create each server separately.

1. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).
2. On the Cloud Servers page, click **Create Server**.
3. Name the servers so that you can easily identify them during setup. In this exercise they are named debian501 and debian502.
4. Select the Debian image.
5. Select the RAM configuration (flavor) meets your database requirements.
6. Click **Create Server**.

Note that the commands listed below are to be run as a privileged (root, sudo group) user.

### Installing MySQL

First we need to install MySQL on both the Debian Cloud Servers. As always, prior to installing any packages, we need to make sure that our package list is up to date and our locale/language settings are configured properly.

- Update the package database:

      # aptitude update

- Install locales:

      # aptitude install locales

      # dpkg-reconfigure locales

- The `dpkg-reconfigure locales` command will bring up a locales setting window where you can choose the locales for your system depending on your country and region. In this case we have chosen *en\_GB.UTF-8*.

- Now, you can run the following commands to install MySQL:

      # aptitude install mysql-server mysql-client libmysqlclient15-dev

### Configuring replication

Once the _mysql-server_ package has been installed successfully, we can start configuring each of the MySQL nodes in order to enable replication between them.

We need to create the database that will be replicated as well as the replication username and password to be used with it. You can use the commands outlined below to set them up, remembering to change all the strings/values in brackets to apply to your specific configuration.

- First on debian501, login to the _mysql console_ (using mysql root password setup during MySQL installation).

      # mysql -u root -p
      mysql>

- Now let's create the replication user, which will be used to synchronize the changes.

      mysql> grant replication slave on \*.\* to slaveuser@'[private IP of debian502]' identified by '[some password]';
      mysql> flush privileges;
      mysql> exit

- Do the same for debian502

      mysql> grant replication slave on \*.\* to slaveuser@'[private IP of debian501]' identified by '[some password]';
      mysql> flush privileges;
      mysql> exit

- Back on debian501, edit _/etc/mysql/my.cnf_ and insert/update or uncomment following entries:

      bind-address = 0.0.0.0
      server-id = 1
      log-bin = /var/log/mysql/var/bin.log
      log-slave-updates
      log-bin-index = /var/log/mysql/log-bin.index
      log-error = /var/log/mysql/error.log
      relay-log = /var/log/mysql/relay.log
      relay-log-info-file = /var/log/mysql/relay-log.info
      relay-log-index = /var/log/mysql/relay-log.index
      auto_increment_increment = 10
      auto_increment_offset = 1
      master-host = [private IP address of debian502]
      master-user = [replication username]
      master-password = [replication password]
      replicate-do-db = <database name to be replicated>

- Repeat the steps on the debian502 server

      bind-address = 0.0.0.0
      server-id = 2
      log-bin = /var/log/mysql/bin.log
      log-slave-updates
      log-bin-index = /var/log/mysql/log-bin.index
      log-error = /var/log/mysql/error.log
      relay-log = /var/log/mysql/relay.log
      relay-log-info-file = /var/log/mysql/relay-log.info
      relay-log-index = /var/log/mysql/relay-log.index
      auto_increment_increment = 10
      auto_increment_offset = 2
      master-host =  [private IP address of debian501]
      master-user = [replication username]
      master-password = [replication user password]
      replicate-do-db = [database name to be replicated]

- Now, restart both databases. If the service restart on either server fails, then please check the **/var/log/mysql/error.log** file for any errors. Update the configuration and check for any typos, etc.,

### Testing the scenarios

For the purpose of testing our replication setup, we can create the database specified in the configuration section above, as well as a test table on one of the nodes and watch the log files in **/var/log/mysql** directory. Note that all database changes should be replicated to our other server immediately.

      mysql> create database [your-db-name];
      mysql> use [your-db-name]
      mysql> create table foo (id int not null, username varchar(30) not null);
      mysql> insert into foo values (1, 'bar');

- An additional test is to stop the MySQL service on debian502, making database changes on the debian501 server and then restarting the MySQL service on debian502. The debian502 MySQL service should sync up all the new changes automatically.

- You should also consider changing the default binary log rotation values (expire_logs_days and max_binlog_size) in the **/etc/mysql/my.cnf** file, as by default all the binary logs will be kept for 10 days. If you have high transaction count on your database application then it can cause significant hard disk space usage in logs. So, we recommend changing those values to match your server backup policies. For example, if you have daily backups setup of your MySQL node then it makes no sense to keep 10 days worth of binary logs.
