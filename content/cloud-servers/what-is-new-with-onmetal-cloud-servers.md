---
permalink: what-is-new-with-onmetal-cloud-servers/
audit_date:
title: What is new with OnMetal Cloud Servers
type: article
created_date: '2014-06-19'
created_by: Kyle Laffoon
last_modified_date: '2016-07-22'
last_modified_by: Aurimas Mickevicius
product: Cloud Servers
product_url: cloud-servers
---

OnMetal servers are single-tenant, bare metal servers provisioned via
the same OpenStack API as our cloud. They can be spun up or down as
quickly as VMs to offer the agility of multi-tenant environments with
the performance of single-tenant hardware. OnMetal servers are
engineered as 100 percent solid-state with external cooling. This
provides increased mean time between failures (MTBF). They are very
large, so you will need fewer of them.

OnMetal is designed for large or quickly-growing Internet businesses
thinking about moving from colo to cloud, or vice versa:

-   You pay by the minute, just like with VMs. But OnMetal servers are
    much simpler and more powerful than VMs.

-   They are built on OpenStack software and Open Compute hardware. The
    API for OnMetal is the OpenStack Nova API. It's familiar to users of
    any OpenStack public cloud. Users don't have to worry about
    vendor lock-in.
-   OnMetal servers are customized for specific workloads.
-   There is no hypervisor, and no virtualization tax.
-   There is no sharing of metal with any other user.

### Disk structure

OnMetal combines the simplicity of consistent performance and the
economy of colocation with the elasticity of the cloud. Running your
high-traffic production environment on consistently performing bare
metal machines means less over-engineering, more simplicity and ultimately lower costs. Because OnMetal is a part of the Rackspace
Managed Cloud portfolio, you won't spend as much managing your servers.

The chassis is all solid-state. We removed cooling fans from the boxes
and do not use any spinning media. This reduces heat and vibration,
and helps increase MTBF. In order to deliver the economy of colocation
that customers require, we optimized the configuration based on specific
workload requirements like "database transactions per second per dollar"
or "total RAM per dollar per hour". This led to the following
configurations:

| Instance name  | CPU/RAM/disk/network         | Description                              |
|----------------|------------------------------|------------------------------------------|
|**OnMetal GP v2 Small**   | **2.4 Ghz, 6 core Intel® Xeon® E5-2620 v3**, 32GB RAM, redundant 800GB hot-swappable SSDs configured in a RAID 1 mirror, redundant 10Gb/s network   | Great for all-around cloud needs and workloads. Perfect for large network requests, load balancers like HA Proxy, handling web server workloads and doing background processing. |
| **OnMetal GP v2 Medium** | **Dual 2.4 Ghz, 6 core Intel® Xeon® E5-2620 v3**, 64GB RAM, redundant 800GB hot-swappable SSDs configured in a RAID 1 mirror, redundant 10Gb/s network  | Optimized for larger web server workloads and most common open source databases, also container platforms like Docker.    |
| **OnMetal GP v2 Large**  | **Dual 2.4 Ghz, 6 core Intel® Xeon® E5-2620 v3**, 128GB RAM, redundant 800GB hot-swappable SSDs configured in a RAID 1 mirror, redundant 10Gb/s network  | Optimized for memory-heavy workloads. Especially useful for high RAM activity like in-memory SQL configurations, caching servers, and search indexes.   |
| **OnMetal I/O v2**  | **Dual 2.6 GHz, 10 core Intel® Xeon® E5-2660 v3**, 128GB RAM, 240GB hot-swappable SSDs configured in a RAID 1 mirror, **Dual Seagate Nytro XP6302 1.6 TB PCIe flash cards**,  redundant 10Gb/s network  | Designed to support low-latency and extreme throughput to local storage. Optimized for large relational databases and NoSQL data stores like Cassandra or MongoDB, latency-sensitive applications, online transaction processing and real-time analytics.   |

All OnMetal v2 are built on second generation Open Compute hardware, General Purpose v2 utilize Intel Xeon E5-2620 v3 processors and I/O v2 - Intel Xeon E5-2660 v3 processor. Fast and redundant 10-gigabit network is used for all instance types, because
network performance is becoming increasingly important. Integration with Cloud Networks and RackConnect 3.0 allow to isolate traffic for complete security. All OnMetal v2 server flavors have redundant hot-swappable SSDs configured in a RAID 1 mirror to reduce the risk of lost data. The  I/O v2 flavor also has two Seagate Nytro XP6302 1.6 TB PCIe flash cards for extreme throughput to local storage. Cloud
Block Storage can be attached to any OnMetal server instance (see
[Attach a Cloud Block Storage volume to an OnMetal server](/how-to/attach-a-cloud-block-storage-volume-to-an-onmetal-server)
). However, configuring the available flash drives as data drives
provides a much faster configuration. See [Configure flash drives in High I/O instances as Data drives](/how-to/configure-flash-drives-in-high-io-instances-as-data-drives)
for more information on this option.

### What Is Different with OnMetal Cloud Servers from other cloud servers?

API-driven instant provisioning of OnMetal Cloud Servers brings the
agility and elasticity of the cloud without the problems of multi-tenant
environments. All OnMetal flavors include dual 10-gigabit Ethernet (10
GigE) 10G NICs in a high-availability bonded configuration, and use VLAN
tagging to access ServiceNet (for traffic within a Rackspace data
center) and PublicNet (the Internet).

OnMetal servers are not offered as single-tenant VMs for the following
reasons:

-   Several customers expressed concerns with virtualization tax, which
    becomes more important as the number of servers grows. While
    hypervisors continue to get better, we routinely meet customers who
    feel the impact of this tax.
-   We see a technology trend in software that renders virtualization
    less useful. In a single-tenant environment like OnMetal, the
    application management and isolation that virtualization requires is
    not necessary.
-   The progress in operating systems has delivered a native capability
    to isolate applications by using containers. Companies like
    [Docker](http://www.docker.com/) and [CoreOS](https://coreos.com/)
    provide tools to run fully isolated applications without relying on
    virtualization, and we see this as an emerging trend to run at
    scale: containers on bare metal.

Depending on your application needs, you have the option to mix and
match multi-tenant VMs with bare metal instances. OnMetal servers must
be created using SSH key pairs. You should neither use nor modify the
administrator password generated by the server build operation. For
information on generating SSH keys, see [Manage SSH Key Pairs for Cloud Servers with python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

### Limitations

After an OnMetal server is built, there is a slight delay in network availability. Even after the status reads ACTIVE, a few additional minutes (3 to 4) are needed for the network configuration to complete. After the new OnMetal server pings successfully, you can begin to use it.

You can attach a private network to OnMetal V2 servers at boot time, but
post-boot attachment to OnMetal v2 servers is not supported yet. OnMetal V1
servers do not support configuration of private networks. With OnMetal v1
servers, use ServiceNet for internal traffic, and remember to secure your
OnMetal server because ServiceNet is open to other Rackspace customers.

With no hypervisor, there is also not a web terminal or console as on
other Rackspace cloud servers. This limits the options available if you
lose access to your OnMetal Cloud Server. If access is lost, you must
reprovision your OnMetal Cloud Server. Use caution with your login
information and network configuration.

The following actions and features are not possible on OnMetal servers:

-   Server rebuild
-   Server resize
-   Server image creation
-   Password change
-   Connect via console
