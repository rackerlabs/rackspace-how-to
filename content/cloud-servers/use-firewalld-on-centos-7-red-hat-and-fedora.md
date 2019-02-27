---
permalink: use-firewalld-on-centos-7-red-hat-and-fedora/
audit_date: '2019-01-22'
title: Use firewalld on CentOS 7, Red Hat, and Fedora
created_date: '2019-02-26'
created_by: Rackspace Community
last_modified_date: '2019-02-26'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Firewalld has replaced iptables as the firewall for CentOS&reg; 7. The syntax
that firewalld uses is more user-friendly. This post shows you how to ensure
that firewalld is running and starts when your server boots. It also shows you 
how to create persistent and flexible firewall rules.

**Note**: Red Hat&reg; Fedora&reg; also uses firewalld, so all of the commands
in this article also work in the Fedora image that Rackspace provides.

### Basic firewalld concepts

Firewalld uses _zones_ to manage groups of rules. Zones are attached to
network interfaces and determine which traffic is allowed on a specific
network and which traffic is denied.

This functionality might be useful if you want to establish a very strict
firewall on your public interface, and a more relaxed firewall on your Cloud
Network interface. Becoming familiar with the zones that
firewalld pre-defined is helpful. Firewalld has the following pre-defined zones, in
order from least trusted to most trusted:

- `drop`: This zone only allows outgoing connections. It drops incoming connections 
  without a reply.
- `block`: While similar to `drop`, this zone rejects incoming requests with an 
  `icmp-host-prohibited` or `icmp6-adm-prohibited` message.
- `public`: Use this zone for public networks, or when you don't trust any of the 
  other computers on the network. This zone accepts incoming connections on a 
  case-by-case basis.
- `external`: Use this zone on external networks where the firewall acts as the
  gateway. This zone is configured for Network Address Translation (NAT)
  masquerading so that your internal network is private but reachable.
- `internal`: Use this zone for the internal part of a gateway, where the
  other computers are reasonably trustworthy.
- `dmz`: Use this zone for isolated computers that are located in a demilitarized 
  zone (DMZ). This zone only allows Secure Shell (SSH) and 
  Internet Control Message Protocol (ICMP).
- `work`: Use this zone for work computers.
- `home`: Use this zone for home environments.
- `trusted`: Use this zone when you trust all of the computers on the network. 

To use the firewall, you create rules and alter the properties of your zones,
and then assign your network interfaces to the zones that are most
appropriate for your network.

### Start the firewall and enable it on boot

By default, firewalld should be enabled, reboot the server, and then start at
boot.

You can easily check if the firewall is running by using the `--state` flag,
as shown in the following example:

    $ sudo firewall-cmd --state
    Finding out about your zones

If firewalld is not running, you can enable and start it by running the
following commands:

    $ sudo systemctl enable firewalld
    $ sudo systemctl start firewalld

You can see which zone is currently the default zone by running the following
command:

    $ sudo firewall-cmd --get-default-zone

You can see which network interfaces are assigned to which zones by running
the following command:

    $ sudo firewall-cmd --get-active-zones

**Note**: The default assigns all network interfaces to the public zone.

You can also find the rules that are associated with the public zone by
running the following command:

    $ sudo firewall-cmd --list-all --zone=public

The output should look like the following example:

    public (default, active)

    interfaces: eth0 eth1

    sources:

    services: dhcpv6-client http https ssh

    ports: 1025/tcp

    masquerade: no

    forward-ports:

    icmp-blocks:

    rich rules:

The output shows that the public zone is the default, and has eth0 and
eth1 network interfaces. Dynamic Host Configuration Protocol (DHCP)
(`dhcpv6-client`), SSH, Hypertext Transfer Protocol (HTTP), and Secure HTTP
(HTTPS) traffic are allowed, as well as Transmission Control Protocol (TCP)
traffic on port `1025`.

To get a list of the available zones, run the following command:

    $ sudo firewall-cmd --get-zones

### Set up your zones

You can move interfaces between zones during your session by using the
`--change-interface=` argument and the `--zone` argument. If the firewall
restarts, the interface reverts to the default zone.

    $ sudo firewall-cmd --zone=internal --change-interface=eth1

To define a permanent zone for an interface, open the configuration file for
the interface and add the following lines:

    ...
    ONBOOT=yes
    ZOME=internal

Save and close the file, then run the following commands to restart the
networking and firewall and force the changes to take effect:

    $ sudo systemctl restart network
    $ sudo systemctl restart firewalld

### Set up the rules

Firewalld comes with pre-defined services that enable you to add only the
service, rather than the port number and protocol type. For example, they
enable you to allow `http` rather than `tcp port 80`.

You can obtain a list of these services by using the following command:

    $ sudo firewall-cmd --get-services

Then, use the following example command to add a service:

    $ sudo firewall-cmd --add-service=http

The configuration takes immediate effect, but doesn't survive reboots. To
enable these types of service configurations to restart when the server
reboots, you need to add the `--permanent` argument. We recommend that you run
both of these commands in sequence so that the configuration takes immediate
effect, and services also reboot, as shown in the following example:

    $ sudo firewall-cmd --add-service=http
    firewall-cmd --permanent --add-service=http

You can obtain additional details about firewalld's pre-defined rules by
navigating to the **/usr/lib/firewalld/services/** directory and reading the
files.

### Set up rich rules

_Rich rules_ are how you define conditionals in firewalld. The most common use
case for rich rules is allowing access from a particular IP address or IP
address range. The following commands enable access to TCP port 80 from any IP
on the 192.168.0.0 network and make the rule permanent:

    $ sudo firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" service name="http" accept'

    $ sudo firewall-cmd --add-rich-rule 'rule family="ipv4" source address="192.168.0.0/24" service name="http" accept' --permanent

For examples of rich rules, see the [Fedora&reg;
Wiki](https://fedoraproject.org/wiki/Features/FirewalldRichLanguage).

### Define services

You can create your own service and refer to when you create rules by placing a
file in the **/usr/lib/firewalld/services/** directory. The easiest way
to perform this task by copying an existing **.xml** file in this directory,
then changing the details.

The following example command copies an existing file to a new file:

    $ sudo cp /usr/lib/firewalld/services/http.xml /usr/lib/firewalld/services/myservice.xml

The following command opens the new file for editing:

    $ sudo vim /usr/lib/firewalld/services/myserver.xml

The file should look like the following example:

    <!--?xml version="1.0" encoding="utf-8"?-->
    <service>
      <short>My Custom Service</short>
      <description>A brief description of the service. This rule allows port 1134 on TCP for my application.</description>
      <port protocol="tcp" port="1134"></port>
    </service>

To apply your changes, use the following commands with the name of the file,
minus the **.xml** file extension:

    $ sudo firewall-cmd --add-service=myservice
    $ sudo firewall-cmd --permanent --add-service=myservice
