---
permalink: cloud-servers-faq/
audit_date:
title: Cloud Servers FAQ
type: article
created_date: '2015-12-01'
created_by: Rackspace Support
last_modified_date: '2017-03-03'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### - Getting started -

#### I want to install version x.y of software in Linux, but your system doesn't allow me to? How do I install it?

Chances are that the repository for your operating system's package
manager has an older approved version. This is fairly common, and you
will need to remove that installation and then compile the newer version
yourself. Refer to the software vendor for instructions.

#### Will you help me install my software package?

It depends on your service level. For Managed Infrastructure Cloud
accounts, you are responsible for installing and maintaining all
software on your server. Rackspace does provide support for specific
software and server configurations on Cloud Servers with Managed
Operations. For more information on supported systems and third party
packages, see [Cloud Servers with Managed Operations - Spheres of Support](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops).

#### Do you support Ruby/Python/(insert language or application here)?

All of our Cloud Servers can be configured as development stacks,
database servers and web servers. Apache, Lighttpd and Mongrel, Visual
Studio are all options.

You can use the programming language of your choice to interact with
Cloud Servers. For help getting started with that, use any of the
Software Development Kits (SDKs) documented at
<https://developer.rackspace.com/sdks/>.

#### Do you host DNS?

Yes. Our Control Panel has a DNS menu for maintaining domain records for
your Cloud Servers. See [Create DNS records for Cloud Servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel)
for more information.

#### What are the DNS servers for my Cloud Server?

*dns1.stabletransit.com* and *dns2.stabletransit.com*

#### How many domains can I host?

This is a question familiar to those who use shared hosting. There is no
limit, since you are in control of everything on your Cloud Server.

#### I'm kind of new to this, will it be difficult?

Maybe. That mostly depends on your experience as a Systems Administrator
for Linux and/or Windows Server. Our Linux Cloud Servers are full Linux
distributions with root-level access. Our Windows Cloud Servers give you
Administrator access, and are built with nothing but the default
applications on install. Cloud Servers are geared towards customers who
want to start from scratch and tune a system for their own purposes.

If, after wearing the Systems Administrator hat for a while, you feel
that you are out of your league - don't despair! We also offer Cloud
Servers with a Managed Operations. Read here for more information on
[Cloud Servers with Managed Operations](http://www.rackspace.com/cloud/managed_cloud/).

#### What level of support comes with Cloud Servers?

We have two Service Levels: **Managed Infrastructure** and **Managed
Operations**. At the Managed Infrastructure level, we support the Cloud
Server hardware, datacenter environment, and Internet connectivity - but
do not support the software installed on your server, including the
operating system and its configuration. When you provision a Cloud
Server, you will be given a server with unrestricted access. The Managed
Infrastructure support team will not assist in the installation of
software or troubleshooting any kind of issue related to the software
installed. We have some articles in Rackspace How-To covering basic
installation of common applications. We also have community forums where
you can share tips and tricks with other customers.

If you would like to have a [Managed Operations](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops)
on your Cloud Servers, we offer that service. This operations level
provides additional support on Cloud Servers, which includes monitoring,
operating system and application infrastructure layer support, and
technical guidance.

#### What can I do with a Cloud Server?

Anything you want to (within the law and our [Acceptable Use Policy](http://www.rackspace.com/cloud/legal/aup/), of course)! The
Rackspace Cloud Server solution is a fully unrestricted,
root/Administrator level access, Linux or Windows environment. Any
application or service that you can run from a traditional, physical,
dedicated-unmanaged operations can be run from your Cloud Server.

#### Can I reinstall a different distribution or start over?

Of course you can! Simply press the **Rebuild** button in the Control
Panel and you will be able to select a new distribution. Be sure you
have a backup of your data because this process will destroy any data
that is on the server. The rebuild process does allow you to save you IP
address.

#### What if I mess up my Cloud Server?

You can [reboot your server](/how-to/reboot-your-server).
You can [restore from a backup](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).
You can [delete your server](/how-to/deleting-your-server)
and start over. You can [boot into an emergency rescue mode](/how-to/rescue-mode)
and attempt fix the problem. There are many options for recovering from
mistakes, but the easiest is to keep regular backups and to [make a fresh backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup)
before attempting any major configuration changes or before installing
new software.

------------------------------------------------------------------------

### Account services

#### Are Rackspace Cloud Servers HIPAA compliant?

Rackspace cannot determine if a given customer is meeting their
obligations under the laws applicable to them, and it remains our
customers' obligation to understand the laws applicable to their use of
the services and select appropriate services to meet those obligations.
We do understand the needs of many of our customers in the healthcare
space to implement appropriate security measures to protect the
sensitive information they work with.

To help customers in the healthcare industry meet their compliance
requirements with regards to HIPAA, Rackspace offers a [Business Associate Agreement](http://www.rackspace.com/information/legal/hipaabaa) in all
of our dedicated hosting services segments, and it is included by
default in our agreements with customers for those services.

#### How does Cloud Servers handle my data from potentially becoming visible when I delete a server?

For your security, the Virtual Hard Drive (VHD) on the hypervisor is
deleted when you delete a server. Once it is deleted, data cannot be
retrieved and customers do not have logical or direct access to the
physical drive.

#### What are PVHVM images?

PVHVM refers to the virtualization mode used by the hypervisor to run
the virtual machine. PVHVM images are virtual machine images that use
the PVHVM virtualization mode. In general, PVHVM offers better
performance than PV, especially for disk and network IO, but is not well
supported in Linux operating systems with a kernel version earlier than
2.6.36. The availability of PV and PVHVM images in the Rackspace Cloud
is determined by the effectiveness of each virtualization mode for that
particular operating system.

**Note**: Work-optimized servers (Compute, I/O, and Memory) require
PVHVM images. If you try to create a work-optimized server by using a
non-PVHVM image, the following error message is displayed:
`Image cannot be built with provided flavor`.

For more information about PVHVM, see [Choosing a Virtualization Mode (PV versus PVHVM)](/how-to/choosing-a-virtualization-mode-pv-versus-pvhvm).

#### What do I enter in the Server Name field?

The information that you enter in the **Server Name** field helps you
identify this server in the API and Cloud Control Panel. The name that
you enter when you create a server is used as the server's host name. If
you rename the server later, the name that is displayed in the API and
Cloud Control Panel is updated. However, the host name on the computer
is not updated.

#### Can I connect to a server by using the server name?

To connect to the server from outside of the server's local network, you
need to configure an A record in Cloud DNS. To access Cloud DNS, in the
top navigation bar of the Cloud Control Panel, select **Networking >
Cloud DNS**.

For example, if you name your server
**[MyWebServer1.MyExampleDomain.com](http://mywebserver1.myexampledomain.com/)**,
you must add an A record for
**[MyWebServer1.MyExampleDomain.com](http://mywebserver1.myexampledomain.com/)**
to your DNS zone ([MyExampleDomain.com](http://myexampledomain.com/))
that points to the public IP address of the server. The information that
you enter in the **Server Name** field helps you identify this server in
the API and [Cloud Control Panel](https://mycloud.rackspace.com/).

#### Can I read your SLA?

Sure, it's [right here](https://www.rackspace.com/information/legal/cloud/sla).

#### How do I contact Support?

At Rackspace, our goal is to make the Cloud easy for you to use. To meet
that goal, we have created many different ways for you to get the
support that you need to get the most out of the Cloud.

-   Your first stop should be [Rackspace How-To](/how-to/), which is the best
    source for articles and tutorials to help you get the precise
    answers that you need.
-   Our [Open Cloud Forum](https://community.rackspace.com/products/f/25) in the
    Rackspace Community is always open. Use the forum to get your
    questions answered by a Racker.
-   Do you have a quick question that you can't find an answer for in
    Rackspace How-To? Open Chat and talk with our Fanatical Support&reg;
    staff anytime, 24x7x365.
-   Do you have a specialized Service Request or are you experiencing a
    problem with our service? Open a ticket. From the Rackspace [Cloud Control Panel](http://mycloud.rackspace.com/), select **Support
    Tickets** from the Account menu. Click **Create Ticket** to open a
    ticket directly with our support teams to report a problem or make a
    service request.
-   Call us 24x7x365 at 800 961 4454 (toll-free) or +1 210 312
    4000 (international).

#### Can I install the Rackspace Private Cloud on virtual machines?

Rackspace strongly recommends that you install Rackspace Private Cloud
on physical hardware nodes running Ubuntu 12.04 or CentOS 6.3.
Installation on virtual platforms should only be performed for
evaluation purposes.

------------------------------------------------------------------------

### Server Management

#### Do you host DNS?

Yes. Our Control Panel has a DNS menu for maintaining domain records for
your Cloud Servers. Read this article for [detailed information on using the Rackspace Cloud DNS Control Panel](/how-to/getting-started-with-cloud-sites-managing-dns-records).

#### How do I get reverse DNS setup for my Cloud Server?

You can setup reverse DNS from your control panel. This article will
show you how: [Create a reverse DNS record.](/how-to/create-a-reverse-dns-record)

#### Is there a throughput limit on my server's network interface card?

The amount of network throughput varies based on the Cloud Server
flavor. For more details, see
[here](http://www.rackspace.com/cloud/public-pricing/#cloud-servers).

#### Do you offer internal IPs?

Yes. Each server comes with an internal IP address that is used to
communicate between servers. The traffic that flows over this interface
(eth1) on your server is unmetered and is not billed. This network is
also referred to as ServiceNet. ServiceNet is an internal only,
multi-tenant network connection within each Rackspace datacenter.
ServiceNet IPs are not accessible from the public Internet and are local
per datacenter.

#### Can I buy extra public IPs?

Yes. For more information about the IP request process, see [Requesting Additional IPv4 Addresses for Cloud Servers](/how-to/requesting-additional-ipv4-addresses-for-cloud-servers).

#### I would like to set up multiple servers from the same image. Can I do this?

As a Cloud Servers customer, you have access to create both on-demand
images and scheduled images of your cloud server. All Cloud Server
images will be stored in your Cloud Files account. This enables you to
keep these images even after the Cloud Server they were created on is
deleted. It also allows the flexibility to create an unlimited number of
on-demand images of your Cloud Server. All Cloud Server images can be
used to create new Cloud Servers or restore an existing Cloud Server.
For details, see [Creating an Image of Your Performance Flavor Server with the Control Panel](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).

#### Do you offer on-demand images (snapshots) and scheduled images and what are the prices?

You can create an image of any General Purpose Cloud Server, and you can
use this image to restore a server or clone a new one. You can create an
unlimited number of images on-demand, or you can schedule an automatic
daily or weekly image.

Images will be compressed and stored on Rackspace Cloud Files at the
[current storage rates](http://www.rackspace.com/cloud/cloud_hosting_products/files/pricing/).
Please also read this list of [Snapshot Limitations](/how-to/rackspace-cloud-essentials-cloud-server-image-limitations).

If using a virtual cloud server, see [Creating an image of your General Purpose Cloud Server with the control panel](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
for more information on the image options associated with virtual cloud
servers.

#### I would like to use the GUI interface for my Linux Cloud Server. Is this possible?

Yes it is! An article on how to install VNC and X-Windows is located
here: [VNC Install](/how-to/vnc-install "VNC Install").
Keep in mind that this will use up a large amount of bandwidth on your
server.

#### Do you have a control panel?

Yes, the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com/)
is a web-based management interface for restarting your cloud server,
starting support discussions, viewing stats, and scheduling snapshots.
However, we do not offer a control panel like Plesk or cPanel. You're free to install such packages for your own cloud server. If you are installing cPanel, be sure to install on a clean (empty) server. See [CentOS/RHEL - Installing cPanel & WHM 11.24](https://community.rackspace.com/products/f/25/t/6798) for additional information.
The usage of Plesk or cPanel is not supported and strongly discouraged for customers under the Managed Operations SLA as it interferes with our server administration. See [Using Plesk or cPanel with the Managed Operations Service Level Agreement](https://community.rackspace.com/products/f/25/t/4888) for additional information.

You may be interested in installing the free monitoring agent on your
server and using the [Cloud Intelligence dashboard](https://intelligence.rackspace.com/), which offers many of
the same functions as a control panel.

#### Do you provide Console access?

Yes, via a Java web terminal accessible through the Details section of
each webserver, in the Actions menu under the section labeled Manage,
you will see a link to Connect Via Terminal.

**Note**: Console access is via a secure HTTP connection which is
different connection from the traditional way to connect via SSH for
Linux or RDP for Windows. Console can be a useful troubleshooting tool
if your server is unresponsive or you have locked yourself out.

#### Can I reboot my machine?

Yes. All Cloud Servers can perform both soft (reset button) and hard
(power cycle) reboots. These are performed instantly and handled via the
Cloud Server Control Panel.

#### Will I be billed if my server is powered off?

Yes. You will be billed for the resources that are used on the host
while your server is in the **Active** status. When your server is
created, you are given a dedicated amount of RAM and hard drive space.
As long as your server exists, no one else will be able to use those
resources that have been allocated to you - this is why you are billed
per hour even while powered off. If you would like to stop incurring
charges for a given server, you must delete that server in the Control
Panel.

If you want to stop paying for a server, but still need to retain the
configurations from it, your best option is to [create an image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
of the Cloud Server. Your system configurations on your system disk will
be preserved in the image. The image will be saved in Cloud Files and
accessible through the Saved Images tab in the Control Panel. There is a
fee associated with Cloud Files storage but it is much less than the
cost of an active server. You will also need to save the data from your
data disk out to Cloud Block Storage or Rackspace Cloud Backup to have
available on your next server. Then you will be free to delete the
original server, safe in the knowledge that you can always provision a
new server using the saved image of your old server and you saved data.
After restoring your server from the saved image, the primary difference
will be that your new server has a different IP address from the old
one. Putting the new server into production may require you to update
any associated DNS records to reflect the new IP address.

#### How do I power my server back on after shutting it down?

Please see the following article: [Shutting Down and Restarting a Cloud Server](/how-to/reboot-your-server "Shutting Down and Restarting a Cloud Server")

#### Which distributions do you offer?

The Features section of our [product page](http://www.rackspace.com/cloud/servers/) has information regarding
the Linux distributions and Windows operating systems that we have
available.

#### Can I upgrade down the road?

Yes. With General Purpose Cloud Servers, you can change the size of your
data storage space in one of two ways:

-   Increase Available Storage with Cloud Block Storage. For more
    information on Cloud Block Storage, see [Create and Attach a Cloud
    Block Storage
    Volume](/how-to/create-and-attach-a-cloud-block-storage-volume).
-   Migrate to a larger size server with more RAM, disk space,
    and vCPUs. For  more information on resizing, see [Changing the Size
    of Your Cloud
    Server](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

#### How many users go onto each machine?

The number of customers on a Cloud Server host machine depends on the
size of the customers' Cloud Servers, and the type of operating system.

#### How does the CPU scheduling work on Standard servers?

**Note**: [General Purpose Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers)
have specific virtual CPU allocations, as detailed on the [Cloud Servers pricing page](http://www.rackspace.com/cloud/servers/pricing/). The
following information on CPU scheduling applies to standard Cloud Servers only.

For Windows images, each Cloud Server is assigned a number of virtual
cores based on the size of the Cloud Server. The Standard 1 GB Cloud
Server receives 1 virtual core, the standard 2 GB and 4 GB Cloud Servers
receive 2 virtual cores, the standard 8 GB and 15.5 GB Cloud Servers
receive 4 virtual cores, and the standard 30GB servers receive 8 virtual
cores. Each of these cores is given equal weight when allocating CPU
cycles.

For Linux distributions, each Standard Cloud Server is assigned the
number of virtual cores and the CPU cycles allocated to these cores, as
selected when creating the server in the Control Panel.

All standard Cloud Servers receive a guaranteed minimum amount of CPU
cycles with the ability to burst when excess cycles are available.

#### How long does a standard Cloud Server resize take?

The amount of time a resize takes varies by the size of the server and
the time of day you are performing the resize. If you have a brand-new
server with no additional data or software installed, then you might be
looking at 10 minutes. However, if you have data installed on your
server and have been installing software then it can take up to 30
minutes or more. Peak times for resize activity tend to be at the start
and end of the business day. Expect a short period of downtime while
your server is being resized.

Note also that resizing a server down can take longer than resizing up
because the system needs to consolidate and copy data to a smaller disk
container rather than expand the existing container. Cleaning up
unneeded files (like old logs and session files) can improve the speed
of a resize operation.

There are different processes of resizes, as follows:

-   **Online Resizes**: Allow for the original sized Cloud Server to be
    powered on during the "Prep-Resize" step, and only powers down
    during the second step of the resize process.

    This includes: Standard resize up.

-   **Offline Resizes**: Power down as the first "Prep-Resize" step.

    This includes: Standard resize down.

**NOTE**: Resizing is not available for workload-optimized Cloud
Servers. For information on your available options, see [Changing the size of your workload-optimized Cloud Server](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

#### Can I buy extra storage?

While the native storage allocation for a Cloud Server is based on the
Cloud Server flavor that you select, you can also add extra storage at
any time with our [Cloud Block Storage](http://www.rackspace.com/cloud/blockstorage/) service.

------------------------------------------------------------------------

### Performance

#### What is the difference between Standard and General Purpose Cloud Servers?

There are several noteworthy differences between Standard and General
Purpose Cloud Servers:

-   General Purpose Cloud Servers use faster solid state drives (SSD)
    compared to the standard spinning disk allocation for Standard
    Cloud Servers.
-   Up to 120 GB of RAM is available on General Purpose servers, whereas
    Standard Servers provide up to 30 GB of RAM.
-   You can have up to 32 vCPUs running on General Purpose Cloud
    Servers, comapred to the maximum of 8 on the Standard Cloud Servers.
-   Maximum network bandwidth on Standard Cloud Servers is 300 Mbps
    public network and 600 Mbps private network. Maximum network
    bandwidth on General Purpose Cloud Servers is 10,000 Mbps to divide
    between public and private networks as you choose.

For more information about General Purpose Cloud Servers, see [What is new with General Purpose Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers).

------------------------------------------------------------------------

### Billing and Account

#### Do you offer discounts for Cloud Servers?

Yes. We offer different types of discounts based on usage. Please see
the [Cloud Servers discounts page](http://www.rackspace.com/cloud/servers/discounts/) for details.

------------------------------------------------------------------------

### Security

#### What happens when a Security Group rule is added to the Security Group?

Traffic matching a Security Group rule is allowed to go through.

#### Can I apply Security Groups to ports on an instance at boot time?

No. Security Groups can only be applied after the instance is active.

#### Is there a default Security Group that gets applied to my instances?

No, there is no default security Group that gets applied. Users have to
create a Security Group themselves and apply them to ports on an
instance.

#### Are Security Groups supported for OnMetal users?

No, Security Groups are currently only supported for Virtual Cloud
servers.

#### Will this be integrated and available to use via the Control Panel / Reach?

The product will be available via Control panel very soon. In the
interim, customers can use either the Neutron client or the API.

#### Will Security Groups be supported via Neutron client?

Yes. Users can provision security groups via Neutron client.

#### Are Security Groups on Cloud Networks supported?

Yes. For Additional information see [API Developer Guide, Concept section](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-concepts/index).

#### Are Outbound Security Groups supported?

Yes. For Additional information see [API Developer Guide, Concept section](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-concepts/index).

#### What features are supported at launch for Security Groups?

Inbound Security Groups on PublicNet and ServiceNet interfaces are
supported. This means customers can filter incoming traffic to their
PublicNet and ServiceNet ports.

#### Is the security group feature supported for all Cloud customers?

Security Groups will only be supported for Managed Infrastructure,
non-RackConnect customers at launch.

#### Is Security Groups available to all Rackspace Public Cloud users?

Security Groups is in Limited Availability in all Data Centers. Please
contact Rackspace support to enable this feature.

#### What are the benefits of using Security Groups?

Prior to this feature being available, customers had to manage traffic
to/from their instances individually via (for example) ipTables rules on
every instance (or perhaps use 3rd party tools). Managing firewall
policies involves in a distributed fashion significant overhead to keep
track of and manage. Security Groups makes it possible to use
self-service API to define a common set of rules and apply them to the
Neutron ports (Public/ServiceNet) on Cloud Servers without needing to
tweak iptables rules on each server, thereby simplifying administration
of security policies.

#### What are Security Groups?

Security groups are a named collection of network access rules
that provide Rackspace Public Cloud users the ability to specify the
types of traffic that are allowed to pass through, to and from ports
(Public/ServiceNet) on a Cloud server instance. A security group is a
container for security group rules. After you launch an instance, you
can assign one or more security groups to ports on that instance.
Security Groups act as a stateful firewall for your cloud server
instances.

#### Are cloud servers PCI-DSS compliant?

The Rackspace Cloud environment has not been formally assessed for for
compliance with the Payment Card Industry (PCI) Data Security Standard
(DSS). For information about PCI-DSS, see [Cloud Security Solutions](http://www.rackspace.com/security/solutions/#pci). For
information about PCI-DSS when using Rackspace Dedicated Hosting
services, see [PCI-Compliant Hosting for E-commerce Websites](http://www.rackspace.com/ecommerce-hosting/pci/).

#### Can I run a firewall on my server?

Definitely and we encourage it! Each Linux server is capable of running
the Linux-standard firewall called **iptables**- some even have it
pre-configured! Other firewall systems have been tested on Cloud Servers
as well.

#### Is there a limit of number of rules per user?

There is an aggregate limit of 100 security Group rules per user during
Limited Availability. Please contact Rackspace support if you need this
limit raised.

#### Is there a limit of number of rules per Security Group?

There is a limit of 20 security Group rules per Security Group. Please
contact Rackspace support if you need this limit raised.

#### How many Security Groups can I apply per port?

Up to 5 security Groups are allowed per port. Please contact Rackspace
support if you need this limit raised.

#### Are Security Groups applied to instances?

Security Groups are applied to Neutron ports (PublicNet and ServiceNet)
on Cloud Server instances.

#### Can I have a Security Group with no rules?

Yes. Such a Security Group will deny/ block all traffic.

#### What kinds of traffic can be matched by the Security Group rules?

TCP, UDP, ICMP traffic can be matched in addition to traffic from a
Source IP address or CIDR. Both IPv4 and IPv6 traffic can be matched.

#### Is there any traffic that is permitted or allowed by default by Security Groups?

DNS responses from Rackspace Provider DNS servers (UDP source port 53 )
are allowed by default even if they are not explicitly allowed by a
Security Group.

Also TCP flags ACK and RST are permitted by default.

#### What are the maximum limits for the Cloud Servers service?

The maximum limits are as follows:

| Limit Name              | Description                                                                                                                            | Value  |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|--------|
| maxImageMeta            | The maximum number of metadata key value pairs associated with a particular image.                                                     | 40     |
| maxPersonality          | The maximum number of file path/content pairs that can be supplied when a server is built or rebuilt.                                  | 5      |
| maxPersonalitySize      | The maximum size, in bytes, for each personality file.                                                                                 | 1000   |
| maxServerMeta           | The maximum number of metadata key value pairs associated with a particular server.                                                    | 40     |
| maxTotalCores           | This limit is disabled, so no limits exist on the total number of cores.                                                               | -1     |
| maxTotalInstances       | The maximum number of cloud servers that can exist in your account at any one time.                                                    | 100    |
| maxTotalPrivateNetworks | The maximum number of isolated networks that you can create. Set to 0 when Cloud Networks is disabled, 10 when Cloud Networks enabled. | 10     |
| maxTotalRAMSize         | The maximum total amount of RAM (MB) of all cloud servers in your account at any one time.                                             | 131072 |

#### When a Cloud Server is deleted how is the data removed from the host server?

-   Cloud Servers use VHD storage. Once a server is
    deleted the VHD is deleted, similar to the way you would do a rm
    command in Linux. When that is done the VHD is completely removed
    thus allowing another one to be created.

------------------------------------------------------------------------

### API

#### Where are your APIs?

You can find the documentation for the API for Cloud Servers and our
other products on the [Rackspace Developer Docs](https://developer.rackspace.com/docs/).

Before you can start using our APIs, you will need your API Key. You can
obtain your API key by following the instructions in our article,
[Viewing and Regenerating Your API Key](/how-to/view-and-reset-your-api-key).
