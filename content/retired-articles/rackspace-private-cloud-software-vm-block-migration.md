---
permalink: rackspace-private-cloud-software-vm-block-migration/
audit_date:
title: Rackspace Private Cloud Software - VM Block Migration
type: article
created_date: '2012-11-05'
created_by: Karin Levenstein
last_modified_date: '2016-06-24'
last_modified_by: Kyle Laffoon
---

Overview
------------

Rackspace Private Cloud Software installs a collection of Chef cookbooks
that deploy and manage the suite of OpenStack core projects: Compute
(Nova), Image Service (Glance), Dashboard (Horizon), Identity
(Keystone), and Block Storage (Cinder). OpenStack Object Storage (Swift)
is installed separately, as described in this document.

Rackspace Private Cloud Software v 2.0 (Alamo) supports the [Folsom
release of OpenStack](http://www.openstack.org/software/essex/) for
these components.

### Intended Audience

This guide is intended for users who have used Rackspace Private Cloud
Software to deploy an OpenStack-powered cloud that has been tested and
optimized by the OpenStack experts at Rackspace. This document discusses
the migration of virtual machine (VM) guests from one compute node to
another.

To use the product and this document, you should have prior knowledge of
OpenStack and cloud computing, basic Linux administration skills, and a
side of bacon.

### Document Change History

This version of the Rackspace Private Cloud Cookbook Update Guide
replaces and obsoletes all previous versions. The most recent changes
are described in the table below:

Revision Date

Summary of Changes

November 15, 2012

-   Rackspace Private Cloud Software v 2.0 release

### Additional Resources

-   [Rackspace Private Cloud Knowledge
    Center](/how-to/rpc-openstack)
-   [OpenStack Manuals](http://docs.openstack.org)
-   [OpenStack Documentation: Configuring migrations](http://docs.openstack.org/admin-guide-cloud/compute-configuring-migrations.html)

### OpenStack Compute Migration Concepts


In virtual machine migration, a VM (also known as a guest) that is
running on one OpenStack Compute (Nova) compute node is moved to another
compute node, with minimum downtime for the guest. In other words, the
guest is migrated while still running. This can be useful when you need
to apply patches or perform maintenance on the physical node or when you
want to redistribute guest machine load across a cluster of nova compute
nodes.

The guest components that are migrated include the current memory pages
and disk state, and the host components include the network rules and IP
addresses that allow access to and from the guest. There are two
different modes of guest migration, live
migration and block
migration.  Both types of
migration must be performed by an admin user.

#### Live Migrations

For a live migration to be successful, your configuration must meet the
following prerequisites:

-   The guest machine images are stored on shared storage that is
    accessible to all compute nodes in the compute cluster.
-   The shared storage is running some kind of distributed filesystem,
    like NFS.
-   The shared storage is mounted in the same place on each of the
    compute hosts. The default value of this path can be found in
    `flags.instances_path` in `nova.compute.manager`.
-   The libvirt configuration is modified so that libvirt is listening
    for connections on the network.

Optionally, some flags can be set in `nova.conf` to control the behavior
of the live migration.

If these prerequisites are met, the guest images are actually stored on
shared storage. This means that during a live migration, the actual
guest image stays where it is in the storage system. First, the guest is
briefly paused while its memory is copied over to the destination node,
and the MySQL database is updated to show that the guest is in
`migration` status. If the memory copy is successful, the source node
removes any traces of the guest, including any network rules and IPs
that were associated with the guest. Finally, the destination node adds
the relevant network details, unpauses the guest, and updates the
database to show that the migration is complete.

#### Block Migrations

Block migrations are useful when you don't have, and don't want the
management overhead of, shared storage to place your guest images on.
The stages of the migration are similar to those of the live migration,
with the additional step of copying the guest disk image over the
network from the source node to the destination node.  This does mean
that the migration takes a little longer, but achieves a similar result
in that the guest is fully migrated from one node to another.

### Rackspace Private Cloud Block Migration

By default, shared storage is not configured in an Rackspace Private
Cloud (Alamo) install, so your guest migration will use the block
migration feature instead.  This section describes a sample block
migration. In this example, we have a 2-node nova compute cluster, with
compute hosts called `compute1` and `compute2`. All actions are
performed with `root` access.

#### Migration Example

First, get a list of the VM guests:

    $ nova list
    +-------------------------+----------+--------+-------------------+
    |          ID             |   Name   | Status |      Networks     |
    +-------------------------+----------+--------+-------------------+
    | 89a5e582-[id_truncated] | myserver | ACTIVE | public=172.31.0.7 |
    +-------------------------+----------+--------+-------------------+

We will be migrating the guest `myserver`. View the details of the
guest:

    $ nova show myserver
    +-------------------------------------+--------------------------------------+
    |               Property              |                 Value                |
    +-------------------------------------+--------------------------------------+
    | OS-DCF:diskConfig                   | MANUAL                               |
    | OS-EXT-SRV-ATTR:host                | compute1                             |
    | OS-EXT-SRV-ATTR:hypervisor_hostname | None                                 |
    | OS-EXT-SRV-ATTR:instance_name       | instance-00000013                    |
    | OS-EXT-STS:power_state              | 1                                    |
    | OS-EXT-STS:task_state               | None                                 |
    | OS-EXT-STS:vm_state                 | active                               |
    | accessIPv4                          |                                      |
    | accessIPv6                          |                                      |
    | config_drive                        |                                      |
    | created                             | 2012-08-30T11:27:22Z                 |
    | flavor                              | m1.tiny                              |
    | hostId                              | cc42c70[id_truncated]                |
    | id                                  | 89a5e582-d3f3-4665-afc2-03c2114f0bbb |
    | image                               | cirros-image                         |
    | key_name                            |                                      |
    | metadata                            | {}                                   |
    | name                                | myserver                             |
    | progress                            | 0                                    |
    | public network                      | 172.31.0.7                           |
    | status                              | ACTIVE                               |
    | tenant_id                           | 502c4cc57e6240438eb9b0bd2041701f     |
    | updated                             | 2012-08-30T11:27:27Z                 |
    | user_id                             | 03332d7fa8db4006aed4526fb--5a6d8e8   |
    +-------------------------------------+--------------------------------------+

This information shows us that the guest is running on the `compute1`
host, and its internal instance name is `instance-00000013`.

We can also log on to `compute1` and can locate the guest files in the
nova instances directory:

    $ ls -al /var/lib/nova/instances/instance-00000013/
    total 33492
    drwxrwxr-x 2 nova         nova     4096 Aug 30 07:27 .
    drwxr-xr-x 4 nova         nova     4096 Aug 30 07:27 ..
    -rw-rw---- 1 libvirt-qemu kvm     16134 Aug 30 07:30 console.log
    -rw-r--r-- 1 libvirt-qemu kvm  31457280 Aug 30 07:31 disk
    -rw-rw-r-- 1 libvirt-qemu kvm   4731440 Aug 30 07:27 kernel
    -rw-rw-r-- 1 nova         nova     1650 Aug 30 07:27 libvirt.xml
    -rw-rw-r-- 1 libvirt-qemu kvm   2254249 Aug 30 07:27 ramdisk

We can also log in to the guest. In this example, it has a cirros image
installed:

    $ ssh cirros@172.31.0.7
    cirros@172.31.0.7's password:
    $ pwd
    /home/cirros

Before we migrate the guest, verify that the destination node has enough
resources to receive our guest:

    $ nova-manage service describe_resource compute2
    HOST                              PROJECT     cpu mem(mb)     hdd
    compute2        (total)                         2    2003      17
    compute2        (used_now)                      0     330       1
    compute2        (used_max)                      0       0       0

Note that some debug output from the `nova-manage` command has been
omitted. Debug mode is enabled by default in an Alamo install with the
`verbose=true` flag in `/etc/nova/nova.conf`.

Now that source location of the guest and the available space on the
destination node have been verified, we can actually perform the block
migration with the `nova live-migration` command:

    $ nova live-migration --block_migrate 89a5e582-d3f3-4665-afc2-03c2114f0bbb compute2

When the command is executed, nothing appears to happen, but if you're
quick enough you can use `nova list` to see the guest placed in
`MIGRATING`{.computeroutput} status:

    $ nova list
    +-------------------------+----------+-----------+-------------------+
    |           ID            |   Name   |   Status  |      Networks     |
    +-------------------------+----------+-----------+-------------------+
    | 89a5e582-[id_truncated] | myserver | MIGRATING | public=172.31.0.7 |
    +-------------------------+----------+-----------+-------------------+

A few seconds later (or more, depending on the size of the guest VM),
`nova list` will show that the guest is now active again:

    $ nova list
    +-------------------------+----------+--------+-------------------+
    |           ID            |   Name   | Status |      Networks     |
    +-------------------------+----------+--------+-------------------+
    | 89a5e582-[id_truncated] | myserver | ACTIVE | public=172.31.0.7 |
    +-------------------------+----------+--------+-------------------+

We can verify that it is running on the expected node, `compute2`:

    $ nova show myserver | grep 'OS-EXT-SRV-ATTR:host'
    | OS-EXT-SRV-ATTR:host    | compute2     |

We can also verify that it is no longer located on `compute1` by logging
into that node and trying to list the instance directory:

    $ ls -al /var/lib/nova/instances/instance-00000013/
    ls: cannot access /var/lib/nova/instances/instance-00000013/: No such file or directory

When we log onto `compute2` and list the instance directory, the
instance files appear:

    $ ls -al /var/lib/nova/instances/instance-00000013/
    total 33476
    drwxrwxr-x 2 nova         nova     4096 Aug 30 08:01 .
    drwxr-xr-x 4 nova         nova     4096 Aug 30 08:01 ..
    -rw------- 1 libvirt-qemu kvm         0 Aug 30 08:01 console.log
    -rw-r--r-- 1 libvirt-qemu kvm  31457280 Aug 30 08:02 disk
    -rw-rw-r-- 1 libvirt-qemu kvm   4731440 Aug 30 08:01 kernel
    -rw-rw-r-- 1 nova         nova     1650 Aug 30 08:01 libvirt.xml
    -rw-rw-r-- 1 libvirt-qemu kvm   2254249 Aug 30 08:01 ramdisk

Finally, we can log into the guest normally:

    $~# ssh cirros@172.31.0.7
    cirros@172.31.0.7's password:
    $ pwd
    /home/cirros
    $ uptime
     06:06:48 up 17 min, load average: 0.00, 0.00, 0.00

Note the uptime shows 17 minutes, which in this example is the total
time since the initial creation of the guest. This is because
migrations, whether tagged as live or block migrations, do not shutdown
or reboot the virtual machine: they simply freeze it in a running state
while the necessary files are copied over the network, and then unfreeze
it at the other end of the migration process.

<div class="section" title="Troubleshooting a Migration">

#### Troubleshooting a Migration

Sometimes when attempting a migration, you will encounter an error from
the nova client, similar to the following :

    $ nova live-migration --block_migrate 89a5e582-d3f3-4665-afc2-03c2114f0bbb compute2
    ERROR: Live migration of instance 89a5e582-d3f3-4665-afc2-03c2114f0bbb to host compute2 failed (HTTP 400)

This error indicates that the migration failed, but not why it failed.
For that, we can go and look in the nova-scheduler log
(`/var/log/nova/nova-scheduler.log`)on the Alamo controller node. Toward
the end of that file, we find an error block:

    2012-08-30 08:11:57 WARNING nova.scheduler.manager [req-10302630-7f13-49fd-aeed-b73e1bbe69ef 03332d7fa8db4006aed4526fb5a6d8e8 502c4cc57e6240438eb9b0bd2041701f] Failed to schedule_live_migration: Unable to migrate instance (89a5e582-d3f3-4665-afc2-03c2114f0bbb) to current host (compute2).
    2012-08-30 08:11:57 ERROR nova.rpc.amqp [req-10302630-7f13-49fd-aeed-b73e1bbe69ef 03332d7fa8db4006aed4526fb5a6d8e8 502c4cc57e6240438eb9b0bd2041701f] Exception during message handling
    2012-08-30 08:11:57 TRACE nova.rpc.amqp Traceback (most recent call last):
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/dist-packages/nova/rpc/amqp.py", line 253, in _process_data
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     rval = node_func(context=ctxt, **node_args)
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/dist-packages/nova/scheduler/manager.py", line 97, in _schedule
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     context, ex, *args, **kwargs)
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/contextlib.py", line 24, in __exit__
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     self.gen.next()
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/dist-packages/nova/scheduler/manager.py", line 92, in _schedule
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     return driver_method(*args, **kwargs)
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/dist-packages/nova/scheduler/driver.py", line 218, in schedule_live_migration
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     disk_over_commit)
    2012-08-30 08:11:57 TRACE nova.rpc.amqp   File "/usr/lib/python2.7/dist-packages/nova/scheduler/driver.py", line 294, in _live_migration_dest_check
    2012-08-30 08:11:57 TRACE nova.rpc.amqp     instance_id=instance_ref['uuid'], host=dest)
    2012-08-30 08:11:57 TRACE nova.rpc.amqp UnableToMigrateToSelf: Unable to migrate instance (89a5e582-d3f3-4665-afc2-03c2114f0bbb) to current host (compute2).

In this case, we can see that the migration failed as we were attempting
to migrate the guest to the host on which it was already running.
Different failure conditions will produce different errors in this log.
For example, if nova-compute on the destination host is not
running/unavailable for some reason, you'll see a message similar to the
following in the `nova-scheduler.log`:

    2012-08-30 08:18:28 TRACE nova.rpc.amqp Timeout: Timeout while waiting on RPC response.

Another fairly common error you may see is if you attempt a migration as
a non-admin user. This error will occur even if your user is a member of
the admin tenant:

    $ nova live-migration --block_migrate 89a5e582-d3f3-4665-afc2-03c2114f0bbb compute1
    ERROR: Policy doesn't allow compute_extension:admin_actions:migrateLive to be performed. (HTTP 403)

Generally, if you have any issues migrating your guests, the best places
to check would be the following log files:

-   `/var/log/nova/nova-scheduler.log` on the Alamo controller node
-   `/var/log/nova/nova-compute.log` on your source/destination compute
    hosts
