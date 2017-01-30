---
permalink: rackconnect-v30-requirements/
audit_date:
title: RackConnect v3.0 requirements
type: article
created_date: '2014-08-28'
created_by: Juan Perez
last_modified_date: '2016-01-14'
last_modified_by: Rose Coste
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0

These requirements must be met to implement RackConnect v3.0.

### Cloud account

-   The cloud account that you want to use with RackConnect must
    be *linked* to your dedicated account. You can accomplish this in
    the [MyRackspace portal](https://my.rackspace.com/).
-   This cloud account must also be *associated* with your RackConnect
    v3.0 configuration. You can accomplish this in the [MyRackspace
    portal](https://my.rackspace.com/).
-   You can associate a single cloud account with multiple RackConnect
    v3.0 configurations, if each configuration is located in a
    different region.
-   You can have multiple cloud accounts associated with a
    RackConnect configuration.

### Dedicated account

To use RackConnect v3.0, you must have a Dedicated Hosting account with Rackspace.

### Supported network device

-   You must have a supported network device in your dedicated account.
-   For a detailed list of the network devices currently supported by
    RackConnect v3.0 and their capabilities, see the article
    [RackConnect network device
    comparison](/how-to/rackconnect-network-device-comparison).

### Supported region

-   Your devices must be deployed in a region supported by
    RackConnect v3.0. The regions supported, as of October 2014, are
    DFW, IAD, ORD, LON, HKG, and SYD.
-   You can have multiple RackConnect v3.0 configurations in multiple
    regions, but each configuration is an independent entity and
    cross-communication between configurations in different regions is
    not possible with RackConnect v3.0 (although, cross-communication
    between regions might be possible with a VPN solution).

### Cloud network

-   **Important**: You cannot create the cloud network for use with
    RackConnect v3.0 yourself, and any existing cloud networks will not
    work with RackConnect v3.0.  Only cloud networks created by
    Rackspace during the RackConnect v3.0 implementation process work
    with RackConnect v3.0.
-   Your cloud networks will be set up, configured, and associated with
    your configuration by Rackspace during the RackConnect v3.0
    implementation process. RackConnect v3.0 supports up to 10
    cloud networks. For details about Cloud Networks limitations, see
    the article, [RackConnect v3.0
    limitations](/how-to/rackconnect-v30-limitations).
-   During the implementation process, you must provide the
    subnet (CIDR) and network segment name that you want to use with
    your cloud networks.
-   With RackConnect v3.0,  multiple cloud networks can be associated
    with a single cloud account. However, to have RackConnect
    connectivity, the networks must be created by Rackspace. [Contact us](/how-to/support) if
    you want to add additional cloud networks to your RackConnect
    v3.0 configuration.
-   Additionally, to have RackConnect v3.0 connectivity, any cloud
    servers that you build must be built with a RackConnect v3.0
    associated cloud network.

If you have any questions, reach out to us. Contact information
is available on the [Contact Us](/how-to/support) page.
