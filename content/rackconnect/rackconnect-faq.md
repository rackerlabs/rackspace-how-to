---
node_id: 4271
title: RackConnect FAQ
type: article
created_date: '2014-09-26'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

### Rackconnect v3.0

#### Can I allocate multiple cloud networks to a single RackConnect v3.0 cloud server?

No. We currently support only one cloud network per cloud server.

#### Can I assign more than one cloud network IP address to my RackConnect v3.0 cloud servers?

No. For each cloud server, we currently only support:

-   One cloud network
-   One IP address per cloud network
-   One public IP address network address translation (NAT) per cloud
    server

#### Can I upgrade my RackConnect v2.0 environment to RackConnect v3.0?

Not yet, but we are working on a migration path. Initially, we plan to
offer you the ability to associate a *new* cloud account with your
existing RackConnect v2.0 configuration, which will enable you to
experience RackConnect v3.0 without deactivating your existing
RackConnect v2.0 environment. Note that only *next generation cloud
servers* will be compatible with the migration process to RackConnect
v3.0. We will provide more details about this process as they become
available.

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
-   If the pre-existing cloud servers are using PublicNet, you must
    remove PublicNet before attempting to add a RackConnect v3.0 cloud
    network to the cloud server.
-   If you are a Managed Operations customer and need help detaching
    PublicNet, contact your Rackspace support team for assistance.
-   If the pre-existing cloud servers are using ServiceNet, the
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
    your server is attached to only those networks. See the [Create your first Server](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-getting-started/create-server-intro)
    section of the Cloud Servers v2 Developer Guide for
    more information.

### Rackconnect v2.0

#### How do I get RackConnect?

Customers with a dedicated account should speak to their Account Manager
for information about the actions involved in getting RackConnect, and
how best to proceed. Be aware that RackConnect is supported only where
Rackspace Cloud infrastructure exists. At this time, the Rackspace Cloud
is available from our Chicago, Dallas, Virginia, Sydney, Hong Kong, and
London data centers.

If you are an existing Cloud customer, you will need to speak to a
member of our Sales team. They can guide you through the process of
acquiring a device that may be used in a RackConnected environment.

#### What can RackConnect do for me?

You need RackConnect in order to build a hybrid hosting solution that
combines the best of dedicated and cloud hosting by creating connections
between dedicated servers and Cloud Servers. RackConnect can be
implemented on certain Cisco ASA series FIREWALLS, or an F5 BIG-IP load
balancer that is used to interconnect dedicated physical servers with
cloud-based servers on the Rackspace internal network known as
ServiceNet.

#### Where do I go for help with RackConnect

If you need help with RackConnect please contact us via any of our usual
Support channels, and our team will help you with your issue or direct
you on to the relevant support group. We are available via phone, chat,
or tickets 24x7x365.

If you believe your issue is Cloud Server specific, please raise the
appropriate query with the Cloud team via the Cloud Control Panel,
otherwise please raise other requests via the my.rackspace.com portal.

#### I already have a cloud account, can I connect to my existing servers?

You may RackConnect an existing Cloud account, but any existing servers
will not be RackConnected. If existing servers need to be RackConnected,
they will need to be rebuilt after the RackConnect implementation has
been completed. This may be done by first saving a Cloud Server image,
and then using the image to rebuild the existing server a a new
RackConnected server - or to simply build a new server.

Please be aware that this process for RackConnecting an existing server
will result in a new IP being assigned to the server. Since you are
essentially creating a new server, unfortunately this cannot be avoided.

An important consideration to take into account is the region you will
use to provision your servers. Because RackConnect relies on a service
net connection to link your dedicated servers and your cloud servers,
you will need to provision your RackConnected servers in the same
geographic region as your dedicated servers. Your saved server images
will only be available for creating servers in the same region as the
original server.

#### Which cloud account do I need for RackConnect?

RackConnect may be used with both Managed Operations Service Level and
Managed Infrastructure accounts.

Be aware that the usual service-level limitations still apply for
RackConnect Cloud accounts, and you should use the appropriate account
type for the implementation based on your support requirements. It is
possible to use RackConnect with more than one cloud account, so you can
have a mix of both if you prefer.

#### I have RackConnect v2.0, how can I build unconnected Cloud Servers?

During normal circumstances, if your Cloud account has been enabled with
RackConnect v2.0, your Cloud account is linked to your dedicated hosting
account and your dedicated servers will be able to communicate using the
service net with your Cloud Servers in the same region. If you want to
provision Cloud Servers that are *not* linked to your dedicated
Rackspace Hosting account, there are a couple of ways you can work
around this condition.

- You can provision Cloud Servers in a region other than the one where
your dedicated servers are located. For example, if your dedicated
servers are in the DFW region, and your linked Cloud Servers are also in
the the DFW region, any Cloud Servers you provision in ORD or IAD will
not be linked to your dedicated servers and should function
independently.

- You can also sign up for a second Cloud account. The drawback of
doing this is that you will not be able to access any custom server
images between accounts.

#### How am I charged for bandwidth usage?

For Cloud Servers that are a part of your RackConnect configuration,
all network traffic will leave via the dedicated firewall device. The
traffic between the Cloud Servers and the RackConnect device travels
over the internal, unmetered Cloud ServiceNet. Any traffic between the
Cloud Servers and dedicated networks will similarly be unmetered and not
incur bandwidth charges.

The bandwidth usage costs for Internet related traffic entering and
leaving the RackConnect device is charged using Dedicated Hosting
bandwidth pricing plans. Our Sales representatives will discuss this in
more detail with you when you inquire about RackConnect.

#### What are network policies?

RackConnect network policies are the equivalent of firewall rules that
are applied via the RackConnect web interface. These policies are then
applied to the firewall device and any Cloud Servers referenced.

The network policies are a useful means of centralizing all your
firewall rules for the RackConnect device, any dedicated networks and
any RackConnected Cloud servers.

#### My Cloud Servers have no network connectivity, what's wrong?

Please check the current RackConnect network policies in place to ensure
that the relevant access rules will permit the required connectivity.
For example creating an Internet-to-Cloud rule to permit traffic
originating from the Internet to reach your Cloud Servers.

If adjusting the network policies does not resolve the issue, please
contact Support via phone, chat, or ticket so that we can help
investigate this further with you.

#### Can Cloud Databases be used with Rackconnect?

Yes, RackConnect cloud servers can be used to connect to Cloud
Databases, but dedicated servers in a RackConnect configuration will not
be able to connect to Cloud Databases.

#### Can I use RackConnect across different data centers?

No. Because RackConnect is intended to interconnect devices on a local
network, any involved servers need to be within the same data center.

If you have existing dedicated hardware, ensure that your Cloud account
is provisioned to build your Cloud Servers in the same data center.
Contact our Cloud support team for help with this. Rackspace has cloud
infrastructure in Chicago, Dallas, and Virginia in the US, and global
cloud infrastructure in London, Sydney, and Hong Kong.

#### I need VPN connectivity to my Cloud Servers. Can RackConnect help?

Yes, because RackConnect is a dedicated firewall, it is possible to
terminate a site-to-site VPN on the device, or to use a client-based
VPN. This enables secure VPN communication between your office or home
into the cloud environment.

#### Does RackConnect enhance my ability to connect to my Cloud Files?

Most areas of our data centers have access to our ServiceNet in which
a customer can connect privately to our Cloud Files infrastructure
without traversing the public network (provided the cloud files are in
the same DC as the dedicated server making the connection). The older
areas of our DFW DC that do not have ServiceNet will need RackConnect to
connect to the cloud ServiceNet, which will allow for a private
connection to Cloud Files.

#### Can RackConnect be used if the dedicated firewall is already set up with multiple segments?

Yes. RackConnect connects your Rackspace Cloud as an additional
interface on your firewall; therefore it allows you to connect to a
firewall that has multiple segments set up if enough ports available.
Our data center can perform a visual inspection of the firewall to
ensure that there is an available port to connect to RackConnect.

#### Can I extend my Active Directory (AD) domain across RackConnect into the cloud?

Customer-owned Active Directory domains can be extended over
RackConnect. This includes Active Directory Domain Controllers in your
Dedicated environment or in your Cloud environment.

If you are planning to deploy Domain Controllers in the Cloud, and you
promote a Cloud Server to a Domain Controller, please make sure to
create a ticket and inform the RackConnect team about this change. You
will need to manually create a **rackconnect** user account on the Domain
and add this account to the Domain Admins global group. We will add
the **DOMAIN\rackconnect** account to the RackConnect system instead of
**rackconnect** to get RackConnect to work with your Domain
Controller cloud servers.

Additionally, Active Directory requires a large number of open ports to
function properly, so we highly recommended that you create RackConnect
network policies that allow full access between your Cloud and Dedicated
environments.

**IMPORTANT**: RackConnect network policies are limited to port ranges
of 100. For details, see [Managing RackConnect network policies](/how-to/managing-rackconnect-v20-network-policies).

**Note**: Connecting Cloud Servers to the Intensive Active Directory
Domains is not currently supported.

#### Can I have an additional private IP address on my RackConnected Cloud Servers for SSL routing?

Unfortunately our Cloud does not allow for additional IP addresses on
the private interface. The best work-around for hosting multiple SSL
sites would be to host each site on a separate Cloud Server, or utilize
PAT (Port Address Translation).

Please view the following article for further details on PAT: [Multiple SSL certificates on a single RackConnect cloud server (PAT)](/how-to/multiple-ssl-certificates-on-a-single-rackconnected-cloud-server-pat).

#### Can Cloud Load Balancers (CLB) be used with RackConnect?

Utilizing CLB can be a great solution. The key is to clearly understand
the use cases for this configuration. CLB works best when all servers to
be load balanced reside in the Cloud. If dedicated servers need to be
load balanced, or Cloud and Dedicated are to be load balanced together,
you should deploy RackConnect with an F5 load balancer. The firewall
used with RackConnect serves to further isolate and protect the
customers dedicated servers.

Also note that when using CLB with RackConnect, all internet traffic
comes and goes through the Cloud, and the customer will pay for all
outbound bandwidth at the standard CLB rate. This bandwidth is not
included in the "included" bandwidth that comes with each dedicated
server.

For further details, see [Using Cloud Load Balancers with RackConnect](/how-to/using-cloud-load-balancers-with-rackconnect).

#### Do pre-existing snapshots cause issues after an account is set up with RackConnect?

Snapshots taken of a server before the Cloud account was set up with
RackConnect should not pose a significant problem after the account is
set up with RackConnect. However, a problem can occur if the network
stack has been modified or iptables has been set to block all access
(which will block the RackConnect system from connecting). Specifically,
the snapshot must have a clean SSH configuration that permits root
login, with port 22 open in iptables, and accepts password
authentication.

#### Can I use First Generation Cloud Server customer images with Next Generation Cloud Servers?

On Friday Nov 2, 2012, Rackspace enabled our final set of images allowing
88% to 90% of our First Generation Servers to be eligible for a snapshot
migration to a Next Generation Server. Approximately 130,000 to 135,000
First Generation Cloud Servers can now easily make the transition over
to our Next Generation platform powered by OpenStack&reg;.

The snapshot migration feature allows a Rackspace customer to take a
snapshot of their eligible First Generation Cloud Server, and create a
new Next Generation Cloud Server from that snapshot. With a few button
clicks, a new Next Generation Cloud Server is up and running that is an
exact copy, data-wise, of their First Generation server. With this
option, customers will get a new Next Generation cloud server with a new
IP address, but will experience no downtime.

#### Can I migrate my first generation Cloud Servers to next generation Cloud Servers?

There will not be an automated migration process available upon launch,
but we anticipate that one will be made available in the coming months.

#### How do I retrieve the public IP address for a Next Generation Cloud Server that has been recently provisioned?

You can view the public IP address of your RackConnect Cloud Server in
the following places:

-   In the RackConnect Management Interface of the
    [MyRackspace](https://my.rackspace.com/) portal, view the IP address
    on the Overview tab for the server.

-   You can retrieve the public IP address through the Cloud Servers API
    by querying for Server Details. The field containing the RackConnect
    Public IP address is called *accessIPv4*. For details about using
    the API to retrieve server information, see the [Get Server Details](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-getting-started/create-server/get-server-details)
    section in the *Cloud Servers v2 Developer Guide*.

#### Can I use next generation Cloud Server Images to Create Cloud Servers in different regions?

It is not currently possible to use next generation Images (snapshots)
created in one region to spin up Cloud Servers in a different region. We
expect this functionality to be available in late 2013.

Due to the limitation above, if you would like to use generation Cloud
Server Images with RackConnect, follow this process:

1.  Create a next generation Cloud Server in the same
    region as your RackConnect Configuration.
2.  After the cloud server is deployed and configured as you would like,
    you can create an image (snapshot) of it.
3.  You can now create new next generation Cloud Servers from this
    image, as long as they are created in the same region your
    RackConnect Configuration is located.

**Note**: If you have existing next generation Images that were created
in a different region than where your RackConnect configuration is
located, then it will not be possible to use them with RackConnect until
the first half of 2014 (expected timeframe).

#### Can I use RackConnect as a firewall for my Cloud Servers?

Yes. By default the Cloud Servers are directly exposed to the Internet and
only the internal OS firewall is available for protection. RackConnect
may be deployed as a front-end dedicated firewall to provide a single
entry point for public traffic to all your cloud servers. In addition it
allows a single point to consolidate your firewall rules for all cloud
servers through the use of RackConnect network policies.
