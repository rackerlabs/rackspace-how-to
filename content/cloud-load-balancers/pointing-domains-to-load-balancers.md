---
permalink: pointing-domains-to-load-balancers/
audit_date:
title: Point Domains to Load Balancers
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-04-21'
last_modified_by: Rose Contreras
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

You can load balance incoming traffic to your domain using a Cloud Load
Balancer. Suppose you initially have one Cloud Server with a domain
pointing to the public IP Address of the server. Then traffic to your
domain starts picking up and suddenly overloads your server. To improve
traffic flow, you can create a clone of the server and then put both
servers behind a new load balancer. Instead of pointing your domain
directly to the old server, you can now point it to the new load
balancer, which will distribute the traffic evenly and prevent server
overload. Additionally, you could create several new domains that
point to the load balancer.

This article describes how to point an existing domain to a Cloud Load
Balancer. For instructions on creating a new Load Balancer,
see [Configuring a Load Balancer](/how-to/configure-a-load-balancer).

### Pointing an existing domain to a Load Balancer

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2.  Click on **Networking > Load Balancers**.
3.  Click on an existing load balancer to see the **Load Balancer
    Details**.

    Take note of the load balancer's IP address. You will need it in a later step.

4.  Click on **Networking > Cloud DNS**.
5.  Click the gear icon next to an existing domain and
    select **Add DNS Record**.
6.  In the Add Record dialog box, select **A/AAAA Record** as the **Record
    Type**, and enter the load balancer's IP address as the **Target**.
7.  Click **Add Record**.

The load balancer will now distribute the traffic evenly to the nodes
that are attached to the load balancer.
