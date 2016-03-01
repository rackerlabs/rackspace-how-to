---
node_id: 1490
title: Pointing Domains to Load Balancers
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Rose Contreras
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

You can load balance incoming traffic to your domain using a Cloud Load
Balancer. Suppose you initially have one Cloud Server with a domain
pointing to the public IP Address of the server. Then traffic to your
domain starts picking up and suddenly overloads your server. To improve
traffic flow, you can create a clone of the server and then put both
servers behind a new load balancer. Intead of pointing your domain
directly to the old server, you can now point it to the new load
balancer, which will distribute the traffic evenly and prevent server
overload. Additionally, you could also create several new domains that
point to the load balancer.

This article describes how to point an existing domain to a Cloud Load
Balancer. For instructions on creating a new Load Balancer,
see [Configuring a Load
Balancer](/how-to/configure-a-load-balancer).

### Pointing an existing domain to a Load Balancer

1.  Click **Load Balancers **at the top of the Control Panel.
2.  Click on an existing load balancer to see the **Load Balancer
    Details**. Jot down the load balancer's IP address.

    ![Load Balancer
     Details](http://c691244.r44.cf2.rackcdn.com/LoadBalancer%20IP%20Address.png)

3.  Click **DNS** at the top of the Control Panel.
4.  Click the **Actions** cog to the left of an existing domain and
    select **Add DNS Record**.
5.  In the Add Record pop-over, select **A/AAAA Record** as the **Record
    Type**, and enter the load balancer's IP address as the **Target**.

     ![Add DNS
     Record](http://c691244.r44.cf2.rackcdn.com/DNS%20A%20Record.png)

6.  Click **Add Record**.

The load balancer will now distribute the traffic evenly to the nodes
that are attached to the load balancer.

