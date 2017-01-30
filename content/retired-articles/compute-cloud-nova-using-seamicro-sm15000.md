---
permalink: compute-cloud-nova-using-seamicro-sm15000/
audit_date:
title: Compute Cloud (Nova) using SeaMicro SM15000
type: article
created_date: '2013-01-24'
created_by: Alyssa Hurtgen
last_modified_date: '2016-01-06'
last_modified_by: Constanze Kratel
---

Cloud computing is creating significant shifts in the way information
technology is provisioned and consumed. This also kicks off a challenge
to cloud service providers find innovative ways to adhere to the high
demands of availability, performance, efficiency, and
cost-effectiveness.

AMD's SeaMicro SM15000&trade; brings together compute, storage, and networking
very effectively to solve huge costs and space issues with hardware
required to operate a cloud. This paper describes the SeaMicro fabric,
architecture, and tips to realize a compute cloud using Rackspace
Private Cloud Software (RPCS).

### The SeaMicro SM15000&trade;

The AMD SeaMicro SM15000&trade; brings compute, networking, and a
super-compute fabric together in a single 10 Rack Unit (RU) chassis. It
may be configured with the following:

-   64 compute cards (c-cards) with up to 8 cores per card

<!-- -->

-   64 internal SSD or HDD drives at 2.5"

<!-- -->

-   8 storage cards (s-cards) with up to 1,344 external disks
    -   2 enclosures (Just a Bunch of Disks/JBODs) each
    -   84 3.5" disks per JBOD

<!-- -->

-   4 Terabytes of DRAM

<!-- -->

-   16 x 10 Gigabit Ethernet (GbE) or 64 x 1 GbE uplinks

A total raw capacity of 6,848 TB or 6.69 PB may be attached to the
system, including both internal and external drives.

<img src="{% asset_path rpc-openstack/compute-cloud-nova-using-seamicro-sm15000/seamicro.png %}" width="538" height="257" />

An interesting and powerful aspect of the SM15000&trade; is the supercompute
fabric, which is able to deliver 1.28 Terabits/second of bandwidth
internally. It is configured as a three-dimensional torus, tunneling
packets using flow control digits (FLITs) and routing them through a
"wormhole fabric". The "wormhole fabric" uses a simple protocol to route
packets based on whether virtual channels are active, waiting, or idle.
In cases of high congestion, the traffic is prioritized using virtual
channels. Storage traffic is always given the highest priority to avoid
interruption.

### OpenStack Compute

OpenStack Compute, code named Nova, is the cloud operating system to
launch and organize a compute cloud, which includes creating and running
instances as well as managing the networks between virtual machines.

OpenStack compute consists of different services, but they are mainly
categorized into two types of nodes:

-   Controller Node - Controller node hosts RabbitMQ server, MySQL
    database, Keystone, API server, Horizon, and Glance.

<!-- -->

-   Compute Node - nova-compute and nova-network.

The API service is responsible for receiving and responding to the user
request.  Once the request is received, the nova-scheduler service finds
the right compute host and sends it a message. All of these services
talk with each other using a RabbitMQ that is sitting on the controller
node. MySQL database that is also sitting on the controller node is the
central database used to store any persistent data.

You can interact with the APIs using OpenStack python-bindings or you
can use Horizon, which is a graphical user interface to interact with
the cloud.

<img src="{% asset_path rpc-openstack/compute-cloud-nova-using-seamicro-sm15000/masscompute_1-web.jpg %}" width="600" height="398" />

### Recommended architecture

AMD SM15000&trade; brings a good balance between storage, compute, and
networking.  The SM15000&trade; comes with 64 compute cards, 64 internal
storage cards that can be extended up to 2 TB per card, and 16 ten
Gigabit Ethernet (GbE) in single chassis that makes this environment
very attractive. A recommended architecture for the different compute
services running in the SeaMicro fabric is as follows:

-   2 RPCS controllers on their own c-card - each will host Rabbitmq,
    Horizon dashboard, nova-scheduler, cinder-scheduler, Keystone
    Identity service, API services, and MySQL database.

<!-- -->

-   4 cinder-volume servers on 4 c-cards with 4\*2 TB of block storage.
-   1 Chef-server on it's own c-card

<!-- -->

-   45 compute nodes on 45 c-cards running nova-compute. These nodes
    will host the virtual machines.

The SM15000&trade; incorporates a technology to interconnect all the nodes
including computing cards, disks, network-interface cards, power
supplies, and fans.  With this technology, the SM15000&trade; provides
multiple paths between any two components in the system, which allows
system for easy routing during node failures.

Each SeaMicro fabric comes with 6 slots for AC/DC power supplies and 4
optional slots. Failure of a single power supply doesn't have any impact
on the system availability and operation.

### Installation

Installation of RPCS is well documented in the following article:

[Getting Started with Rackspace Private Cloud -
OpenStack](/how-to/rpc-openstack "/how-to/rpc-openstack")

### Conclusion

AMD SM15000&trade; provides an efficient combination of compute, storage, and
networking in a compact box and is a strong choice for creating compute
cloud in a box. It consumes less space and power compared to other
solutions, and is just one system to manage.

### References

<http://www.seamicro.com/products/SM15000>

<http://www.brightsideofnews.com/print/2012/9/11/amd-expands-seamicro-big-data-gets-a-high-performance-home.aspx>

<http://www.fallenbeck.net/publications/sfsf10.pdf>

<http://github.com/rcbops/chef-cookbooks>
