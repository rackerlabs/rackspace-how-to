---
node_id: 1527
title: Load Balancing Internal IPs in the same region
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Rose Contreras
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

### Public and Internal IPs

All Next Generation Cloud Servers automatically receive three IP
addresses upon creation:

-   A version 4 **IP Address** that provides public access
    to your server from anywhere on the Internet.
-   A version 6 **IP Address** that also provides public access to your
    from anywhere on the Internet.
-   An internal **Rackspace Network** (ServiceNet) IP address that you
    lets you access the server from other Cloud Servers or Cloud Load
    Balancers over the internal Rackspace Network.

The following screenshot shows the **Server Details** section in the
[Cloud Control Panel](http://mycloud.rackspace.com) for a server name
Zippy:

![Server Details](http://c691244.r44.cf2.rackcdn.com/IPs.png)

**Note**: First Generation Cloud Servers receive only 2 IP addresses: a
public v4 IP address and the internal Rackspace Network IP address. In
the Cloud Control Panel, the Rackspace Network is called ServiceNet.

### Use regions and the Racskapce Network to manage bandwidth charges

If your Cloud Server (also known as a **node** within the Cloud Load
Balancers product) and Cloud Load Balancer are set up in the *same
region*, they can send traffic over the Rackspace Network without
traversing the Internet, and therefore incur zero bandwidth charges.
This not only saves you money, but speeds up performance of the load
balancer. However, if the node is in the Chicago region and your Load
Balancer is set up in Dallas, traffic cannot go across the Rackspace
Network only. It must traverse the internet, which incurs normal
bandwidth charges that will appear on your monthly invoice.

The following diagram illustrates this concept. The traffic between the
nodes and load balancer in the Dallas region incur zero bandwidth
charges, while the traffic between the node in Chicago and the load
balancer in Dallas will incur normal bandwidth charges:

![Load Balancing Nodes in the Same
Region](http://c691244.r44.cf2.rackcdn.com/cloud-load-balancers-illustration.png)

#### Selecting a Load Balancer's Region

To take advantage of this cost savings and performance feature, you'll
need to match the location of your Cloud Load Balancer with the node.
The following screenshot shows you Configuration area of the Create Load
Balancer page in the Cloud Control Panel. This is where you select the
**Region**:

![Choose Load Balancer
Region](http://c691244.r44.cf2.rackcdn.com/LB%20Public%20vs%20Private%20IPs.png)

**Note**: If you're load balancing an external node (one that is
external to the Rackspace Cloud), choose the region that is
geographically closest to the external node.



