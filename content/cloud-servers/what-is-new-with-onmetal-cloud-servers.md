---
node_id: 4106
title: What is new with OnMetal Cloud Servers
type: article
created_date: '2014-06-19'
created_by: Kyle Laffoon
last_modified_date: '2016-01-05'
last_modified_by: Kyle Laffoon
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
and do not using any spinning media. This reduces heat and vibration,
and helps increase MTBF. In order to deliver the economy of colocation
that customers require, we optimized the configuration based on specific
workload requirements like "database transactions per second per dollar"
or "total RAM per dollar per hour". This led to the following
configurations:

| Instance name  | CPU/RAM/disk/network         | Description                              |
|----------------|------------------------------|------------------------------------------|
|**Compute** (High CPU)   | **10 Cores**, 32 GB RAM, no disk, 10 gigabit   | Latest Xeons optimized for CPU per dollar, perfect for handling web requests and doing background processing. Optimized for high CPU activity like network requests, application logic, web servers, and load balancers. |
| **High I/O** (High RAM)   | **20 cores, 128 GB RAM, **3.2 TB of PCIe Flash**, 10 gigabit** | Optimized for the best performance per dollar for the most common open source databases. Optimized for high I/O activity like NoSQL and SQL databases                                                                    |
| **Memory**      | **12 cores, **512 GB RAM**, no disk, 10 gigabit**     | Optimized for the best RAM per dollar ratio or memory-heavy workloads. Especially useful for high RAM activity like in-memory SQL configurations, caching, and searching indexes.   |

The fast 10-gigabit network is used for all instance types, because
network performance is becoming increasingly important. All OnMetal
server flavors have a 32 GB system disk. The OnMetal High I/O flavor
also has two 1.6 TB PCIe flash drives, which are mounted directly into
**/dev** as regular disks. Rackspace recommends using Linux built-in
software RAID. OnMetal Compute and Memory flavors only use the 32 GB
system disk and are considered "diskless", with no data disks. Cloud
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

After an OnMetal server is built, there is a slight delay in network
availability. Even after the status reads ACTIVE, a few additional
minutes (3 to 4) are needed for the network configuration to complete.
After the new OnMetal server pings successfully, you can begin to use
it.

You cannot attach a private network to an OnMetal server. Future
generations of OnMetal servers will have this capability. Until then,
use ServiceNet for internal traffic, and remember to secure your OnMetal
server because ServiceNet is open to other Rackspace customers.

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
