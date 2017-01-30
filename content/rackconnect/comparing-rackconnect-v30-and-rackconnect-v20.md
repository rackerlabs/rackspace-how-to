---
permalink: comparing-rackconnect-v30-and-rackconnect-v20/
audit_date:
title: Comparing RackConnect v3.0 and RackConnect v2.0
type: article
created_date: '2014-08-26'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v3.0 and RackConnect v2.0

RackConnect is the innovative hybrid connectivity offering from Rackspace that enables you to select and combine the best features of Rackspace dedicated and cloud hosting into one all-encompassing solution. Both RackConnect v2.0 and RackConnect v3.0 provide network connectivity between your cloud and dedicated environments, but the underlying technologies and methods used in each version to accomplish tasks are different. This article explores the similarities and differences between these two RackConnect versions.

RackConnect v2.0 is the second iteration of RackConnect and was released in November 2011. RackConnect v3.0 is the third and latest iteration of RackConnect and is now release for unlimited availability (UA).

### Migration and maintenance for RackConnect 2.0

A migration path from RackConnect v2.0 to RackConnect v3.0 is being developed, but details about how the migration process will work and when it will be released are not yet available.

Now that RackConnect v3.0 is UA, RackConnect v2.0 will be unavailable to new customers. We will continue to support existing RackConnect v2.0 customer environments.

### Cloud Networks

Cloud Networks is a requirement for and is an inherent part of how RackConnect v3.0 works. With RackConnect v3.0, your cloud network connects directly to your dedicated environment. With RackConnect v2.0, connectivity between a cloud server and a dedicated environment is possible only via ServiceNet.

For more information about how Cloud Networks works with RackConnect v2.0, see the [RackConnect v2.0 with Cloud Networks FAQ](/how-to/rackconnect-v20-with-cloud-networks-faq).

### QoS policies

Traffic across a RackConnect v3.0 link between cloud and dedicated environments has its bandwidth limited by quality of service (QoS) policies. By default, these QoS policies are set to limit bandwidth throughput to 100 Mbps (megabits per second), but this limit may be increased on a case-by-case basis. If you need this value increased, [contact us](/how-to/support).

As with RackConnect v2.0, RackConnect v3.0 bandwidth might be limited by the capabilities or QoS settings of the Cloud Servers flavors that you are running, your network device's capabilities, and your dedicated server's capabilities.

### API

The API for RackConnect v3.0 has been enhanced and rewritten so that it no longer uses the Cloud Servers API metadata options that are needed to accomplish certain tasks with RackConnect v2.0. The RackConnect v3.0 API is public-facing and enables you to seamlessly add and remove cloud servers from your load balancer pools, add and remove public IP addresses from your cloud servers, and list the cloud networks associated with your RackConnect configuration.

For details, see [Getting started with the RackConnect v3.0 API](/how-to/getting-started-with-the-rackconnect-v30-api) and [RackConnect v2.0 API](/how-to/the-rackconnect-v20-api).

### Automation access for Cloud Servers

RackConnect v2.0 requires login access to your cloud servers to implement RackConnect v2.0 automation features. One major change from v2.0 to v3.0 is that the RackConnect automation systems no longer log in, connect, or directly interact in any way with your cloud servers. This is significantly different from how RackConnect v2.0 works and means that software firewall updates and network stack modifications on your cloud servers are not required by or controlled by RackConnect v3.0.

Because of these changes, RackConnect network policies are not available with RackConnect v3.0. Because RackConnect v3.0 is built on isolated networks that only your cloud servers can access, a greater level of security is inherent in the offering.

Modifying local software firewall rules to allow automation access is not required in v3.0, as it is with v2.0. One major benefit of this change is no more restrictions on cloud server images. Any custom cloud server images that are built after your RackConnect v3.0 implementation is online should work seamlessly.

For details, see [RackConnect v3.0 Cloud Servers image compatibility](/how-to/rackconnect-v30-cloud-server-image-compatibility).

### PublicNet and ServiceNet access for cloud servers

For Managed Infrastructure service level cloud accounts, the only network interface required for RackConnect v3.0 cloud servers is one configured on an isolated network (cloud network) that is associated with RackConnect v3.0.

RackConnect v3.0 does not support PublicNet networks, and to avoid incompatibilities, these networks are not selectable on cloud accounts associated with RackConnect v3.0.

It is still possible to assign a public IP address to your RackConnect v3.0 cloud servers, but instead of the IP address being allocated out of the cloud PublicNet IP address blocks, it is allocated out of your dedicated IP address blocks. This is also known as provisioning a public IP address to your cloud servers.

If you have only an isolated network configured on your cloud servers, you cannot use other Rackspace cloud products, such as Cloud Files. If you want to use other Rackspace cloud products and your cloud account is configured at the Managed Infrastructure service level, then you can optionally select to add ServiceNet to your RackConnect v3.0 cloud servers. Alternatively, if your cloud account is at the Managed Operations service level, then a ServiceNet interface is required, in addition to a cloud network interface.

### ServiceNet isolation

ServiceNet connectivity on RackConnect v3.0 associated cloud accounts works differently from how it works with cloud servers.

ServiceNet connectivity on RackConnect v3.0 cloud servers is highly restricted to allow traffic only between the cloud server and the subnets running certain Rackspace cloud products. At this time, those cloud products include Cloud Backup, Cloud Databases, and Cloud Files.

These restrictions are set at the hypervisor level and are immutable, which means that ServiceNet on RackConnect v3.0 cloud servers cannot be used to connect to or from any other cloud servers. This restriction frees you from having to use a software firewall to restrict ServiceNet access to your RackConnect v3.0 cloud servers.

Even with ServiceNet added, not all Rackspace cloud products are compatible with RackConnect v3.0 cloud servers. For a list of supported cloud products, see the [RackConnect v3.0 compatibility](/how-to/rackconnect-v30-compatibility).

### Comparison matrix

The following comparison matrix is an overview of the features that are supported in RackConnect v3.0 and RackConnect v2.0.

Feature | RackConnect v3.0 | RackConnect v2.0
--- | --- | ---
Cloud Networks required | Yes | No
Direct connectivity between Cloud Networks and the dedicated environment | Yes | No
ServiceNet required | Managed Infrastructure: No <br /> Managed Operations: Yes | Yes
Highly restricted ServiceNet available | Yes | No
PublicNet available | No | No
Compatible with Public Cloud product offerings | <a href="/how-to/rackconnect-v30-compatibility">Yes, with caveats</a> | <a href="/how-to/rackconnect-v20-compatibility">Yes, with caveats</a>
RackConnect QoS bandwidth limits | Yes | No
Basic API (non-public facing) | No | Yes
Public Facing API | Yes | No
Cloud Servers API metadata used | No | Yes
SSH access to cloud servers required | No | Yes
Automation feature: Software firewall updates | No | Yes
Automation feature: Network stack configuration | No | Yes
Provision public IP address | Yes, via API | Yes, via automation feature
Add cloud server to load balancer pool | Yes, via API | Yes, via metadata
List cloud networks associated with RackConnect | Yes, via API | No
RackConnect network policies | No | Yes
Dedicated Managed service level | Yes | Yes
Cloud Managed Operations service level | Yes | Yes
Cloud Managed Infrastructure service level | Yes | Yes

### Network traffic flow

The following diagrams show high-level views of network traffic flow for RackConnect v2.0 and RackConnect v3.0.

#### RackConnect v2.0 network traffic flow over ServiceNet
<img src="{% asset_path rackconnect/comparing-rackconnect-v30-and-rackconnect-v20/RCv2Example_2.png %}" alt="" width="692" height="444" border="2" id="rcv2" />

#### RackConnect v3.0 network traffic flow over Cloud Networks
<img src="{% asset_path rackconnect/comparing-rackconnect-v30-and-rackconnect-v20/RCv3Example.png %}" alt="" width="692" height="456" border="2" id="rcv3" />

If you have any questions, reach out to us. Our contact information is available on the [Contact Us page](/how-to/support).
