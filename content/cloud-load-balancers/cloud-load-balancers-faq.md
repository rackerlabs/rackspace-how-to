---
permalink: cloud-load-balancers-faq/
audit_date:
title: Cloud Load Balancers FAQ
type: article
created_date: '2015-12-08'
created_by: Rackspace Support
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

### Load Balancing

#### How do I see the original IP address of a connection to a load balancer?

The connection's `X-Forwarded-For` HTTP header stores a visitor's
originating IP address by default. For more information, see [the API documentation for creating a Cloud Load Balancer](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/#creating-a-load-balancer).

#### Do Cloud Load Balancers support SSL Termination?

SSL Termination on Cloud Load Balancers is supported [via the API](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/#document-api-operations/ssl-termination)
and through the Cloud Control Panel.

SSL Termination allows users to have their secure traffic terminate at
the load balancer with centralized certificate management. Features of
this service are as follows:

-   SSL acceleration for improved throughput
-   Reduced CPU load at the application level for better performance
-   HTTP/HTTPS session persistence

**Note:** SSL Termination should not be used when transferring certain
types of [Personally Identifiable Information (PII)](/how-to/definition-of-personally-identifiable-information-pii).

#### How do I configure SSL Termination using the Cloud Control Panel?

You can quickly configure SSL termination for an existing Cloud Load
Balancer by using the Cloud Control Panel.

1.  Click on an existing load balancer to open its Details Page.
2.  Scroll to the Optional Features section.
3.  Click the Edit pencil to the right of the Secure Traffic (SSL)
    option.
4.  In the pop-up dialog box, enter and save your SSL configuration.

#### How can I raise my API rate limits for Cloud Load Balancers?

To modify imposed API rate limits, contact Support.

#### What is the maximum throughput of each load balancer?

A single Cloud Load Balancer is connected through a 10Gb/second network
to both the public network and Rackspace's internal network, which has
been tested to achieve about 9Gb/second of actual throughput. Some
limiting factors might influence the actual throughput at any given
time.

#### How long does it take to provision a load balancer?

In most cases, it should take less than one minute to provision a load
balancer after the
[API](http://www.rackspace.com/cloud/cloud_hosting_products/loadbalancers/api/)
request is submitted. During periods of extreme system load, it should
take no more than a few minutes for complete provisioning.

#### Who should not use SSL termination on Cloud Load Balancers?

You should not use SSL termination when transferring certain types of
sensitive customer data classified as [Personally Identifiable Information (PII)](/how-to/definition-of-personally-identifiable-information-pii).
Examples of PII include information protected by the HIPAA and
Gramm-Leach-Bliley acts, credit card information, or any personal data
that can result in identity theft if disclosed.

#### How do you manage and distribute IPs?

Each load balancer comes with one public IPv4 address.

#### How many concurrent connections can the service handle?

A single load balancer is capable of consistently handling 20,000
concurrent connections with support for periodic spikes estimated at up
to 100,000 concurrent connections. Because Cloud Load Balancers are
implemented in a multi-tenant environment, estimates are not guaranteed
and might vary depending on the number of concurrent connections that
other customer load balancers are processing.

#### Do Cloud Load Balancers work with dedicated servers?

Yes, but we recommend using RackConnect to include [dedicated servers](http://www.rackspace.com/managed-hosting/dedicated-servers/),
except in low-traffic scenarios, because of the potential for
significant bandwidth charges. Without RackConnect, you are billed for
bandwidth charges for requests outbound from the load balancer, and
responses outbound from the dedicated firewall, inbound to the load
balancer, *and* outbound again from the load balancer returning to the
user.

#### Can I use Cloud Load Balancers in conjunction with RackConnect&reg;?

You can use the
[RackConnect](http://www.rackspace.com/cloud/hybrid/rackconnect/) Cisco
ASA solution to connect dedicated servers and cloud servers while
leveraging Cloud Load Balancers to balance the workload between the
cloud servers. Charges apply for outgoing bandwidth through the
dedicated environment, as well as inbound and outbound traffic for the
load balancers.

To include dedicated and cloud servers in the same resource pools (to
balance the workload between both platforms), use the RackConnect F5
BIG-IP Local Traffic Manager solution.

#### Can I manage my Cloud Load Balancer using the API?

Yes, implementation and management of the Cloud Load Balancer solution
is currently available through the Rackspace Cloud Control Panel and the
API. To use the Cloud Load Balancer API, you should have a general
understanding of the load balancing service and be familiar with the
following technologies:

-   RESTful web services
-   HTTP/1.1 conventions
-   JSON and serialization formats
-   Atom Syndication Format

#### How does Rackspace charge for bandwidth (public and private traffic)?

-   **Public** - Standard bandwidth rates apply for outbound transfers.
    There is no charge for inbound transfers.
-   **Private** - No charges apply for inbound or outbound bandwidth
    transfers over the Rackspace internal network.

#### How much does a Rackspace Cloud Load Balancer cost?

See the [pricing page](http://www.rackspace.com/cloud/load-balancing/pricing/) for
details. If you enable log delivery to your Cloud Files account,
standard charges for Cloud Files apply. Additionally, standard charges
apply for additional (unique) virtual IP addresses per load balancer.

#### What is a Cloud Load Balancer?

Your business's website, applications, and web-based workloads depend on
high availability. Rackspace [Cloud Load Balancers](http://www.rackspace.com/cloud/load-balancing/) enable you to
quickly balance the workload of multiple Cloud Servers for optimal
traffic management and maximum failover protection. Load balancers
distribute workloads across two or more servers, network links, and
other resources to maximize throughput, minimize response time, and
avoid network overload.

#### What are the requirements for using SSL Termination?

When using SSL Termination on your load balancers, the following
requirements should be understood.

-   Additional fees apply when SSL Termination is enabled.
-   SSL Termination is available to Rackspace Cloud Load Balancer
    customers in the US and UK with a valid SSL certificate/intermediate
    certificate and associated private key.
-   SSL Termination cannot be enabled when a Cloud Load Balancer is
    provisioned; it must be configured on existing load balancers by
    issuing a command through the API. Read our Developer's Guide to
    learn [how to configure SSL Termination](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/#document-api-operations/ssl-termination)
    on an existing load balancers through the API.

For information about how to do this in the Control Panel, see [SSL Termination - How to set it up](https://community.rackspace.com/products/f/25/t/3302).

#### What is ServiceNet?

ServiceNet is an internal only, multi-tenant network connection within
each Rackspace data center. ServiceNet IP addresses are not accessible
from the public Internet and are local to each data center.

**Note:** You can configure your account resources, such as Cloud
Servers and Cloud Load Balancers, to utilize a ServiceNet IP address
instead of the public IP address. Any traffic that occurs between your
cloud resources on the Rackspace Network does not incur bandwidth
charges.

If you filter traffic to your servers by using a firewall, the best
practice is to allow the subnet range in which your Load Balancer
resides. For more information how to filter traffic from a load balancer
on your servers, see [Using Cloud Load Balancers with RackConnect](/how-to/using-cloud-load-balancers-with-rackconnect).

#### What are the security concerns with SSL termination?

After SSL termination decrypts the data at the Cloud Load Balancer, it
passes the unencrypted data to any nodes that are configured for that
device. If you have nodes that are not in the same data center as the
SSL-enabled load balancer, that unencrypted data is sent over the public
Internet to those nodes. Therefore we recommend that you use an
SSL-enabled load balancer *only with nodes that reside in the same data
center as the load balancer.* The proximity allows the load balancer to
use the nodes' private IP addresses (the ServiceNet) to limit
unencrypted traffic to within the data center's network.

#### What are the benefits of using SSL Termination on the Cloud Load Balancer?

With SSL Termination the traffic is decrypted at the Cloud Load
Balancer, and unencrypted traffic can now be distributed to one or more
Cloud Servers to be processed

Following are other benefits:

-   The ability to configure a load balancer that accepts both secure &
    unsecured traffic, or secure traffic only
-   Can be a less expensive than a dedicated F5 load balancer solution
-   Another alternative to using HA Proxy with Cloud Servers

#### How is SSL traffic normally handled?

Secure traffic comes in to your site over an encrypted SSL connection,
and it must be decrypted by the webserver which holds the SSL
certificate. The Cloud Load Balancer passes all traffic directly to the
Cloud Server with the corresponding SSL certificate, placing the burden
of the decryption on that server alone. This is because each device
(Cloud Server or Cloud Load Balancer) handling traffic through an SSL
connection requires either its own SSL certificate or a Licensed
Certificate Option.
