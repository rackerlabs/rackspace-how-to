---
permalink: setting-up-vyatta-vpn-with-policy-nat/
audit_date:
title: Setting Up Vyatta VPN with Policy NAT
type: article
created_date: '2013-09-03'
created_by: Sameer Satyam
last_modified_date: '2013-09-17'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

The following information will direct you in setting up your traffic
sourced from 2 of your cloud servers to appear as the public IP of your
cloud servers across the VPN tunnel only (Policy Nat).

-   **Cloud Server 1** Cloud Networks IP: 172.26.26.2
-   **Cloud Server 2** Cloud Networks IP: 172.26.26.3

In this scenario, the 2 IP addresses appear to come from the
10.255.255.x. We will present two alternative solutions for this. One
solution, we will map only the specific /32 addresses in our policy NAT.
In the second solution, we will policy NAT the entire /24 subnet to the
other /24 subnet.

### Scenario Notes

**Note:** This assumes that the cloud servers have their default gateways
pointed at the Vyatta (much in the same way a cloud server gets "rack
connected" to an ASA or an F5). If you wish to continue to your cloud
servers' public interface for Internet access and the cloud networks
interface for VPN only traffic, your server admin will need to create a
static route on the cloud server for the remote VPN encryption domain
that points at the Vyatta's cloud network IP address.

Vyatta calls their static NAT a "bi-directional NAT". So when searching
Vyatta's documentation, please keep this in mind.

### Topology

##### Local Vyatta Firewall

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Interface</strong></p></td>
<td align="left"><p><strong>IP Address</strong></p></td>
<td align="left"><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>eth0</p></td>
<td align="left"><p>166.78.184.111/24</p></td>
<td align="left"><p>public</p></td>
</tr>
<tr class="odd">
<td align="left"><p>eth1</p></td>
<td align="left"><p>172.26.26.1/24</p></td>
<td align="left"><p>INSIDE-172.26.26.0/24</p></td>
</tr>
</tbody>
</table>

#### Remote Cisco ASA Firewall

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Interface</strong></p></td>
<td align="left"><p><strong>IP Address</strong></p></td>
<td align="left"><p><strong>Description</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>eth 0/0</p></td>
<td align="left"><p><span style="line-height: 1.538em;">192.0.2.10</span>/28</p></td>
<td align="left"><p>outside</p></td>
</tr>
<tr class="odd">
<td align="left"><p>eth 0/1</p></td>
<td align="left"><p>192.168.10.1/24</p></td>
<td align="left"><p>INSIDE-192.168.10.0/24</p></td>
</tr>
<tr class="even">
<td align="left"><p>eth 0/2</p></td>
<td align="left"><p>192.168.19.1/24</p></td>
<td align="left"><p>DMZ-192.168.19.0/24</p></td>
</tr>
</tbody>
</table>

### VPN Details

#### Encryption Domains

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Local VPN Encryption Domains</strong></p></td>
<td align="left"><p><strong>Remote VPN Encryption Domains</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>INSIDE-172.26.26.0/24</p></td>
<td align="left"><p>DMZ-192.168.19.0/24</p></td>
</tr>
</tbody>
</table>

#### ISAKMP and IPSEC Settings

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Phase 1 Settings</strong></p></td>
<td align="left"><p><strong>Phase 2 Settings</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>AES-256</p></td>
<td align="left"><p>AES-256</p></td>
</tr>
<tr class="odd">
<td align="left"><p>SHA1</p></td>
<td align="left"><p>SHA1</p></td>
</tr>
<tr class="even">
<td align="left"><p>Group 5</p></td>
<td align="left"><p>PFS Group 5</p></td>
</tr>
<tr class="odd">
<td align="left"><p>86400 Seconds</p></td>
<td align="left"><p>3600 Seconds</p></td>
</tr>
</tbody>
</table>

### VPN Configuration

#### Enable the VPN daemon on the outside interface

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p># Enable the VPN daemon on the eth0 Interface<br />
set vpn ipsec ipsec-interfaces interface eth0</p></td>
</tr>
</tbody>
</table>

#### Phase 1 Define the Policies

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p># Phase 1 Settings: AES-256, SHA1, Group 5, Lifetime 86400<br />
set vpn ipsec ike-group <strong>IKE-POLICY-10</strong> lifetime 86400<br />
set vpn ipsec ike-group <strong>IKE-POLICY-10</strong> proposal 1 dh-group 5<br />
set vpn ipsec ike-group <strong>IKE-POLICY-10</strong> proposal 1 encryption aes256<br />
set vpn ipsec ike-group <strong>IKE-POLICY-10</strong> proposal 1 hash sha1</p></td>
</tr>
</tbody>
</table>

#### Phase 2 Define the ESP-GROUP (Like an ASA Transform Set)

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p># Phase 2 Settings: AES-256, SHA1, PFS Group 5, Lifetime 3600<br />
set vpn ipsec esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong> lifetime 3600<br />
set vpn ipsec esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong> mode tunnel<br />
set vpn ipsec esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong> pfs enable<br />
set vpn ipsec esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong> proposal 1 encryption aes256<br />
set vpn ipsec esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong> proposal 1 hash sha1</p></td>
</tr>
</tbody>
</table>

#### Phase 2 Define the Individual Peer Attributes

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>set vpn ipsec site-to-site peer 192.0.2.10 description &quot;VPN TO TANGO LAB ASA-5510&quot;<br />
set vpn ipsec site-to-site peer 192.0.2.10 authentication mode pre-shared-secret<br />
set vpn ipsec site-to-site peer 192.0.2.10 authentication pre-shared-secret netsecR@wks<br />
set vpn ipsec site-to-site peer 192.0.2.10 default-esp-group <strong>AES-256-SHA-PFS-GROUP-5-3600</strong><br />
set vpn ipsec site-to-site peer 192.0.2.10 ike-group <strong>IKE-POLICY-10</strong><br />
set vpn ipsec site-to-site peer 192.0.2.10 local-address 166.78.184.111</p></td>
</tr>
</tbody>
</table>

#### Phase 2 Define the Tunnel Attributes (Encryption Domains)

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p># Tunnel 1 Local Cloud Networks (Inside) to remote DMZ<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 1 allow-nat-networks disable<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 1 allow-public-networks disable<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 1 esp-group AES-256-SHA-PFS-GROUP-5-3600<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 1 local prefix 10.255.255.0/24<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 1 remote prefix 192.168.19.0/24</p>
<p># Tunnel 2 Local Cloud Networks (Inside) to remote INSIDE<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 2 allow-nat-networks disable<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 2 allow-public-networks disable<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 2 esp-group AES-256-SHA-PFS-GROUP-5-3600<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 2 local prefix 10.255.255.0/24<br />
set vpn ipsec site-to-site peer 192.0.2.10 tunnel 2 remote prefix 192.168.10.0/24</p></td>
</tr>
</tbody>
</table>

### Solution 1: Policy NAT Configuration With Individual Addresses

#### VPN NAT

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>NAT traffic bidirectionally mapping 172.26.26.2 &lt;--&gt; 10.255.255.202 and 172.26.26.3 &lt;--&gt; 10.255.255.203</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p># Rule 10 - <strong>NAT 172.26.26.2 &lt;--&gt; 10.255.255.2 when traffic is destined for the remote VPN encryption domain</strong><br />
set nat <strong>destination</strong> rule 10 description &quot;172.26.26.2 - 10.255.255.202 Policy Nat&quot;<br />
set nat <strong>destination</strong> rule 10 source address 192.168.19.0/24<br />
set nat <strong>destination</strong> rule 10 destination address 10.255.255.202<br />
set nat <strong>destination</strong> rule 10 inbound-interface eth0<br />
set nat <strong>destination</strong> rule 10 translation address 172.26.26.2<br />
set nat <strong>source</strong> rule 10 description &quot;172.26.26.2 - 10.255.255.202 Policy Nat&quot;<br />
set nat <strong>source</strong> rule 10 outbound-interface eth0<br />
set nat <strong>source</strong> rule 10 source address 172.26.26.2<br />
set nat <strong>source</strong> rule 10 destination address 192.168.19.0/24<br />
set nat <strong>source</strong> rule 10 translation address 10.255.255.202</p>
<p># Rule 20 - <strong>NAT 172.26.26.3 &lt;--&gt; 10.255.255.3 when traffic is destined for the remote VPN encryption domain</strong><br />
set nat <strong>destination</strong> rule 20 description &quot;172.26.26.3 - 10.255.255.203 Policy Nat&quot;<br />
set nat <strong>destination</strong> rule 20 source address 192.168.19.0/24<br />
set nat <strong>destination</strong> rule 20 destination address 10.255.255.203<br />
set nat <strong>destination</strong> rule 20 inbound-interface eth0<br />
set nat <strong>destination</strong> rule 20 translation address 172.26.26.3<br />
set nat <strong>source</strong> rule 20 description &quot;172.26.26.3 - 10.255.255.203 Policy Nat&quot;<br />
set nat <strong>source</strong> rule 20 outbound-interface eth0<br />
set nat <strong>source</strong> rule 20 source address 172.26.26.3<br />
set nat <strong>source</strong> rule 20 destination address 192.168.19.0/24<br />
set nat <strong>source</strong> rule 20 translation address 10.255.255.203</p>
<p># Rule 50 - <strong>PAT all other traffic from 172.26.26.0/24 as the outside interface's IP Address</strong> (Outside PAT Overload)<br />
# Note that this traffic would not be destined for the VPN but for unencrypted Internet traffic<br />
set nat source rule 50 description &quot;POLICY PAT INSIDE TO Internet&quot;<br />
set nat source rule 50 outbound-interface eth0<br />
set nat source rule 50 source address 172.26.26.0/24<br />
set nat source rule 50 translation address masquerade</p></td>
</tr>
</tbody>
</table>

### Solution 2: Policy NAT Subnet to Subnet

#### VPN NAT

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>NAT traffic bidirectionally mapping the entire subnets 172.26.26.0/24 &lt;--&gt; 10.255.255.0/24<br />
eg: 172.26.26.2 &lt;--&gt; 10.255.255.2 and 172.26.26.3 &lt;--&gt; 10.255.255.3</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p># Rule 10 - <strong>NAT 172.26.26.0/24 &lt;--&gt; 10.255.255./24 when traffic is destined for the remote VPN encryption domain</strong><br />
set nat <strong>destination</strong> rule 10 description &quot;172.26.26.0/24 - 10.255.255.0/24 Policy Nat&quot;<br />
set nat <strong>destination</strong> rule 10 source address 192.168.19.0/24<br />
set nat <strong>destination</strong> rule 10 destination address 10.255.255.0/24<br />
set nat <strong>destination</strong> rule 10 inbound-interface eth0<br />
set nat <strong>destination</strong> rule 10 translation address 172.26.26.0/24<br />
set nat <strong>source</strong> rule 10 description &quot;172.26.26.0/24 - 10.255.255.0/24 Policy Nat&quot;<br />
set nat <strong>source</strong> rule 10 outbound-interface eth0<br />
set nat <strong>source</strong> rule 10 source address 172.26.26.0/24<br />
set nat <strong>source</strong> rule 10 destination address 192.168.19.0/24<br />
set nat <strong>source</strong> rule 10 translation address 10.255.255.0/24</p>
<p># Rule 50 - <strong>PAT all other traffic from 172.26.26.0/24 as the outside interface's IP Address</strong> (Outside PAT Overload)<br />
# Note that this traffic would not be destined for the VPN but for unencrypted Internet traffic<br />
set nat source rule 50 description &quot;POLICY PAT INSIDE TO Internet&quot;<br />
set nat source rule 50 outbound-interface eth0<br />
set nat source rule 50 source address 172.26.26.0/24<br />
set nat source rule 50 translation address masquerade</p></td>
</tr>
</tbody>
</table>
