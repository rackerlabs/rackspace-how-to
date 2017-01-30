---
permalink: how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers/
audit_date:
title: Prevent RackConnect from overwriting custom iptables rules on Linux cloud servers
type: article
created_date: '2013-01-26'
created_by: Russell Lambert
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

By default, RackConnect Automation takes complete control of the
iptables software firewall on your Linux cloud servers, using it to
enforce your configured network policies for those network connections
that do not traverse your hardware firewall device. This is exactly the
functionality that most users need.

For a few advanced users, however, the way that RackConnect Automation
replaces all existing iptables rules can be frustrating. They have
specific needs that require the ability to create and maintain their own
custom iptables rules in addition to those used to enforce their network
policies.

This article describes a method that advanced users can use to modify the
default behavior of RackConnect Automation's software firewall
management on Linux cloud servers to allow them to create their
own iptables rules.

### Target audience for this article

This article is for advanced Linux users who are familiar with the
iptables software firewall and who have a need to create custom iptables
rules to perform tasks that are beyond the scope of [network
policies](/how-to/managing-rackconnect-v20-network-policies).

If you are unfamiliar with iptables syntax or how to write custom
iptables rules in Linux, or if you do not have a pressing need to create
and maintain your own iptables rules, it we recommend that you do not
modify the default behavior of RackConnect Automation. [RackConnect
network
policies](/how-to/managing-rackconnect-v20-network-policies)
provide a friendlier and more scalable solution for software firewall
management than writing your own custom iptables rules on each
individual cloud server.

### Create custom rules

Each time that RackConnect Automation updates the iptables rules on a server,
it checks for the existence of a file called
`/etc/rackconnect-allow-custom-iptables`. If this file exists, it uses a
slightly different method to update the iptables rules on the server.
Instead of completely replacing the iptables filter rules, it rebuilds
only the RackConnect created rules while preserving all other iptables
rules. Because it merges RackConnect rules with custom rules, this new
method is often referred to as the *merge method* (as opposed to the
traditional *clobber method*). To tell RackConnect Automation to use the
merge method on a particular server, perform the following steps:

1.  Create an empty file in `/etc` named
    `rackconnect-allow-custom-iptables`.

        touch /etc/rackconnect-allow-custom-iptables

2.  Force a software firewall update by creating a network policy in the
    MyRackspace portal that affects the server on which you created the
    `/etc/rackconnect-allow-custom-iptables` file. The easiest way to do
    this is to create a temporary Dedicated to Cloud Server policy for a
    bogus IP address to all cloud servers. After the policy has been pushed to
    all cloud servers (the indicator to the left of the policy changes
    from yellow to green), you should delete it.

    <img src="{% asset_path rackconnect/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers/framed-netpolicy_0.jpg %}" alt="Add Network Policy Screenshot; Name TempPolicy, Access Scenario Dedicated to Cloud Server, Source 1.1.1.1, Destination All, Destination Protocol All" width="506" height="509" />

    <img src="{% asset_path rackconnect/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers/framed-netpolicy-syncing_0.jpg %}" alt="Network Policy Indicator Screenshot; Yellow, still syncing" width="749" height="63" />

    <img src="{% asset_path rackconnect/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers/framed-netpolicy-synced_0.jpg %}" alt="Network Policy Indicator Screenshot; Green, sync complete" width="750" height="58" />

    <img src="{% asset_path rackconnect/how-to-prevent-rackconnect-from-overwriting-custom-iptables-rules-on-linux-cloud-servers/framed-netpolicy-delete_0.jpg %}" alt="Network Policy Delete Screenshot; Check TempPolicy, Click Delete Policy" width="749" height="238" />

3.  Verify that RackConnect Automation is using the merge method
    by looking at the last iptables rule in the `RS-RackConnect-INBOUND`
    chain on the server. If it is a RETURN rule, the merge method is now
    being used for software firewall updates on this server.

        # iptables -vnL RS-RackConnect-INBOUND
        Chain RS-RackConnect-INBOUND (2 references)
         pkts bytes target     prot opt in     out     source               destination
          ###  #### ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED /* RackConnectChain-INBOUND-RE */
          ###  #### ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0            /* Local-Loopback */
          ...
          ###  #### ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0            /* RCAutoMP-NP_34908 */
          ###  #### RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0

### Considerations

For the most part, touching the file and forcing automation to update
iptables is all that is required. However, there are a few important things to
note.

#### RackConnect rules always run before custom rules

All RackConnect related ACCEPT/DENY rules are kept in filter chains
named `RS-RackConnect-*` (such as `RS-RackConnect-INBOUND`). The first
rule of a primary iptables filter chain (such as `INPUT`) will always be
an unconditional jump to the relevant `RS-RackConnect-*` chain. **This
jump rule needs to remain the first rule in the basic chains; otherwise,
your custom rules might prevent RackConnect Automation from being able to
log in to your server.**

If you try to add iptables rules above this jump rule, RackConnect
Automation will automatically move it back to the top of the list the
next time network policies affecting that server are updated. Because
the merge method adds an unconditional RETURN statement to the end of
each of the `RS-RackConnect-*` chains, iptables will automatically
continue processing rules underneath the jump rule if none of the rules
in the `RS-RackConnect-*` chain match.

#### No changes can be made to the RS-RackConnect-\* chains except through network policies

All of the `RS-RackConnect-*` chains are rebuilt whenever network
policies affecting a server are updated. As a result, any manual changes
to a `RS-RackConnect-*` chain will be overwritten on the next update.

#### RackConnect Automation saves iptables rules so they are restored on reboot

Every time RackConnect Automation runs, it saves the current rules to the
default system location for the Linux distribution running on that
server, ensuring that they will be restored on reboot. Normally, this is
desired behavior; after all, you don't want your server to be
unprotected if it reboots. Occasionally, advanced users exploit the
fact that iptables rules are held in memory until manually committed to
disk in order to experiment with new rules, knowing that they can simply
restart the iptables "service" to restore the old ruleset. If you are
one of these users, be aware that updates to your network policies (by
yourself or by another user in your organization with access to your
account in the MyRackspace portal) might cause RackConnect Automation to
save the running ruleset to disk in the background while you are
experimenting.

#### RS-RackConnect-\* rules are updated only when network policies change

If you use the `iptables-save` command to back up your iptables
rules, note when your backup files are created. By default, the
`iptables-save` utility saves all chains in all tables. If you restore
from such a backup by using `iptables-restore`, you might be restoring an
older version of the `RS-RackConnect-*` chains than you should currently
have. If you have any doubt or suspicion that RackConnect Automation might
have updated the iptables rules for a server since the backup that you're
restoring was taken, restore the backup and then use the *create a
temporary network policy* method listed earlier in this article to force
RackConnect Automation to update the `RS-RackConnect-*` chains to the
latest version.

### Troubleshooting

If you created `/etc/rackconnect-allow-custom-iptables`, but it doesn't appear that your rules are being processed, there are two possible causes:

-   RackConnect Automation has not updated iptables on the server since `/etc/rackconnect-allow-custom-iptables` was created.

    RackConnect Automation creates a RETURN rule at the end of the `RS-RackConnect-*` chains only when it is operating in merge mode. If you have created the `/etc/rackconnect-allow-custom-iptables` file but RackConnect Automation has not yet updated iptables on your server, there will not be a RETURN rule and iptables will stop processing rules as soon as it reaches the end of the relevant `RS-RackConnect-*` chain. You can remedy the situation by forcing a software firewall refresh using the *create a temporary network policy* method detailed earlier in this article. As long as `/etc/rackconnect-allow-custom-iptables` exists, RackConnect Automation does not remove the custom rules that you have created; it simply adds the RETURN rule necessary for iptables to process them.

-   A RackConnect rule is already handling the packet.

    Iptables rules are handled on a "first match" basis. If a rule in the relevant `RS-RackConnect-*` chain matches a packet, iptables does as that rule says (ACCEPT or DROP it) and stops processing further rules. If the matching `RS-RackConnect-*` rule is insufficient for your needs, you might need to adjust your network policies to remove the matching rule in order to allow iptables to continue down the rule list to your custom rule.

If you have any questions about RackConnect or this change, [contact your Rackspace Support team](http://www.rackspace.com/support/).
