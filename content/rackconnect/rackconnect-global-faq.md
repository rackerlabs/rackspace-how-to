---
node_id: 4864
title: RackConnect Global FAQ
type: article
created_date: '2015-10-16'
created_by: Sameer Satyam
last_modified_date: '2015-10-22'
last_modified_by: Nate Archer
product: RackConnect
product_url: rackconnect
---

#### What is RackConnect Global?

RackConnect Global is a connectivity service that makes it
possible for you to deploy a hybrid cloud infrastructure at Rackspace
with the best network performance possible. See
<http://www.rackspace.com/cloud/hybrid/rackconnect/global> for more
details.

#### Who is the audience for RackConnect Global and what pain points does it solve?

RackConnect Global is intended for enterprise users that want to connect their
infrastructure at Rackspace with their infrastructure outside of
Rackspace without going over the Internet. Traditionally you would
choose a site-to-site VPN solution or work with a network provider to
drop a leased line into Rackspace data centers. While the first solution
results in unpredictable latency and throughput, the latter involves
working with a third party provider, which can prove costly.
RackConnect Global allows you to deploy your hybrid cloud in a network with low
latency, predictable throughput, and predictable redundancy at a
reasonable cost to you, all managed by Rackspace Fanatical Support.

#### What are the primary use cases?

If you want to use Rackspace infrastructure for backup and disaster recovery
scenarios (for example, database replication), if you are seeking to
avoid the Internet networking path to reduce the latency and if you want
to make throughput predictable, RackConnect Global helps you achieve this goal.

RackConnect Global also works for those who want to deploy some components of your
infrastructure at Rackspace (for example a database in Rackspace)
whereas you may want to deploy other components (web/front-end) in other
clouds (like Azure). RackConnect Global makes the connectivity between components
faster and more reliable than connectivity over the Internet.

Lastly, RackConnect Global works for those who have latency sensitive
services (like VoIP/Video) on Rackspace and may want dedicated access to
Rackspace for good performance.

#### Is this product being launched for Dedicated hosting or cloud customers? What networks can be connected?

RackConnect Global is primarily for Rackspace dedicated hosting users at
launch. Dedicated hosting users who want to establish a virtual circuit
to connect the dedicated private (ExNet) address space at Rackspace to a
private address space on their side of the connection (for purposes like
disaster recovery or business continuity, for example database replication)
are the target customer set. However, Rackspace Cloud or Dedicated
hosting customers who want to access Public prefixes via RackConnect Global may also do
so via dedicated cross-connect only. Note that customers cannot use
RackConnect Global to connect to private prefixes on the Rackspace Public
cloud (for example, Cloud networks).

#### In what regions is the service being launched?

RackConnect Global will be available in all three US data centers at this time
(ORD, IAD and DFW). The service will be available in LON at a later
date.

#### What are the connectivity options for users to establish a connection via RackConnect Global?

Users can connect via the following means:

- Dedicated cross-connect if they are colocated at the Equinix
facilities in the US (that is, DFW, ORD, IAD)

- They can be a buyer on the Equinix cloud exchange

- They can be a Microsoft Azure customer using ExpressRoute (this is a
Microsoft Equivalent of RackConnect Global)

#### Can we connect to Public cloud isolated networks (Cloud networks) over RackConnect v3?

No, we do not support any sort of connectivity to any Public Cloud
resources via RackConnect v2 or v3 at this time.

#### What speeds are supported?

We support connectivity speeds of 100 Mbps, 200 Mbps, 500 Mbps, and 1 Gbps
at launch. Higher speeds will be handled on a case-by-case basis. Note
that these are the speeds supported by Rackspace and can only be
supported if the other end of the virtual circuit is capable of
supporting these speeds.

#### Is a dedicated aggregation (customer edge) device needed to use this service?

Yes, a dedicated aggregation (customer edge) is needed at this time.

#### What kind of dedicated aggregation (customer edge) devices are supported?

At this time we recommend one of the following devices:

-   Arista 7050-SX
-   Cisco 9372-PX

#### Are dedicated TORs needed to use this service?

Yes we need dedicated TORs. We cannot connect shared TORs to Dedicated
aggregation devices as that would create a problem with zone management,
billing, automation, monitoring and complicates troubleshooting. Cisco
2960 devices can be used as TORs.

#### Is the traffic secure?

The service does not provide encryption of any sort. It is purely an
MPLS VPN connection. The traffic rides all the way through the Rackspace
Backbone (the network that interconnects Rackspace regions and provides
connectivity outside of Rackspace) without hitting the Internet path and
is inherently secure.

#### Does the service have an SLA?

Rackspace provides a 99.9% uptime service level agreement (SLA), which this is defined as follows :
"Rackspace guarantees that the termination end point for the RackConnect
Global Service virtual circuit will be able to accept connections 99.9%
of the time in any calendar month, provided that there are two or more
virtual circuit termination end points at the Rackspace data center
location."

#### What is the high-level procedure by which an RackConnect Global connection can be ordered and provisioned for the customer?

The complete procedure can be found at [RackConnect Global user workflow](/how-to/rackconnect-global-user-workflow).
