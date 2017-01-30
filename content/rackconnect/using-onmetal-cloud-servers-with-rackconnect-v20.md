---
permalink: using-onmetal-cloud-servers-with-rackconnect-v20/
audit_date:
title: Using OnMetal Cloud Servers with RackConnect v2.0
type: article
created_date: '2014-08-20'
created_by: Juan Perez
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v2.0, OnMetal Cloud Servers

Rackspace now supports OnMetal Cloud Servers with RackConnect. You can now combine the benefits of OnMetal Cloud Servers&mdash;single-tenant, bare-metal, API-driven&mdash; with the features of RackConnect&mdash;public IP address provisioning, network stack
configuration, software firewall updates&mdash;to create your own custom
hybrid solution that spans your dedicated, cloud, and OnMetal server
environments.

If you are new to RackConnect or OnMetal, or would just like to learn
more about them, you can find more details about these offerings at the following links:

-   [OnMetal Cloud Servers product page](http://www.rackspace.com/cloud/servers/onmetal/)
-   [RackConnect product page](http://www.rackspace.com/cloud/hybrid/rackconnect/)
-   [What is new with OnMetal Cloud Servers](/how-to/what-is-new-with-onmetal-cloud-servers)
-   [Using OnMetal Cloud Servers](/how-to/create-onmetal-cloud-servers)
-   [Using OnMetal Cloud Servers through API](/how-to/using-onmetal-cloud-servers-through-api)

OnMetal Cloud Servers with RackConnect are compatible with both our
[Managed Operations](http://www.rackspace.com/managed-cloud/) and
[Managed Infrastructure](http://www.rackspace.com/managed-cloud/)
service level offerings, allowing you to get the level of support you
need to properly manage your hybrid environment.

Although OnMetal servers and RackConnect generally work well together,
following are some caveats to be aware of as you build out your hybrid
infrastructure with these offerings:

-   Support for OnMetal Cloud Servers is currently limited to the
    RackConnect v2.0 offering.

-   When using one of the portals to create RackConnect cloud servers,
    we normally recommend the [MyRackspace
    portal](https://my.rackspace.com/). However, support for creating OnMetal servers is currently limited to the
    [Cloud Control Panel](https://mycloud.rackspace.com/). Additionally,
    you can also use the [Cloud Servers API](/how-to/using-onmetal-cloud-servers-through-api)
    to create your OnMetal servers.

-   OnMetal servers might not be available in all regions. To view the regions where OnMetal is currently available, connect to the [Cloud Control
Panel](https://mycloud.rackspace.com/) using a cloud account that is associated with RackConnect and begin the process of creating
a new server. Select a region to see if the OnMetal Server tab is available.

-   The complete set of OnMetal images might not be available for use
    with RackConnect. To view the current set of OnMetal images
    available, follow the preceding process to begin the process of creating
    a new OnMetal server, and view the choices in the **Image** section.

-   OnMetal servers are configured with 10 Gbps (gigabits per second)
    capable bonded NICs (network interface cards), but bandwidth
    availability via RackConnect is limited to the capabilities of
    your RackConnect network devices. As an extreme example, if you
    are using an ASA 5505 Sec+ as your RackConnect edge and connected
    network device, your OnMetal server's throughput via RackConnect
    is limited to approximately 150 Mbps (megabits per second). For
    a detailed comparison of RackConnect network devices, see [RackConnect network device
    comparison](/how-to/rackconnect-network-device-comparison).

-   Even though OnMetal servers require the use of SSH keys, the RackConnect automation systems still create and use a "rackconnect" user account for administering the OnMetal servers. Do not disable, modify, or remove this user account. Additionally, the other [RackConnect best practices](/how-to/rackconnect-v20-best-practices) still apply to OnMetal servers.

If you have any questions, reach out to
us on the [Contact Us](/how-to/support) page.
