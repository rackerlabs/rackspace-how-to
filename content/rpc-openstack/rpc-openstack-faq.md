---
permalink: rpc-openstack-faq/
audit_date:
title: Rackspace Private Cloud FAQ
type: article
created_date: '2014-09-09'
created_by: Karin Levenstein
last_modified_date: '2016-11-29'
last_modified_by: Cat Lookabaugh
product: Rackspace Private Cloud Powered by OpenStack
product_url: rpc-openstack
---

**Previous section**: [Getting Started with Rackspace Private Cloud - OpenStack ](/how-to/rpc-openstack)

Rackspace Private Cloud is powered by OpenStack and delivers the agility and
efficiency of a public cloud combined with the enhanced security, control and
performance of a dedicated environment.  It can be deployed in your data center
or ours, is managed by our OpenStack experts and backed by Fanatical Support&reg;.
Rackspace Private Cloud gives you all the power of the cloud without the pain of
running it, so you can focus on your core business.

Rackspace Private Cloud (RPC) consists of the Rackspace Private Cloud Software
powered by OpenStack, deployed in a Customer Data Center (CDC) or at RAX based
on our reference architecture and managed by a dedicated team of RPC OpenStack
experts.

---------

###General

#### How does Rackspace Private Cloud support Rackspace's position as the #1 managed cloud company?
Rackspace Private Cloud supports our position as the #1 managed cloud company
by offering customers managed private cloud solutions in their data center or
ours.  Our team of OpenStack engineers operate our customers' private clouds so
they can focus on their core business and applications.

#### What new enhancements were delivered with the latest release of Rackspace Private Cloud?

See [Rackspace Private Cloud Powered by OpenStack](https://support.rackspace.com/how-to//rpc-openstack/)
for the latest release notes.

#### What support services are available for Rackspace Private Cloud?

Rackspace offers the following support service, which we define as
**Core Support**. Our support engineers will proactively monitor and maintain
the health of your cloud providing installation, configuration, patching,
updating, troubleshooting and resizing services.

More information is available at the [Rackspace Private Cloud web page](http://www.rackspace.com/cloud/private/).

#### Does Rackspace offer any additional services for RPC customers?

Yes, Rackspace offers several additional services for RPC customers.  Customers
have the option to have a Dedicated OpenStack Engineer for their account,
DevOps automation services to help you unlock the full power of your cloud
through automation and professional services to help you get started with, and
optimize, your private cloud.

#### What are Rackspace Private Cloud's main differentiators?
<img src="{% asset_path rpc-openstack/rpc-openstack-faq/rpc-differentiators.png %}" width="700" alt="What differentiates Rackspace Private Cloud"  />

>**Stable & Scalable**

>We offer an industry leading 99.99% OpenStack API uptime guarantee, a reference
architecture that utilizes Linux containers to provide in-place upgrades and
independent scaling of each OpenStack service, and a cloud that is designed to
scale to hundreds of nodes.

>**Automation**

>RPC is deployed using Ansible software, supports OpenStack Orchestration
(Heat), can be combined with our DevOps Automation Service to help automate a
customer's process for deploying and scaling applications, and provides solution
templates that enable customers to deploy production-ready application stacks in
minutes.

>**Fanatical Support**

>Dedicated account manager, optional dedicated OpenStack Engineer service, 15
minute live response time guarantee to any emergency ticket with Core support
and 24x7x365 access to our team of OpenStack experts.

>**Deploy Anywhere**

>Deploy anywhere in the world.  You can host Rackspace private cloud in your
data center, in our data center, in a colocation facility or in multiple
locations.

>**Expertise**

>We manage one of the world's largest OpenStack powered clouds, are #1 in
all-time code contributions to the OpenStack project and offer an extensive
OpenStack training curriculum.

>**Hybrid**

>Add elasticity to your infrastructure with the capability to automatically add
and remove public cloud resources as needed to support your private cloud
workloads.

#### Where can I deploy Rackspace Private Cloud?

You can deploy a Rackspace Private Cloud in your own data center, in a Rackspace
data center, in a colocation facility or across multiple locations.

#### Is Rackspace Private Cloud updated with each new OpenStack version release (e.g. Juno, Kilo, etc)?

Yes, Rackspace updates and releases a major version of Rackspace Private Cloud
software following each OpenStack version release.  We first verify that the
new OpenStack version release meets our stability requirements before launching,
which typically takes about six weeks.  We also have minor releases throughout
the year to introduce new features, fix bugs and provide security patches.

#### Can I install Rackspace Private Cloud on virtual machines?

Rackspace strongly recommends that you install Rackspace Private Cloud on
physical hardware nodes running Ubuntu 12.04 or CentOS 6.3. Installation on
virtual platforms should only be performed for evaluation purposes.

#### What is the maximum number of nodes for Rackspace Private Cloud?

Rackspace Private Cloud is designed to scale to hundreds of nodes. The maximum
number depends on the specific application.

#### Does Rackspace Private Cloud come with any images?

Currently, Rackspace Private Cloud Software does not include any images. For
more information about downloading and creating images, refer to the
[OpenStack Virtual Machine Image Guide](http://docs.openstack.org/image-guide/content/).

#### Why does the node IP address need to have Internet access?

Rackspace Private Cloud Software downloads Ubuntu installation files as part of
the installation process to ensure that you have the most up-to-date operating
system that works with our software. If the node doesn't have internet access,
the installation process will fail. You may also experience issues if the node
is behind a firewall.

#### Is there a proof-of-concept offering to allow a customer to test Rackspace Private Cloud before they buy it?

Rackspace has dedicated environments that are accessible to customers for
proof-of-concept testing. Please contact the Rackspace Private Cloud sales team
at [rpcsales@rackspace.com](mailto:rpcsales@rackspace.com).

#### What devices are certified for Rackspace Private Cloud compute nodes?

All devices certified for Ubuntu Server 14.04 LTS are certified for Rackspace
Private Cloud. Refer to the
[Ubuntu Server certified hardware page](http://www.ubuntu.com/certification/server/)
for the full list.

#### Where can I get more technical information?

Get quick answers to common technical questions about Rackspace Private Cloud
in [the Rackspace Private Cloud v11 FAQ](https://developer.rackspace.com/docs/private-cloud/rpc/v11/rpc-faq-external/).

#### Where can I learn more?

More information about Rackspace Private Cloud is available on the Rackspace
Private Cloud web site at
[http://www.rackspace.com/cloud/private](http://www.rackspace.com/cloud/private).
You can also visit the Rackspace Private Cloud Forum at
[https://community.rackspace.com/products/f/45](https://community.rackspace.com/products/f/45).

#### How is Rackspace Monitoring billed?

Rackspace Monitoring bills you by how much you use. While other monitoring
services lock you into a month-long or even year-long contract, with Rackspace
Monitoring you are billed by the hourly usage based on how many checks were
running in that hour, and from how many monitoring zones were involved. Adjusting
your usage is quick and easy, and this flexibility can help reduce unnecessary
costs. Never again will you have to pay for more than you use.

---------

### Rackspace Private Cloud Solutions templates

#### What are RPC solution templates?
They are application-stack templates built by Rackspace experts that enable
customers to easily deploy a production-ready application stack on top of their
OpenStack cloud.  These templates are designed to be used with OpenStack
Orchestration (Heat).

#### Why should customers care about these templates?
Customers need to deploy applications on top of their cloud as quickly as
possible to start adding business value for their end users.  The challenge is
that deploying an application in the cloud can be difficult and time consuming.
It can take the average customer about two months to deploy an application, and
typically their deployment ends up being a "snowflake" which isn't automated and
is difficult to reproduce.  These production-ready templates enable customers to
deploy popular open-source applications on top of their private cloud in a
matter of minutes.  They save customers a significant amount of time and help
them quickly start adding business value.

#### What makes these solution templates production-ready?
The templates are built and tested by Rackspace's OpenStack experts.  They are
built using industry standards and best practices and they include software
plug-ins for enhanced functionality, network isolation and firewalls for robust
security, are designed for high availability (e.g. database failure, redundant
caching) and are optimized via extensive performance testing.

#### What solution templates are available from RPC?
We currently offer eight solution templates: Magento, Drupal, Galera, MongoDB,
ELK stack, Hortonworks HDP, Gerrit, and Gitlab CE.

#### How much do the solution templates cost?
The RPC solution templates are available for free.

#### Are the solution templates supported by RPC?
The solution templates are not supported by RPC.

#### Where are the solutions templates located?
The general public can download our solution templates at the following GitHub
site: [http://rcbops.github.io/templates/](http://rcbops.github.io/templates/).
As part of our v10 release, Rackspace Private Cloud customers can now discover
and deploy RPC solution templates using the RPC "Solutions" tab in the Horizon
dashboard.

#### Does Rackspace plan to offer additional templates in the future?
Yes, Rackspace plans to continue adding new solution templates to the RPC
"Solutions" tab.

---------

### Next section
[Spheres of Support](/how-to/rackspace-private-cloud-spheres-of-support)
