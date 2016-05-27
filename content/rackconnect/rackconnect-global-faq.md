---
permalink: rackconnect-global-faq/
audit_date:
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
with the best network performance possible. For more details, see
<http://www.rackspace.com/cloud/hybrid/rackconnect/global>.

#### Who is the audience for RackConnect Global and what pain points does it solve?

RackConnect Global is intended for enterprise users that want to connect their
infrastructure at Rackspace with their infrastructure outside of
Rackspace without going over the Internet. Traditionally you would
choose a site-to-site VPN solution or work with a network provider to
drop a leased line into Rackspace data centers. The first solution
results in unpredictable latency and throughput, and the latter involves
working with a third-party provider, which can be costly.
RackConnect Global enables you to deploy your hybrid cloud in a network with low
latency, predictable throughput, and predictable redundancy at a
reasonable cost to you, all managed by Rackspace ***Fanatical Support***&reg;.

#### What are the primary use cases?

If you want to use Rackspace infrastructure for backup and disaster recovery
scenarios (for example, database replication), if you are seeking to
avoid the Internet networking path to reduce the latency, and if you want
to make throughput predictable, RackConnect Global helps you achieve this goal.

RackConnect Global also works for customers who want to deploy some components of their infrastructure at Rackspace (for example a database in Rackspace) and other components (web or front end) in other clouds (like Azure). RackConnect Global makes the connectivity between components
faster and more reliable than connectivity over the Internet.

Lastly, RackConnect Global works for those who have latency-sensitive services (like VoIP or video) on Rackspace and might want dedicated access to Rackspace for good performance.

#### Is this product being launched for dedicated hosting or cloud customers? What networks can be connected?

RackConnect Global is primarily for Rackspace dedicated hosting users at
launch. Dedicated hosting users who want to establish a virtual circuit
to connect the dedicated private (ExNet) address space at Rackspace to a
private address space on their side of the connection (for purposes like
disaster recovery or business continuity, for example, database replication)
are the target customer set. However, Rackspace cloud or dedicated
hosting customers who want to access public prefixes via RackConnect Global can also do
so via dedicated cross-connect only. Note that customers cannot use
RackConnect Global to connect to private prefixes on the Rackspace Public
cloud (for example, cloud networks).

#### In what regions is the service being launched?

RackConnect Global is available in all three US data centers at this time
(ORD, IAD and DFW). The service will be available in LON at a later
date.

#### What are the connectivity options for users to establish a connection via RackConnect Global?

Users can connect via the following means:

- Dedicated cross-connect, if they are colocated at the Equinix facilities in the US (that is, DFW, ORD, IAD)

- As a buyer on the Equinix cloud exchange

- As a Microsoft Azure customer using ExpressRoute (this is a Microsoft Equivalent of RackConnect Global)

#### Can I connect to public cloud isolated networks (cloud networks) over RackConnect v3?

No, we do not support any sort of connectivity to any public cloud resources via RackConnect v2.0 or v3.0 at this time.

#### What speeds are supported?

Connectivity speeds of 100 Mbps, 200 Mbps, 500 Mbps, and 1 Gbps are supported
at launch. Higher speeds will be handled on a case-by-case basis. Note
that these are the speeds supported by Rackspace and can be
supported only if the other end of the virtual circuit is capable of
supporting these speeds.

#### Is a dedicated aggregation (customer edge) device needed to use this service?

Yes, a dedicated aggregation (customer edge) device is needed at this time. We currently recommend one of the following devices:

-   Arista 7050-SX
-   Cisco 9372-PX

#### Are dedicated TORs needed to use this service?

Yes, dedicated TORs are needed. We cannot connect shared TORs to dedicated
aggregation devices because that would create a problem with zone management,
billing, automation, and monitoring, and complicate troubleshooting. Cisco
2960 devices can be used as TORs.

#### Is the traffic secure?

The service does not provide encryption of any sort. It is purely an
MPLS VPN connection. The traffic rides all the way through the Rackspace
Backbone (the network that interconnects Rackspace regions and provides
connectivity outside of Rackspace) without hitting the Internet path and
is inherently secure.

#### Does the service have an SLA?

Yes. You can read the agreement at https://www.rackspace.com/information/legal/rackconnect-global-regionlink.

#### What is the high-level procedure by which an RackConnect Global connection can be ordered and provisioned for the customer?

The complete procedure can be found at [RackConnect Global user workflow](/how-to/rackconnect-global-user-workflow).
