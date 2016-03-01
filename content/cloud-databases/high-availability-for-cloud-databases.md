---
node_id: 4708
title: High Availability for Cloud Databases
type: article
created_date: '2015-06-10'
created_by: Neha Verma
last_modified_date: '2015-12-01'
last_modified_by: Mike Asthalter
product: Cloud Databases
product_url: cloud-databases
---

High Availability for Cloud Databases means that Cloud Databases users
can run their critical production workloads without worrying about the
database becoming unavailable. It improves the reliability of running a
database in the cloud environment by minimizing downtime and ensuring
that the application is never down for more than a fraction of a second.

A Cloud Databases High Availability (HA) instance group includes a
source database instance with one or two replicas. For a true HA setup,
we recommend that you have two replicas. In the future, we will increase
the limit on the maximum number of replicas. There is no design
limitation for the maximum number of replicas. If the source database
instance becomes unavailable, an automatic failover is initiated to one
of the replicas. The automatic failover and promotion of the new replica
is completed within a short downtime (approximately 10-30 seconds).

Currently, HA is supported for MySQL 5.6, Percona 5.6, and MariaDB 10.

### Use cases

-   For critical application workloads, a couple of minutes of
    application downtime can result in huge revenue losses. Users can
    use Cloud Databases HA instances to ensure that their database is
    always available and will only experience a small amount of downtime
    in case of failover.

-   For read-heavy workloads, to improve performance Cloud Databases
    users can redirect writes and reads to source and replica instances
    (within the HA setup) respectively.

**Note:** The user&rsquo;s application must be able to direct the reads and
writes to a specific endpoint.

### Technical/architecture details

HA for Cloud Databases relies on the [MHA for
MySQL](https://code.google.com/p/mysql-master-ha/) functionality for
source monitoring, automatic failover, and replica promotion. The
[replication setup is
semi-synchronous](https://dev.mysql.com/doc/refman/5.6/en/replication-semisync.html)
and is set up using GTIDs (for MySQL 5.6, Percona 5.6, and without GTID
for MariaDB 10) between one source and one or two replicas. To improve
the robustness of the system, the source and replicas are provisioned on
separate hosts.

An [HAProxy load balancer](http://www.haproxy.org/) is used to control a
single access point (IP/hostname) for the HA group and uses a different
port for a read-write pool (port 3306) and read-only pool (port 3307).
The load balancer with HAProxy is highly available itself, with two
nodes managed by [Keepalived](http://keepalived.org/) and is accessed
using a VIP (virtual IP). Figure 1 gives an overview of a Cloud Database
HA setup.

The MHA manager lives within the master HAProxy node and monitors the
source database instance. If the source database instance becomes
unavailable, MHA initiates failover to the most up-to-date replica node.
All other replica nodes automatically re-attach themselves to the new
source. If some of the replicas have not received the latest relay log
events, MHA automatically identifies differential relay log events from
the latest replica and applies them to the other replicas. MHA also
triggers a script that switches the new source out of the read-only pool
and updates the write pool. Total downtime is around 10-30 seconds.

**Figure 1. Cloud Databases HA setup**
<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/HighAvailabilityforCloudDatabases1b.png" width="818" height="605" />


### Getting started with HA for Cloud Databases

Creation of new HA instance groups is currently available in the Cloud
Control Panel and API, but conversion of running instances to HA is
still API only. The ability to convert instances to HA will be added to
the Cloud Control Panel in an upcoming release. For more details about
the HA-related API calls, see the [Cloud Databases developer
guide](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#high-availability-instance-group).

**Notes:**

-   By default, access is blocked for an HA instance. To access an HA
    instance, you must explicitly add an ACL that specifies the IP
    address to grant access for.
-   The `networks` property associated with an HA instance (obtained by
    listing the details of an HA instance) provides details about
    accessing the HA instance. The single access point (VIP) of the HA
    instance is specified as the `address`. All the reads and writes are
    directed to this single access point and port 3306
    (source database). You can also point reads to replicas using
    port 3307.
-   The only allowed operations on instances that are part of the HA
    group are Create users and Create databases (on source only). All
    other operations are blocked on these instances.
-   In case a failover occurs, there will be an automatic failover to
    the replica closest to the failed database instance. Cloud Databases
    will remove the failed database instance. A new replica of the same
    flavor and volume as the other instances that are part of the HA
    group will be built and automatically added to this setup in order
    to maintain the HA node configuration. For the period when this
    replica is being added, the HA would be in `ADDING_REPLICA` state
    and would switch to `ACTIVE` once the node has been
    successfully added.

**Warning!** Automatically adding a new replica node would
restart the MHA manager service (which monitors the source/replica
instances to trigger failover) and the haproxy service on the load
balancer nodes.

**Recommendations:**

-   Create an HA setup with two replicas, which guarantees a highly
    available setup even post failover.
-   Monitor and set up alarms for the replicas to ensure that they are
    in a healthy state. For more information about monitoring replicas,
    see the [API
    developer guide](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-developer-guide).

### Limitations

-   Currently, the maximum number of replicas allowed per source
    database instance is two.
-   An HA instance is available only for instance flavors 1 GB
    and greater.
-   The source and replicas should have the same size and flavor.
-   The source and replicas are created in the same region.
-   Currently backups, resizes, and custom configurations cannot be
    performed for instances that are part of the HA setup. Backups and
    incremental backups can be created for the HA group. Resizes (both
    volume and flavor) can be performed across the HA cluster. Custom
    configurations for the HA cluster will be supported soon.
-   There will be a small delay between the source and the replicas.
-   The HA setup might take anywhere between 5-10 minutes, depending on
    the number of replicas. Because it requires creation of multiple
    nodes, allow some time for the HA instance&rsquo;s `status` property to
    display as ACTIVE when performing a GET in the API.
