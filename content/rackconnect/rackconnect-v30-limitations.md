---
permalink: rackconnect-v30-limitations/
audit_date: '2018-05-05'
title: RackConnect v3.0 limitations
type: article
created_date: '2014-08-29'
created_by: Juan Perez
last_modified_date: '2018-10-25'
last_modified_by: Stephanie Fillmon
product: RackConnect
product_url: rackconnect
---

This article describes the limitations of RackConnect v3.0.

### Cloud account

A single cloud account cannot be associated with both a RackConnect v3.0 configuration and a RackConnect v2.0 configuration.

### Cloud Networks

Be aware of the following considerations for cloud networks:

- Limitations in the Rackspace Cloud Networks service also apply to cloud networks that are associated with RackConnect v3.0. For example, cloud networks is currently limited to 10 isolated networks and up to 250 cloud servers per network. These limitations also apply to cloud networks that are associated with RackConnect v3.0. For a list of current cloud networks limitations, see [Create an isolated Cloud Network and attach it to a server](/how-to/create-an-isolated-cloud-network-and-attach-it-to-a-server) and [Cloud Networks FAQ](/how-to/cloud-networks-faq).

- Currently, only cloud servers configured with a single cloud network are supported.

- Avoid using network ranges for your cloud networks that overlap with the Rackspace public cloud ServiceNet IP address ranges of 10.176.0.0/12 and 10.208.0.0/12. Also avoid using network ranges that are already in use on the dedicated side of your network or that consist of public IP addresses.

  **Note:** Other than the preceding caveats, we recommend that you use network ranges from within the standard private IPv4 address spaces of 10.0.0.0-10.255.255.255, 172.16.0.0-172.31.255.255, or 192.168.0.0-192.168.255.255 for your cloud networks. We also recommend that you select a /24 CIDR subnet mask to simplify management, because a /24 CIDR is large enough to support 250 cloud servers (the cloud servers limit per network). If you are planning to build and delete a large number of cloud servers every hour, then you might want to use a subnet that allows for a larger number of cloud servers, such as a /23 CIDR, to avoid potential issues with cloud network IP address availability.

- You cannot have a single network subnet that spans both your cloud and dedicated environments. To clarify, your network subnets on your dedicated side must be on a different subnet than your cloud network's subnet.

- RackConnect v3.0 cloud servers are automatically assigned their cloud network subnet's first IP address as the default gateway. The gateway IP address lives on the RackConnect v3.0 connected network device, and is manually configured by Rackspace during the RackConnect v3.0 implementation process.

### RackConnect v3.0

Not all of the Rackspace public cloud products are compatible with RackConnect v3.0 cloud servers. To verify which offerings are supported, see [RackConnect v3.0 compatibility](/how-to/rackconnect-v30-compatibility).

### Types of RackConnect Gateways

Consider the following information about gateways in RackConnect:

- RackConnect v3.0 has two types of gateways: software gateways and hardware gateways. Hardware gateways are better than
software gateways because of the translation that is done in the hardware Application-Specific Integrated Circuit (ASIC) layer. All clients who implement RackConnect or who migrate to RackConnect v3.0 from v2.0 receive hardware gateways free  of charge. If you have RackConnect v3.0 on software gateways, you can ask Rackspace to move you to hardware gateways free of charge. Moving to hardware gateways does not require any changes on your part.

- Traffic that traverses the RackConnect v3.0 link between your cloud and dedicated environments is bandwidth-limited by  Quality of Service (QoS) policies on only software gateways. By default, these QoS policies are set to limit bandwidth throughput to 100 megabits per second (Mbps), but with Rackspace approval, they may be increased. If you need more than 100 Mbps of bandwidth, [contact us](/how-to/support/) for details about potential one-off solutions. Note that hardware gateways do not have this restriction.

- As with RackConnect v2.0, RackConnect v3.0 bandwidth might be limited by the capabilities of the cloud servers flavors that you are running, your network device's capabilities, and your dedicated server's capabilities.

- The default setting for RackConnect v3.0 access between cloud and dedicated network segments is to restrict all communication. During the RackConnect v3.0 implementation process and afterwards, you can provide us with details about how you want the access between your network segments configured. Alternatively, you can also set up any necessary firewall rules on your own by using the Firewall Manager feature that is available in the [MyRackspace Portal](https://login.rackspace.com/).

- Your devices must be deployed in a region supported by RackConnect v3.0. The regions supported are DFW, IAD, ORD, LON, HKG, and SYD.

### RackConnect v3.0 API

Be aware of the following considerations for the API in Rackspace v3.0:

- Cloud servers metadata options are no longer available with RackConnect v3.0. Metadata options for RackConnect v3.0 cloud servers have been superseded by the new RackConnect v3.0 API.

- The RackConnect v3.0 API must be used to provision public IP addresses to your cloud servers and to add cloud servers to load balancer pools.

- Currently, you can provision only one public IP address to a RackConnect v3.0 cloud server.

### RackConnect v3.0 cloud servers

Consider the following information about cloud servers for RackConnect v3.0:

- IPv6 is not currently supported.

- Standard cloud servers are supported.

- Currently, PublicNet network interfaces are not supported. Optionally, a single network address translation (NAT) from a dedicated public IP address to a cloud server's cloud network IP address may be configured. This is known as provisioning a public IP address to a RackConnect v3.0 cloud server.

- Currently, only cloud servers configured with a single cloud network are supported.

- ServiceNet network interfaces are optional for Managed Infrastructure service level customers but are required for Managed Operations service level customers.

- Limitations in the Rackspace Cloud Servers service also apply to RackConnect v3.0 cloud servers. For a list of current Rackspace Cloud Server limitations, see the [Cloud Servers FAQ](/how-to/cloud-servers-faq). Cloud server bandwidth limitations are described in [Rackspace Public Cloud Pricing](http://www.rackspace.com/cloud/public-pricing/#cloud-servers).

- Currently, you cannot have multiple cloud network IP addresses on individual RackConnect v3.0 cloud servers.

- Currently, you cannot move, change, add, or remove IP addresses from RackConnect v3.0 cloud servers.
