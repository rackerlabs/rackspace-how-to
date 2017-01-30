---
permalink: rackconnect-v20-with-cloud-networks-faq/
audit_date:
title: RackConnect v2.0 with Cloud Networks FAQ
type: article
created_date: '2012-12-19'
created_by: Juan Perez
last_modified_date: '2016-01-20'
last_modified_by: Rose Contreras
product: Cloud Networks
product_url: cloud-networks
---

####Does RackConnect support cloud servers that are part of a Cloud Network?

RackConnect support for Cloud Networks is available as of January 16,
2013.

####IMPORTANT: Can I attach/detach a Cloud Network on a running RackConnected Cloud Server?

Attaching/detaching a Cloud Network on a running RackConnected Cloud
Server causes the network stack to be reset, which will break the cloud
server's RackConnect connectivity. Therefore, we do not recommend
attaching or detaching Cloud Networks to running RackConnect servers.
If you do need to attach or detach a network, please contact your
Support team prior to making the change.

####What are the requirements for using Cloud Networks with RackConnect?

1. You must be a RackConnect 2.0 with Automation Features enabled
 customer. For further details on RackConnect Automation Features,
 please view the [RackConnect v2.0 Automation Features
 FAQ](/how-to/rackconnect-v20-automation-features-faq).

2. You must make sure to create cloud servers with the PublicNet and
 ServiceNet networks enabled, in addition to your Cloud Network.
 These PublicNet and ServiceNet networks are selected by default, and
 as a RackConnect customer you will not be able to uncheck them, in
 the [my.rackspace.com](https://my.rackspace.com) portal or the [Cloud
 Control Panel](https://mycloud.rackspace.com/). But, if you are
 using the Cloud Servers API to create cloud servers, there are API
 options that allow you to create cloud servers without the PublicNet
 and/or ServiceNet networks, so to avoid RackConnect failures, please
 be sure you do \*not\* disable the PublicNet and/or ServiceNet
 networks when using the API to create new cloud servers.

3. Since RackConnect controls the software firewalls on your cloud
 servers via Network Policies, you will also need to create a
 RackConnect Network Policy to allow communication between the cloud
 servers across the Cloud Network. The Network Policy should be
 configured as follows:

 - The **Access Scenario** should be set to "Dedicated to Cloud Server(s)"
 - The **Source Server Network** should be set to the network configured for your Cloud Network

**Note:** This Network Policy will need to be created, even if you already
have a "Cloud Server(s) to Cloud Server(s)" Network Policy allowing all
traffic.

####What network ranges can I use with Cloud Networks for RackConnected cloud servers?

Cloud Networks itself normally supports any network range, but if you
plan to use the Cloud Network with RackConnected cloud servers, we
suggest you limit the network ranges you use to the following Private
Address Spaces:

- 10.x.x.x/8 **\***
- 172.16.x.x/12 -&gt; 172.31.x.x/12**\***
- 192.168.x.x/16 **\***

**Note:** When creating Cloud Networks, please follow these guidelines to avoid connectivity issues:

   - Avoid using a network range that overlaps with 10.176.0.0/12
 or 10.208.0.0/12.
   - ****Avoid using** a network range that is already in use in your
 Dedicated environment.**
   - ****Avoid using Public IP address network ranges.****

####Can I use RackConnect and Cloud Networks to create one large Layer 2 Broadcast Domain that spans my Dedicated and Cloud environments?

In other words, can you have a single network, let's say 192.168.x.x/24,
for your dedicated servers and also for your cloud servers, so that they
can communicate like they are all on the same network? Currently, the
answer is **no.** Your cloud servers connect to RackConnect via a
ServiceNet NIC, and a separate Cloud Networks NIC is used for Cloud
Networks connectivity. The ServiceNet Network and the Cloud Network are
two distinct networks that do not have direct connectivity between
them. 
