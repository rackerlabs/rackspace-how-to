---
permalink: rackconnect-regionlink-faq/
audit_date:
title: RackConnect RegionLink FAQ
type: article
created_date: '2014-12-04'
created_by: Sameer Satyam
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

Get quick answers to common questions about RackConnect RegionLink.

#### What is RackConnect RegionLink?

RackConnect RegionLink is a Limited Availability service that enables
Dedicated Hosting customers to connect infrastructure that they have
deployed across two or more Rackspace regions. The service uses
multiprotocol label switching (MPLS) virtual private network (VPN)
across Rackspace Backbone and enables connectivity between resources at
Layer 2 or Layer 3.

#### Why do you need it?

Some Dedicated Hosting customers cannot tolerate the risk of unexpected
downtime. To mitigate the risk of an outage caused by a problem with a
single Rackspace region, customers can distribute their
compute resources across multiple Rackspace regions. Interregional
connectivity is a way to transfer data between Rackspace regions at
lower latency and with better throughput than over the Internet.

#### What are some common use cases for this service?

Customers might want to establish a backup or high availability
duplicate of an existing configuration (for example, database
replication) or geographically distribute applications closer to their
customers to minimize latency and improve network performance.

#### What are the benefits of the interregional solution?

-   Bypasses multiple layers of network devices, which improves latency
-   Better option than using upgraded firewalls just for VPN throughput
-   Built-in redundancy
-   Fully managed and supported by Rackspace

#### Which Rackspace customers can use this service?

The RackConnect RegionLink service is available only for Dedicated
Hosting customers at this time.

#### In which regions is this service available?

The service is currently available in IAD, DFW, and ORD regions.

#### Is a dedicated aggregation (customer edge) device needed to use this service?

Yes, a dedicated aggregation, or customer edge (CE) device is needed at
this time. We recommend one of the following devices:

-   Cisco 4948E
-   Arista 7050
-   Cisco Nexus 3064

#### Is the traffic encrypted?

The service does not provide any encryption. It is purely an MPLS VPN
connection (L2/L3). The traffic rides across the Rackspace backbone all
the way through without hitting the Internet.

#### What kind of speeds are supported?

At launch, the service supports connectivity speeds of 100 Mbps, 500
Mbps, and 1 Gbps. Faster speeds are supported on a case-by-case
basis.

#### Is redundancy built in to the solution?

Yes, there are two connectivity options into the backbone from the
dedicated aggregation (customer edge) device. Both options use
two uplinks to the data center provider edge (PE) device.

#### What is the SLA for this service?

The SLA varies based on which redundancy option the customer chooses. If the customer wants only one dedicated aggregation device, the SLA is limited to a 1-hour hardware replacement time for the aggregated device. If the customer uses two dedicated aggregation devices, we have an SLA of 99.9% connection availability between data center edge devices. See the
[Rackspace RackConnect RegionLink Terms](http://www.rackspace.com/information/legal/rackconnect_regionlink)
for the SLA.

#### For an MPLS L3 VPN connection, how many VPN prefixes can be exchanged between the sites?

Up to 100 prefixes can be exchanged.

#### Is IPv6 traffic supported?

No. Only IPv4 is supported at this time.

#### How do I order the service, and what is the pricing?

Contact your Rackspace account representative for ordering and pricing
information.
