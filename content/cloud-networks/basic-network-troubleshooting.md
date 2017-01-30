---
permalink: basic-network-troubleshooting/
audit_date:
title: Basic Network Troubleshooting
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Stephanie Fillmon
product: Cloud Networks
product_url: cloud-networks
---

Networking issues can be problematic when working on a remote server. If
you accidentally break your Cloud Server's networking capabilities, you
may find yourself locked out of any remote connection. However, many
networking problems can be solved by logging into the web console
(through your The Rackspace Cloud Control Panel) and running a few
simple commands.

### ip addr show

ip addr show is a basic network information and configuration tool. On a
working Cloud Server, its output may look something like this:

    # ip addr show
    eth0      Link encap:Ethernet  HWaddr 40:40:d9:xx:xx:xx
              inet addr:67.23.13.xx  Bcast:67.23.13.255  Mask:255.255.255.0
              inet6 addr: fe80::4240:d9ff:fe05:xxxx/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:36564 errors:0 dropped:0 overruns:0 frame:0
              TX packets:11490 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:48350683 (46.1 MiB)  TX bytes:1456436 (1.3 MiB)

    eth1      Link encap:Ethernet  HWaddr 40:40:a5:xx:xx:xx
              inet addr:10.176.44.xx  Bcast:10.176.63.255  Mask:255.255.224.0
              inet6 addr: fe80::4240:a5ff:fe5f:xxxx/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:3 errors:0 dropped:0 overruns:0 frame:0
              TX packets:53 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:230 (230.0 B)  TX bytes:7764 (7.5 KiB)

    lo        Link encap:Local Loopback
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:16436  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

#### Common Problems

If, upon running ifconfig, you do not see an IP address under eth0, try

    ip addr show eth0 1.2.3.4 netmask 255.255.255.0 up

where "1.2.3.4" is the static IP for your Cloud Server as given to you
when the server was created. If you do not see an eth0 interface *at
all*, run

    ifup eth0

This will bring up the interface under its default configuration.
Similar steps may be followed to fix the internal connection by using
'eth1' and your assigned private (10.xx.xx.xx) IP.

### iptables

iptables is a commonly-used firewall in Linux. By default, your Cloud
Server should have iptables already installed, but it will not be
configured. To list the firewall rules, run

    iptables -L

A newly-built server will show the following:

    # iptables -L
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination

    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination

    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination

#### Common Problems

If your iptables output differs from the above, the firewall may be
causing your issue.

### route

route is used to view and edit the routing table. The output of route
may display several lines, but the most important (or the most commonly
broken) is one called the default gateway.

**Note:** Various Linux distros may configure their routes slightly differently. The output
shown below is from a Debian server.

    # route
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    67.23.13.0      *               255.255.255.0   U     0      0        0 eth0
    10.176.32.0     *               255.255.224.0   U     0      0        0 eth1
    10.191.192.0    10.176.32.1     255.255.192.0   UG    0      0        0 eth1
    10.176.0.0      10.176.32.1     255.248.0.0     UG    0      0        0 eth1
    default         67.23.13.1      0.0.0.0         UG    0      0        0 eth0

In this example, the first line is a "catch-all" for the 67.23.13.xx
network, while the next three lines are specific to the internal
network. The last line is the default gateway, and should point to
xx.xx.xx.1 (where the first three octets match those of the top line).

#### Common Problems

To change the default route, run

    route add default gw xx.xx.xx.1

replacing "xx.xx.xx" as described above.
