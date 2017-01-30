---
permalink: rackconnect-faq/
audit_date:
title: RackConnect FAQ
type: article
created_date: '2014-09-26'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

### Rackconnect v3.0

#### Can I allocate multiple cloud networks to a single RackConnect v3.0 cloud server?

No. We currently support only one cloud network per cloud server.

#### Can I assign more than one cloud network IP address to my RackConnect v3.0 cloud servers?

No. For each cloud server, we currently support:

-   One cloud network
-   One IP address per cloud network
-   One public IP address network address translation (NAT) per cloud
    server

#### Can I upgrade my RackConnect v2.0 environment to RackConnect v3.0?

Not yet, but we are working on a migration path. Initially, we plan to
offer you the ability to associate a *new* cloud account with your
existing RackConnect v2.0 configuration, which will enable you to
experience RackConnect v3.0 without deactivating your existing
RackConnect v2.0 environment. Note that only *cloud servers* will be compatible with the migration process to RackConnect v3.0. We will provide more details about this process as they become available.

#### Can I use a Brocade ADX 1000 as my RackConnect v3.0 edge device?

No. Because of access list limitations, we currently support the Brocade
ADX 1000 devices only in the connected device role. For a full list of
network devices that are compatible with RackConnect v3.0, see
[RackConnect network device comparison](/how-to/rackconnect-network-device-comparison).

#### Does RackConnect v3.0 support IPv6?

Not yet, but support for IPv6 is anticipated for early 2016.

#### Does RackConnect v3.0 support Managed Colocation environments?

Network devices in a Managed Colocation environment are supported only
if the network devices are managed by the Rackspace Network Security
team. Customer-managed network devices are not supported. For more
details about RackConnect v3.0 compatibility with other Rackspace
offerings, see [RackConnect v3.0 compatibility](/how-to/rackconnect-v30-compatibility).

#### How do I get RackConnect v3.0?

The answer varies based on whether you are an existing Rackspace
customer:

-   If you are new to Rackspace, contact a member of our Sales team
    for help. For details about how to contact our Sales teams, go to
    [Contact Rackspace](http://www.rackspace.com/information/contactus/).
-   If you are an existing Rackspace cloud-only customer, contact a
    member of our Sales team for help. For details about how to contact
    our Sales team, go to [Contact Rackspace](http://www.rackspace.com/information/contactus/).
-   If you are an existing Rackspace dedicated-only customer, contact
    your account manager for help in getting RackConnect v3.0 set up in
    your environment.

#### Is it possible to attach a RackConnect v3.0 cloud network to pre-existing cloud servers?

Yes, but with the following caveats:

**Note:** *Pre-existing cloud servers* refers to cloud servers that were
built before RackConnect v3.0 was associated with the cloud account.

-   For the best possible experience, we recommend using a clean cloud
    account (meaning a cloud account with no pre-existing cloud servers)
    with RackConnect v3.0.
-   If the pre-existing cloud servers use PublicNet, you must
    remove PublicNet before attempting to add a RackConnect v3.0 cloud
    network to the cloud server. If you are a Managed Operations customer and need help detaching
    PublicNet, contact your Rackspace support team for assistance.
-   If the pre-existing cloud servers use ServiceNet, the
    ServiceNet IP address will change because ServiceNet will
    be detached and then re-attached to apply the appropriate
    security policies. Note that ServiceNet in RackConnect v3.0 is
    highly restricted and cannot be used for communication between
    cloud servers.

#### What network subnet (CIDR) should I assign to my RackConnect v3.0 cloud network?

See the "Cloud Networks" section of [RackConnect v3.0 limitations](/how-to/rackconnect-v30-limitations).

#### What requirements must be met to implement RackConnect v3.0 in my environment?

For the full list of requirements, see [RackConnect v3.0 requirements](/how-to/rackconnect-v30-requirements).

#### Whom do I contact for help with RackConnect v3.0?

Because RackConnect spans both your cloud and dedicated environments,
you can contact your cloud or dedicated hosting support teams for help
with RackConnect. If you are certain that the issue you are experiencing
is directly related to your cloud servers, we recommend contacting your
cloud hosting team first. However, if you are certain that the issue is
related to your network device, we recommend contacting your dedicated
hosting team first. For details about how to contact your support teams,
visit the [Contact Us](/how-to/support) page.

#### Why do I receive 403 Forbidden HTTP status code responses when I try to build RackConnect v3.0 cloud servers by using the Cloud Servers API or the nova client?

By default, when you use the Cloud Servers API or nova client to build
cloud servers, the servers are built with a PublicNet network. However,
RackConnect v3.0 does not support PublicNet and restricts you from
building cloud servers with PublicNet attached on RackConnect v3.0
linked cloud accounts. This restriction is likely the reason that you
are receiving `403 Forbidden` responses. Following are details for
resolving this error:

-   When building a cloud server using the nova client `boot` command,
    include the `--no-public` option to prevent the PublicNet network
    from being attached to the server. Note that you can also use the
    `--no-service-net` option with the nova client `boot` command to
    keep the ServiceNet network from being attached to a cloud server.
    However, consider that ServiceNet is required for cloud servers
    created in cloud accounts with a [Managed Operations](http://www.rackspace.com/managed-cloud/) service level.
-   With the Cloud Servers API, specify the cloud network that you want
    to attach to the cloud server. If you specify one or more networks,
    your server is attached to only those networks. For more information, see the [Create your first Server](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-getting-started/create-server-intro)
    section of the Cloud Servers v2 Developer Guide.

### Rackconnect v2.0

#### How do I get RackConnect?

Customers with a dedicated account should speak to their Account Manager. Be aware that RackConnect is supported only where
Rackspace cloud infrastructure exists. At this time, the Rackspace cloud
is available from our Chicago, Dallas, Virginia, Sydney, Hong Kong, and
London regions.

If you are an existing cloud customer, you should speak to a
member of our Sales team. They can guide you through the process of
acquiring a device that can be used in a RackConnected environment.

#### What can RackConnect do for me?

You need RackConnect to build a hybrid hosting solution that
combines the best of dedicated and cloud hosting by creating connections
between dedicated servers and cloud servers. RackConnect can be
implemented on certain Cisco ASA series firewalls, or an F5 BIG-IP load
balancer that is used to interconnect dedicated physical servers with
cloud-based servers on the Rackspace internal network known as
ServiceNet.

#### Where do I go for help with RackConnect?

If you need help with RackConnect, contact us via any of our [usual Support channels](/how-to/support), and our team will help you with your issue or direct you on to the relevant support group. We are available via phone, chat, or tickets 24x7x365.

If you believe your issue is cloud-server specific, send the
appropriate query to the Cloud team via the Cloud Control Panel;
otherwise, send other requests via the my.rackspace.com portal.

#### I already have a cloud account. Can I connect to my existing servers?

You may use RackConnect an existing cloud account, but you cannot connect to any existing cloud servers. If you need to use existing servers, they must be rebuilt after the RackConnect implementation has been completed. You can do this by first saving a cloud server image, and then using the image to rebuild the existing server as a new RackConnect server - or to simply build a new server.

Please be aware that this process for rebuilding an existing server assigns a new IP assigned to the server. Because you are essentially creating a new server, this cannot be avoided.

An important consideration is the region you will
use to provision your servers. Because RackConnect relies on a ServiceNet connection to link your dedicated servers and your cloud servers,
you must provision your RackConnect cloud servers in the same
geographic region as your dedicated servers. Your saved server images
are available only for creating servers in the same region as the
original server.

#### Which cloud account do I need for RackConnect?

You can use RackConnect with both Managed Operations service level and
Managed Infrastructure service level accounts.

Be aware that the usual service-level limitations still apply for
RackConnect cloud accounts, and you should use the appropriate account
type for the implementation based on your support requirements. It is
possible to use RackConnect with more than one cloud account, so you can
have a mix of both if you prefer.

#### I have RackConnect v2.0. How can I build unconnected cloud servers?

During normal circumstances, if your cloud account has been enabled with
RackConnect v2.0, your cloud account is linked to your dedicated hosting
account and your dedicated servers can communicate using ServiceNet with your cloud servers in the same region. If you want to
provision cloud servers that are *not* linked to your dedicated account, use one of the following methods:

- Provision cloud servers in a region other than the one where
your dedicated servers are located. For example, if your dedicated
servers are in the DFW region, and your linked cloud servers are also in
the DFW region, any cloud servers you provision in ORD or IAD will
not be linked to your dedicated servers and should function
independently.

- Sign up for a second cloud account. The drawback of
doing this is that you cannot access any custom server
images between accounts.

#### How am I charged for bandwidth usage?

For cloud servers that are a part of your RackConnect configuration,
all network traffic leaves via the dedicated firewall device. The
traffic between the cloud servers and the RackConnect device travels
over the internal, unmetered ServiceNet network. Any traffic between the
cloud servers and dedicated networks is similarly unmetered and does not
incur bandwidth charges.

The bandwidth usage costs for Internet-related traffic entering and
leaving the RackConnect device is charged using Dedicated Hosting
bandwidth pricing plans. Our Sales representatives will discuss this in
more detail with you when you inquire about RackConnect.

#### What are network policies?

RackConnect network policies are the equivalent of firewall rules that
are applied via the RackConnect web interface. These policies are then
applied to the firewall device and any cloud servers referenced.

The network policies are a useful means of centralizing all your
firewall rules for the RackConnect device, any dedicated networks, and
any RackConnect cloud servers.

#### My cloud servers have no network connectivity. What's wrong?

Check the RackConnect network policies that are in place to ensure
that the relevant access rules permit the required connectivity.
For example, ensure that an Internet-to-Cloud rule exists to permit traffic
originating from the Internet to reach your cloud servers.

If adjusting the network policies does not resolve the issue, contact Support via phone, chat, or ticket so that we can help
investigate this further.

#### Can Cloud Databases be used with RackConnect?

Yes, RackConnect cloud servers can be used to connect to Cloud
Databases instances, but dedicated servers in a RackConnect configuration cannot connect to Cloud Databases instances.

#### Can I use RackConnect across different regions?

No. Because RackConnect is intended to interconnect devices on a local
network, any involved servers need to be within the same region.

If you have existing dedicated hardware, ensure that your cloud account
is provisioned to build your cloud servers in the same region.
Contact our Cloud support team for help with this. Rackspace has cloud
infrastructure in Chicago, Dallas, and Virginia in the US, and global
cloud infrastructure in London, Sydney, and Hong Kong.

#### I need VPN connectivity to my cloud servers. Can RackConnect help?

Yes. Because RackConnect is a dedicated firewall, it is possible to
terminate a site-to-site VPN on the device, or to use a client-based
VPN. This enables secure VPN communication between your office or home
into the cloud environment.

#### Does RackConnect enhance my ability to connect to Cloud Files?

Most areas of our data centers have access to our ServiceNet network through which
a customer can connect privately to our Cloud Files infrastructure
without traversing the public network (provided the files are in
the same data center as the dedicated server making the connection). The older
areas of our DFW data center that do not have ServiceNet need RackConnect to
connect to the cloud ServiceNet, which allows for a private
connection to Cloud Files.

#### Can RackConnect be used if the dedicated firewall is already set up with multiple segments?

Yes. RackConnect connects your Rackspace cloud as an additional
interface on your firewall; therefore, it allows you to connect to a
firewall that has multiple segments set up if enough ports are available.
Our data center can perform a visual inspection of the firewall to
ensure that there is an available port to connect to RackConnect.

#### Can I extend my Active Directory (AD) domain across RackConnect into the cloud?

Customer-owned Active Directory domains can be extended over
RackConnect. This includes Active Directory domain controllers in your
dedicated environment or in your cloud environment.

If you are planning to deploy domain controllers in the cloud, and you
promote a cloud server to a domain controller, be sure to
create a ticket and inform the RackConnect team about this change. You
must manually create a **rackconnect** user account on the Domain
and add this account to the Domain Admins global group. We will add
the **DOMAIN\rackconnect** account to the RackConnect system instead of
**rackconnect** to get RackConnect to work with your domain
controller cloud servers.

Additionally, Active Directory requires a large number of open ports to
function properly, so we recommended that you create RackConnect
network policies that allow full access between your cloud and dedicated
environments.

**Important:** RackConnect network policies are limited to port ranges
of 100. For details, see [Managing RackConnect network policies](/how-to/managing-rackconnect-v20-network-policies).

**Note**: Connecting cloud servers to the Intensive Active Directory
domains is not currently supported.

#### Can I have an additional private IP address on my RackConnect cloud servers for SSL routing?

The Rackspace cloud does not allow for additional IP addresses on
the private interface. The best workaround for hosting multiple SSL
sites would be to host each site on a separate cloud server, or use
PAT (Port Address Translation).

For more details about PAT, see [Multiple SSL certificates on a single RackConnect cloud server (PAT)](/how-to/multiple-ssl-certificates-on-a-single-rackconnected-cloud-server-pat).

#### Can Cloud Load Balancers be used with RackConnect?

Using Cloud Load Balancers can be a great solution. The key is to clearly understand
the use cases for this configuration. Load Balancers works best when all servers to
be load balanced reside in the cloud. If dedicated servers need to be
load balanced, or cloud and dedicated servers are to be load balanced together,
you should deploy RackConnect with an F5 load balancer. The firewall
used with RackConnect further isolates and protects the
customers dedicated servers.

Also note that when you use Load Balancers with RackConnect, all Internet traffic
comes and goes through the cloud, and you pay for all
outbound bandwidth at the standard Load Balancers rate. This bandwidth is not
included in the "included" bandwidth that comes with each dedicated
server.

For more details, see [Use Cloud Load Balancers with RackConnect](/how-to/using-cloud-load-balancers-with-rackconnect).

#### Do pre-existing snapshots cause issues after an account is set up with RackConnect?

Snapshots taken of a server before the cloud account was set up with
RackConnect should not pose a significant problem after the account is
set up with RackConnect. However, a problem can occur if the network
stack has been modified or iptables have been set to block all access
(which will block the RackConnect system from connecting). Specifically,
the snapshot must have a clean SSH configuration that permits root
login, with port 22 open in iptables, and accepts password
authentication.

#### How do I retrieve the public IP address for a cloud server that has been recently provisioned?

You can view the public IP address of your RackConnect cloud server in
the following places:

-   In the RackConnect Management Interface of the
    [MyRackspace portal](https://my.rackspace.com/), view the IP address
    on the **Overview** tab for the server.

-   You can retrieve the public IP address through the Cloud Servers API
    by querying for server details. The field containing the RackConnect
    Public IP address is called `accessIPv4`. For details about using
    the API to retrieve server information, see the [Getting server details](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#getting-server-details)
    section in the *Cloud Servers v2 Developer Guide*.

#### Can I use cloud server images to create cloud servers in different regions?

It is not currently possible to use cloud server images (snapshots)
created in one region to spin up cloud servers in a different region. We
expect this functionality to be available in late 2013.

Due to the limitation above, if you would like to use cloud server images with RackConnect, follow this process:

1.  Create a cloud server in the same region as your RackConnect configuration.
2.  After the cloud server is deployed and configured as you would like, you can create an image (snapshot) of it.
3.  You can now create new cloud servers from this image, as long as they are created in the same region in which your
    RackConnect configuration is located.

**Note**: If you have existing cloud server images that were created
in a different region than where your RackConnect configuration is
located, then it will not be possible to use them with RackConnect until
the first half of 2014 (expected time frame).

#### Can I use RackConnect as a firewall for my cloud servers?

Yes. By default the cloud servers are directly exposed to the Internet and
only the internal OS firewall is available for protection. You can deploy RackConnect
as a front-end dedicated firewall to provide a single
entry point for public traffic to all your cloud servers. In addition, it
allows a single point to consolidate your firewall rules for all cloud
servers through the use of RackConnect network policies.
