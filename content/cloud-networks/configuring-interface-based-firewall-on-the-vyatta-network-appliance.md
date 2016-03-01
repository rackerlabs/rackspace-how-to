---
node_id: 3370
title: Configuring Interface Based Firewall on the Vyatta Network Appliance
type: article
created_date: '2013-03-26'
created_by: Sameer Satyam
last_modified_date: '2015-09-29'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

### Introduction

The Vyatta network appliance can be used as a firewall to protect
Rackspace Cloud Server instances.

In this article you will see how interface-based firewalls can be
configured on the Vyatta and applied on the Public interface for local
traffic (terminating on the Vyatta) as well as for ingress traffic
(traversing the appliance and destined to Cloud Servers).

Click the link for a comprehensive guide to [configuring the Vyatta appliance as a firewall](https://54712289bdd910def82d-5cc7866f7aae0a382278b5bce7412a4a.ssl.cf1.rackcdn.com/Vyatta-Firewall_6.5R1_v01.pdf).

The Vyatta firewall features both IPv4 and IPv6 stateful packet
inspection to intercept and inspect network activity and allow or deny
the attempt. Vyatta's firewall functionality analyzes and filters IP
packets between network interfaces. It allows you to filter packets
based on their characteristics and perform actions on packets that match
the rule. Vyatta system firewall functionality provides the following:

-   Packet filtering for traffic traversing the appliance and for
    traffic destined for the appliance itself
-   Definable criteria for packet-matching rules, including source IP
    address, destination IP address, source port, destination port, IP
    protocol, and ICMP type
-   General detection on IP options such as source routing and broadcast
    packets
-   Ability to set the firewall globally for stateful or stateless
    operation

Vyatta's advanced firewall capabilities include stateful failover,
zone-based firewalling and time-based firewalling.

### Firewall definition

Firewalls filter packets on interfaces. There are two steps for using
the firewall feature:

-   You define a firewall instance and save it under a name. A firewall
    instance is also called a firewall rule set, where a rule set is
    just a series of firewall rules. You define the firewall instance
    and configure the rules in its rule set in the
    firewall configuration node.
-   After defining the instance and specifying the rules in the rule
    set, you apply the instance to an interface or a zone. You do this
    by configuring the interface configuration node for the interface
    or zone.

Once the instance is applied to the interface or zone, the rules in the
instance begin filtering packets on that location.

### Types of firewall

There are two types of firewall, Interface-based firewall and zone-based
firewall. If only one interface is being protected then interface-based
firewall can serve your purpose. However, if more than one interface is
being protected, then zone-based firewalls are recommended.

### Firewall rules

Rules are executed in sequence according to the rule number. If the
traffic matches the characteristics specified by the rule, the rule's
action is executed; if not, the system "falls through" to the next rule.

The action can be one of the following:

-   Accept. Traffic is allowed and forwarded.
-   Drop. Traffic is silently discarded.
-   Reject. Traffic is discarded with an ICMP "Port
    Unreachable" message.

### Applying firewall rules to interfaces (interface-based firewall)

Once a firewall instance is defined it can be applied to an interface,
where the instance acts as a packet filter. The firewall instance
filters packets in one of the following ways, depending on what you
specify when you apply the firewall instance:

-   in. If you apply the instance as in, the firewall will filter
    packets entering the interface and traversing the Vyatta system. You
    can apply one in packet filter.
-   out. If you apply the instance as out, the firewall will filter
    packets leaving the interface. These can be packets traversing the
    Vyatta system or packets originated on the system. You can apply one
    out packet filter.
-   local. If you apply the instance as local, the firewall will filter
    packets destined for the Vyatta system. One firewall instance can be
    applied as a local packet filter.

A total of three firewall instances can be applied to an interface: one
instance as an in filter, one instance as an out filter, and one
instance as a local filter.

### Interface-based firewall on the Public interface.

The following example shows a firewall rule set applied on a Public
interface of the Vyatta. This rule set does the following:

-   Makes the firewall stateful (global configuration). Sets recommended
    global rules to be applied to all firewall interfaces (in this case
    Public interface. Any other interfaces with a firewall configuration
    will also inherit this configuration)
-   Allows L2TP over IPsec traffic for remote-access VPN sessions
-   Allows Site-to-site VPN tunnel traffic
-   Allows SSH and ICMP traffic


(1) Log onto the Vyatta Appliance using ssh:

        ssh vyatta@X.X.X.X

  Where X.X.X.X is the IP address of the Vyatta. You'll see a Welcome to
Vyatta message and a prompt to enter your Vyatta password.

  Once you're logged onto the appliance, you can enter a ? or press the
Tab key for help.

(2) Enter configuration mode:

       vyatta@vyatta: configure
       [edit]
       vyatta@vyatta#

  The \# symbol indicates you're in configuration mode.

(3) Make the firewall stateful (global configuration)

       set firewall state-policy established action 'accept'
       set firewall state-policy related action 'accept'

(4) Set the recommended global rules which will apply to all firewall
protected interfaces. Anything global can be changed within the
interface specific firewall rule

       set firewall all-ping 'enable'
       set firewall broadcast-ping 'disable'
       set firewall ipv6-receive-redirects 'disable'
       set firewall ipv6-src-route 'disable'
       set firewall ip-src-route 'disable'
       set firewall log-martians 'enable'
       set firewall receive-redirects 'disable'
       set firewall send-redirects 'enable'
       set firewall source-validation 'disable'
       set firewall syn-cookies 'enable'

(5) Start configuring firewall configuration for Public interface

        edit firewall name protect-vyatta

  Drop everything by default

        set default-action 'drop'

  Allow IKE and ESP traffic for IPsec

       set rule 100 action 'accept'
       set rule 100 destination port '500'
       set rule 100 protocol 'udp'
       set rule 200 action 'accept'
       set rule 200 protocol 'esp'

  Allow L2TP over IPsec

       set rule 210 action 'accept'
       set rule 210 destination port '1701'
       set rule 210 ipsec 'match-ipsec'
       set rule 210 protocol 'udp'

  Allow NAT traversal of IPsec

       set rule 250 action 'accept'
       set rule 250 destination port '4500'
       set rule 250 protocol 'udp'

  Deter ssh brute-force (only allow 3 new connections within 30 seconds)

       set rule 300 action 'drop'
       set rule 300 destination port '22'
       set rule 300 protocol 'tcp'
       set rule 300 recent count '3'
       set rule 300 recent time '30'
       set rule 300 state new 'enable'

  Allow all other ssh

       set rule 310 action 'accept'
       set rule 310 destination port '22'
       set rule 310 protocol 'tcp'

  Allow icmp

       set rule 900 action 'accept'
       set rule 900 description 'allow icmp'
       set rule 900 protocol 'icmp'
       exit

(6) Apply locally on Public interface (eth0)

       set interfaces ethernet eth0 firewall local name 'protect-vyatta'

(7) Create and apply firewall ruleset 'in' (for traffic destined for
cloud servers) on Public interface (eth0)

       set firewall name untrusted default-action 'drop'
       set firewall name untrusted description 'deny traffic from internet'
       set interfaces ethernet eth0 firewall in name 'untrusted'

(8) Commit and save the changes.

       commit
       save
