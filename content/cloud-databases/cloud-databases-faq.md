---
permalink: cloud-databases-faq/
audit_date: '2018-03-29'
title: Cloud Databases FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2018-10-23'
last_modified_by: Kate Dougherty
product: Cloud Databases
product_url: cloud-databases
---

### Getting started

#### What is Cloud Databases?

Cloud Databases is a standalone, API-based, relational database service
built on OpenStack&reg; cloud that enables Rackspace customers to easily
provision and manage multiple MySQL database instances. Instances are
provisioned in a single-tenant, container-based environment per account and
are accessible through the Rackspace internal ServiceNet network. In addition,
High Availability (HA) instances can also be provisioned with a public IP
during creation to enable access via public IP. Each database instance is
optimized for performance. You can run a database instance by using MySQL,
Percona, or MariaDB as the database technology.

#### What are the benefits of using Cloud Databases?

Cloud Databases provides a complete solution for customers who demand a
high-performance, purpose-built infrastructure designed for relational
databases that is backed and supported by engineers who specialize in MySQL
workloads. Cloud Databases is a fully-managed service for customers who
want to focus on developing their applications without having to manage the
underlying infrastructure. The service offers high availability, scheduled
backups, on-demand backups and restores, integrated monitoring, redundant
storage, replication, scalability, and full control of your database.

#### Can I provision Cloud Databases if I don't have Cloud Servers or Cloud Load Balancers on my account?

Yes, High Availability (HA) instance groups enable both internal
connections on the data center's internal service network (ServiceNet) and
external networks through a public IP or hostname. Single instances and
replica sets are provisioned only with network interfaces on ServiceNet.
Connecting to one of these types of Cloud Databases instances remotely
requires either a Cloud Server or Cloud Load Balancer to proxy the
connection.

For more information about connecting to a Cloud Databases instance, see
[Connect to a Cloud Databases
instance](/how-to/connect-to-a-cloud-databases-instance).

For more information on HA instance groups, see [High Availability for Cloud
Databases](/how-to/high-availability-for-cloud-databases) or the "High
Availability" section of this FAQ.

#### What kind of storage solution does Cloud Databases offer?

Each Cloud Databases instance comes with an attached storage volume.
Storage volumes are automatically provisioned on a shared Internet small
computer system interface (iSCSI) storage area network (SAN) that
enables increased performance, scalability, availability, and
manageability. Applications with high input/output (I/O) demands are
performance-optimized and data is protected through both local and
network RAID-10. (RAID stands for redundant array of independent disks.)
Additionally, network RAID provides synchronous replication of volumes with
automatic failover of SAN nodes and load balancing across available storage
clusters.

#### How is performance better than running a MySQL database on a Cloud Server?

Every Cloud Databases instance is optimized for performance. Cloud
Databases uses container-based virtualization, which eliminates the
performance bottlenecks that are associated with traditional hardware
virtualization and enables your database to run at near bare metal speeds.
Cloud Databases also uses dedicated SAN storage and high-speed networking to
give you faster access to your data.

#### What instance sizes do you currently support?

For the most up-to-date information about available instance sizes, see
the [Cloud Databases website](http://www.rackspace.com/cloud/databases/)
or the _[Cloud Databases Developer
Guide](https://developer.rackspace.com/docs/cloud-databases/v1/api-reference/flavors/#list-flavors)_.

#### What types of Rackspace products and accounts can use Cloud Databases?

Any US or UK customer with a Cloud account may provision
multiple ServiceNet database instances and also manage multiple databases
and users (within resource limits). This service is also available to
RackConnected Cloud Servers that use RackConnect. Both First and Open Cloud
Servers can connect to Cloud Databases, as well as any product with access to
our internal ServiceNet network within the same regional data center.

#### Can Cloud Databases be used with dedicated servers?

No, Cloud Databases are available only to customers with Cloud account
credentials. Managed Operations Service Level or dedicated customers
with RackConnect (those customers who also have a Cloud account)
have access but can use the service only with their Rackspace Cloud
product resources.

#### Is Cloud Databases available in the Cloud Control Panel?

Yes. Use the following steps to access Cloud Databases:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/)
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Select **Databases**.

Connecting to a Cloud Database instance remotely requires a [high availability
instance group](/how-to/connect-to-a-cloud-databases-instance) with a public
IP, or a single or replica instance connected either to a Cloud Server or a
Cloud Load Balancer to [proxy the
connection](/how-to/connect-to-a-cloud-databases-instance).

------------------------------------------------------------------------

### Account services

#### Does Cloud Databases support SSL for communication between my application and my database instance?

Yes. An SSL certificate is installed for each Cloud Databases instance. This
certificate enables a secure connection between your application and the
instance. When an SSL connection is established, any data transfer between the
instance and the application is encrypted.

------------------------------------------------------------------------

### Backups

#### Can I write to my database instance during a backup?

The behavior of your instance during a backup depends on the storage
engine that you use for tables. If you use only InnoDB, write
access to your database instance is not suspended. However, if you
have MyISAM tables, those databases are write-locked during the backup
process.

#### What storage engines do you support for database backups?

MySQL supports several types of table engines, which are also known as *table
types*. The tables on a Cloud Databases instance can use either a mix of
different table engine types or use the same type. We currently support
backups of databases that use InnoDB and MyISAM.

#### How much do you charge for database backups?

Backups are stored in your Cloud Files account, and you are charged for the
storage that they use. Standard rates for Cloud Files storage apply. For
current costs, see the [OpenStack pricing
page](https://www.rackspace.com/openstack/public/pricing).

#### How do you perform database backups?

Backups are created by using Percona XtraBackup to create a hot copy of
all of the databases on an instance. The resulting database files are streamed
directly to your Cloud Files account for storage.

#### Do you provide database backup and restore features?

Scheduled backup, on-demand backup, and restore operations are currently
supported by the Cloud Control Panel and the [Cloud Databases
API](https://developer.rackspace.com/docs/cloud-databases/v1/). For more
information, see [Scheduled backups for Cloud
Databases](/how-to/scheduled-backups-for-cloud-databases) and [Manage
backups for Cloud Databases](/how-to/managing-backups-for-cloud-databases).
For details about using the Cloud Databases
API, see the [API
Reference](https://developer.rackspace.com/docs/cloud-databases/v1/api-reference/).
You can also use backup and restore features through the Trove command-line
interface (CLI) tool. For information about using this tool, see
[Using the Trove
client](https://developer.rackspace.com/docs/cloud-databases/v1/getting-started/send-request-ovw/#id2).

#### How long does a database backup take?

The duration of a backup depends on the size of your databases and
any network saturation during the backup.

#### How do I restore a database backup?

To restore a database backup, you must create a new database instance and
specify the backup that you want to restore during the create
request. Your backup is loaded to the new instance, and you receive
a DNS endpoint for the new instance. After the restore operation is
complete, update your application to use the new endpoint.

The original instance is not altered during a restore operation and might
remain in use or be deleted through the API, the CLI, or the Cloud Control
Panel.

#### How many database backups can I request?

There is no limit on the number of database backups that you can create.

**Note**: You may run only one backup at a time. Duplicate requests generate
a 422 error.

#### When a Cloud Database is deleted how is the data removed?

Cloud Databases runs off of SAN storage by using a mount point. After an
instance is deleted, the mount point is destroyed.

#### Are database backups deleted when a database is deleted?

Backups are not deleted when a database instance is deleted. You must manually
remove any stored backups.

#### Can I automate my backups?

Yes. [Scheduled backups](/how-to/scheduled-backups-for-cloud-databases)
enable you to set a time of day to take a daily backup and a day of the week
to take a full backup. You can also specify the maximum number of full backups
to retain.  

------------------------------------------------------------------------

### Monitoring and troubleshooting

#### What Cloud Databases operations are supported at different service levels?

Support coverage information is available on [the OpenStack Cloud Service
Levels page](https://www.rackspace.com/openstack/public/service-levels).

#### Where can I find the Cloud Service Level Agreement?

The [Cloud Service Level Agreement
(SLA)](http://www.rackspace.com/information/legal/cloud/sla) is available on
the Rackspace website.

#### How can I monitor my resource use on Cloud Databases?

Monitoring is available for all Cloud Databases instances through
pre-configured Cloud Monitoring checks, including load average, CPU,
memory, disk storage, network, and a number of MySQL metrics. You can
monitor your Cloud Databases instances by using the [Cloud Control
Panel](/how-to/monitoring-cloud-databases-in-the-cloud-control-panel),
the [Cloud Monitoring
API](https://developer.rackspace.com/docs/rackspace-monitoring/v1/), or the
[Cloud Monitoring
CLI](/how-to/getting-started-with-rackspace-monitoring-cli).

You can also set up alarms that send email alerts to you that are based on
thresholds that you define. An alert for disk space is set up by default for
every instance.

In addition, you can use Rackspace Intelligence to observe usage patterns for
any unexpected changes in your environment. For more information, see [Getting
started with Rackspace Intelligence for the
cloud](https://support.rackspace.com/how-to/getting-started-with-rackspace-intelligence-for-the-cloud/).

#### Can I create a Cloud Databases support ticket?

Yes. A Cloud Databases support ticket category is available in the
[Cloud Control Panel](https://login.rackspace.com/).

------------------------------------------------------------------------

### Databases

#### What are the differences between InnoDB and MyISAM?

InnoDB is the default storage engine for Cloud Databases. InnoDB
enforces Atomicity, Consistency, Isolation, Durability (ACID) transactions
that enable commit, rollback, and crash recovery capabilities to protect user
data.

During a backup, a hot copy process is used on all tables. InnoDB tables
record all transactions during the copy in order to replay them during a
restore operation.

In order to create a consistent backup, MyISAM tables are write-locked during
the copy process. While the instance is being backed up, you
cannot add or delete databases, add or delete users, or delete, stop, or
reboot the instance.

For more information about these engine types, see the following MySQL
documentation:

-   [The InnoDB Storage
    Engine](https://dev.mysql.com/doc/refman/5.7/en/innodb-storage-engine.html)
-   [The MyISAM Storage
    Engine](https://dev.mysql.com/doc/refman/5.7/en/myisam-storage-engine.html)

#### How many connections does each database instance size support?

The following table provides details about maximum numbers of connections and
access to `my.cnf` file settings per database size:

| Size   | Max connections | Max user connections |
|--------|-----------------|----------------------|
| 512 MB | 50              | 40                   |
| 1 GB   | 110             | 100                  |
| 2 GB   | 210             | 200                  |
| 4 GB   | 410             | 400                  |
| 8 GB   | 810             | 800                  |
| 16 GB  | 1610            | 1600                 |
| 32 GB  | 3210            | 3200                 |
| 64 GB  | 6410            | 6400                 |

#### What is the maximum scalable capacity of a Cloud Database instance?

You can provision instances with up to 64 GB of memory and up to 500 GB
of disk storage. You can increase storage up to the maximum by using the
[Cloud Control Panel](https://login.rackspace.com/). To increase storage
beyond 500 GB, submit a support ticket. Note that disk storage cannot be
decreased on a running instance.

#### Can I set up a read-only MySQL user in Cloud Databases?

Yes. However, all users created through the Cloud Control Panel, API,
and CLI have full permissions by default.

To create read-only users, you first must enable the root user and then use
that user to generate and manage additional users with read-only privileges.

#### Can I enable a root (super) user?

Yes. Currently, the root user can only be enabled through the public API or the
CLI.

After root is enabled, it cannot be disabled.

#### What versions of MySQL do you offer?

Cloud Databases supports MySQL 5.6, Percona 5.6, and MariaDB 10. For all
newly created Cloud Databases instances, MySQL 5.6 is the default. We
will continue to support MySQL 5.1 for legacy instances, but we
recommend that our customers use the latest version of MySQL, Percona, or
MariaDB because they offer significant performance improvements and
newer features. For more information that will help you choose the right
database version for your application, see [Choosing the right
database with Rackspace Cloud
Databases](/how-to/choosing-the-right-database-with-rackspace-cloud-databases).

#### What bandwidth limitations are enforced on the ServiceNet network?

The following table shows bandwidth in megabits per second (Mbps),
based on instance size.

| Instance size | Bandwidth |
|---------------|-----------|
| 512 MB        | 20 Mbps   |
| 1 GB          | 100 Mbps  |
| 2 GB          | 200 Mbps  |
| 4 GB          | 300 Mbps  |
| 8 GB          | 400 Mbps  |
| 16 GB         | 500 Mbps  |
| 32 GB         | 1000 Mbps |
| 64 GB         | 2000 Mbps |

#### Where can I find the documentation for Cloud Databases?

For release notes, API documentation, and a _Getting started_ guide for Cloud
Databases, see [Rackspace Cloud Databases API
v1.0](https://developer.rackspace.com/docs/cloud-databases/v1/).

#### Are there API or account limits for my Cloud Database instances?

Yes. By default, all accounts have a preconfigured set of thresholds
that manage capacity and prevent abuse of the system. The
system recognizes two kinds of limits: rate limits and absolute limits.
_Rate limits_ are thresholds that are reset after a certain amount of time
passes. _Absolute limits_ are fixed at the account level. For the most
up-to-date information about rate and absolute limits (which include
instance and volume limits), see the _[Rackspace
Cloud Databases Developer
Guide](https://developer.rackspace.com/docs/cloud-databases/v1/general-api-info/limits/)_.

#### If my database instance is unavailable, what happens to my data?

If you cannot access your Cloud Databases instance, your data is still
protected on a redundant SAN.

#### How can I access my database instance?

Cloud Databases provides several options for connecting to your
database, which gives you complete flexibility in how you access your
database. You can connect to your database by using the following methods:

- [Public and private access with High Availability
  Groups](/how-to/high-availability-for-cloud-databases)

- [Public and private access for Cloud
  Databases Instances](/how-to/public-and-private-access-for-cloud-databases)

- [Connect to a Cloud Databases
  instance](/how-to/connect-to-a-cloud-databases-instance)

You can also use the Cloud Control Panel, the API, or the CLI to manage your
database instance. While some features are not available in the Cloud Control
Panel, you can access these features through the API or the CLI. More
information about the API and the CLI is available in the [Cloud Databases API
documentation](https://developer.rackspace.com/docs/cloud-databases/v1/).

#### How do I set the default time zone for MySQL?

You can set the default time zone for a Cloud Databases instance of
MySQL by creating a configuration group that sets the
`default\_time\_zone` parameter to the offset from UTC. (For example,
`-6:00` for CST.)

For more information, see [Set the time zone for a Cloud Databases
instance](/how-to/setting-the-time-zone-for-a-cloud-databases-instance).

#### Do you support importing and exporting data into the database?

Yes. You can use standard MySQL client tools to import data into and export
data from your instance. For more information, see [Import data into Cloud
Databases](/how-to/importing-data-into-cloud-databases)
and [Export Data from MySQL](/how-to/exporting-data-from-mysql).

#### Do you support MySQL configuration (my.cnf) file modifications?

Yes. Configuration settings for Cloud Databases instances can be stored
and applied by using the [Cloud Control
Panel](https://login.rackspace.com/) and the [Cloud Databases
API](https://developer.rackspace.com/docs/cloud-databases/v1/).
You can save your settings in configuration groups, and then apply each
configuration group to multiple instances. You can maintain multiple
configuration groups to account for different workloads.

#### What level of access do I have to my database instance?

Access to MySQL is allowed only over port 3306. Shell-level access is
not available. Full MySQL access can be obtained by enabling the root
user on the database instance.

#### What is the default database storage engine?

The default storage engine is InnoDB. However, other storage engines such as
MyISAM that are included with MySQL also work for certain use cases.

------------------------------------------------------------------------

### High Availability

#### What is High Availability for Cloud Databases?

A Cloud Databases High Availability (HA) instance group includes a
source database instance with one or two replicas. If the source
database instance becomes unavailable, an automatic failover is
initiated to one of the replicas. The automatic failover and promotion
of the new instance is completed within a short downtime of approximately
10 to 30 seconds.

#### What flavors are supported for HA instance groups?

When you provision an HA instance group, you can choose any flavor from 1 GB to
64 GB.

#### Can I create a backup of the High Availability instances?

Yes. Both on-demand and scheduled backups are available for HA instance groups.

#### Can I resize the RAM for my HA instances?

Yes. However, resizes of HA instance groups can be applied only to the entire
group and cannot be applied to individual instances in the HA group.

#### What is the underlying technology for creating Cloud Databases HA instances?

For details on the technical architecture used to create Cloud Databases
HA instances, see [High Availability for Cloud
Databases](/how-to/high-availability-for-cloud-databases).

#### Do HA instances support automatic failover?

Yes. Rackspace ensures that if the source database instance becomes
unavailable, an automatic failover is initiated to the replicas within
10 to 30 seconds of downtime.

#### What is the pricing for HA instances for Cloud Databases?

HA instances carry a small premium per instance over regular Cloud Databases
instances and are charged per instance, similar to replica sets. (An HA group
with a master and one slave counts as two instances.) The additional cost per
instance covers the load balancer containers that are added for HA instance
groups. For the latest pricing information, see the [Cloud Databases
product page](https://www.rackspace.com/cloud/databases).

#### Which databases are supported for HA instances for Cloud Databases?

Rackspace currently supports MySQL 5.6, Percona 5.6, and MariaDB 10 for
HA database instances.

#### How many replicas can I add to the HA group?

Rackspace enables you to add a maximum of two replicas to the primary source
database instance. You can have a maximum of three total instances in the HA
group: one primary and two replicas. In the future, we will increase the
number of replicas that you can add to an HA group.

#### Where can I find more technical details about High Availability?

For more information about HA, see [High Availability for
Cloud Databases](/how-to/high-availability-for-cloud-databases).

#### Can I convert regular instances to High Availability Instances?

Yes. You can convert replica sets to HA groups through the API or the
Cloud Control Panel. We will add the ability to convert a single
instance to an HA group at a later date.

------------------------------------------------------------------------

### Replication

#### Can I monitor replication?

Yes. You can monitor replication using the monitoring agent installed on
the instance. For more information, see [Database replication with Cloud Databases](how-to/database-replication-with-cloud-databases/) and
[Monitoring Read
Replication](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-general-api-info/monitoring-read-replication)
in the API documentation.

#### Is replication supported between different versions of the database?

No. You can only add replica of the same database type and version as
your source database instance.

#### Is replication supported between different regions?

No. You can only add a replica in the same region as your source
database instance.

#### Does setting up replication require downtime?

When you add a replica to the source DB instance, the instance is
restarted. This means that your database is unavailable until the instance
restarts.

#### Is there a charge for replication?

Each read replica added is charged the same way as a new instance.

#### Does replication support auto failover?

Replication does not currently support automatic failover. If your
database instance goes down and you want to use a replica instance
to minimize downtime, you must do a manual failover to the
replica instances. For manual failover, you must detach the replica from
the source instance and change the application endpoint to this new
source database instance.

If you're interested in automatic failover, take a look at our High
Availability instances.

#### Is replication supported for all database types?

Replication is supported for MySQL 5.6, Percona 5.6, and MariaDB 10. We
do not support replication for MySQL 5.1 because this is an older version of
MySQL and there have been significant improvements for replication
support in newer versions of MySQL. We highly recommend all users to
[upgrade from MySQL 5.1 to MySQL
5.6](/how-to/upgrade-a-cloud-databases-instance-from-mysql-51-to-mysql-56).

#### Do you support replication?

Yes we do support master-slave replication. You can add and manage
replicas using [Cloud Control Panel](https://login.rackspace.com/) and
Cloud Databases API. For more information about managing replication
by using the API, see the [API documentation for
replication](https://developer.rackspace.com/docs/cloud-databases/v1/api-reference/replication/).

------------------------------------------------------------------------

### Billing

#### How much does Cloud Databases cost?

Pricing information is available at [the Cloud Databases pricing
page](http://www.rackspace.com/cloud/databases/pricing/). Standard
charges apply for any Cloud Servers, Cloud Load Balancers, or Cloud
Sites that are used to access your Cloud Database instances.
