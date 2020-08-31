---
permalink: set-up-mysql-primary-replica-replication/
audit_date: '2019-09-06'
title: Set up MySQL primary-replica replication
type: article
created_date: '2011-06-02'
created_by: Rackspace Support
last_modified_date: '2019-09-06'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

**Note**: This article replaces master/slave nomenclature with primary/replica.

Primary/replica data replication enables you to copy replicated data to
multiple computers for backup and analysis by multiple parties. You should submit
necessary changes identified by a group member to the
designated primary of the node. This differs from [Primary-Primary
replication](/how-to/mysql-master-master-replication),
in which any authorized contributor of the group can update data.

This article provides steps for setting up MySQL&reg; primary-replica database
replication between two cloud servers. The operating system used for the
examples in the article is CentOS&reg; 6, built from a Rackspace Cloud
Servers base image.

### Before you begin

The steps in this article use two cloud servers, `db01` and `db02`.
Cloud servers have two IP addresses (one public, one private). The
examples demonstrate configuring replication over the private IP
interface so that no bandwidth charges are incurred. For the duration of
the article, `db01` is considered the *primary* MySQL server (running in
read-write mode), and `db02` is considered the *replica* server (running in
read-only mode).

If you already have a MySQL database running on the primary node, a dump
and restore into the replica node is required before configuring
replication between them. You use the `mysqldump` command to dump a
database into a file, then transfer it and restore it to the replica.
After the necessary configuration has been performed, replication is in
effect. For more information, see the [Configure replication](#configure-replication)
section.

### Create the Cloud Servers

Create two Linux&reg; cloud servers, using the Centos 6 base image. Use the
following steps to create each server separately.

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the top navigation bar, click **Select a Product** then **Rackspace Cloud**.
3.  Select **Servers** then **Cloud Servers**.
4.  Click **Create Server**.
5.  Name the servers so that you can easily identify them during
    the setup.
6.  Select the Centos 6 base image.
7.  Select the RAM configuration (flavor) appropriate for your
    database requirements.
8.  Click **Create Server**.

The commands outlined in the following sections need to be executed by a
privileged root or sudo group user. Any strings or values specified in
brackets should be replaced with data specific to your setup.

### Install MySQL

You must install the *mysql-server* package on both CentOS cloud
servers.


1.  Before installing MySQL, confirm that the package database is
    up-to-date by running the following command:


        #yum update

2.  Install MySQL and enable it to run at boot automatically:


         #yum install mysql-server
        #chkconfig mysqld on

3.  Start the `mysqld` service:


        #service mysqld start

4.  After the `mysqld` service has been started, set your MySQL server
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

5.  To permit connections on port 3306 (the `mysqld` default port), add a
    TCP port 3306 rule with an insert at the last line number in the
    `RH-Firewall-1-INPUT` chain (in this case, line 10):


        # iptables -I RH-Firewall-1-INPUT 10 -p tcp --dport 3306 -j ACCEPT

6.  Save the firewall configuration:

        # service iptables save

Complete the following section to make relevant configuration changes to
enable replication.

### Configure replication

A MySQL user is required on the primary server (`db01`) to be used for
replication.

1.  Run the following commands to set up the MySQL user, updating the
    entries in brackets with strings or values that you plan to use
    with your setup:

    **Note:** You might not need to create the user in the follow code.

        # mysql -u root -p
        mysql> create user [replication_username]@'[private IP of db02]' identified by '[some password]';
        mysql> grant replication slave on *.* TO [replication_username]@'[private IP of db02]';
        mysql> flush privileges;
        mysql> quit

2.  Edit the **/etc/my.cnf** file, and add the following entries:


        bind-address = 0.0.0.0
        server-id = 1
        log-bin = mysql-bin
        binlog-ignore-db = "mysql"

3.  After you have finished updating the **/etc/my.cnf** file, restart
    the `mysqld` service.


        #service mysqld restart

    Before starting replication, the data on the primary
    and replica servers must be the same. To accomplish this duplication, dump
    the data from the primary (`db01`) server and add it to the
    replica (`db02`) server.

4.  Use the following command to ensure that nothing can write to the
    primary database during a database dump. Also note the filename and
    position of the binary log because you need these values to
    complete the replication configuration on db02:


        # mysql -u root -p
        mysql> FLUSH TABLES WITH READ LOCK;
        mysql> SHOW MASTER STATUS;

        +------------------+--------------------------+------------------+
        | File             | Position  | Binlog_Do_DB | Binlog_Ignore_DB |
        +------------------+--------------------------+------------------+
        | mysql-bin.000010 |        10 |              | mysql            |
        +------------------+--------------------------+------------------+
        1 row in set (0.00 sec)

      **Note 1:** Record the filename and position of the binary log because you need these values to
      complete the replication configuration on `db02`.
      
      **Note 2:** Keep this session open, closing it releases the lock!
      
5.  Perform a database dump by using `mysqldump` as follows:

        # mysqldump -u root -p --databases [database-1] [database-2] ...  > /root/db_dump.sql

6.  After the database dump has completed, lift the read lock from the primary
    (`db01`) by typing the following, or by exiting the open session:


        mysql> UNLOCK TABLES;

7.  Copy the database dump file to the replica server so that it can
    be restored by using the following command:


        scp /root/db_dump.sql [private-IP-of-db02]:/root/

8.  On `db02`, edit the **/etc/my.cnf** file and add the following
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

10. Complete the replica replication steps:

        # mysql -u root -p
        mysql> SLAVE STOP;
        mysql> CHANGE MASTER TO MASTER_HOST='[private-IP-of-db01]',
        MASTER_USER='[replication-username]',
        MASTER_PASSWORD='[replication-password]',
        MASTER_LOG_FILE='[file-listed-on-master-status]',
        MASTER_LOG_POS=[log-position-listed-on-master-status];
        mysql> START SLAVE;
        mysql> SHOW SLAVE STATUS\G

    **Note:** The **Slave\_IO\_State** field should show "Waiting for master to
    send event". If it shows "Connecting to Master", check your
    MySQL log file. By default, it is **/var/log/mysqld.log**,
    but it might be configured differently on your system. As
    always, **/etc/my.cnf** defines the location of your log file.

### Test replication

To test the replication setup, create a new database and associated
table on `db01` and insert data to confirm that the changes are mirrored
on `db02`. In the following example, the new database is named
**testing**, and the new table is named **users**:


    # mysql -u root -p
    mysql> create database testing;
    mysql> use testing
    mysql> create table users(id int not null auto_increment, primary key(id), username varchar(30) not null);
    mysql> insert into users (username) values ('foo');
    mysql> insert into users (username) values ('bar');
    mysql> exit

You should see the changes on `db02` immediately.
