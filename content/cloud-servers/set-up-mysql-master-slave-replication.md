---
permalink: set-up-mysql-master-slave-replication/
audit_date:
title: Set up MySQL master-slave replication
type: article
created_date: '2011-06-02'
created_by: Rackspace Support
last_modified_date: '2015-08-27'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Master-slave data replication allows for replicated data to be copied to
multiple computers for backup and analysis by multiple parties. Needed
changes identified by a group member must to be submitted to the
designated "master" of the node. This differs from [Master-Master
replication](/how-to/mysql-master-master-replication),
in which data can be updated by any authorized contributor of the group.

This article provides steps for setting up MySQL master-slave database
replication between two cloud servers. The operating system used for the
examples in the article is CentOS 6, built from a Rackspace Cloud
Servers base image.

### Before you begin

The steps in this article use two cloud servers named db01 and db02.
Cloud servers have two IP addresses (one public, one private). The
examples demonstrate configuring replication over the private IP
interface so that no bandwidth charges are incurred. For the duration of
the article, db01 is considered the *master* MySQL server (running in
read-write mode), and db02 is considered the *slave* server (running in
read-only mode).

If you already have a MySQL database running on the master node, a dump
and restore into the slave node is required before configuring
replication between them. You use the **mysqldump** command to dump a
database into a file, then transfer it and restore it to the slave.
After the necessary configuration has been performed, replication is in
effect. For more information, see the **Configure replication**
section.

### Create the Cloud Servers

Create two Linux cloud servers, using the Centos 6 base image. Use the
following steps to create each server separately.

1.  Log in to your [Rackspace Cloud Control
    Panel](https://mycloud.rackspace.com/).
2.  On the Cloud Servers page, click **Create Server**.
3.  Name the servers so that you can easily identify them during
    the setup.
4.  Select the Centos 6 base image.
5.  Select the RAM configuration (flavor) appropriate for your
    database requirements.
6.  Click **Create Server**.

The commands outlined in the following sections need to be executed by a
privileged (root, sudo group) user. Any strings or values specified in
brackets should be replaced with data specific to your setup.

### Install MySQL

You must install the *mysql-server* package on both CentOS Cloud
Servers.


1.  Before installing MySQL, confirm that the package database is
    up-to-date by running the following command:


        #yum update

2.  Install MySQL and enable it to run at boot automatically:


         #yum install mysql-server
        #chkconfig mysqld on

3.  Start the mysqld service:


        #service mysqld start

4.  After the *mysqld* service has been started, set your mysql server
    root password by using following commands:


        /usr/bin/mysqladmin -u root password 'new-password'
        /usr/bin/mysqladmin -u root -h web01 password 'new-password'

    **Note**: Alternatively, you can run the secure installation script
    packaged with the MySQL installation:


        # /usr/bin/mysql_secure_installation
        Enter current password for root (enter for none):
        ...
        Set root password? [Y/n] Y
        ...
        Remove anonymous users? [Y/n] Y
        ...
        Disallow root login remotely? [Y/n] Y
        ...
        Remove test database and access to it? [Y/n] Y
        ...
        Reload privilege tables now? [Y/n] Y

5.  To permit connections on port 3306 (the mysqld default port), add a
    TCP port 3306 rule with an insert at the last line number in the
    RH-Firewall-1-INPUT chain (in this case, line 10):


        # iptables -I RH-Firewall-1-INPUT 10 -p tcp --dport 3306 -j ACCEPT

6.  <span class="mw-headline">Save the firewall configuration:</span>

        # service iptables save

Complete the following section to make relevant configuration changes to
enable replication.

### Configure replication

A MySQL user is required on the master server (db01) to be used for
replication.

1.  Run the following commands to set up the MySQL user, updatng the
    entries in brackets with strings or values you that you want to use
    with your setup.


        # mysql -u root -p
        mysql> grant replication slave on *.* TO [replication_username]@'[private IP of db02]' identified by '[some password]';
        mysql> flush privileges;
        mysql> quit

2.  Edit the **/etc/my.cnf** file and add the following entries:


        bind-address = 0.0.0.0
        server-id = 1
        log-bin = mysql-bin
        binlog-ignore-db = "mysql"

3.  After you have finished updating the **/etc/my.cnf** file, restart
    the MySQL service.


        #service mysqld restart

    Before starting replication, the data on each server (master
    and slave) must be the same. To accomplish this duplication, dump
    the data from the master (db01) server and add it to the
    slave (db02) server, as instructed in the following.

4.  Use the following command to ensure that nothing can write to the
    master database during a database dump. Also note the filename and
    position of the binary log because you will need these values to
    complete the replication configuration on db02.


        # mysql -u root -p
        mysql> FLUSH TABLES WITH READ LOCK;
        mysql> SHOW MASTER STATUS;

        +------------------+--------------------------+------------------+
        | File             | Position  | Binlog_Do_DB | Binlog_Ignore_DB |
        +------------------+--------------------------+------------------+
        | mysql-bin.000010 |        10 |              | mysql            |
        +------------------+--------------------------+------------------+
        1 row in set (0.00 sec)

5.  Perform a database dump by using mysqldump as follows. list all the
    databases barring mysql and information\_schema:


        # mysqldump -u root -p --databases [database-1] [database-2] ...  > /root/db_dump.sql

6.  Aftre the database dump has completed, lift the read lock from the
    master (db01):


        # mysql -u root -p
        mysql> UNLOCK TABLES;

7.  Copy the database dump file to the slave server so that it can
    be restored. You can use the scp command to accomplish this:


        scp /root/db_dump.sql [private-IP-of-db02]:/root/

8.  On db02, edit the **/etc/my.cnf** file and add the following
    entries:


        bind-address = 0.0.0.0
        server-id = 2
        master-host =  [private-IP-of-db01]
        master-user = [replication-username]
        master-password = [replication-password]
        master-connect-retry = 60

9.  Import the **db\_dump.sql** file copied earlier and restart the
    MySQL service.


        # mysql -u root -p < /root/db_dump.sql
        # service mysqld restart

10. Complete the slave replication steps:


        # mysql -u root -p
        mysql> SLAVE STOP;
        mysql> CHANGE MASTER TO MASTER_HOST='[private-IP-of-db01]',
        MASTER_USER='[replication-username]',
        MASTER_PASSWORD='[replication-password]',
        MASTER_LOG_FILE='[file-listed-on-master-status]',
        MASTER_LOG_POS=[log-position-listed-on-master-status];
        mysql> START SLAVE;
        mysql> SHOW SLAVE STATUS\G

    The **Slave\_IO\_State** field should show "Waiting for master to
    send event". If it shows "Connecting to Master" please check your
    MySQL log file. By default it is **/var/log/mysqld.log**
    but it may be configured differently on your system. As
    always **/etc/my.cnf** will define the location of your
    log file.

### Test replication

To test the replication setup, create a new database and associated
table on db01, and insert data to confirm that the changes are mirrored
on db02. In the following example, the new database is called
**testing** and the new table is called **users**:


    # mysql -u root -p
    mysql> create database testing;
    mysql> use testing
    mysql> create table users(id int not null auto_increment, primary key(id), username varchar(30) not null);
    mysql> insert into users (username) values ('foo');
    mysql> insert into users (username) values ('bar');
    mysql> exit

The changes should be visible on db02 immediately.
