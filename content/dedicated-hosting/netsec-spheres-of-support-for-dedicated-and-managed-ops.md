---
permalink: netsec-spheres-of-support-for-dedicated-and-managed-ops
title: Network security Spheres of Support
type: article
audit_date: '2019-03-07'
created_date: '2019-2-25'
created_by: NetSec Standardization Group
last_modified_date: '2019-03-07'
last_modified_by: Adrian Bekele
product: Dedicated Hosting
product_url: dedicated-hosting
---

The Spheres of Support for network security (NetSec) lists the technologies and features
in the network security domain and defines the support level for each item.

### Firewall support

Firewall support contains the following elements:

* Monitoring and management of network firewalls
* Customized patching, rollback capabilities, and iOS updates
* Problem, incident, and change management
* Configuration changes on behalf of the customer
* Performance monitoring and tuning
* Configuration and support of internet protocol security (IPsec)-compliant Virtual Private Networks (VPNs)
* Configuration and maintenance of firewall policies to restrict access to environments
* Provision Virtual Local Area Networks (VLANs) and private IP space
* Managed VPN access
* Secure Scocket Layer (SSL) certificate installation and troubleshooting

The following table shows which features are supported in Cisco&reg; and Juniper&reg; firewalls:

|   | Feature | Cisco ASA | Juniper SRX |
| :---: |:--- | :---: | :---: |
| **Interfaces** |VLAN tagged (Cisco trunk)| ✓ | ✓ |
||VLAN untagged (Cisco access)| ✓ | ✓ |
||Link Aggregation Control Protocol (LACP) bundling with a number of interfaces is a power of 2| ✓ | ✓ |
| **Routing** |Static routing| ✓ | ✓ |
||Static routing with Internet protocol service level agreement (IP SLA) tracking| ✓ |  |
| **IPv6** |Static routing| ✓ | ✓ |
||Static routing with IP SLA tracking| ✓ |  |
| **Network Address Translation (NAT)** |Static (one-to-one)| ✓ | ✓ |
||Port Address Translation (PAT) (NAT overloading)| ✓ | ✓ |
||Policy NAT/PAT| ✓ | ✓ |
||Domain Name System (DNS) doctoring| ✓ | ✓ |
||Connection limits via static NAT| ✓ |  |
| **Packet filtering** |Layer 3/4 filtering ingress/egress| ✓ | ✓ |
||Fully qualified domain name (FQDN) based filtering| ✓ ASA 8.3+| ✓ |
||Outbound access control list (ACL)| ✓ |  |
| **DDoS mitigation** |Connection limiting (embryonic, established, or both)  |✓| ✓|
||Connection timeouts |✓| ✓|
||Transmission Control Protocol (TCP) normalization modification  || ✓|
||Application inspection  || ✓|
| **VPN** |Route-based VPNs - Border Gateway Protocol (BGP)  |✓| ✓|
||Route-based VPNs - static |✓| ✓|
||IPsec - IKEv2 L2L with Pre-shared keys (PSK)  |✓| ✓|
||IPsec LAN-to-LAN layer 3/4 filtering  |✓| ✓|
||IPsec LAN-to-LAN PSK authentication |✓| ✓|
||IPsec LAN-to-LAN hub and spoke configuration  |✓| ✓|
||IPsec remote access with group authentication |✓| |
||IPsec remote access with group and user authentication  |✓| |
||IPsec remote access with two-factor authentication  |✓| |
||IPsec remote access - multiple VPN groups |✓| |
||IPsec remote access with layer 3/4 filtering  |✓| |
||IPsec remote access - split-tunneling |✓| |
||IPsec remote access - all traffic through VPN (tunnel all)  |✓| |
||IPsec remote access - DNS server assignment |✓| |
||SSL VPN AnyConnect&reg; Plus |✓||
||SSL VPN - mobile client (plus license feature)  |✓||
||SSL VPN - two-factor authentication |✓||
| **Management** |  Buffered logging  |✓| ✓|
||Log shipping to log correlation device within the customer's account  |✓| ✓|
||Simple Network Management Protocol (SNMP) read-only for customer |✓| ✓|
| **High Availability (HA)** |  Active or standby (stateful and non-stateful) (clustering - Security, Routing, and Switching (SRX)) Adaptive Security Appliance (ASA) 5510 and above, ASA-X 5508, 5515 and above |✓|✓|
| **Modes and modules** | Mode - multi-context routed |✓||
||Mode - routed |✓| ✓|
| **RackConnect** | RackConnect VLANs termination |✓| |
| **RackConnect Global** |  RackConnect Global Classic Static |✓| ✓|
||RackConnect Global 2.0 Static - BGP |✓| |
||RackConnect Global 2.1 Static - BGP (with top of rack (TOR))  |✓| |

### Load balancer support

Load balancer support contains the following elements:

* Monitoring and management of load balancers
* Problem, incident, and change management
* Configuration changes on behalf of the customer
* Performance monitoring and tuning

The following table shows which features are supported in F5&reg; LTM&reg;, Brocade&reg; ADX,
NetScaler&reg; VPX, and NetScaler MPX load balancers:

**Note**: Citrix made the VPX software platform available in early access and will soon
release it in limited access. They have not released the MPX hardware platform yet but
currently are planning support for it.

| | Feature | F5 LTM | Brocade ADX | NetScaler VPX | NetScaler MPX|
| :---: |:--- | :---: | :---: | :---: | :---: |
| **Interfaces** |  VLAN tagged (Cisco trunk) |✓|✓||✓|
||VLAN untagged (Cisco access)  |✓|✓|✓|✓|
| **Routing** | Static routes |✓|✓|Default route|✓|
| **IPv6** |  Static routes |✓|✓| Default route|✓|
| **Packet filtering** |  Layer 3/4 Ingress/Egress |US - ✓ <Br/>Intl - X|✓|||
| **NAT** | Static (one-for-one)  |✓|✓|||
||PAT (NAT overload)  |✓|✓|||
||Source NAT pools on virtual servers |✓|✓|✓|✓|
| **Load balancing** |  Local servers Servers behind the load balancer (LB)|✓|✓||✓|
||Remote servers in front of the LB |✓|✓|✓|✓|
||Parallel Servers sitting as a neighbor to the LB  |✓|✓|✓|✓|
||Algorithms - static (round robin or weighted round robin) |✓|✓|✓|✓|
||Algorithms - dynamic (least connections)  |✓|✓|✓|✓|
||Healthchecks - ICMP echo  |✓|✓|✓|✓|
||Healthchecks - Layer 4 TCP (port socket check) and UDP (port rejection) |✓|✓|✓|✓|
||Healthchecks - Layer 7 HTTP (response code, string search, checks on non well-known ports)  |✓|✓|✓|✓|
||Healthchecks - Layer 7 HTTPS (SSL hello, Response Code, String Search, Checks on non-well-known ports)  |✓|✓|✓|✓|
||Transmission Control Protocol (TCP)/User Datagram Protocol(UDP) virtual servers  (catchall, single port) |✓|✓|✓|✓|
||Stateful Networked Address Translation (SNAT)  |✓|✓|✓|✓|
||HTTP Redirects |✓|✓|✓|✓|
||Universal Resource Identifier (URI) load balancing |✓|✓|✓|✓|
||SSL offloading  |✓|✓|✓|✓|
||Pools - single node: port combination (multiple ports on a server)  |✓|✓|✓|✓|
||Pools - connection limits (pool, node)  |✓|✓|✓|✓|
||Pools - priority group activation |✓||||
||LB - pools - group monitor applied to all pool members  |✓||✓|✓|
||LB - pools - individual monitors applied to each pool member  |✓|✓|✓|✓|
||LB - pools - combination of individual and group monitors across different pool members |✓||✓|✓|
||LB - application profiles - HTTP (OneConnect, custom HTTP profile settings) |✓||✓|✓|
||LB - application profiles - SSL (client and server) |✓|✓|✓|✓|
||LB - application profiles - FTP (active and passive)  |✓||✓|✓|
||Persistence - TCP - source IP |✓|✓|✓|✓|
||Persistence - HTTP cookie: LB generated, server generated |✓|✓|✓|✓|
||Persistence - HTTP custom cookie name |✓||✓|✓|
||Persistence - cookie encryption |✓||✓|✓|
||Persistence - UDP - source IP |✓|✓|✓|✓|
||LB - virtual servers - SNAT pools |✓|✓|✓|✓|
| **Scripting** | iRules  |✓ (Limited)||||
| **Management** |  Logging - local buffered logging  |✓|✓|✓|✓|
||Logging - log shipping to log correlation device (Within customer's account)  |✓|✓|✓|✓|
||Management - SNMP read-only for customer  |✓|✓|✓|✓|
| **HA** |  High availability |✓ |✓ ADX 1000 only |✓|✓|
||HA - active or standby |✓|✓|✓|✓|
| **Modes and modules** | Routed (single and multiple route domains) default gateway for back end servers |✓|✓||✓|
||Mode - edge net device|✓ with AFM||||
||Multiple segments behind LB |✓|✓||✓<Br/>Interface filtering is |
| **RackConnect** | RackConnect VLANs termination |✓|RCV2 - X<Br/>RCv3 - ✓|||
| **RackConnect Global** |  RackConnect Global Classic Static |✓(AFM only)||||
| **SSL VPNs** |  SSL client VPN on edge Big-IPs using APM module |✓||||
| **SNI** | Server name indication  |✓|✓|✓|✓|

### Global load balancer

The following table shows which global load balancer features are supported in F5 LTM, Brocade ADX, NetScaler VPX, and NetScaler MPX load balancers:

|| Feature | F5 GTM |  ADX GSLB | NetScaler VPX | NetScaler MPX|
| :--- |:--- | :---: | :---: | :---: | :---: |
| **Interfaces** |  VLAN tagged (Cisco trunk)|✓||||
||VLAN untagged (Cisco access)  |✓| |||     
||LACP bundling with the number of interfaces is a power of 2 |✓||||
| **Routing** | Static routes |✓||||
| **IPv6** |  Static routes |✓||||
| **Load balancing** |  Single listener address |✓||||
||Servers - BIG-IP system (single)  |✓||||
||Servers - BIG-IP system (redundant pair)  |✓||||
||Virtual servers - manual configuration  |✓||||
||Wide IPs - standard FQDN names  |✓||||
||Wide IPs - standard FQDN alias names  |✓||||
||Wide IPs - single pool, multiple virtual server members |✓||||
||Algorithms - static - round robin, ratio (weighted round robin), Global Availability  |✓||||
||Algorithms - dynamic - least connections  |✓||||
| **DNS** | Authoritative name server for specific sub-delegated domains |✓||||
| **Management** |  Buffered logging  |✓||||
||Log shipping to log correlation device (within customer's account)  |✓||||
| **High availability (HA)** |  Synchronization groups  |✓||||
||Redundant GTM devices specified as primary and secondary DNS servers  |✓||||
| **Modes and modules** | Serial configuration  |✓||||
||Parallel configuration  |✓||||
||Standalone BigIP with GTM license |✓||||

### Cisco Content Service Switches support

End of support for Cisco Content Service Switches (CSS) occurred on September 30, 2014. Customers
that continue to use the platform fall under the Extended Lifecycle Support agreement. Any
support is considered a reasonable endeavor.

### Redhill&reg; WebMux support

End of support for the Redhill MebMux load balancer occurred on September 1, 2014. Customers that
continue to use the platform fall under the Extended Lifecycle Support agreement. Any support
is considered a reasonable endeavor.

**Note:** Rackspace makes every effort to align our support dates for operating systems with the
manufacturer’s support dates. If a manufacturer decides to shorten the support life of an operating
system, Rackspace might be forced to end support sooner than originally anticipated. For full details
on support life, see the [Rackspace End of Life Terms](https://www.rackspace.com/information/legal/eolterms?_ga=2.83585110.1185508516.1551714471-1563606307.1544215242).

### DDoS mitigation

Be aware that Rackspace does support the mitigation of the Distributed Denial of Service (DDoS) feature.

### Disclaimer
### The information contained in this document is a general introduction to the Rackspace Services and does not include any legal commitment on the part of Rackspace.

Except as set forth in the agreements you sign with Rackspace, Rackspace assumes no liability whatsoever, and disclaims any express or implied warranty, relating to its services including, but not limited to, the implied warranty of merchantability, fitness for a particular purpose, and no infringement.

Although part of this document explains how Rackspace services may work with third-party products, the information contained in the document is not designed to work with all scenarios. Any use or changes to third-party products and configurations should be made at the discretion of your administrators and are subject to the applicable terms and conditions of such third party. Rackspace does not provide technical support for third-party products, other than specified in the agreement or agreements you have with Rackspace, and Rackspace accepts no responsibility for third-party products.

Rackspace cannot guarantee the accuracy of any information presented after the date of publication. Rackspace&reg; and other Rackspace marks are either registered service marks or service marks of Rackspace US, Inc. in the United States and other countries. All other trademarks, service marks, images, products, and brands remain the sole property of their respective holders and do not imply endorsement or sponsorship.
