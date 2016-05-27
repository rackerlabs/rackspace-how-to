---
permalink: rackconnect-key-terms/
audit_date:
title: RackConnect key terms
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: RackConnect
product_url: rackconnect
---

**Previous section:** [Features introduced in RackConnect
v2.0](/how-to/features-introduced-in-rackconnect-v20)

**Applies to**: RackConnect v3.0 and RackConnect v2.0

This article defines many of the *key terms* that you will encounter
with RackConnect. A label next to each term designates whether the term
applies to RackConnect v2.0, RackConnect v3.0, or both.

#### Access lists (v2.0 and v3.0)

Used on network devices to control what network traffic is allowed
between network segments. Access lists are also called ACLs.

#### Automation features (v2.0)

Features that control which actions the RackConnect automation systems
do and do not perform in your environment. In certain cases, the
settings might differ between your cloud account and your individual
cloud servers. The cloud account settings are used for all new servers
that you build in the future, while the existing cloud server settings
are used if you perform a rebuild or make other changes to your cloud
server. The following figure shows an example of an automation features
configuration:

<img src="{% asset_path rackconnect/rackconnect-key-terms/Automation.Features.png %}" width="257" height="84" />

**Note:** Currently you cannot adjust automation features settings; they
are displayed for informational purposes only. If you need to modify
these settings, contact your support team.

#### Cloud networks (v2.0 and v3.0)

Isolated networks that you can create and attach to your cloud servers,
as network interfaces, that allow traffic only between cloud servers
that are part of the same isolated network. In essence, they are secure
networks whose traffic is restricted to only the cloud servers that you
allow. In the case of RackConnect v3.0, they are also used to
communicate with your dedicated networks.

#### Connected network device role (v2.0 and v3.0)

The dedicated network device that provides a physical connection and
path to the cloud side of your RackConnect environment. This device can
be a firewall or a load balancer. RackConnect gateway IP addresses live
on this device. Additionally, a single network device can function in
both the edge and connected network device roles.

#### Edge network device role (v2.0 and v3.0)

The outermost dedicated network device in your RackConnect
configuration&mdash;the device that connects directly to the Internet. This device is typically a firewall, but it can also be a load balancer in certain deployment scenarios. Additionally, a single network device can function in both the edge and connected network device roles.

#### Network policies (v2.0)

Policies that define the network access this is allowed in the following RackConnect traffic scenarios:

-   Traffic from cloud servers to dedicated servers
-   Traffic from cloud servers to the Internet
-   Traffic from cloud servers to cloud servers (for example, traffic
    between a web tier and an application tier, both hosted on
    cloud servers)
-   Traffic from dedicated servers to cloud servers
-   Traffic from the Internet to cloud servers

Network policies provide you with the ability to match network traffic
based on certain criteria&mdash;hosts, networks, and cloud server name
matches&mdash;to limit access to only allowed protocols and ports (or port ranges).

#### Network policy templates (v2.0)

Templates that provide an easy way of getting started with RackConnect network policies. The templates enable you to select from some of the most common RackConnect network policy options. For example, the Basic Access Configuration template, if applied, allows you to have unrestricted network access between your dedicated and cloud servers.

#### PublicNet (v2.0 and v3.0)

A network that can be added to your cloud servers, as a network
interface, to allow traffic directly with the public Internet. If
enabled, it is very important to secure this network because it is vulnerable to attacks from the Internet.

#### QoS (v3.0)

Quality of service. Used to limit the amount of bandwidth allowed
between your cloud and dedicated networks via RackConnect.

#### RackConnect configuration (v2.0 and v3.0)

A single deployment of a RackConnect solution. A configuration is composed of dedicated network devices that function in
the RackConnect edge and connected network device roles, along with the
stored settings needed to make these devices function with RackConnect.
You can have multiple RackConnect configurations. A configuration is
normally associated with one or more cloud accounts.

#### ServiceNet (v2.0 and v3.0)

A shared network within each region that can be added to your cloud
servers, as a network interface. It is normally used to allow cloud
servers to take advantage of other Public Cloud products, such as Cloud
Files, to communicate between your cloud servers in a given region, or
in the case of RackConnect v2.0, to communicate with your dedicated
network. If enabled, it is very important to secure this network because other Rackspace Public Cloud customers are also on this network.

If you have any questions, reach out to us. Our contact
information is available on the [Contact Us](/how-to/support) page.

### Next step

[RackConnect v2.0 requirements](/how-to/rackconnect-v20-requirements)
