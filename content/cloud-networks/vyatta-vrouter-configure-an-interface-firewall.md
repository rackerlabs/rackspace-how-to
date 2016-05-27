---
permalink: vyatta-vrouter-configure-an-interface-firewall/
audit_date:
title: 'Vyatta vRouter: Configure an interface firewall'
type: article
created_date: '2014-09-11'
created_by: Sameer Satyam
last_modified_date: '2016-01-14'
last_modified_by: Rose Coste
product: Cloud Networks
product_url: cloud-networks
---

Brocade Vyatta vRouter can be configured for two methods of firewall
operations: interface-based firewalls and zone-based firewalls. Because
it is the standard method of firewall deployment, this article describes
how to configure an interface-based firewall.

The configuration examples in this article use parameters as follows:

-   `INSIDE` is `eth1` at 10.0.0.0/24
-   `APP` is `eth2` at 172.16.10.0/24
-   `DMZ` is `eth3` at 192.168.100.0/24
-   `PUBLIC` is `eth0`
-   `Local` is `local`

### Log in to the router

First, log in to the vRouter and put it into configuration mode using the following command:

    configure

### Allow established and related traffic

You need to configure a rule that allows all established (session) or
related (ALG, FTP) traffic through the firewall. Otherwise, return
traffic for established or related sessions cannot traverse the firewall
policies. You can add these globally with a Global State Policy with the
following statement:

    set firewall state-policy established action accept set firewall state-policy related action accept

### Configure the firewall rule base

You need to configure the rule base that defines all the parameters of
the firewall policy, and then you need to apply your rule base to the
interface and the direction of the traffic. As with all other firewall
rules, this rule base uses a "first match" policy, which means that you
must add the most specific rules at the top of the list. The number of
the rule dictates its position in the rule base.

By default, apply your rules inbound, into the interface. There is a
limit of 10k lines per firewall rule base. Rules cannot be reordered, so
allow space between added rules; space new rules by 10. Lastly, firewall
rules are processed POST-DNAT. See the NAT page for more information.

#### To configure the interface firewall rule base

The following are configuration examples to guide in configuring the
interface firewall rule base.

    set firewall name PUBLIC-IN rule 1000 description "Allow 7's to DMZ, 80/443"
    set firewall name PUBLIC-IN rule 1000 source address 7.7.7.0/24
    set firewall name PUBLIC-IN rule 1000 destination address 192.168.100.0/24
    set firewall name PUBLIC-IN rule 1000 destination port http, https
    set firewall name PUBLIC-IN rule 1000 protocol tcp
    set firewall name PUBLIC-IN rule 1000 action accept

    set firewall name DMZ-IN rule 1000 description "Allow mail to APP segment"
    set firewall name DMZ-IN rule 1000 destination port smtp
    set firewall name DMZ-IN rule 1000 protocol tcp
    set firewall name DMZ-IN rule 1000 action accept`
    set firewall name DMZ-IN rule 1000 description "BLOCK to INSIDE"
    set firewall name DMZ-IN rule 1000 destination address 10.0.0.0/24
    set firewall name DMZ-IN rule 1000 action drop
    set firewall name DMZ-IN rule 1000 description "BLOCK to APP"
    set firewall name DMZ-IN rule 1000 destination address 172.16.10.0/24
    set firewall name DMZ-IN rule 1000 action drop
    set firewall name DMZ-IN rule 9999 description "ALLOW OUT"
    set firewall name DMZ-IN rule 9999 action accept
    . . .

**Note:** If a field in the rule base is left empty, vRouter interprets
that field as nonspecific and allows all possible matches. In the case
of source and destination addresses, the vRouter assumes 0.0.0.0/0. In
the case of source and destination ports, vRouter assumes all ports. If
a port is specified, a protocol must also be specified. If no port is
specified, and the protocol field is left empty, vRouter assumes all
protocols.

Specify the actions.

#### To apply the rule base to the interfaces

The following configuration examples will help you apply the rule base
to the interfaces.

    set interfaces ethernet eth0 firewall in name PUBLIC-IN
    set interfaces ethernet eth1 firewall in name INSIDE-IN
    set interfaces ethernet eth2 firewall in name APP-IN
    set interfaces ethernet eth3 firewall in name DMZ-IN

### Configure the local firewall

vRouter has a specific firewall that you can configure to handle traffic
destined for vRouter itself. Each interface can share a single local
firewall rule base, or each interface can have a specific rule base
configured. As with traditional interface firewall rule bases, create
your specific rules first. The naming convention is also similar,
-LOCAL. You can then apply that rule base to the interface, as a local
firewall.

#### To apply the local firewall to the interface

The following configuration examples will guide you in configuring the
local firewall to the interface.

    set interfaces ethernet eth0 firewall local name PUBLIC-LOCAL
    set interfaces ethernet eth1 firewall local name INTERNAL-LOCAL
    set interfaces ethernet eth2 firewall local name INTERNAL-LOCAL
    set interfaces ethernet eth3 firewall local name INTERNAL-LOCAL

#### Verify the firewall configuration

The following configuration examples will guide you in verifying the
firewall configuration.

    show firewall name
    show firewall name  statistics
    show firewall name  counters

### Log firewall rules

You can enable logging for specific firewall rules within the command
hierarchy. Enable logging only when needed and disable it after you are
done so that vRouter is not flooded with unneeded log messages.

-  To enable logging on a specific rule (configuration mode)

        set firewall name <'rulebase_name'> rule 10 log enable commit

-  To view (operational mode) active log messages

        monitor firewall

-  To disable logging on a specific rule (configuration mode)

        delete firewall name <*rulebase_name'> rule 10 log commit
