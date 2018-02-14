---
permalink: rackconnect-v30-upgrade-information/
audit_date:
title: RackConnect v3.0 upgrade information
type: article
created_date: '2015-12-21'
created_by: Rackspace Support
last_modified_date: '2018-01-02'
last_modified_by: Brian King
product: RackConnect
product_url: rackconnect
---

Customers can now upgrade from RackConnect v2.0 to RackConnect
v3.0. This article provides information about RackConnect v3.0 and about
upgrading.

### Benefits of RackConnect 3.0

RackConnect v3.0 provides the following benefits:

-   **Built on Rackspace Cloud Networks**: Cloud Networks provides your
    cloud servers with an isolated, single-tenant network that exists
    virtually between your cloud servers.

-   **Ability to choose an IP scheme on cloud networks**: The ability to
    choose your own IP scheme means that you can avoid IP overlap issues
    such as site-to-site VPNs between network environments residing in
    different regions. Unless you specify otherwise, a default IP scheme
    (and network name) is provided when our Network Security team
    provisions the RackConnect cloud network.

-   **A fully functional public API for RackConnect v3.0**: You can use
    the RackConnect v3.0 API to perform automated tasks (or
    provide information) such as adding or removing load balancer
    members, and assigning or unassigning a public IP address to
    cloud servers.

-   **No more in-instance, per-cloud server automation**: In RackConnect
    v2.0, automation made changes on a per-cloud-server basis by using a
    system user (which caused issues for some customers). With
    RackConnect v3.0, automation is seamless and happens at the
    hypervisor layer.

-   **No Public IP address is necessary**: RackConnect v3.0 uses a
    public IP address that is assigned to and resides with your
    dedicated network environment. These public IP addresses are routed
    through your edge device (typically a firewall) just like any other
    dedicated server's public IP address. Unlike the v2.0, RackConnect
    v3.0 does not provision a public IP address by default. If you
    decide you need a public IP address, you can choose to assign one to
    your cloud server at any time.

    **An example of where this feature provides value**: Cloud servers
    that receive load-balanced traffic from a dedicated load balancer
    usually do not require a public IP address*.*

-   **Your cloud servers can be protected by robust dedicated
    security**: Because each RackConnect cloud network is a dedicated,
    private network segment that resides on your dedicated network
    device, it follows standards used by traditional dedicated
    network segments. This means many of the same security devices (for
    example, IDS and WAF) and methods used for dedicated network
    segments can also be used for your RackConnect cloud networks.

-   **More scalable**: Each RackConnect cloud network have up to 250
    cloud servers, and you can create multiple networks based on the
    roles that the servers will fulfill in a network. This means that
    you can set up scalable security on a per-network basis, and all
    cloud servers created within those networks will have those
    permissions automatically applied. This is a benefit for highly
    automated operations.

### Limitations of RackConnect 3.0

RackConnect v3.0 has the following limitations:

-   **Cloud Load Balancers blacklisted by default**: For security reasons, Cloud Load
    Balancers are blacklisted by default, and cannot communicate with RackConnect v3 cloud servers.
    We recommend a dedicated hardware load balancer (Brocade ADX or F5 LTM)
    for RackConnect v3.0. However, we can whitelist Cloud Load Balancers if you require acccess to this product.

-   **Not compatible with OnMetal v1.0**: RackConnect v3.0 supports
    OnMetal 2.0 only. If your RackConnect network was provisioned before 2016,
    it might be necessary to provision a new RackConnect network, or to migrate
    your existing network (this is free). Contact Rackspace Support, if you
    have questions about this.

-   **Limit of 250 cloud servers per RackConnect cloud network**: This
    is a limitation of the Rackspace Cloud Networks product that
    RackConnect v3.0 uses.

-   **Traffic between two RackConnect cloud networks must traverse the
    connected device**: For traffic to go between two RackConnect cloud
    networks, a routing decision must be made by the network's
    default gateway. Each network's default gateway exists on the
    connected network device. Because of this, traffic coming from one
    network that is destined to another network must be forwarded to the
    connected network device before making its way to the
    destination network.

### Upgrade eligibility

Some customers might require firewall software version updates to be
eligible for RackConnect v3.0. Contact your Rackspace Account Manager
or Service Delivery Manager for additional details and to ensure that
you have no other potential issues that would prevent you from upgrading
to RackConnect v3.0.

### Options for migrating to RackConnect v 3.0

You can follow one of two paths to upgrade to RackConnect v3.0 from
RackConnect v2.0.

#### Upgrade path A

Upgrade path A is ideal for customers who want to run RackConnect v2.0
and RackConnect v3.0 side-by-side. However, this path might require
significant manual effort, depending on the total number of cloud
servers that you have. Following are the requirements and caveats for
this upgrade path:

-   **An additional cloud account is required for the RackConnect v3.0
    configuration**: This requirement means that any other cloud
    services being used (including your cloud account's Role Based
    Access Control settings) must be re-created on the new cloud account
    used for RackConnect v3.0.

-   **RackConnect v3.0 and v2.0 run in parallel at the same time**:
    RackConnect v3.0 is set up on the same dedicated network devices
    used for RackConnect v2.0, but it does not replace the current
    RackConnect v2.0 configuration. Both v2.0 and v3.0 run in parallel
    without interfering with each other. As a result, you can migrate as
    slowly as necessary while maintaining the ability to communicate
    between RackConnect v3.0 and v2.0 cloud servers.

-   **Each cloud server to be migrated must have a snapshot image taken
    and shared with the new cloud account used for RackConnect v3.0**:
    The snapshot image is saved on the cloud account used for
    RackConnect v2.0 and is shared with the new cloud account used for
    RackConnect v3.0. A data migration must occur for Windows devices.

-   **You will lose the existing public and private IP addresses of your
    cloud servers**: Because the server itself isn't being moved, the IP
    addresses assigned to the server on RackConnect v2.0 will *not* be
    migrated with the snapshot image. As a result, the new RackConnect
    v3.0 server replacement can't receive the old IP addresses used by
    the RackConnect v2.0 server. Any necessary changes to your
    applications or environment must take into account the IP address
    changes that will be occurring.

-   **You can test RackConnect v3.0 before fully committing to the
    migration**: You can test v3.0 before you migrate
    your existing infrastructure. You can also migrate devices as
    quickly or as slowly as you like.

-   All RackConnect v2.0-supported images are currently fully compatible
    with this upgrade path.

#### Upgrade path B

Most customers prefer upgrade path B.  Following are the requirements
and caveats for this upgrade path:

-   **The same cloud accounts are used for both RackConnect v2.0 and
    RackConnect v3.0**: No additional account is necessary.

-   **Your cloud servers keep their original public IP address and
    ServiceNet IP** address: Your server's assigned public IP address is
    kept after you migrate the server to RackConnect v3.0, but the
    address is NAT translated to the server's private IP address (from
    the  cloud network). The ServiceNet IP address remains the same as
    well, but is now used only to communicate with other cloud services
    (such as Cloud Databases and Cloud Monitoring). Your RackConnect
    v3.0 cloud servers will be unable to use their ServiceNet IP address
    to communicate with your other cloud servers or dedicated servers;
    the cloud network IP address is used to accomplish this in
    RackConnect v3.0.

-   **A configuration freeze is necessary for RackConnect v2.0**: After
    migration has started, RackConnect v2.0 still exists (and allows
    v2.0 cloud servers to communicate as normal), but RackConnect
    automation can't make any v2.0-related changes to your network
    devices or cloud servers. During this time you *cannot* create or
    delete RackConnect v2.0 cloud servers, cannot make changes to your
    RackConnect v2.0 Network Policy rules during the migration, though
    you can create new RackConnect v3.0 cloud servers.

-   **Downtime will be on a per-server basis**: Downtime lasts approximately 1 to 2.5 minutes as we add and move to the RackConnect Cloud Network.

-   **After the upgrade maintenance process starts, it should be
    completed in one batch**: The upgrade *can* occur in multiple
    batches upon request, but the configuration freeze for RackConnect
    v2.0 must be in place for the entire process (until the upgrade is
    complete).

### Next step

After you determine which upgrade option best meets your needs, call
your Account Manager or Server Delivery Manager to being the migration
process. Also, your Account Manager can schedule a call with one of our
RackConnect specialists to answer any outstanding questions that you
might have.
