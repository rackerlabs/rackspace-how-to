---
permalink: pointing-domains-to-load-balancers/
audit_date:
title: Point domains to load balancers
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2018-10-24'
last_modified_by: Kate Dougherty
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

You can load balance incoming traffic to your domain by using Cloud Load
Balancers. Suppose you initially have one Cloud Server with a domain
pointing to the public Internet Protocol (IP) address of the server. Then
traffic to your domain starts picking up and suddenly overloads your server.
To improve traffic flow, you can create a clone of the server and then put both
servers behind a new load balancer. Instead of pointing your domain
directly to the old server, you can now point it to the new load
balancer, which distributes the traffic evenly and prevents server
overload. Additionally, you can create several new domains that
point to the load balancer.

This article describes how to point an existing domain to a Cloud Load
Balancer. For instructions on creating a new Load Balancer,
see [Configure a Load Balancer](/how-to/configure-a-load-balancer).

### Point an existing domain to a load balancer

Use the following steps to point an existing domain to a load balancer:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3.  Select **Networking > Load Balancers**.
4.  Click on an existing load balancer to see the **Load Balancer
    Details**.

    Take note of the load balancer's IP address. You will need it in a later
    step.

5.  Click on **Networking > Cloud DNS**.
6.  Click the gear icon next to an existing domain and
    select **Add DNS Record**.
7.  In the Add Record dialog box, select **A/AAAA Record** as the **Record
    Type**, and enter the load balancer's IP address as the **Target**.
8.  Click **Add Record**.

The load balancer now distributes the traffic evenly to the nodes
that are attached to it.
