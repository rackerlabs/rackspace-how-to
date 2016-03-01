---
node_id: 1494
title: Products I Can Load Balance
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-05'
last_modified_by: Cat Lookabaugh
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

You can apply load balancing to anything with an IP address that is accessible on
the Internet. This means that you can load balance your
Rackspace Cloud Servers as well as any external server
or IP address. For example, you can load balance an external mail
server, a database server, a website, or your personal web server at
home. In load balancing terminology, the resources that you can load
balance are called ***nodes***.

The following illustrations shows a load balancer with both Rackspace
Cloud Servers and an external node:

![Products I Can Load
Balance](http://c691244.r44.cf2.rackcdn.com/What%20Can%20I%20Load%20Balance.png)

### Adding Nodes

When you create a load balancer using the Control Panel you'll see that
Add Nodes is part of the configuration process:

![Add
Nodes](http://c691244.r44.cf2.rackcdn.com/Load%20Balancer%20Nodes.png)

This is where you specify the things you want to load balance. You can
add an existing Rackspace Cloud Server or an External IP.

Note that the distance between the node being load balanced and the
region of the load balancer can impact performance of the load balancer.
We recommend creating the load balancer in the region that is closest to
your external nodes.

For more information, see [Load Balancing Public Vs. Private
IPs](/how-to/load-balancing-internal-ips-in-the-same-region).

