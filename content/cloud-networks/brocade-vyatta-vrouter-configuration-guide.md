---
permalink: brocade-vyatta-vrouter-configuration-guide/
audit_date:
title: Brocade Vyatta vRouter configuration guide
type: article
created_date: '2014-07-30'
created_by: Sameer Satyam
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Networks
product_url: cloud-networks
---

The Brocade Vyatta vRouter is a network appliance that you can spin up in the Rackspace public cloud. It acts as a firewall, VPN gateway, router, and NAT device.

You read more about the Brocade Vyatta vRouter at the [Rackspace virtual cloud servers](http://www.rackspace.com/cloud/servers/vrouter).

The following articles provide detailed configurations for the Brocade Vyatta vrouter:

[Configuring a policy-based IPsec site-to-site VPN on a Vyatta vRouter](/how-to/vyatta-ipsec-site-to-site-vpn)

[Configure a Site-to-site VPN using the Vyatta Network Appliance](/how-to/configure-a-site-to-site-vpn-using-the-vyatta-network-appliance)

[Creating NAT rules for Vyatta vRouter](/how-to/creating-nat-rules-for-vyatta-vrouter)

[Vyatta vRouter: Allow an IP address to access the vRouter via SSH](/how-to/vyatta-vrouter-allow-an-ip-address-to-access-the-vrouter-via-ssh)

[Vyatta vRouter: Adding a local administrative user](/how-to/vyatta-vrouter-add-a-local-administrative-user)

[Vyatta vRouter: Configure an interface firewall](/how-to/vyatta-vrouter-configure-an-interface-firewall)

The following table shows the list of Rackspace supported features on the Brocade Vyatta vRouter

<table border="1">
	<tr border="1">
		<th colspan="2">Feature</th>
		<th>Support Status on Vyatta vRouter</th>
	</tr>
	<tr>
		<td rowspan="4">Routing</td>
		<td>Static routing</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>Static routing with IP SLA tracking</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Dynamic routing protocols OSPF, EIGRP</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Dynamic routing protocols - all other</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td rowspan="3">IPv6</td>
		<td>Static routing</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Static routing with IP SLA tracking</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Dynamic routing protocols</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td rowspan="5">NAT</td>
		<td>Static (one-to-one)</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>PAT (NAT overloading)</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>Policy NAT/PAT</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>DNS Doctoring</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Connection limits via static NAT</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td rowspan="2">Packet filtering</td>
		<td>Layer 3/4 filtering ingress/egress</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>FQDN based filtering</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td rowspan="25">VPN</td>
		<td>IPsec - IKEv2</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>IPsec LAN-to-LAN Layer 3/4 filtering</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>IPsec LAN-to-LAN Pre-shared keys authentication</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>IPsec LAN-to-LAN Hub and spoke configuration</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>IPsec LAN-to-LAN Cert-based authentication</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>IPsec DMVPN</td>
		<td>N/A</td>
	<tr>
		<td>IPsec remote access with Cisco Client</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with Apple OS X native IPsec client</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with Shrew Soft client</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with group authentication</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with group and user authentication</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with two-factor authentication</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access - Multiple VPN groups</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access with layer 3/4 filtering</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access - Split-tunneling</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access - all traffic through VPN (tunnel all)</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access - DNS server assignment</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access - Client certificate-based authentication</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>IPsec remote access on Windows 8</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>SSL VPN - AnyConnect</td>
		<td><strong>N/A (Supported via Open VPN SSL client)</strong></td>
	</tr>
	<tr>
		<td>SSL VPN - Certificate authentication</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>SSL VPN - Two-factor authentication</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>SSL VPN - Clientless SSL VPN</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>SSL VPN - Secure desktop</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>SSL VPN - Mobile client</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td rowspan="7">Management</td>
		<td>Buffered Logging</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>Log shipping to log correlation device within customer's account</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td>Custom logging, logging lists</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Log retention by Rackspace</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Log analysis, outside of troubleshooting an issue</td>
		<td>Not supported</td>
	</tr>
	<tr>
		<td>Direct customer access if firewall is on TACACS</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>SNMP read-only for customer</td>
		<td><strong>Supported</strong></td>
	</tr>
	<tr>
		<td rowspan="3">High Availability (HA)</td>
		<td>Active/Standby (stateful and non-stateful)</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Active/Active (stateful and non-stateful)</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Clustering of more than two units</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td rowspan="6">Modes and modules</td>
		<td>Mode - Multi-Context Routed</td>
		<td>N/A</td>
	<tr>
		<td>Mode - Routed</td>
		<td><strong>Supported</strong></td>
	<tr>
		<td>Mode - Transparent</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Modules/Configs - Threat-detection</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Modules/Configs - IPS Module</td>
		<td>N/A</td>
	</tr>
	<tr>
		<td>Modules/Configs - Cisco Unified Communications Proxy</td>
		<td>N/A</td>
	<tr>
		<td>RackConnect</td>
		<td>RackConnect VLANs termination</td>
		<td>N/A</td>
	</tr>
</table>

<p>&nbsp;</p>
