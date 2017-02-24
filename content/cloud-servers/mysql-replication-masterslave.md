---
permalink: mysql-replication-masterslave/
audit_date:
title: 'Configure MySQL Master-Slave replication'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-05-06'
last_modified_by: David Hendler
product: Cloud Servers
product_url: cloud-servers
---

MySQL replication enables one database server (referred to as the Master server in this article) to be replicated to one or more database servers (referred to as the Slave servers in this article). With MySQL, replication is asynchronous. This means the slave servers do not need to be connected permanently to receive updates from the master server. For example, you can stop the slave thread on the slave server and restart it at a later time and it will automatically synchronize with the Master.

This tutorial will explain a simple setup (a single master server replicating to a single slave server) that replicates all databases from the master to the slave.

### Prerequisites

Before beginning this tutorial, complete the following steps.

- Install your operating system. (The steps in this article are completed using a CentOS operating system)
- Install mysql
- Install mysql-devel
- Install mysql-server

**Note:** The procedure in this article:

- describes replication configuration on a new set of servers with no data or database. This is important because existing data on servers will throw off the replication

- can be used for other flavors of Linux

### Collect IP Information

The MySQL configuration in this article replicates over the private IPs of your cloud server. Make note of the private IP of each server.

    [user@mysql-master ~]$ /sbin/ifconfig

You will see the following output:


     eth0      Link encap:Ethernet  HWaddr 40:40:51:B7:A4:2E
               inet addr:67.23.9.185  Bcast:67.23.9.255  Mask:255.255.255.0
               inet6 addr: fe80::4240:51ff:feb7:a42e/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:28878 errors:0 dropped:0 overruns:0 frame:0
               TX packets:15147 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000
               RX bytes:37708534 (35.9 MiB)  TX bytes:1129533 (1.0 MiB)

     eth1      Link encap:Ethernet  HWaddr 40:40:1A:AF:35:F2
               inet addr:10.176.41.72  Bcast:10.176.63.255 Mask:255.255.224.0
               inet6 addr: fe80::4240:1aff:feaf:35f2/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:3 errors:0 dropped:0 overruns:0 frame:0
               TX packets:13 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000
               RX bytes:230 (230.0 b)  TX bytes:762 (762.0 b)

     lo        Link encap:Local Loopback
               inet addr:127.0.0.1  Mask:255.0.0.0
               inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:16436  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0
               RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

You want to note the IP that is shown for `eth1`. The IP address is listed right after `inet addr:`. In this example, our master server's private IP is 10.176.41.72. Repeat this on the slave server and note the private IP.

**Slave:**

     [user@mysql-slave ~]$ /sbin/ifconfig
     eth0      Link encap:Ethernet  HWaddr 40:40:BE:90:EB:1E
               inet addr:67.23.10.69  Bcast:67.23.10.255  Mask:255.255.255.0
               inet6 addr: fe80::4240:beff:fe90:eb1e/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:29047 errors:0 dropped:0 overruns:0 frame:0
               TX packets:13527 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000
               RX bytes:37743828 (35.9 MiB)  TX bytes:1473375 (1.4 MiB)

     eth1      Link encap:Ethernet  HWaddr 40:40:AE:5B:35:3A
               inet addr:10.176.41.207  Bcast:10.176.63.255 Mask:255.255.224.0
               inet6 addr: fe80::4240:aeff:fe5b:353a/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:3 errors:0 dropped:0 overruns:0 frame:0
               TX packets:13 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000
               RX bytes:230 (230.0 b)  TX bytes:762 (762.0 b)

     lo        Link encap:Local Loopback
               inet addr:127.0.0.1  Mask:255.0.0.0
               inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:16436  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0
               RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

The IP address for our slave server in this example is 10.176.41.207. When you have both private IPs noted somewhere, you're good to start configuring.

### Configure the server

#### Master

- Edit the **/etc/my.cnf** file on the Master server to enable binary logging and set the server's name.

        [user@mysql-master ~]$ sudo vi /etc/my.cnf

- Add these lines under the <code>mysqld</code> section.

        log-bin=/var/lib/mysqllogs/RackspaceServerID-theServerShortName-binary-log
        expire_logs_days=7
        server-name=<server_number>

- Set the replication user.

        mysql> GRANT REPLICATION SLAVE ON *.* to 'replicant'@'slaveIP' IDENTIFIED BY 'somepassword';

The master my.cnf configuration is complete.

#### Slave preparation

- Verify that the time zones match between master and slave.
- Set the following items:

        relay-log=/var/lib/mysqllogs/RackspaceServerID-theServerShortName-relay-log
        relay-log-space-limit = 16G
        read-only=1
        server-name=<server_number>


#### Initial copy of data to slave

Choose one of the following options to copy data over to the slave.

- mysqldump
- Copy the flat files

####  mysqldump

Consider this option if the data directory is a reasonable size, and if you can have your tables locked for the duration of the procedure.

     mysqldump -A --flush-privileges --master-data=1 | gzip -1 > ~rack/master.sql.gz

Transfer the dump file to the slave and import it.

#### Copy the flat files

For this method, stop MySQL on both servers and move the data directory out of the way on the slave. If MySQL is not stopped on both servers, it will be necessary to make a backup:

     # mv /var/lib/mysql{,.prereplication}

Use one of the methods listed above to make the data directory on the slave into a copy from the master. For example:

     # rsync -azv --progress --delete /var/lib/mysql/ slave:/var/lib/mysql/

When the data copy is finished, restart MySQL on both servers. Verify that `innodb-log-file-size` in **/etc/my.cnf** is set the same for slave and master, or MySQL will not start on the slave.

If slave is a newer version of MySQL, run <code>mysql_upgrade</code> on slave before issuing the `start slave` command.

### Attach slave to master

You will need the binary log filename and position from the master that corresponds with the backup. If you are using `mysqldump`, this will be included in the **master.sql.gz** file itself.

     # zgrep -m 1 -P 'CHANGE MASTER' master.sql.gz
     CHANGE MASTER TO MASTER_LOG_FILE = '<binary log filename>', MASTER_LOG_POS = <binary log position>;

For a file level copy such as a cold copy obtained by shutting down MySQL and using `rsync`, the binary log filename and position will be the first log file created after restarting MySQL.

You can obtain this by following these steps:

     # service mysqld stop
     # tail -n 1 /var/lib/mysqllogs/db1-1234-bin-log.index
     /var/lib/mysqllogs/db1-1234-bin-log.000001
     # rsync ...
     # service mysqld start

In this case, start at filename `db1-bin-log.000001 + 1 = db1-1234-bin-log.000002` at the beginning of this file. You will get this result:

     MASTER_LOG_FILE = 'db1-1234-bin-log.000002', MASTER_LOG_POS = 4

Now execute <code>CHANGE MASTER</code> on the slave to set the credentials for connecting to the master, as well as the binary log file and position to start replication from.

     mysql> change master to master_host='master-ip',master_user='userSetAbove', master_password='passwordSetAbove',master_log_file='logfile-from-above-command', master_log_pos=4;
     mysql> start slave;

### MySQL root credentials

Make sure that the new slave has the same credentials in the **/root/.my.cnf** file as the master server. The MySQL database and user grants table will also sync over to the slave.

### Holland

Because you imported the MySQL database from the master, all passwords are now the same. Just as you updated the **/root/.my.cnf** on dbSlave to match dbMaster, you might need to update the **/etc/holland/backupsets/default.conf** file to use the same credentials as the master for `rackspace_backup`.

### Testing

Test your settings by creating a dummy database on the master and verifying that it shows up on the slave. Once verified, you can drop the dummy database and confirm the slave automatically drops it.

If you see an error like `Last_IO_Error: error connecting to master`, manually test the replication user. From the slave, try two things:

    nc masterIP 3306

If you see an error here, your grant is wrong, probably because you are in a different network segment than you thought. The error will look like `Host dbSlave is not allowed to connect to this MySQL server`.

    mysql -ureplicant -hmasterDb -p

If you get an error, your grant is wrong.

If either of those fail to connect, you might need to adjust the firewall or verify that you are making correct assumptions about how the network is laname out for this customer.

### Filtering

It is recommended that you not use replication filtering. If you want to exclude some tables from the slave, the only recommended method is with one of the following **my.cnf** options configured on the slave:

     replicate-wild-do-table=dbase1.%
     replicate-wild-do-table=dbase3.%

     replicate-wild-ignore-table=dbase2.%
     replicate-wild-ignore-table=dbase4.someTable

Patterns can contain the wildcard characters `%` and `\_`, which have the same meaning as the `LIKE` pattern-matching operator. If you need to use a literal \_ character, escape it as follows:

     replicate-wild-ignore-table=%.%\_tmp

In MySQL 5.5, database-level filtering options are case sensitive on platforms supporting case sensitivity in filenames. Table-level filtering options are not case sensitive on any platform, regardless of the value of the <code>lower_case_table_names</code> system variable.

### Events

If **my.cnf** has been enabled on the master, you can disable it on the slave. If the event scheduler does need to be enabled on the slave, verify that the existing events were created with `CREATE EVENT ... DISABLE ON SLAVE` with something like: <code>select db, name from mysql.event where status not in ('disabled','slavename_disabled');</code>

### Monitoring

Always monitor replication. In Emerging, we generally use SiteScope Content Match with check_replication.php, which typically lives in snamee httpd running on the slave.

You will need to issue the GRANT for this on the master, which replicates to the slave:

     GRANT REPLICATION CLIENT ON *.* TO 'rep_monitor'@'slavePrimaryIP' IDENTIFIED BY 'somePassword';

Assuming you are behind a firewall, the 'slavePrimaryIP' should be the internal IP of the slave server [192.168.100.x]. In the check_replication.php script, set <code>host='192.168.100.x</code>, the internal IP of the server the script is running on. This is usually the same as <code>slavePrimaryIP</code>.

Contact your account manager and request setup of the SiteScope monitor. The URL should be the public IP of the monitoring server, for example <code>http://68.23.45.32/check_replication.php</code>

[https://wiki.rackspace.corp/Databases/MySQL/ReplicationMonitoringScript](https://wiki.rackspace.corp/Databases/MySQL/ReplicationMonitoringScript)

**Note:** The script can have additional elements in the <code>dsn list</code> array and check multiple slaves with a single SiteScope probe. The PHP documentation states that the comma after the last array element is optional and can be omitted. However, with the SiteScope probe checking multiple slaves, it may be less clear which slave had a problem when the alert clears quickly. In this regard, it can make sense to have a check_replication.php and corresponding SiteScope probe running on each slave.

Wasn't too bad, was it? Now sit back and let your Slave server replicate from the Master. Be sure not to perform any writes to the Slave server as this will break replication! All writes performed on the Master will automatically be sent to the slave via the binary log and replication. For more information on MySQL replication, go here: <a class="external free" href="https://dev.mysql.com/doc/refman/5.0/en/replication.html" rel="nofollow" title="https://dev.mysql.com/doc/refman/5.0/en/replication.html">https://dev.mysql.com/doc/refman/5.0/en/replication.html</a>.
