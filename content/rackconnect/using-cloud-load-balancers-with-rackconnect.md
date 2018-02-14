---
permalink: using-cloud-load-balancers-with-rackconnect/
audit_date:
title: Use Cloud Load Balancers with RackConnect
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2016-04-24'
last_modified_by: Blake Moore
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v3.0 and RackConnect v2.0

Because only a highly restricted ServiceNet option is
available for RackConnect v3.0, RackConnect v3.0 does *not* support the
Cloud Load Balancers offering by default. If you do require access to Cloud Load Balancers in your RackConnect v3 environment, contact Rackspace Support, and we can help you enable Cloud Load Balancer use in your RackConnect v3 environment. 
For more details about the offerings that are support by RackConnect v3.0 and the differences between RackConnect
v3.0 and v2.0, see the following articles:

-   [RackConnect v3.0 compatibility](/how-to/rackconnect-v30-compatibility)

-   [Comparing RackConnect v3.0 and RackConnect v2.0](/how-to/comparing-rackconnect-v30-and-rackconnect-v20)

**Note:** The rest of this article applies only to RackConnect v2.0.

### Configure RackConnect v2.0 to allow cloud load balancer traffic

To configure RackConnect to allow cloud load balancer traffic to your
cloud servers, you must create a Dedicated to Cloud Servers network policy in
RackConnect.

1. Log in to RackConnect Management Interface.

1. On the **Network Policies** tab, add a new policy.

1. Set **Access Scenario** to **Dedicated to Cloud Servers**.

1. Set the **Source Type** to **Network**.

1. Use the appropriate 10.*nnn*.*nnn*.*nnn*/*nn* network as the
    **Source Server Network**:

    -   DFW region:

            10.189.254.0/24
            10.189.252.0/24
            10.183.248.0/24
            10.187.186.0/24
            10.183.250.0/24

    -   IAD region:

            10.187.191.0/24
            10.189.255.0/24
            10.187.186.0/24
            10.189.254.0/24

    -   ORD region:

            10.183.253.0/24
            10.183.250.0/24
            10.189.246.0/24
            10.187.187.0/24
            10.187.186.0/24
            10.183.252.0/24
            10.189.245.0/24
            10.183.251.0/24

    -   LON region:

            10.187.191.0/24
            10.190.254.0/24
            10.189.246.0/24
            10.190.255.0/24
            10.187.190.0/24
            10.189.247.0/24

    -   SYD region:

            10.189.254.0/24

    -   HKG region:

            10.189.254.0/24

1. Set the **Destination Type**, **Destination Protocol**, and **Destination Port or Port Range** to specify the resources that the load balancer will access.

1. Click **Create Rule**.

### More details about using cloud load balancers with RackConnect

Cloud load balancers work best when all servers to be load-balanced
reside in the cloud. If dedicated servers need to be load balanced, or
cloud and dedicated servers need to be load balanced together, then you
should deploy RackConnect with a F5 load balancer instead. The firewall
used with RackConnect serves to further isolate and protect your
dedicated servers.

Following is a normal use case for using cloud load balancers with
RackConnect:

-   Use cloud load balancers to balance web traffic between cloud
    servers.

-   Use RackConnect to provide back-end connectivity to dedicated
    database servers from your cloud servers.

<img src="{% asset_path rackconnect/using-cloud-load-balancers-with-rackconnect/RC.CLB_.png %}" width="700" />

In this example, a cloud load balancer balances traffic between cloud
web servers, and RackConnect provides connectivity from the web servers
to the dedicated database servers. When you use cloud load balancers
with RackConnect, all internet traffic travels through the cloud, and
you pay for all outbound bandwidth at the standard Cloud Load Balancers
rate. This bandwidth is not included in the bandwidth that comes with
each dedicated server.

**Important:** When using Cloud Load Balancers and RackConnect together,
you normally have two points of entry into your environment from the
Internet: one on your dedicated side, protected by your dedicated edge
network device (ASA or F5), and another on your cloud side via your
cloud load balancer (virtual IP address accessible on the public
Internet). In this scenario, your dedicated edge network device cannot
protect your cloud load balancer connections. If this is a concern, then
you can deploy RackConnect with a F5 load balancer.

To reiterate, RackConnect *cannot* be used to balance traffic between
cloud and dedicated servers, or to protect your inbound cloud load
balancer Internet connections.

<img src="{% asset_path rackconnect/using-cloud-load-balancers-with-rackconnect/How.CLB_.RC_.Do_.Not_.Work_.png %}" width="700" />

The following image shows some use cases that further illustrate the
limitations of using cloud load balancers:

<img src="{% asset_path rackconnect/using-cloud-load-balancers-with-rackconnect/CLB.Use_.Cases__0.png %}" width="700" />


If you have any questions, please reach out to us. Our contact
information is available on the [Contact
Us](/how-to/support) page.
