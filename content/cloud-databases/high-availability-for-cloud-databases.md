---
permalink: high-availability-for-cloud-databases/
audit_date:
title: High Availability for Cloud Databases
type: article
created_date: '2015-06-10'
created_by: Neha Verma
last_modified_date: '2016-08-11'
last_modified_by: Steve Croce
product: Cloud Databases
product_url: cloud-databases
---

High Availability for Cloud Databases means that Cloud Databases users
can run their critical production workloads without worrying about the
database becoming unavailable due to the failure of a database component. It improves the reliability of running a
database in the cloud environment by minimizing downtime and ensuring
that the application is never down for more than a few seconds in the event of a failure.

A Cloud Databases High Availability (HA) instance group includes a
source database instance with one or two replicas. For a true HA setup,
we recommend two replicas. If the source database
instance becomes unavailable, an automatic failover is initiated to one
of the replicas. The automatic failover and promotion of the new replica
is completed in approximately 10-30 seconds.

Currently, HA is supported for MySQL 5.6, Percona 5.6, MariaDB 10, and later versions.

### Use cases

-   For critical application workloads, a couple of minutes of
    application downtime can result in huge revenue losses. Users can
    use Cloud Databases HA instances to ensure that their database is
    highly-available and will only experience a small amount of downtime
    in case of failover.

-   For read-heavy workloads, to improve performance Cloud Databases
    users can redirect writes and reads to source and replica instances
    (within the HA setup) respectively and reduce the load on the master instance.

**Note:** The user's application must be able to direct the reads and
writes to a specific port.

### Technical/architecture details

HA for Cloud Databases relies on the [MHA for
MySQL](https://code.google.com/p/mysql-master-ha/) functionality for
source monitoring, automatic failover, and replica promotion. The
[replication setup is
semi-synchronous](https://dev.mysql.com/doc/refman/5.6/en/replication-semisync.html)
and is set up using GTIDs (for MySQL, Percona; MariaDB does not use GTIDs) between one source and one or two replicas. To improve
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
and updates the write pool. The total process is around 10-30 seconds.

**Figure 1. Cloud Databases HA setup**
<img src="{% asset_path cloud-databases/high-availability-for-cloud-databases/HighAvailabilityforCloudDatabases1b.png %}" width="818" height="605" />


### Getting started with HA for Cloud Databases

Creation of new HA instance groups and conversion from a replica set to HA group are currently available in the [Cloud
Control Panel](/how-to/managing-cloud-databases-ha-groups-in-the-cloud-control-panel) and API. More details about HA-related API calls are available in the [Cloud Databases developer
guide](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#high-availability-instance-group).

**Notes:**

-   By default, access to an HA instance via the VIP is blocked. To access an HA
    instance, you must explicitly add an ACL that specifies the IP
    address(es) to grant access for. ACLs can be set via the API or the Cloud Control Panel.
-   The `networks` property associated with an HA instance (obtained by
    listing the details of an HA instance) provides the addresses and ports for
    accessing the HA instance. The single access point (VIP) of the HA
    instance is specified as the `address`. All the reads and writes
    directed to the VIP and port 3306 will be sent to the source instance. You can also direct reads to replicas using
    port 3307.
-   On HA groups, most service actions (resize, configuration, etc.) must be applied to the HA group UUID rather than the individual database instances within the cluster. The only allowed operations on instances that are part of the HA
    group are Create users and Create databases (on the source/master instance). All
    other operations are blocked on the instances.
-   In case a failover occurs, there will be an automatic failover to
    the replica closest to the failed database instance. Cloud Databases
    will remove the failed database instance. A new replica of the same
    flavor and volume as the other instances that are part of the HA
    group will be built and automatically added to this setup in order
    to maintain the HA node configuration. For the period when this
    replica is being added, the HA would be in `ADDING_REPLICA` state
    and would switch to `ACTIVE` once the node has been
    successfully added.

**Warning!** Automatically adding a new replica node
restarts the MHA manager service (which monitors the source/replica
instances to trigger failover) and the haproxy service on the load
balancer nodes, so any API actions issued to the cluster during the replica add part of the process may not succeed.

**Recommendations:**

-   Create an HA setup with two replicas, which guarantees a highly
    available setup even post failover.
-   Monitor and set up alarms for the replicas to ensure that they are
    in a healthy state. More information about monitoring replicas can be found in the how-to document on 
    [Database replication with Cloud Databases](/how-to/database-replication-with-cloud-databases).

### Limitations

-   Currently, the maximum number of replicas allowed per source
    database instance is two.
-   An HA instance is available only for instance flavors 1 GB
    and greater.
-   The source and replicas must have the same size and flavor.
-   The source and replicas are created in the same region.
-   Backup, resize, and custom configuration commands and changes must be applied to the overall HA group using the group UUID. Applying updates across groups ensures that all instances in the group have the same configuration. Backup commands select the most up-to-date replica and create a backup from it. Backup, resize, and custom configuration commands and changes against the individual instances in the HA group are not allowed. 
-   There will be a small delay between the source and the replicas, so ensure all reads that require strong data consistency are made to the source/master instance (port 3306).
-   Initial setup of the HA group might take anywhere between 5-10 minutes, depending on
    the number of replicas. Because it requires creation of multiple
    nodes, allow some time for the HA instance's `status` property to
    display as ACTIVE when performing a GET in the API.
-   Currently the instance listing in the cloud control panel shows the master instance for HA groups. To take action on the cluster or view cluster level information, please click the instance name to go to the cluster details page.
