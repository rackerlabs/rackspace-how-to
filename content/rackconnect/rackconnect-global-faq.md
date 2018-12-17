---
permalink: rackconnect-global-faq/
audit_date:
title: RackConnect Global FAQ
type: article
created_date: '2015-10-16'
created_by: Sameer Satyam
last_modified_date: '2018-06-15'
last_modified_by: Shannon Enix
product: RackConnect
product_url: rackconnect
---

#### What is RackConnect Global?

RackConnect Global is a connectivity service that makes it
possible for you to deploy a hybrid cloud infrastructure connecting Rackspace
to infrastructure hosted on your premises, at a colocation provider, or in AWS, 
Microsoft Azure, Google Cloud Platform or Alibaba Cloud. For more details, see
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
reasonable cost to you, all managed by Rackspace **Fanatical Support**&reg;.
You can also use RackConnect Global to connect Rackspace regions across the 
U.S. and Europe along the Rackspace backbone, which avoids the Internet.

#### What are the primary use cases?

If you want to use Rackspace infrastructure for backup and disaster recovery
scenarios (for example, database replication), if you are seeking to
avoid the Internet networking path to reduce the latency, and if you want
to make throughput predictable, RackConnect Global helps you achieve this goal.

RackConnect Global also works for customers who want to deploy some components of their infrastructure at Rackspace (for example a database in Rackspace) and other components (web or front end) in other clouds (like Microsoft Azure, Amazon Web Services, Google Cloud Platform, and Alibaba Cloud). RackConnect Global makes the connectivity between components
faster and more reliable than connectivity over the Internet.

Lastly, RackConnect Global works for those who have latency-sensitive services (like VoIP or video) on Rackspace and might want dedicated access to Rackspace for good performance.

#### Is this product for managed hosting or cloud customers? What networks can be connected?

RackConnect Global is primarily for Rackspace managed hosting users at
launch. Managed hosting users who want to establish a virtual circuit
to connect the dedicated private (ExNet) address space at Rackspace to a
private address space on their side of the connection (for purposes like
disaster recovery or business continuity, for example, database replication)
are the target customer set. However, Rackspace cloud or dedicated
hosting customers who want to access public prefixes via RackConnect Global can also do
so via dedicated cross-connect only. Note that customers cannot use
RackConnect Global to connect to private prefixes on the Rackspace Public
cloud (for example, cloud networks).

#### In what regions is the service available?

RackConnect Global is available in DFW, FRA, IAD, LON, ORD, and SYD Rackspace data centers with connectivity across North America, Europe and Australia.
With 26 RackConnect Global locations, in 10 countries, across 3 continents and growing, you can choose the RackConnect Global locations closest to your data center.

#### What are the connectivity options for users to establish a connection via RackConnect Global?

Users can connect via the following means:

- Dedicated cross-connect, if they are colocated at supported Equinix or Megaport locations in the North American, European, or Australian continents. (view the list of supported locations: https://www.rackspace.com/cloud-connectivity/rackconnect/global)

- As a buyer on the Equinix or Megaport cloud exchange

- As a Microsoft Azure customer using ExpressRoute (this is a Microsoft Equivalent of RackConnect Global)

- As an Amazon Web Services customers using AWS Direct Connect

#### What speeds are supported?

Connectivity speeds of 100 Mbps, 200 Mbps, 500 Mbps, 1 Gbps, 2 Gbps, 
5 Gbps, and 10 Gbps are supportedat launch. Higher speeds will be 
handled on a case-by-case basis. Note that these are the speeds 
supported by Rackspace and can be supported only if the other end 
of the virtual circuit is capable of
supporting these speeds.

#### Is a dedicated aggregation switch (customer edge device) and top of rack (TOR) switch needed to use this service?

No, at Rackspace we offer customers the choice of utilizing dedicated 
10G switches or shared 10G switches (which is a more affordable option).

#### Is the traffic secure?

Use RackConnect Global to securely transfer data without going over the 
Internet, using a private circuit that isn’t shared with others — for an 
additional layer of protection for your business data and apps. The 
service does not provide encryption of any sort. It is purely an
MPLS VPN connection. The traffic rides all the way through the Rackspace
Backbone (the network that interconnects Rackspace regions and provides
connectivity outside of Rackspace) without hitting the Internet path and
is inherently secure.

#### Does the service have an SLA?

Yes. RackConnect Global includes a 99.9% Connectivity Uptime Guarantee, industry-leading SLAs and Fanatical Support — the commitment to 24x7x365 service and support that’s at the core of what we do. (Rackspace guarantees that the termination end point for the RackConnect Global Service virtual circuit will be able to accept connections 99.9% of the time in any calendar month, provided that there are two or more virtual circuit termination end points at the Rackspace data center location.) You can read the agreement at [https://www.rackspace.com/information/legal/rackconnect-global-regionlink](https://www.rackspace.com/information/legal/rackconnect-global-regionlink).

#### What is the high-level procedure by which an RackConnect Global connection can be ordered and provisioned for the customer?

The complete procedure can be found at [RackConnect Global user workflow](/how-to/rackconnect-global-user-workflow).
