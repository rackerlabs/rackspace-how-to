---
permalink: glusterfs-high-availability-through-ctdb/
audit_date:
title: Explore high availability of GlusterFS through CTDB
type: article
created_date: '2014-08-14'
created_by: Marcin Stangel
last_modified_date: '2016-11-29'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section** - [GlusterFS troubleshooting](/how-to/glusterfs-troubleshooting)

In its native form, GlusterFS gives you redundancy and high availability (HA). However,
the clients that connect to your GlusterFS volumes by using its NFS or Samba exports need
to have some additional services installed and configured on the GlusterFS nodes. This
article explains how to add HA to NFS and Samba exports that are managed by the GlusterFS
nodes when you build your volume.

**Note:** If you use Cluster Trivial Database (CTDB) for the NFS exports, your GlusterFS
nodes already have the NFS exports created, and the service is installed and configured.

GlusterFS installs and uses a modified version of the NFS service (NFS v3 that uses TCP),
and it is managed through the glusterd service scripts, not through the **/etc/init.d/nfs scripts**.

### Introduction

Previous articles in this series describe the theory behind GlusterFS, the different types
of volumes it supports, and the different ways of connecting clients to GlusterFS nodes by
using the native Gluster client (FUSE) or the NFS exports managed by GlusterFS nodes.

Some clients that need to access GlusterFS volumes might not be compatible with the native
FUSE driver for various reasons, and these clients need to connect to the volumes by using
NFS or Samba exports provided by your GlusterFS nodes.

One drawback to using the NFS or Samba exports is that, unlike using the native client, if
a node goes offline, your clients won't be able to automatically reconnect to a different
GlusterFS node. This can result in problems for your client system, including D state
processes and issues that are a direct result of the storage becoming unavailable.

To battle that problem, developers from the Samba project have created a simple clustering
tool called CTDB. You need to configure and deploy CTDB to achieve HA for clients that rely
on NFS protocols to access your GlusterFS volumes. This article guides you through the
process of adding a Samba export to your nodes and configuring it to be highly available
by using CTDB.

### Using CTDB

CTDB is a simple clustering daemon developed by Samba developers that provides a simple
solution for highly available CIFS and NFS exports. It adds virtual IP addresses and a
heartbeat service to each GlusterFS server node. For those volumes that are exported via
CIFS, it also adds a locking mechanism.

You can find more information about CTDB at [http://ctdb.samba.org](http://ctdb.samba.org/).

Using CTDB ensures that your clients, whichever method they use (NFS or CIFS), can still
access the volume in case of a brick failure.

### Requirements

The following items are necessary for CTDB installation:

- CTDB installed on all nodes
- A number of *unused* IP addresses that will be used as floating IP addresses for your
  bricks and the services used on the bricks to export the volume
- Round-robin A records in your DNS (or hosts files on clients) for the virtual IP address

### Install CTDB

1.	Install CTDB on each GlusterFS server node:

          yum install ctdb

    You need a shared volume (can be Gluster) to store the lock files and be available to
    all GlusterFS server nodes. The best practice is use a separated volume, but the
    following example uses a volume that was already created, `gvol0`.

2.	On each GlusterFS server node, run the following command, where *N* is the number of
   the node, so that each node mounts the volume via its own glusterd service:

          mount -t glusterfs glusterN:/gvol0 /gluster-volume0/

3.	Install Samba on each GlusterFS server node:

          yum install samba

4.	Ensure that nothing blocks communication between Gluster server nodes on port 4379.

5.	Stop Samba.

6.	Disable Samba from automatically starting. It will be managed by the CTDB service.

          chkconfig smb off

7.	Configure the CTDB **/etc/sysconfig/ctdb** file, as follows:

          CTDB_RECOVERY_LOCK=/gluster-volume0/.CTDB-lockfile
          CTDB_PUBLIC_ADDRESSES=/etc/ctdb/public_addresses
          CTDB_MANAGES_SAMBA=yes
          CTDB_NODES=/etc/ctdb/nodes

8.	Configure the **/etc/ctdb/public_addresses** file, which is the list of virtual IP addresses
   to be assigned to all server nodes. This example uses two virtual IP addresses per server
   node (one for NFS and one for Samba), so in total it uses eight new private IP addresses.

          vi /etc/ctdb/public_addresses

          10.0.0.6/24 eth2
          10.0.0.7/24 eth2
          10.0.0.8/24 eth2
          10.0.0.9/24 eth2
          10.0.0.10/24 eth2
          10.0.0.11/24 eth2
          10.0.0.12/24 eth2
          10.0.0.13/24 eth2

9.	In **/etc/ctdb/nodes**, list the server nodes that will be members of the CTDB cluster:

           vi /etc/ctdb/nodes

           10.0.0.1
           10.0.0.2
           10.0.0.3
           10.0.0.4

#### Start and verify the configuration

1.	Start the CTDB service on each cluster node, and configure it to start automatically at boot:

          service ctdb start
          chkconfig ctdb on

2.	When CTDB starts, it will start Samba, so ensure that Samba is not enabled to automatically:

          chkconfig smb off

3.	Verify that CTDB is running and check the status of the service:

          ctdb status
          ctdb ip
          ctdb ping -n all

    You should see the following output:

    - `ctdb status` returns the following information:

            [root@centos63-gluster1 ~]# ctdb status
            Number of nodes:4
            pnn:0 10.0.0.1         OK (THIS NODE)
            pnn:1 10.0.0.2         OK
            pnn:2 10.0.0.3         OK
            pnn:3 10.0.0.4         OK
            Generation:247859038
            Size:4
            hash:0 lmaster:0
            hash:1 lmaster:1
            hash:2 lmaster:2
            hash:3 lmaster:3
            Recovery mode:NORMAL (0)
            Recovery master:0

    - `ctdb ip` returns a list of all IP addresses and the nodes to which they are assigned:

            [root@centos63-gluster1 ~]# ctdb ip
            Public IPs on node 0
            10.0.0.6 node[3] active[] available[eth2] configured[eth2]
            10.0.0.7 node[2] active[] available[eth2] configured[eth2]
            10.0.0.8 node[1] active[] available[eth2] configured[eth2]
            10.0.0.9 node[0] active[eth2] available[eth2] configured[eth2]
            10.0.0.10 node[3] active[] available[eth2] configured[eth2]
            10.0.0.11 node[2] active[] available[eth2] configured[eth2]
            10.0.0.12 node[1] active[] available[eth2] configured[eth2]
            10.0.0.13 node[0] active[eth2] available[eth2] configured[eth2]

    - `ctdb ping -n all` shows the result of issuing a ping to all nodes:

            [root@centos63-gluster1 ~]# ctdb ping -n all
            response from 0 time=0.000084 sec  (4 clients)
            response from 1 time=0.000380 sec  (4 clients)
            response from 2 time=0.000577 sec  (4 clients)
            response from 3 time=0.000420 sec  (4 clients)

### Load balancing

CTDB as explained in this article provides highly available NFS and CIFS services across
GlusterFS replica servers. However, it does not load balance connections. To prevent the
interfaces from being saturated on any of the GlusterFS servers, you can configure your
solution with a round-robin DNS or WINS (or even hosts) for the CTDB-defined IP addresses.

For example, a round-robin DNS entry could look as follows:

    ; zone file fragment !

    ; NFS vips

        gluster-nfs-vip 1 IN A 10.0.0.6
        gluster-nfs-vip 1 IN A 10.0.0.7
        gluster-nfs-vip 1 IN A 10.0.0.8
        gluster-nfs-vip 1 IN A 10.0.0.9

    ; SAMBA VIPs

        gluster-smb-vip 1 IN A 10.0.0.10
        gluster-smb-vip 1 IN A 10.0.0.11
        gluster-smb-vip 1 IN A 10.0.0.12
        gluster-smb-vip 1 IN A 10.0.0.13

On your clients that are not supporting the native FUSE client, you could use the following
methods:

- NFS:

        mount -t nfs -o vers=3 gluster-nfs-vip:/gvol0 /mnt/gluster-gvol0

- CIFS (on Windows clients):

        net use <DeviceLetter> \\gluster-smb-vip\gvol0

### References

-  [http://ctdb.samba.org/](http://ctdb.samba.org/)
-  [hhttps://wiki.samba.org/index.php/CTDB_and_Clustered_Samba](https://wiki.samba.org/index.php/CTDB_and_Clustered_Samba)
-  [http://www.zytrax.com/books/dns/ch9/rr.html](http://www.zytrax.com/books/dns/ch9/rr.html)
