---
permalink: managing-rackconnect-v20-network-policies/
audit_date:
title: Managing RackConnect v2.0 network policies
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: RackConnect
product_url: rackconnect
---

**Previous section:** [Access the RackConnect v2.0 Management Interface](/how-to/access-the-rackconnect-management-interface)

**Applies to:** RackConnect v2.0

One of the main benefits of RackConnect is that you do not have to set
software firewall rules (iptables or Windows Firewall) on individual
cloud servers. Instead, you can modify network connectivity between all
servers (cloud and dedicated) and the Internet by adding *network
policies*.

Network policies are configurable under each individual Cloud account in
the RackConnect Management Interface (available in the [MyRackspace
portal](https://my.rackspace.com/)), and you can add them to control access
between cloud servers, a dedicated environment, and the Internet.

### Access scenarios

A network policy defines the access that you want to apply in one of
the following RackConnect traffic (access) scenarios:

-   Cloud Servers to Dedicated: Updates connected network device access lists
-   Cloud Servers to Internet: Updates connected network device access lists
-   Cloud Servers to Cloud Servers: Updates inbound software firewalls on cloud servers
-   Dedicated to Cloud Servers: Updates inbound software firewalls on cloud servers
-   Internet to Cloud Servers: Updates edge network device access lists and inbound software firewalls on cloud servers

**Note:** Software firewalls are configured to allow unrestricted
outbound access from your cloud servers.

Network policies provide you the ability to match based on certain
criteria (such as hosts, networks, cloud server names, and cloud server
IDs) and can limit access to specific protocols (such as TCP, UDP, and
ICMP) and ports or port ranges (port ranges limited to 100 ports).

### Manage network policies

To manage your network policies, you select the Cloud account to
customize in the RackConnect Management Interface. On the **Network
Policies** tab, follow the instructions to add and remove policies.

When you define a network policy, you enter a policy name, select an
access scenario, and enter a source
type, a destination type, and a destination protocol with a destination
port or port range (as shown in the following screenshot). These fields
are context sensitive, based on the access scenario that you choose.

-   Selecting **All** refers to all hosts within a network or account.

-   Selecting **Server Name Match** performs a match of your
    entered text. It is not case sensitive and you do not need to enter
    any wildcards. For example, **Web** matches a cloud server named
    WEB001 and one named Mywebserver.

-   Selecting **Server ID Match** performs an exact match of the server
    ID from the Cloud Servers API. When you begin typing the server
    name, a list appears from which you can select the server, and the
    server ID is populated for you.

-   Selecting **Network** enables you to define a network and subnet
    that includes all IP addresses within the subnet. Enter it in the
    format xxx.xxx.xxx.xxx/xx using CIDR notation. For example,
    172.16.1.0/24 enters the entire 172.16.1.0 class C network, which
    corresponds to 172.16.1.0 with a subnet mask of 255.255.255.0.

-   Selecting **Host** enables you to enter the IP address of the host
    to define.

    <img src="{% asset_path rackconnect/managing-rackconnect-v20-network-policies/SampleNP.png %}" width="447" height="365" />

**Important:** Destination port range entries are limited to 100 ports,
and they have valid integer values between 0 and 65535 with a range of
the form xxxxxx-xxxxxx.

Any time you change a network policy, the automation status indicators
show you when the policy is being deployed (or removed) and when the
changes are complete. You can also track details of the status on the
**Tasks** tab. You must refresh the page in the MyRackspace
portal to view the updated status indicators, which can have the following meanings:

-   Green = Deployed
-   Blue = Deploying
-   Red = Failed
-   Yellow = Removing

In the following image, the indicators are all green, which means that
the network policies were successfully deployed.

<img src="{% asset_path rackconnect/managing-rackconnect-v20-network-policies/Status.Indicator.png %}" width="700" />

**Tip:** From the **Network Policies** tab, you can also apply a network
policy *template*. Network policy templates provide a quick way to get
started using RackConnect. Review the description of each template for
details about the type of access that it will grant in your environment.

### Frequently asked questions

#### I've written my own software firewall rules. What will happen to them?

All software firewall rules should be managed by using network policies.
RackConnect automation rebuilds the entire firewall ruleset when it
updates a system. As a result, any custom software firewall rules not
created by network policies are overwritten.

This behavior can be changed on Linux cloud servers to allow custom iptables rules ([within certain
limitations](/how-to/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers)). However, because of the technical limitations in Windows Firewall, all firewall rules on Windows cloud servers must be managed through network policies only.

#### Why am I limited to port ranges of 100 or fewer ports?

Because of a technical limitation in Windows Firewall that prevents
port-range rules from being executed in the correct order, a separate
firewall rule must be created for every port in the range. For network
policies such as Cloud Server Name-Match rules, which allow multiple
source systems, the number of rules created on each destination server
can be as large as the number of ports allowed *multiplied* by the
number of systems allowed. To prevent Windows servers from
becoming so overloaded with firewall rules that they become
unresponsive, we limit network policies to port ranges of 100 or fewer
ports.

#### How should I set up network policies for use with Cloud Monitoring?

By default, the Cloud Monitoring systems have access to your RackConnect
cloud servers. You should not need to create any custom network policies
to allow the Cloud Monitoring systems to connect.

If you have any questions, reach out to us. Our contact information is
available on the [Contact Us](/how-to/support) page.

### Next step

[Accessing RackConnect cloud servers](/how-to/accessing-rackconnect-cloud-servers)
