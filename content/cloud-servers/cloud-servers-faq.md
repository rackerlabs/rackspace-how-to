---
permalink: cloud-servers-faq/
audit_date:
title: Cloud Servers FAQ
type: article
created_date: '2015-12-01'
created_by: Rackspace Support
last_modified_date: '2017-10-09'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Getting started

#### I want to install version x.y of software in Linux, but your system doesn't allow me to? How do I install it?

The repository for your operating system's package manager probably has an
older approved version. If so, you must remove that installation and then
compile the newer version yourself. Refer to the software vendor for instructions.

#### Will you help me install my software package?

It depends on your service level. For Managed Infrastructure Cloud
accounts, you are responsible for installing and maintaining all
software on your server. If your account has a Managed Operations service
level, Rackspace provides support for specific software and server configurations
on cloud servers. For more information about supported systems and third party
packages, see [Linux Spheres of Support for Dedicated and Managed Operations](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops).

#### What programming languages or applications are supported?

All of our cloud servers can be configured as development stacks,
database servers, and web servers. Apache, Lighttpd, Mongrel, and Visual
Studio are all options.

You can use the programming language of your choice to interact with
cloud servers. For help getting started, use any of the
Software Development Kits (SDKs) documented at
<https://developer.rackspace.com/docs/>.

#### Do you host DNS?

Yes. The Cloud Control Panel has a DNS menu for maintaining domain records for
your cloud servers. For more information, see [Create DNS records for Cloud Servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).

#### What are the DNS servers for my cloud server?

**ns.rackspace.com** and **ns2.rackspace.com**

#### How many domains can I host?

Because you are in control of everything on your server, there is no limit.

#### I'm kind of new to this. Will it be difficult?

The answer depends largely on your experience as a Systems Administrator
for Linux or Windows Server. Our Linux servers are full Linux
distributions with root-level access. Our Windows servers give you
Administrator access, and are built with nothing but the default
applications on installation. Cloud servers are designed for customers who
want to start from scratch and tune a system for their own purposes.

If you are uncomfortable in the System Administrator role, we also offer a
[Managed Operations service level](http://www.rackspace.com/cloud/managed_cloud/).

#### What level of support comes with Cloud Servers?

We have two service levels: **Managed Infrastructure** and **Managed
Operations**.

At the Managed Infrastructure level, we support the
server hardware, datacenter environment, and Internet connectivity, but
we do not support the software installed on your server, including the
operating system and its configuration. When you provision a cloud
server, you are given a server with unrestricted access. The Managed
Infrastructure support team does not assist in the installation of
software or troubleshooting any kind of issue related to the software
installed. We have some articles in the Rackspace How-To covering basic
installation of common applications. We also have community forums where
you can share tips and tricks with other customers.

The [Managed Operations service](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops)
level provides additional support on cloud servers, which includes monitoring,
operating system and application infrastructure layer support, and
technical guidance.

#### What can I do with a cloud server?

The Rackspace Cloud Servers soution is a fully unrestricted,
root/Administrator level access, Linux or Windows environment. Any
application or service that you can run from a traditional, physical,
dedicated-unmanaged operations server can be run from your cloud server.

#### Can I reinstall a different distribution or start over?

Yes! Select the **Rebuild** option in the Cloud Control Panel to select
a new distribution. However, be sure to backup of your data first because this
process destroys any data that is on the server. The rebuild process does allow
you to save your IP address.

#### What if I mess up my cloud server?

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
deleted when you delete a server. After it is deleted, data cannot be
retrieved and customers do not have logical or direct access to the
physical drive.

#### Can I read your SLA?

Yes. Go to [https://www.rackspace.com/information/legal/cloud/sla](https://www.rackspace.com/information/legal/cloud/sla).

#### How do I contact Support?

At Rackspace, our goal is to make the cloud easy for you to use. To meet
that goal, we have created many different ways for you to get the
support that you need to get the most out of the cloud.

-   Your first stop should be [Rackspace How-To](/how-to/), which is the best
    source for articles and tutorials to help you get the precise
    answers that you need.
-   Our [Open Cloud Forum](https://community.rackspace.com/products/f/25) in the
    Rackspace Community is always open. Use the forum to get your
    questions answered by a Racker.
-   Do you have a quick question that you can't find an answer for in the
    Rackspace How-To? Open Chat and talk with our **Fanatical Support&reg;**
    staff anytime, 24x7x365.
-   Do you have a specialized Service Request or are you experiencing a
    problem with our service? Open a ticket. In the Rackspace [Cloud Control Panel](http://mycloud.rackspace.com/),
    select **Support Tickets** from the **Support** menu. Click **Create Ticket** to open a
    ticket directly with our support teams to report a problem or make a
    service request.
-   Call us 24x7x365 at 800 961 4454 (toll-free) or +1 210 312 4000 (international).

------------------------------------------------------------------------

### Server management

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

For example, if you name your server **MyWebServer1.MyExampleDomain.com**,
you must add an A record for **MyWebServer1.MyExampleDomain.com**
to your DNS zone ([MyExampleDomain.com](http://myexampledomain.com/))
that points to the public IP address of the server. The information that
you enter in the **Server Name** field helps you identify this server in
the API and [Cloud Control Panel](https://mycloud.rackspace.com/).

#### How do I set up reverse DNS setup for my server?

You can set up reverse DNS from the control panel. For instructions,
see [Create a reverse DNS record.](/how-to/create-a-reverse-dns-record)

#### What are PVHVM images?

PVHVM refers to the virtualization mode used by the hypervisor to run
the virtual machine (VM). PVHVM images are VM images that use
the PVHVM virtualization mode. In general, PVHVM offers better
performance than PV, especially for disk and network I/O, but it is not well
supported in Linux operating systems with a kernel version earlier than
2.6.36. The availability of PV and PVHVM images in the Rackspace Cloud
is determined by the effectiveness of each virtualization mode for that
particular operating system.

**Note**: Work-optimized servers (Compute, I/O, and Memory) require
PVHVM images. If you try to create a work-optimized server by using a
non-PVHVM image, the following error message is displayed:
`Image cannot be built with provided flavor`.

For more information about PVHVM, see [Choosing a virtualization mode (PV versus PVHVM)](/how-to/choosing-a-virtualization-mode-pv-versus-pvhvm).

#### Is there a throughput limit on my server's network interface card?

The amount of network throughput varies based on the flavor of the server.
For more information, see [the Pricing page in the main Rackspace website](http://www.rackspace.com/cloud/public-pricing/#cloud-servers).

#### Do you offer internal IP addresses?

Yes. Each server comes with an internal IP address that is used to
communicate between servers. The traffic that flows over this interface
(eth1) on your server is unmetered and is not billed. This network is
referred to as ServiceNet. ServiceNet is an internal-only,
multitenant network connection within each Rackspace data center.
ServiceNet IP addresses are not accessible from the public Internet and are local
per data center. You can also deploy with Cloud Networks, which are single-tenant.

#### Can I buy extra public IP addresses?

Yes. For more information, see [Requesting Additional IPv4 Addresses for Cloud Servers](/how-to/requesting-additional-ipv4-addresses-for-cloud-servers).

#### I want to set up multiple servers from the same image. Can I do this?

As a Cloud Servers customer, you can create both on-demand
images and scheduled images of your cloud server. All server
images are stored in your Cloud Files account, which enables you to
keep these images even after the server they were created on is
deleted. It also gives you the flexibility to create an unlimited number of
on-demand images of your server. All cloud server images can be used to create
new cloud servers or to resore an existing cloud server.
For details, see [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image).

#### Do you offer on-demand images (snapshots) and scheduled images and what are the prices?

You can create an image of any General Purpose cloud server, and you can
use this image to restore a server or clone a new one. You can create an
unlimited number of images on-demand, or you can schedule an automatic
daily or weekly image.

Images are compressed and stored on Rackspace Cloud Files at the
[current storage rates](http://www.rackspace.com/cloud/cloud_hosting_products/files/pricing/).
Please also read this list of [snapshot limitations](/how-to/rackspace-cloud-essentials-cloud-server-image-limitations).

If you are using a virtual cloud server, see [Create an image of a server and restore a server from a saved image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
for more information about the image options associated with virtual cloud
servers.

#### Can I use the GUI interface for my Linux cloud server?

Yes. For instructions on how to install VNC and X-Windows, see
[Install VNC on a Cloud Server](/how-to/vnc-install "VNC Install").
Note that using a GUI requires a large amount of bandwidth on your server.

#### Do you have a control panel?

Yes, the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com/)
is a web-based management interface for restarting your cloud server,
starting support discussions, viewing stats, and scheduling snapshots.
However, we do not offer a control panel like Plesk or cPanel. You're free to
install such packages for your own cloud server. If you are installing cPanel, be
sure to install on a clean (empty) server. For more information,
see [CentOS/RHEL - Installing cPanel & WHM 11.24](https://community.rackspace.com/products/f/25/t/6798).
The use of Plesk or cPanel is not supported and strongly discouraged for customers under
the Managed Operations SLA because it interferes with our server administration. For more information, see
[Using Plesk or cPanel with the Managed Operations Service Level Agreement](https://community.rackspace.com/products/f/25/t/4888).

Also, consider installing the free monitoring agent on your
server and using the [Rackspace Intelligence dashboard](https://intelligence.rackspace.com/),
which offers many of the same functions as a control panel.

#### Do you provide Console access?

Yes, via an HTML5 web terminal that you can access through the Cloud Control Panel. On the
details section for your server, click **Actions > Emergency Console**.

**Note**: Console access is via a secure HTTP connection, which is
a different connection from the traditional way to connect via SSH for
Linux or RDP for Windows. Console can be a useful troubleshooting tool
if your server is unresponsive or you have locked yourself out.

#### Can I reboot my server?

Yes. On the details page for the server in the cloud control panel, select **Actions > Reboot**.
This method is useful if the server is unresponsive.

#### Am I billed if my server is powered off?

Yes. You are billed for the resources that are used on the host
while your server is in the **Active** status. When your server is
created, you are given a dedicated amount of RAM and hard drive space.
As long as your server exists, no one else can use those
resources that have been allocated to you, which is why you are billed
per hour even while powered off. If you want to stop incurring
charges for a given server, you must delete that server in the control
panel.

If you want to stop paying for a server but still need to retain the
configurations from it, your best option is to
[create an image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image)
of the server. The system configurations on your system disk are
preserved in the image. The image is saved in Cloud Files and
accessible on the Saved Images tab in the control panel. There is a
fee associated with Cloud Files storage but it is much less than the
cost of an active server. You must also save the data from your
data disk to Cloud Block Storage or Rackspace Cloud Backup to have
available on your next server. Then you are free to delete the
original server, knowing that you can provision a new server
by using the saved image of the old server and your saved data.

After you restore your server from the saved image, the primary difference
will be that your new server has a different IP address from the old
one. Putting the new server into production might require you to update
any associated DNS records to reflect the new IP address.

#### How do I power on my server after shutting it down?

Intructions are located in [Reboot your server](/how-to/reboot-your-server)

#### Which distributions do you offer?

To see the Linux distributions and Windows operating systems that we have
available, go to the Cloud Control Panel, **Servers > CloudServers**, and
then click **Create Server**.

#### Can I upgrade my server later?

If you have a General Purpose server, you can change the size of your
data storage space in one of the following ways:

-   Increase available storage with Cloud Block Storage. For more
    information on Cloud Block Storage, see [Create and Attach a Cloud
    Block Storage
    Volume](/how-to/create-and-attach-a-cloud-block-storage-volume).
-   Migrate to a larger size server with more RAM, disk space,
    and vCPUs. For more information about resizing, see
    [Upgrade resources for General Purpose or I/O optimized Cloud Servers](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

#### How many users go onto each host machine?

The number of customers on a Cloud Server host machine depends on the
size of the customers' servers and the type of operating system.

#### Can I buy extra storage?

The native storage allocation for a cloud server is based on the
Cloud Server flavor that you select, but you can add extra storage at
any time with our [Cloud Block Storage](http://www.rackspace.com/cloud/blockstorage/) service.

#### Can I install the Rackspace Private Cloud on virtual machines?

Rackspace strongly recommends that you install Rackspace Private Cloud
on physical hardware nodes. Installation on virtual platforms should only be performed for
evaluation purposes.

------------------------------------------------------------------------

### Performance

#### What is the difference between Standard, General Purpose, and work-optimized servers?

There are several noteworthy differences between Standard, General Purpose, and work-optimized cloud servers:

-   General Purpose servers use faster solid state drives (SSD)
    compared to the standard spinning disk allocation for Standard servers.
-   Only work-optimized servers (I/O, Compute, or Memory flavors) can boot from Cloud Block Storage.
-   For both General Purpose and Standard servers, you can choose the size of your system disk (50 GB-1 TB),
    but the system disk is fixed for work-optimized servers.
-   Up to 240 GB of RAM is available on work-optimized servers (Memory flavor), whereas
    Standard servers provide up to 30 GB of RAM.
-   You can have up to 32 vCPUs running on work-optimized servers, compared to the
    maximum of 8 on the Standard Cloud Servers.
-   Maximum network throughput on Standard servers is 600 Mbps public and 1200 Mbps private network.
    Maximum network bandwidth on work-optimized servers is 5Gbps public and 10Gbps private network.

For more information about General Purpose servers, see [New features in General Purpose and work-optimized Cloud Servers](/how-to/new-features-in-general-purpose-and-work-optimized-cloud-servers).

------------------------------------------------------------------------

### Billing and account

#### Do you offer discounts for cloud servers?

Yes. We offer different types of discounts based on usage. For details, see
the [Cloud Servers discounts page](http://www.rackspace.com/cloud/servers/discounts/) for details.

------------------------------------------------------------------------

### Security

#### Are cloud servers PCI-DSS compliant?

For information about PCI-DSS, see [Cloud Security Solutions](/how-to/are-cloud-servers-pci-dss-compliant).
For information about PCI-DSS for Rackspace Dedicated Hosting
services, see [PCI-Compliant Hosting for E-commerce Websites](http://www.rackspace.com/ecommerce-hosting/pci/).

#### Can I run a firewall on my server?

Yes, and we encourage it! Each Linux server is capable of running
the Linux-standard firewall called iptables; some even have it
pre-configured. Other firewall systems have been tested on cloud servers
as well.

#### What are security groups?

Security groups are a named collection of network access rules
that enable Rackspace Public Cloud users the ability to specify the
types of traffic that are allowed to pass through, to, and from ports
(PublicNet and ServiceNet) on a cloud server instance. A security group is a
container for security group rules. After you launch an instance, you
can assign one or more security groups to ports on that instance.
Security groups act as a stateful firewall for your cloud server
instances.

#### What happens when a security group rule is added to a security group?

Traffic matching the security group rule is allowed to go through.

#### Can I apply security groups to ports on an instance at boot time?

No. Security groups can only be applied only after the instance is active.

#### Is there a default security group that gets applied to my instances?

No default security group is applied. You just create a Security Group and
apply it to the ports on an instance.

#### Are security groups supported for OnMetal users?

No. Security Groups are currently supported only for virtual cloud
servers.

#### Will the security group feature be integrated and available to use via the Cloud Control Panel?

NO. Customers can use either the neutron client or the API to manage security groups.

#### Are security groups supported via the neutron client?

Yes. Users can provision security groups by using the neutron client.

#### Are security groups on Cloud Networks supported?

Yes. For additional information see [Cloud Networks API Getting Started](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/concepts/#security-groups-and-rules-concepts).

#### Are Outbound Security Groups supported?

Yes. For additional information see [Cloud Networks API Getting Started](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/concepts/#security-groups-and-rules-concepts).

#### Is the security group feature supported for all Cloud customers?

Security groups are supported only for Managed Infrastructure,
non-RackConnect customers.

#### Is the security group feature available to all Cloud users?

Security groups is in Limited Availability in all data centers. Contact
Rackspace support to enable this feature.

#### What are the benefits of using security groups?

Prior to this feature being available, customers had to manage traffic
to and from their instances individually via, for example, iptables rules on
every instance (or perhaps use third-party tools), incurring signifcant management
overhead. Security groups make it possible to use a self-service API to define a
common set of rules and apply them to the neutron ports (Public/ServiceNet) on cloud
servers without needing to configure iptables rules on each server, thereby simplifying
administration of security policies.

#### Is there a limit to the number of security group rules per user?

During Limited Availability, there is an aggregate limit of 100 security group rules per user.
Contact Rackspace Support if you need this limit raised.

#### Is there a limit to the number of rules per security group?

There is a limit of 20 security group rules per security group.
Contact Rackspace Support if you need this limit raised.

#### How many security groups can I apply per port?

Up to 5 security groups are allowed per port. Contact Rackspace
Support if you need this limit raised.

#### Are security groups applied to instances?

Security groups are applied to neutron ports (PublicNet and ServiceNet)
on cloud server instances.

#### Can I have a security group with no rules?

Yes. Such a security group denies or blocks all traffic.

#### What kinds of traffic can be matched by the security group rules?

TCP, UDP, and ICMP traffic can be matched in addition to traffic from a
source IP address or CIDR. Both IPv4 and IPv6 traffic can be matched.

#### Is there any traffic that is permitted or allowed by default by security groups?

DNS responses from Rackspace Provider DNS servers (UDP source port 53 )
are allowed by default even if they are not explicitly allowed by a
security group.

TCP flags ACK and RST are also permitted by default.

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

#### When a cloud server is deleted how is the data removed from the host server?

Cloud servers use VHD storage. When a server is deleted, the VHD file is securely and immediately
deleted. It is not possible to recover a server that has been deleted.

------------------------------------------------------------------------

### API

#### Where are your APIs?

The documentation for the API for Cloud Servers and our other products is
loacated on the [Rackspace Developer Docs site](https://developer.rackspace.com/docs/).

Before you can start using our APIs, you will need your API Key. You can
obtain your API key by following the instructions in
[View and reset your API key](/how-to/view-and-reset-your-api-key).
