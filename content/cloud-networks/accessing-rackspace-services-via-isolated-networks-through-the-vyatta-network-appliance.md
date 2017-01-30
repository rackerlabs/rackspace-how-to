---
permalink: accessing-rackspace-services-via-isolated-networks-through-the-vyatta-network-appliance/
audit_date:
title: Accessing Rackspace Services Via Isolated Networks through the Vyatta Network Appliance
type: article
created_date: '2013-05-02'
created_by: Sameer Satyam
last_modified_date: '2014-03-06'
last_modified_by: David Hendler
product: Cloud Networks
product_url: cloud-networks
---

### Introduction

In order to access Rackspace services from your cloud servers, you
traditionally need the servers to be connected to ServiceNet and/or
Public interfaces. It is possible to detach your servers from either of
these networks and have servers be connected only to isolated network
interfaces if you want to restrict access to them. However, this would
cause you to lose access to some Rackspace services.

The following article describes what services are impacted by disconnecting
Public and/or SNET interfaces from your cloud servers:

-  [Removing networks from a Cloud Server](/how-to/removing-networks-from-a-cloud-server)

### Vyatta Network Appliance

The Vyatta network appliance provides you with an easy-to-configure
firewall, advanced networking and VPN capabilities in addition to
increased security in the Cloud. Using this appliance , you can detach
your servers from Public and SNET interfaces and still retain access to
Rackspace services. In this article you will see how this can be
accomplished.

### Accessing Rackspace services using NAT on the Vyatta appliance

In the below setup the cloud server is connected only on the isolated
network (cloud network). The Vyatta is also on the same cloud network
and is used as the default gateway by the server in question. The Vyatta
appliance is connected to all three networks (Public, SNET and
Isolated).

<img src="{% asset_path cloud-networks/accessing-rackspace-services-via-isolated-networks-through-the-vyatta-network-appliance/Vyatta.jpg %}" class="image-half_width" width="350" height="224" />

<span style="line-height: 1.538em;">The table below summarizes what
services can be accessed if the Vyatta is configured as described in the
next section:</span>

| Service                     | Works? |
|-----------------------------|--------|
| Cloud Backup                | Yes    |
| Cloud Databases             | Yes    |
| Cloud Files                 | Yes    |
| Cloud Monitoring            | No     |
| Managed Cloud Service Level | No *   |
| Operating System Updates    | Yes    |
| RackConnect                 | No *   |
| Windows Activation          | Yes    |

&#42;Vyatta Network appliance is not available for this service.

### Configuration

In order for the services listed in the table above to work as explained, the Vyatta appliance needs to be configured with Source NAT. For a
more comprehensive explanation of Source NAT configuration, visit the
following link:

-  [Enable internet access on Cloud Servers using SNAT on a Vyatta Network appliance](/how-to/enable-internet-access-on-cloud-servers-using-snat-on-a-vyatta-network-appliance)

**Note**: The cloud servers are on the isolated interface 192.168.1.0/24 and they are using the Vyatta network appliance as their default gateway

Login to the Vyatta appliance and enter configuration mode:

    $ ssh vyatta@x.x.x.x
    Welcome to Vyatta
    vyatta@x.x.x.x's password:
    Welcome to Vyatta
    Version:      VSE6.5R2
    Description:  Vyatta Subscription Edition 6.5 R2
    Copyright:    2006-2012 Vyatta, Inc.
    Last login: Thu May  2 04:48:29 2013 from x.x.x.x
    vyatta@vyatta-thefinal:~$
    vyatta@vyatta-thefinal:~$ configure
    [edit]
    vyatta@vyatta-thefinal#

Configure Source NAT for ServiceNet traffic. eth1 is the SNET interface
on the Vyatta. Any traffic going out via SNET will now use a source IP
of the SNET interface on the Vyatta.

```
set nat source rule 10 outbound-interface 'eth1'
set nat source rule 10 protocol 'all'
set nat source rule 10 source address '192.168.1.0/24'
set nat source rule 10 translation address 'masquerade'
```

Configure Source NAT for PublicNet traffic. eth0 is the Public interface
on the Vyatta. Any traffic going out via PublicNet will now use a source IP of the Public interface on the Vyatta.

``` 
set nat source rule 20 outbound-interface 'eth0'
set nat source rule 20 protocol 'all'
set nat source rule 20 source address '192.168.1.0/24'
set nat source rule 20 translation address 'masquerade'
```

This simple configuration should allow you to access the services listed
in the table. You may also want to configure firewall policies on the
Vyatta appliance. For configuration assistance of firewall policies on
Vyatta please visit the following article:

-  [Configuring interface-based firewall on the Vyatta Network appliance](/how-to/configuring-interface-based-firewall-on-the-vyatta-network-appliance)
