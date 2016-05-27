---
permalink: enable-internet-access-on-cloud-servers-using-snat-on-a-vyatta-network-appliance/
audit_date:
title: Enable Internet Access on Cloud Servers Using SNAT on a Vyatta Network Appliance
type: article
created_date: '2013-01-08'
created_by: Sameer Satyam
last_modified_date: '2015-09-29'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

Using a Vyatta Appliance you can allow servers on your Private
(isolated) Cloud Network to access software updates and patches. This
article explains how to configure a Source Network Address Translation
(NAT) rule on the Vyatta Appliance that enables Cloud Servers that
initially do not have internet access (no Public interface) to stay
updated with the latest updates and patches.

### Use Case: Allow Outbound Traffic for Servers on a Private Cloud Network

Administrators may choose to completely isolate some of their servers
(for example database servers) from the internet for security reasons.
Rackspace allows you to provision servers that are only on a Private
(isolated) network (no Public interface). These servers will not have
access to the Internet and cannot be reached from outside. However, this
also prevents them from accessing critical patches and updates.

The following illustration shows a simple web application deployment
consisting of a standard three-tier model including Web, Application and
Database servers.

Using the Vyatta Appliance these servers can be kept up-to-date with the
latest software and patches. This is done by configuring a default
gateway on the servers that points to the Vyatta appliance and
configuring a NAT Outbound (Source) rule on the Vyatta Appliance, which
translates the IP address of the each server to the IP address on the
public interface of the Vyatta appliance. This is also known as a Source
NAT.

For a comprehensive guide to configuring NAT on the Vyatta appliance,
click [here](https://54712289bdd910def82d-5cc7866f7aae0a382278b5bce7412a4a.ssl.cf1.rackcdn.com/Vyatta-NAT_6.5R1_v01.pdf).

<img src="{% asset_path cloud-networks/enable-internet-access-on-cloud-servers-using-snat-on-a-vyatta-network-appliance/FirewallFrontendingWebApp.png %}" width="563" height="283" />

### Configure an Outbound NAT Rule

The examples in this section contain two IP addresses that represent
private and public interfaces as follows:

-   192.x.x.x, private (isolated) interface IP address of the server

-   X.X.X.X, public interface IP address of the Vyatta Appliance

To configure the Source NAT rule, log on to the Vyatta Appliance and use
the Vyatta command-line interface. The examples below show the commands
you use to complete this configuration.

1.  Log onto the Vyatta Appliance using ssh:

        ssh vyatta@X.X.X.X

    Where X.X.X.X is the IP address of the Vyatta. You'll see a Welcome
    to Vyatta message and a prompt to enter your Vyatta password.

    Once you're logged onto the appliance, you can enter a ? or press
    the Tab key for help.

2.  Enter configuration mode:

        vyatta@vyatta: configure
        [edit]
        vyatta@vyatta#

    The \# symbol indicates you're in configuration mode.

3.  Configure the Source NAT rule 10:

        vyatta@vyatta# edit nat source rule 10
        [edit nat source rule 10]
        vyatta@vyatta#

    The rule number is arbitrary. As a best practice, leave room between
    rule numbers so that you can add new rules at a later time
    if necessary. NAT rules are executed sequentially, starting with the
    lowest number first.

4.  Apply this rule to packets coming from any host on network
    192.x.x.0/24, the CIDR of the Isolated network, and going through
    interface eth0, the Public interface of Vyatta Appliance:

        vyatta@vyatta# set source address 192.x.x.x/24

        vyatta@vyatta# set outbound-interface eth0

5.  Specify the translation address. Here we use 'masquerade' keyword.
    This instructs the system to use the IP address currently assigned
    to the outbound-interface as the translation address. You can also
    specify the IP address explicitly instead of using 'masquerade'.

        vyatta@vyatta# set translation address masquerade

    This enables the Vyatta Appliance to use the IP address of  eth0 as
    the source IP address.

6.  Commit the change allowing it to take effect:

        vyatta@vyatta# commit

7.  Save the configuration to memory:

        vyatta@vyatta# save

    Any requests from the server on 192.x.x.x/24 are now translated to
    the public interface IP address of the Vyatta appliance.

### View the Configuration

While logged onto the Vyatta Appliance, view the configuration of the
Outbound Source rule.

In configuration mode, use the following the command:

    vyatta@vyatta# show nat source rule 10
     outbound-interface eth0
     source {
    address 192.x.x.0/24
     }
     translation {
     address masquerade
    }

In operational mode, use the following command:

    vyatta@vyatta-ord-6:~$ show nat source rules
     Disabled rules are not shown
    Codes: X - exclude rule, M - masquerade rule
    rule    intf              translation
    M10     eth0             saddr 192.168.2.128/25 to X.X.X.X
            proto-all         sport ANY

### Adding a Static Route on the Sever

You'll need to configure a default gateway on the server. The gateway
address should be the interface of the Vyatta Appliance that is on the
same isolated network that the server belongs to. An example of a static
route configured on an Ubuntu server is shown below. 192.x.x.129 is the
IP address of the interface on the Vyatta appliance that is being used
as the gateway.

    root@ubun-2:~# route add -net 0.0.0.0/0 gw 192.x.x.129

On the server, ping an external address to test the configuration:

    root@ubuntuweb# ping www.rackspace.com
    ping www.wip.rackspace.com (207.97.209.147) 56(84) bytes of data.

    64 bytes from www.rackspace.com (207.97.209.147): icmp_req=1 ttl=242 time=28.2 ms

This completes the configuration of the Outbound NAT (Source) rule.
