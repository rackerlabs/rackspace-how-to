---
permalink: using-the-rackspace-network-effectively/
audit_date:
title: Using the Rackspace network effectively
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-04-17'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The Rackspace Network is the internal network in each Rackspace region
(data center). In the Cloud Control Panel, it's referred to as the Rackspace Network.

### Using the Rackspace Network internal IP address

When you create a new Cloud Server, Cloud Load Balancer, or Cloud
Database, the newly created infrastructure is automatically assigned a
Rackspace Network IP address. This IP address is not visible on the
public internet. However, if you have other assets (Cloud Servers, Cloud
Load Balancers, and Cloud Databases) located in the same region, you can
use the internal IP address to connect the infrastructure together. For
example, you can create a Cloud Load Balancer for two or more Cloud
Servers in the same region using the Rackspace Network internal IP
addresses.

**Note**: Any traffic or communication between cloud infrastructure in
the same region is free of charge. If traffic goes from one region to
another (Dallas-Fort Worth to Chicago, for example) it accrues normal
bandwidth charges.

Another benefit of using the internal Rackspace Network is that it can
offer the first level of network security. For example if you're not
expecting external traffic to your Cloud Servers, you can create a
firewall around them and reduce their exposure to outside threats. Note
that Rackspace creates all new servers with basic security settings,
however you should follow the instructions located in [Configuring Basic Security](/how-to/configuring-basic-security) to
further protect your data.

### Finding the Rackspace IP address

You can find all of the IP addresses for a new server, load balancer or
database by clicking on it and viewing its Details.

Here's an example of a Server Details page:

<img src="{% asset_path cloud-load-balancers/using-the-rackspace-network-effectively/Server%20Details.png %}" alt="Cloud Server Details" />

#### Related Information

[Learn More About Cloud Servers](/how-to/learn-more-about-cloud-servers)
