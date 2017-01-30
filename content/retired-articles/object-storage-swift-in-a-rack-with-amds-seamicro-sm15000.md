---
permalink: object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/
audit_date:
title: "Object Storage (Swift) in a Rack with AMD's SeaMicro SM15000"
type: article
created_date: '2013-01-24'
created_by: Alyssa Hurtgen
last_modified_date: '2013-06-23'
last_modified_by: Rose Contreras
---

### Overview

The amount of data being stored in the world is growing exponentially,
and scientists estimate that by 2020 it will reach 50 Zettabytes. Object
storage systems allow users to upload or download data in the form of
objects. These systems should be reliable, fast and capable of scaling
with demand.

AMD's SeaMicro Server supports more than 5 petabytes (PB) of physical
disk capacity in just under two racks for the industry's highest density
and most power efficient solution. Swift, the object storage solution in
OpenStack, allows multiple nodes to cooperate in order store objects in
such a way that ensures data integrity and availability.

This document describes the environment and process for realizing "Swift
in a Rack": A robust object storage system with a capacity of 2.4 PB.

### The SeaMicro SM15000&trade; Server

The AMD SeaMicro SM15000&trade; brings compute, storage, networking and a
super-compute fabric together in a single 10 Rack Unit (RU) chassis and
is one of the first servers to be certified for Rackspace private Cloud.

It may be configured with the following:

-   512 compute cores and 4 terabytes of DRAM (8GB per core)
-   64 AMD Opteron, 64 Intel Xeon ("Sandy Bridge", "Ivy Bridge")
-   1.28 Tbps Freedom Supercompute Fabric bandwidth
-   64 internal SSD or HDD drives
-   Over 5.4 PB of direct attached storage (1,408 hard drives)
-   160 Gbps of network uplink bandwidth
-   Single management interface

A total raw capacity of 5,440 terabytes (TB) or 5.44 PB may be attached
to the system, including both internal and external drives.

Storage capacity can be expanded using 16 Freedom&trade; Fabric Storage
enclosures. The SM15000&trade; supports several different storage enclosures.
The FS-5084-L is highest capacity enclosure which has the capacity for
up to 84 disks at 4 TB a piece. In a standard 48 RU rack, one SM15000&trade;
and seven storage enclosures can provide over two petabytes of storage.
A second rack of nine enclosures can be installed for a total available
capacity of 5.4 petabytes in just two racks.

Usable Swift space depends on the configured replication which is
typically 3:1. Therefore, either 784 TB of Swift space is available in
one rack or 1.81 PB across both racks. Figure 1 is a picture of the one
rack, 2.4 PB solution. The solution is easy to deploy with no top of
rack switches. Only a small number of cables are required due to the
integration of compute, networking and storage in the SM15000.

 <img src="{% asset_path rpc-openstack/object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/Front%20of%20Rack%20View%20and%20Wiring%20Diagram.jpg %}" width="664" height="716" />

**Figure 1: Front of Rack View and Wiring Diagram**

**
**Standard equipment requires upwards of 20 racks to create an
environment this size.

The SeaMicro Freedom&trade; Fabric is the key technology that interconnects
hundreds of computational server nodes, with significant reductions in
power, latency, and failures. Figure 2 shows how the 64 servers within
the SM15000&trade; are all interconnected with multiple, redundant paths over
the Freedom&trade; Fabric. There is no single point of failure and the
Freedom&trade; Fabric is "self-healing", re-routing any traffic that would
otherwise be unable to reach its destination.

** <img src="{% asset_path rpc-openstack/object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/SeaMicro%20Fabric.jpg %}" width="508" height="282" />**

**Figure 2: SeaMicro Fabric**

### Swift Object Storage

OpenStack is an open source project created by many developers across
the globe to fulfill the need for a free and scalable cloud computing
platform. OpenStack consists of multiple projects which can stand alone
or work together. Swift is included in these projects as the object
storage solution.

Users of the system make requests to a proxy node, which forwards
requests to storage nodes where the objects are located. The forwarded
requests are sent to each replica therefore outgoing requests from the
proxy will equal the number of replicas times incoming requests to the
proxy.

Swift stores three copies of every object by default in three different
zones for high availability and reliability and hence the reason RAID is
deemed unnecessary with Swift. Zones may be thought of as isolated,
logical groups of resources that can be different datacenters, racks,
servers, or disk drives. The goal is for failures in one zone to have no
effect on the others.

 <img src="{% asset_path rpc-openstack/object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/Distributed%20Object%20Storage%20Reference%20Architecture.jpg %}" width="721" height="520" />

**Figure 3: Distributed Object Storage Reference Architecture**

### Recommended "Swift in a Rack" Architecture using the SeaMicro SM15000^TM^

The Rackspace Private Cloud Software distribution of OpenStack (RPCS)
provides the opportunity to quickly and easily spin up private cloud
powered by OpenStack including chef, keystone servers and other integral
components. The "Swift in a Rack" solution requires RPCS and the
SM15000&trade; with at least 10 external storage enclosures.

Figure 4 shows how the SeaMicro SM15000&trade; provides all the key
infrastructure elements needed for OpenStack object storage. It
dramatically simplifies the deployment by converging many of the
functions into the SeaMicro system. The recommended architecture to
produce "Swift in a Rack" leverages RPCS and assigns all compute cards
(C-cards) one internal volume from which they may boot. Beyond this the
architecture will have:

-   Two servers (C-cards) to run the HA controller.
-   Eight dedicated proxy nodes. Ratio of one proxy node to eight
    storage nodes with room for two failures. This ratio has proven
    effective in production environments. Each proxy should be
    configured with:
    -   One bound interface with two slaves for outside connectivity.
    -   One bound interface with six slaves to handle the multiplied
        traffic to the storage nodes.
-   48 storage nodes with:
    -   16 4 TB volumes will provide the 3 PB of required storage.
    -   One bound interface with eight slaves since all traffic will be
        routed through the fabric.



 <img src="{% asset_path rpc-openstack/object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/Swift%20in%20a%20Rack%20Reference%20Architecture.jpg %}" width="669" height="415" />

**Figure 4: "Swift in a Rack" Reference Architecture**

<img src="{% asset_path rpc-openstack/object-storage-swift-in-a-rack-with-amds-seamicro-sm15000/Swift%20in%20a%20Rack%20Recommended%20Configuration.jpg %}" width="686" height="515" />

**Figure 5: "Swift in a Rack" Recommended Configuration**

The SeaMicro SM15000&trade; provides the ability to either assign physical
disks to nodes or pool disks together before splitting off logical
volumes that will appear to each node as physical SATA disks.
Incorrectly assigning volumes may cause two storage nodes to place
replicas of the same object on one disk, reducing the data redundancy
provided by Swift. To provide the highest level of isolation, each disk
pool should use a single storage card (S-card) and directly relate to a
zone in Swift.

This configuration will create eight storage pools provided by eight
different S-cards that map to eight different zones. Each of the eight
zones will have six C-cards with 64 TB of free storage. Eight zones
provide a sufficient time cushion to resolve failures and minimize the
effect they have on one another.

<span style="line-height: 1.538em;">To avoid data loss the Chef
cookbooks for Swift do not affect storage devices that have been
previously altered. Therefore any disks used to store objects must be
blank. To reinitialize the storage, existing volumes and pools in the
SM15000&trade; should be removed and recreated. Commands that, with minor
changes, can accomplish this are as follows:</span>

Enable privileged level commands:

    seamicro> enable

Remove all volume assignments from the nodes:

    seamicro# configure
    seamicro(config)# storage assign-clear

Remove 96 volumes with names that start "volume-" from "zone-0" in slot
0:

    seamicro# storage delete volume-prefix 0/zone-0/volume- count 64

Remove all pools from slot 0:

    seamicro# storage delete pool 0/all

Create pool in slot 0 named "zone-0" which includes disks in slot 0 and
bays 0-3.

    seamicro# storage create pool 0/zone-0 disk 0/0,0/1,0/2,0/3

Create 64 volumes at 495 GB with names that start "volume-" in pool
named "zone-0" and slot 0.

    seamicro# storage create volume-prefix 0/zone-0/volume- size 495 count 8

Assign volume "0/zone-0/volume-0" to node 0/0 as disk 0.

    seamicro# configure
    seamicro(config)# storage assign 0/0 0 volume 0/zone-0/volume-0

An ssh-key should be added to the SeaMicro system for authentication in
the script via the command:

    copy authorized-key scp: 192.168.1.1 rcb /home/rcb/.ssh/rcb_rsa system:

 The process should be scripted, since close to 50 nodes are involved. A
simple disk configuration script can be located at \[[Disk Configuration
Script](http://a5a400a78267f687417a-ad3211b4faa062e0774d6af6255fc585.r97.cf1.rackcdn.com/diskConfig.sh)\].
Swift may be installed after the infrastructure is set up properly and
all nodes have operating systems. The controller nodes will be installed
using RPCS while other nodes are regular CentOS environments.
Documentation provided by Rackspace Private Cloud will explain how to
properly use the cookbooks to install Swift on each of the desired nodes
\[[OpenStack Object Storage installation
guide](http://addff702607deedcafc3-81cc2db876f4430c0f6e1367cfd71afd.r1.cf1.rackcdn.com/rackspace-private-cloud-swift-install.pdf)\].

### Conclusion

"Swift in a Rack" allows businesses to deploy a decent-sized object
storage environment in a fashion that may be implemented in an
afternoon. This environment can scale to multiple petabytes and also
ensure objects are available and uncorrupted.

### References:

-   [SeaMicro SM15000 Fabric Compute Systems](http://www.seamicro.com/products/SM15000)
-   [AMD Expands SeaMicro: Big Data Gets a High Performance
    Home](http://www.brightsideofnews.com/print/2012/9/11/amd-expands-seamicro-big-data-gets-a-high-performance-home.aspx)
-   [SeaMicro Technology
    Overview](http://www.seamicro.com/sites/default/files/SM_TO01_64_v2.5.pdf)
-   [Wormhole
    switching](http://en.wikipedia.org/wiki/Wormhole_switching)
