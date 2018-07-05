---
permalink: high-availability-for-cloud-databases/
audit_date: '2018-07-05'
title: High Availability for Cloud Databases
type: article
created_date: '2015-06-10'
created_by: Neha Verma
last_modified_date: '2018-07-05'
last_modified_by: Kate Dougherty
product: Cloud Databases
product_url: cloud-databases
---

High Availability (HA) for Cloud Databases means that Cloud Databases users
can run their critical production workloads without worrying about a
database becoming unavailable due to the failure of a database component. It
improves the reliability of running a database in the cloud environment by
minimizing downtime and ensuring that the application is never down for more
than a few seconds in the event of a failure.

A Cloud Databases HA instance group includes a source database instance and
one or two replicas. For a robust HA setup, we recommend two replicas. If the
source database instance becomes unavailable, an automatic failover is
initiated to one of the replicas. The automatic failover and promotion of the
new replica is completed in approximately 10 to 30 seconds.

We currently support HA for MySQL 5.6, Percona 5.6, MariaDB 10, and later
versions.

### Use cases

HA for Cloud Databases has the following use cases:

-   For critical application workloads, a couple of minutes of
    application downtime can result in significant revenue losses. Users can
    implement Cloud Databases HA instances to ensure that their databases are
    highly available, and only experience a small amount of downtime
    in the event of failover.

-   To reduce the load on the source instance and improve performance for
    read-heavy workloads, Cloud Databases users can redirect writes and reads
    to source and replica instances within the HA setup, respectively.

**Note:** Your application must be able to direct the reads and
writes to a specific port.

### Technical and architecture details

HA for Cloud Databases relies on [Master High Availability (MHA) for
MySQL](https://code.google.com/p/mysql-master-ha/) functionality for
source monitoring, automatic failover, and replica promotion. The
[replication setup is
semi-synchronous](https://dev.mysql.com/doc/refman/5.6/en/replication-semisync.html)
and involves one source and one or two replicas. MySQL and Percona
implementations are set up by using using global transaction identifiers
(GTIDs). To improve the robustness of the system, the source and the replicas
are each provisioned on separate hosts.

An [HAProxy load balancer](http://www.haproxy.org/) controls a
single access point (IP/hostname) for the HA group and uses different
ports for the read-write pool (port 3306) and the read-only pool (port 3307).
The load balancer with HAProxy is highly available itself, with two
nodes managed by [Keepalived](http://keepalived.org/). It is accessed
by using a virtual IP (VIP). Figure 1 provides an overview of a Cloud Databases
HA setup.

**Figure 1. Cloud Databases HA setup**
<img src="{% asset_path cloud-databases/high-availability-for-cloud-databases/HighAvailabilityforCloudDatabases1b.png %}" width="600" />

The MHA manager lives within the source HAProxy node and monitors the
source database instance. If the source database instance becomes
unavailable, MHA initiates failover to the most up-to-date replica instance.
All of the other replica instances automatically reattach themselves to the new
source. If some of the replicas do not receive the latest relay log
events, MHA automatically identifies differential relay log events from
the latest replica and applies them to the other replicas. MHA also
triggers a script that switches the new source out of the read-only pool
and updates the write pool. The total process takes approximately 10 to 30
seconds.

### Get started with HA for Cloud Databases

You can create new HA instance groups and convert from a replica set to an HA
group by using the [Cloud Control
Panel](/how-to/managing-cloud-databases-ha-groups-in-the-cloud-control-panel)
and the API. For more information about HA-related API calls, see the [Cloud
Databases developer
guide](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#high-availability-instance-group).

**Notes:**

The following list presents information to keep in mind when using HA for
Cloud Databases:

-   By default, access to an HA instance through the VIP is blocked. To access
    an HA instance, you must explicitly add an access control list (ACL) that
    specifies the IP addresses for which to grant access. You can set ACLs
    through the API or the Cloud Control Panel.
-   The `networks` property that is associated with an HA instance provides
    the addresses and ports for accessing the HA instance. (You can obtain
    this property by listing the details of an HA instance.) The single access
    point, or VIP, of the HA instance is specified as the `address`. All of
    the reads and writes that are directed to the VIP and port 3306 are sent
    to the source instance. You can also direct reads to replicas by using port
    3307.
-   On HA groups, most service actions (such as resize and configuration, for
    example) must be applied to the universally unique identifier (UUID) for
    the HA group rather than the individual database instances within the
    cluster. The only operations that are allowed on instances that are part
    of the HA group are create users and create databases (on the source
    instance). All other operations are blocked on the instances.
-   If a failure occurs, an automatic failover to the replica that is closest
    to the failed database instance takes place. Cloud Databases
    removes the failed database instance. A new replica that has the same
    flavor and volume as the other instances that are part of the HA
    group is built and automatically added to this setup in order
    to maintain the HA node configuration. While this replica is being added,
    the HA is in the `ADDING_REPLICA` state. It switches to the `ACTIVE` state
    after the node has been successfully added.

**Warning:** Automatically adding a new replica restarts the MHA manager
service and the HAproxy service on the load balancer nodes. Any API actions
that are issued to the cluster during the replica add part of the process
might not succeed.

**Recommendations:**

We recommend that you take the following steps:

-   Create an HA setup with two replicas. This architecture guarantees a highly
    available setup, even post-failover.
-   Monitor and set up alarms for the replicas to ensure that they are
    in a healthy state. For more information about monitoring replicas, see
    [Database replication with Cloud
    Databases](/how-to/database-replication-with-cloud-databases).

### Limitations

HA for Cloud Databases has the following limitations:

-   The maximum number of replicas allowed per source database instance is two.
-   HA instances are available only for instance flavors that are 1 GB
    or greater in size.
-   The source and replicas must have the same size and flavor.
-   The source and replicas are created in the same region.
-   Backup, resize, and custom configuration commands and changes must be
    applied to the overall HA group by using the group UUID. Applying updates
    across groups ensures that all of the instances in the group have the same
    configuration. Backup commands select the most up-to-date replica and
    create a backup from it. Backup, resize, and custom configuration commands
    and changes against the individual instances in an HA group are not
    allowed.

    **Note**: When you add a replica for a MariaDB HA group, you cannot use an
    existing replica to generate a snapshot for the new replica. For
    more information, see [Xtrabackup doesn't log master co-ordinates while
    backup up MariaDB
    10](https://bugs.launchpad.net/percona-xtrabackup/+bug/1404484).

-   There is a small delay between the source and the replicas. Ensure that
    all reads that require strong data consistency are made to the source
    instance (port 3306).
-   Initial setup of the HA group might take anywhere between 5 and 10
    minutes, depending on the number of replicas. Because the initial setup
    requires creation of multiple nodes, allow some time for the `status`
    property of the HA instance to display as `ACTIVE` when you perform a
    `GET` call through the API.
-   The instance listing in the Cloud Control Panel shows the status
    of the HA group. To take action on the cluster or view
    cluster-level information, click the instance name to go to the **HA Group
    Details** page.
