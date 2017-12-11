---
permalink: configuring-interface-based-firewall-on-the-vyatta-network-appliance/
audit_date:
title: Configuring an interface-based firewall on the Vyatta network appliance
type: article
created_date: '2013-03-26'
created_by: Sameer Satyam
last_modified_date: '2017-12-11'
last_modified_by: Stephanie Fillmon
product: Cloud Networks
product_url: cloud-networks
---

You can use a network appliance as a firewall to protect
Rackspace Cloud Server instances.

This article describes how to configure interface-based firewalls on a Vyatta appliance and apply them on the public interface for local traffic (terminating on the Vyatta appliance) and for ingress traffic (traversing the appliance and destined for Cloud Servers).

For a comprehensive guide to configuring the Vyatta appliance as a firewall, see the [Vyatta Firewall Reference Guide](https://54712289bdd910def82d-5cc7866f7aae0a382278b5bce7412a4a.ssl.cf1.rackcdn.com/Vyatta-Firewall_6.5R1_v01.pdf).

### Overview

The Vyatta firewall uses IPv4 and IPv6 stateful packet inspection to intercept and inspect network activity and to allow or deny the attempts. The firewall analyzes and filters IP packets between network interfaces, and enables you to filter packets based on their characteristics and perform actions on packets that match the rule.

Vyatta firewalls provide the following features:


-   Packet filtering for traffic that traverses the appliance and for
    traffic destined for the appliance itself
-   Definable criteria for packet-matching rules, including source IP
    address, destination IP address, source port, destination port, IP
    protocol, and ICMP type
-   General detection on IP options such as source routing and broadcast
    packets
-   Ability to set the firewall globally for stateful or stateless
    operation

Advanced firewall capabilities include stateful failover,
zone-based firewalls, and time-based firewalls.

### Using the firewall feature

Firewalls filter packets on interfaces. Following are the steps for using
the firewall feature:

-   Define a *firewall instance* and save it under a name. A firewall
    instance is also called a *firewall rule set*, which is a series of firewall rules. You define the firewall instance
    and configure the rules in its rule set in the
    firewall configuration node.

-   Apply the instance to an interface or a zone by configuring the interface configuration node for the interface or zone.

After you apply to the interface or zone, the rules in the
instance begin filtering packets on that location.

### Firewall rules

**Note:** There are two types of firewall, interface-based firewall and zone-based firewall. If only one interface is being protected then interface-based firewall can serve your purpose. However, if more than one interface is being protected, then zone-based firewalls are recommended.

Rules are executed in sequence according to the rule number. If the traffic matches a rule, the rule's action is executed; if not, the system "falls through" to the next rule.

Rules perform the following actions:

- `Accept`, which means that traffic is allowed and forwarded
- `Drop`, which means that traffic is silently discarded
- `Reject`, which means that traffic is discarded with an ICMP Port Unreachable message


### Applying firewall rules to interfaces (interface-based firewall)

After a firewall instance is defined, you can apply it to an interface. The instance then filters packets in one of the following ways, depending on what you specify when you apply the firewall instance:

- **In.** If you apply the instance as in, the firewall filters packets that enter the interface and traverse the Vyatta system. You can apply one in packet filter.

- **Out.** If you apply the instance as out, the firewall filters packets that leave the interface. These can be packets that traverse the Vyatta system or that originated on the system. You can apply one out packet filter.

- **Local.** If you apply the instance as local, the firewall filters packets that are destined for the Vyatta system. One firewall instance can be applied as a local packet filter.


You can apply a total of three firewall instances to an interface: one
instance as an **in** filter, one instance as an **out** filter, and one
instance as a **local** filter.

### Apply an interface-based firewall on the public interface.

The following example shows a firewall rule set applied on a public
interface of the Vyatta system. This rule set performs the following actions:

-   Makes the firewall stateful (global configuration).

- Sets recommended global rules to be applied to all firewall interfaces (in this case, the public interface.) Any other interfaces with a firewall configuration will also inherit this configuration.

-   Allows L2TP over IPsec traffic for remote-access VPN sessions.

-   Allows site-to-site VPN tunnel traffic.

-   Allows SSH and ICMP traffic.

### To apply an interface-based firewall

1. Log in to the Vyatta Appliance by using ssh:

        $ ssh vyatta@X.X.X.X

   X.X.X.X is the IP address of the Vyatta appliance.

   A "Welcome to Vyatta" message is displayed, and you are prompted to enter your Vyatta password.

   After you're logged in to the appliance, you can enter a **?** or press the **Tab** key for help.

2. Enter configuration mode:

        $ vyatta@vyatta: configure
        $ [edit]
        $ vyatta@vyatta#

   The \# symbol indicates indicated in configuration mode.

3. Make the firewall stateful (global configuration):

        # set firewall state-policy established action 'accept'
        # set firewall state-policy related action 'accept'

4. Set the recommended global rules that will apply to all firewall protected interfaces. Anything global can be changed within the interface-specific firewall rule.

        # set firewall all-ping 'enable'
        # set firewall broadcast-ping 'disable'
        # set firewall ipv6-receive-redirects 'disable'
        # set firewall ipv6-src-route 'disable'
        # set firewall ip-src-route 'disable'
        # set firewall log-martians 'enable'
        # set firewall receive-redirects 'disable'
        # set firewall send-redirects 'enable'
        # set firewall source-validation 'disable'
        # set firewall syn-cookies 'enable'

5. Start configuring firewall configuration for Public interface.

        # edit firewall name protect-vyatta

6. Drop everything by default

        # set default-action 'drop'

7. Allow IKE and ESP traffic for IPsec:

        # set rule 100 action 'accept'
        # set rule 100 destination port '500'
        # set rule 100 protocol 'udp'
        # set rule 200 action 'accept'
        # set rule 200 protocol 'esp'

8. Allow L2TP over IPsec:

        # set rule 210 action 'accept'
        # set rule 210 destination port '1701'
        # set rule 210 ipsec 'match-ipsec'
        # set rule 210 protocol 'udp'

9. Allow NAT traversal of IPsec:

        # set rule 250 action 'accept'
        # set rule 250 destination port '4500'
        # set rule 250 protocol 'udp'

10. Deter SSS brute-force attacks by allowing only three new connections within 30 seconds:

        # set rule 300 action 'drop'
        # set rule 300 destination port '22'
        # set rule 300 protocol 'tcp'
        # set rule 300 recent count '3'
        # set rule 300 recent time '30'
        # set rule 300 state new 'enable'

11. Allow all other SSH:

        # set rule 310 action 'accept'
        # set rule 310 destination port '22'
        # set rule 310 protocol 'tcp'

12. Allow icmp

        # set rule 900 action 'accept'
        # set rule 900 description 'allow icmp'
        # set rule 900 protocol 'icmp'
        # exit

13. Apply locally on the public interface (eth0):

        # set interfaces ethernet eth0 firewall local name 'protect-vyatta'

14. Create and apply the firewall ruleset 'in' (for traffic destined for cloud servers) on Public interface (eth0):

        # set firewall name untrusted default-action 'drop'
        # set firewall name untrusted description 'deny traffic from internet'
        # set interfaces ethernet eth0 firewall in name 'untrusted'

15. Commit and save the changes:

        # commit
        # save
