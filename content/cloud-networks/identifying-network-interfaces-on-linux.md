---
permalink: identifying-network-interfaces-on-linux/
audit_date:
title: Identify Network Interfaces on Linux
type: article
created_date: '2013-03-15'
created_by: Jered Heeschen
last_modified_date: '2013-03-15'
last_modified_by: Jered Heeschen
product: Cloud Networks
product_url: cloud-networks
---

This article briefly describes a method of identifying which network interfaces on a Linux 
server are associated with which IP addresses.

### IPv4

You can get a simple list of the network interfaces and IPv4 addresses on your server by 
running the following command:

    /sbin/ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1

The output lists the interface names on the left and the associated IP addresses on the right.

    lo 127.0.0.1
    eth0 68.207.142.192
    eth1 10.173.3.121

### IPv6

For IPv6, you can run a similar command but use "-6" in place of "-4":

    /sbin/ip -6 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1

Here, too, the interface names are on the left, and the IP addresses are on the right.

    lo ::1/128
    eth0 2001:4801:7817:72:bc18:4779:ff10:1653
    eth0 fe80::be76:4eff:fe10:1633
    eth1 fe80::be76:4eff:fe10:12ab

### Full output

To get all the information about your network interfaces in one place, just run:

    /sbin/ip a

The detailed output lists each interface, any associated IP addresses, their network prefix 
length, their scope, and plenty of other data besides.  For more information, check the 
man page for the "ip address" command:

    man ip-address
