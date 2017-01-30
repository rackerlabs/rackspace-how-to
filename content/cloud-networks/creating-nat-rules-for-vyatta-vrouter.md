---
permalink: creating-nat-rules-for-vyatta-vrouter/
audit_date:
title: Creating NAT rules for Vyatta vRouter
type: article
created_date: '2015-01-26'
created_by: Rose Contreras
last_modified_date: '2015-02-18'
last_modified_by: Rose Contreras
product: Cloud Networks
product_url: cloud-networks
---

This article provides information about Rackspace specific operations, standards, and configuration examples for the network address translation (NAT) features of the Brocade Vyatta vRouter.

### Terminology

The following terms are used in this article:

**NAT:** Network address translation, which [provide a brief description here].

**PAT:** Port address translation (also known as NAT overload), which [provide a brief description here].

**Source NAT (SNAT):** NAT that changes the source IP address, port number, or both as the packet egresses an interface.

**Masquerade:** A specific form of SNAT that uses an IP address assigned to the egress interface.

**Destination NAT (DNAT):** NAT that changes the destination IP address, port number, or both as the packet ingresses an interface.

**Bidirectional NAT:** A combination of both a SNAT and a DNAT.

**NAT exclusion:** The equivalent to a NAT exemption or no NAT.

### Order of operations

The following diagram illustrates how DNAT and SNAT are processed at different stages of packet processing. It is important to know this because firewall rules must be created using the correct, either pre-NAT or post-NAT, addresses and ports. Because DNAT is processed first and SNAT is processed last, traffic that is subject to NAT most likely needs to be identified by using the real IP address of the host.

<img src="{% asset_path cloud-networks/creating-nat-rules-for-vyatta-vrouter/883-1_0.png %}" width="780" height="368" border="1" alt=""  />

### Important NAT notes

- The vRouter does not prefer one NAT function over another. It processes the first match and then stops.

- Rule number indicates the location of a NAT configuration in the list, starting with the lowest rule number being processed first.

- "Static" or "bidirectional" configurations don't specifically exist. For bidirectional traffic, you need a SNAT rule and a DNAT rule that mirror each other.

- SNAT and DNAT rule lists are not tied to each other.

- Keep bidirectional rule numbers the same for source and destination rules.

- Avoid using the masquerade source NAT feature.

### Rule numbering convention

The rule number increments in sets of 10 to allow for additions without having to renumber rules. The specific NAT types are organized in number ranges that you can use as a guideline and for best practices. However, these number ranges can be changed.

- **10-190** policy NAT/PAT

- **200-290** NAT exclusion

- **300-390** bidirectional/unidirectional PAT

- **400-490** bidirectional NAT

- **500** default PAT to Internet

### Configuration examples

**Policy NAT**

    set nat destination rule 100 description "Policy NAT for VPN"
    set nat destination rule 100 destination address '192.168.144.0/24'
    set nat destination rule 100 inbound-interface 'eth0'
    set nat destination rule 100 source address '192.168.10.0/24'
    set nat destination rule 100 translation address '192.168.244.0/24'

    set nat source rule 100 description "Policy NAT for VPN"
    set nat source rule 100 destination address '192.168.10.0/24'
    set nat source rule 100 outbound-interface 'eth0'
    set nat source rule 100 source address '192.168.244.0/24'
    set nat source rule 100 translation address '192.168.144.0/24'


**Policy PAT**

	set nat source rule 110 description "POLICY PAT INSIDE TO VPN"
	set nat source rule 110 outbound-interface 'eth0'
	set nat source rule 110 source address '192.168.244.0/24'
	set nat source rule 110 translation address '192.168.145.100'

	set nat source rule 120 description "POLICY PAT DMZ TO VPN"
	set nat source rule 120 outbound-interface 'eth0'
	set nat source rule 120 source address '192.168.245.0/24'
	set nat source rule 120 translation address '192.168.145.50'


**NAT exclusion**

	set nat destination rule 200 description "NAT Exclude for VPN PEER 1.1.1.1"
	set nat destination rule 200 destination address '10.10.10.0/24'
	set nat destination rule 200 exclude
	set nat destination rule 200 outbound-interface 'eth0'


**Destination PAT**

	set nat destination rule 300 description "CLOUD Server WEB1 Public PAT 8080 to 80"
	set nat destination rule 300 destination address '7.7.7.7'
	set nat destination rule 300 destination port '8080'
	set nat destination rule 300 inbound-interface 'eth0'
	set nat destination rule 300 protocol 'tcp'
	set nat destination rule 300 translation address '192.168.244.7'
	set nat destination rule 300 translation port '80'


**Source PAT**

	set nat source rule 300 description "CLOUD Server WEB1 Public PAT 80 to 8080"
	set nat source rule 300 source address '192.168.244.7'
	set nat source rule 300 source port '80'
	set nat source rule 300 inbound-interface 'eth0'
	set nat source rule 300 protocol 'tcp'
	set nat source rule 300 translation address '7.7.7.7'
	set nat source rule 300 translation port '8080'


**Bidirectional NAT (static)**

	set nat source rule 400 description "CLOUD Server Static WEB1"
	set nat source rule 400 outbound-interface 'eth0'
	set nat source rule 400 protocol 'all'
	set nat source rule 400 source address '192.168.244.7'
	set nat source rule 400 translation address '7.7.7.7'

	set nat destination rule 400 description "CLOUD Server Static WEB1"
	set nat destination rule 400 destination address '7.7.7.7'
	set nat destination rule 400 inbound-interface 'eth0'
	set nat destination rule 400 protocol 'all'
	set nat destination rule 400 translation address '192.168.244.7'

**Outbound PAT to Internet**

	set nat source rule 500 description 'DEFAULT PAT TO INTERNET'
	set nat source rule 500 outbound-interface 'eth0'
	set nat source rule 500 protocol 'all'
	set nat source rule 500 source address '0.0.0.0/0'
	set nat source rule 500 translation address '<IP_address_of_interface>'

### Troubleshooting

Following are some NAT troubleshooting commands with ASA equivalent (when available).

<table>
	<tr>
		<th><strong>NAT troubleshooting command</strong></th>
		<th><strong>Equivalent ASA command</strong></th>
	</tr>
	<tr>
		<td><code>show nat &lt;source/destination&gt; rules</code></td>
		<td><code>sh run nat</code></td>
	</tr>
	<tr>
		<td><code>show nat &lt;source/destination&gt; translation</code></td>
		<td><code>sh xlate</code></td>
	</tr>
	<tr>
		<td><code>show nat &lt;source/destination&gt; statistics</code></td>
		<td><strong>None</strong</td>
	</tr>
	<tr>
		<td><code>show conntrack table &lt;ipv4/ipv6&gt;</code></td>
		<td><code>show connection</code></td>
	</tr>
	<tr>
    	<td><code>show conntrack table &lt;ipv4/ipv6&gt; conn-id &lt;conn_id_number&gt;</code></td>
		<td><strong>None</strong></td>
	</tr>
	<tr>
		<td><code>delete conntrack table &lt;ipv4/ipv6&gt; source &lt;address&gt; [&lt;destination_address&gt;]</code></td>
		<td><code>clear connection address</code></td>
	</tr>
</table>
