---
permalink: introduction-to-iptables/
audit_date:
title: Introduction to iptables
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-08'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article explains how to use IP tables for a simple firewall, and
describes the process to open up holes in your firewall to necessary
ports. An IP table is a firewall and networking tool available to
all Linux distros and operates by analyzing packets at the kernel level
as they are received.

For a comprehensive list of IP tables commands, parameters, and other
options, see the [MAN page](http://linux.die.net/man/8/iptables) and the
[IP tables how-to](https://help.ubuntu.com/community/IptablesHowTo/).

### The Base Ruleset

-   List of the Current rules

        sudo iptables --list

Your output is going to look like the following if you haven't made any
changes:

    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination

    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination

    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination


### Reading the Ruleset

In a default install you will see three predefined Chains that will take
care of the three major activities: Incoming Traffic, Forwarded Traffic
and Outgoing Traffic. The "policy" is probably the most important thing
to take away from the above table. The policy is the default ruleset for
that particular Chain, with a standard install all policies will be
"Accept".

### Policies

The available policies and other options are extensive, if you would
like to know more about them check out the [manpage](http://linux.die.net/man/8/iptables "http://linux.die.net/man/8/iptables")
for IPtables. In the scope of this article I will only cover the
following three policies which are the most common:

-   Accept - This is used to explicitly pass through as long as no
    target rules apply.

-   Reject - This is used to send back an error packet in response to
    the matched packet: otherwise it is equivalent to DROP so it is a
    terminating TARGET, ending rule traversal.

-   Drop - This policy will halt a connection to a host without any
    communication unless there is a target rule that applies.

### Available Options

IPtables MAN page: <http://linux.die.net/man/8/iptables>

The options that are recognized by iptables can be divided into several
different groups:

-   Commands - These options specify a
    specific action to perform.
-   Parameters - Parameters set rule
    specifications for the commands used.
-   Other Options - Other options can
    be specified, as necessary, for commands used.

### Simple Firewall

Simple Rules:

-  Allow connections that are already connected to your server

         sudo iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

- To allow connections on ServiceNet (required by other Rackspace Cloud products such as Cloud Backup and Cloud Monitoring)
 
         sudo iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT

-  Allow connections to SSH

  Ok, in this case we can make a few different choices, the choices can be
applied to other ports or situations to make customizations.

  In this command, we will allow connections for all tcp connections
attempts at SSH connections.

         sudo iptables -I INPUT 1 -p tcp  --dport 22 -j ACCEPT

  In this command, we will allow connections only coming from a certain IP
subnet using [CIDR](http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing "http://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing")
notation. In this example we are going to lockdown to any IP address
lying in the range of 192.168.1.0 - 192.168.1.255

         sudo iptables -I INPUT 1 -p tcp --dport 22 -s 192.168.1.0/24 -j ACCEPT

-  Allowing connections to HTTP/HTTPS

  The following iptables rules will allow connections from both port 80
(HTTP) and port 443 (HTTPS) from any connections.

         sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
         sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT

-  Allowing connections to FTP

  The following iptables rules will allow connections for FTP servers on
port 21.

         sudo iptables -I INPUT 1 -p tcp --dport 21 -j ACCEPT

-  List of common Ports

  Using what you've learned from the above use the following list of
[common ports](http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers#Well_known_ports:_1_-_1023)
from the link to create rules for any running server you have.

-  Changing the Default Policy

  The only real policy change that we are going to make is going to effect
incoming traffic, as a general rule we are going to Drop all
connections, and only allow those we have deemed legit.

        sudo iptables -P INPUT DROP

  **Note**: This rule should be run only after you have setup your access
    rules to allow you to ssh in.

### Save your Ruleset

If your server reboots for any reason or you restart IPTables you will
loose your changes. The rules that you input by hand are stored in
volatile memory. Make sure that you save IPtables rules for any change
you want to make permanent you will need one of the following commands:

-   for CentOS and Fedora

        /etc/init.d/iptables save

-   for Ubuntu

        iptables-save > /etc/iptables.rules

-   for all other Distros

        iptables-save > /etc/sysconfig/iptables

The above commands will create a file **/etc/sysconfig/iptables** that will
be a flat file with human readable syntax that can be edited by hand if
necessary. All edits to this file will be live whenever iptables is
restarted.

### Summary

Hopefully from this article you can create a simple firewall to protect
your server from basic attacks. Keep in mind that IPTables is a very
powerful tool that would take a book to fully go through all of its
abilities. My next networking article will go through a few simple
networking tricks like port forwarding and NATing. If you need help
creating more rules, see [Easy Firewall Generator for IPTables](http://easyfwgen.morizot.net/gen/ "http://easyfwgen.morizot.net/gen/").

### References and links

-   [Ubuntu IPtables Howto](https://help.ubuntu.com/community/IptablesHowTo/ "https://help.ubuntu.com/community/IptablesHowTo/")
-   [Man IPtables](http://linux.die.net/man/8/iptables "http://linux.die.net/man/8/iptables")
