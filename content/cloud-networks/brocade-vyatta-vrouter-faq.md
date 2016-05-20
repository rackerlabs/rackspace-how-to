---
permalink: brocade-vyatta-vrouter-faq/
audit_date:
title: Brocade Vyatta vRouter FAQ
type: article
created_date: '2013-11-18'
created_by: Sameer Satyam
last_modified_date: '2016-01-11'
last_modified_by: Rose Coste
product: Cloud Networks
product_url: cloud-networks
---

#### What is the network throughput on the Brocade Vyatta vRouter?

Since the Brocade Vyatta vRouter is a network appliance deployed on a
Cloud Server, the network throughput is dictated by the size of the
Cloud Server. Refer to [Cloud Servers Pricing](http://www.rackspace.com/cloud/servers/pricing/) for the network throughput for different flavors of Cloud Servers.

#### What is the minimum amount of RAM needed to run a Vyatta?

The minimum RAM size needed to run a vRouter is 1 GB.

#### Can you assign more than one IP address to the Vyatta's public interface?

Each Vyatta appliance comes with one public IPv4 address assigned. Up to
four additional public IPv4 addresses can be allocated (for a total of
5) . Please see this article for more details: [Requesting Additional IPv4 Addresses for Cloud Servers](/how-to/requesting-additional-ipv4-addresses-for-cloud-servers)

#### Can Vyatta be used along with RackConnect?

No. RackConnect users may not use the vRouter at this time.

#### Is Vyatta available for Managed Operations service level accounts?

Yes. The vRouter is available for the Managed Operations service level.

#### Can the Vyatta be configured in a redundant mode (active/backup Highly available configuration)?

The Vyatta appliance supports VRRP for High-availability. However,
Rackspace cannot support High Availability of Vyatta over the Public Net
interface because "Shared IP address" is not available over PublicNet at
this time. You can, however, setup Vyatta to be Highly Available on the
Cloud Networks interface since Shared IP addresses are supported on
Cloud Networks.

#### Can I add or remove interfaces from a live Vyatta device?

No. Do not add/disconnect networks . This will cause serious issues with
networking on the Vyatta and the only recourse will be to rebuild the
Vyatta.

#### I cannot log into the Vyatta using username 'root' and the password that was set when the Vyatta was created. What is wrong?

Please log in with username 'vyatta' to login to the appliance.

#### What actions are supported on Vyatta through the control panel?

Control panel actions and limitations are described at the following
link: [Vyatta Network Appliance: Supported Actions Through Cloud Control Panel](/how-to/brocade-vyatta-vrouter-supported-actions-through-the-cloud-control-panel)
