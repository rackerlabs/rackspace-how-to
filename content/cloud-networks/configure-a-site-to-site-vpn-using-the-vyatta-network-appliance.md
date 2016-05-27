---
permalink: configure-a-site-to-site-vpn-using-the-vyatta-network-appliance/
audit_date:
title: Configure a Site-to-site VPN using the Vyatta Network Appliance
type: article
created_date: '2013-01-18'
created_by: Sameer Satyam
last_modified_date: '2015-09-29'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

### Introduction

Using a Vyatta Appliance, you can establish a secure site-to-site VPN connection connection between your cloud infrastructure at any Rackspace site and your data center or existing IT infrastructure location.

This site-to-site VPN connection enables you to extend your IT infrastructure to the Rackspace Cloud and "burst" extra compute requirements into the Rackspace Cloud.

Vyatta supports both policy-based and route-based VPNs. In this article we show you how to configure a policy-based VPN on the Vyatta.

Click the link for a [comprehensive guide to VPN configuration on the Vyatta](https://54712289bdd910def82d-5cc7866f7aae0a382278b5bce7412a4a.ssl.cf1.rackcdn.com/Vyatta-VPN_6.5R1_v01.pdf).

For guidance on configuring the relevant firewall rules to allow VPN traffic on the Vyatta please refer to the following article:

[Configuring interface-based firewall on the Vyatta Network appliance](/how-to/configuring-interface-based-firewall-on-the-vyatta-network-appliance)

### IPsec on Vyatta

There are three main components of the Internet Protocol security (IPsec) architecture:

- The Authentication Header (AH) protocol
- The Encapsulating Security Payload (ESP) protocol
- The Internet Key Exchange (IKE) protocol, formerly referred to as ISAKMP/Oakley

Of these protocols, the Vyatta Appliance currently supports ESP, which encrypts the packet payload and prevents it from being monitored; and IKE, which provides a secure method of exchanging cryptographic keys and negotiating authentication and encryption methods.

The following diagram shows a site-to-site VPN connection between two sites. For simplicity ,we show the configuration of Site-to-site VPN between two Rackspace sites (both using Vyatta).

<img alt="" border="2" height="299" src="{% asset_path cloud-networks/configure-a-site-to-site-vpn-using-the-vyatta-network-appliance/Site%20to%20Site%20VPN_0.png %}" width="629" />

### Site-to-Site VPN Configuration Checklist

To successfully implement an IPsec VPN site-to-site connection, you must complete the following configurations on both IPsec endpoints:

- Configure the interface and IP address.
- Enable the interface for IPsec VPN.
- Configure the peer.
- Define the IKE group specified in the peer configuration.
- Configure the VPN tunnel.
- Define the ESP group specified in the tunnel.
- Configure the local IP address specified for the peer on the VPN-enabled interface.
- If NAT is configured for outbound internet Access, make sure to exclude the site-to-site VPN connection from NAT.

### Configure a Site-to-Site VPN

This article describes how to configure a site-to-site VPN using two Vyatta Appliances.

You can configure a site-to-site VPN for any of the following Cloud datacenters: (DFW - Dallas), (ORD - Chicago), (IAD - Virginia), (HKG - Hong Kong), and (SYD - Sydney). In this example, we assume that one appliance is located in the DFW datacenter and the other is the ORD datacenter.

To complete this configuration, you'll perform the following steps:

1. Enable the VPN on the Vyatta Appliance in the DFW datacenter
2. Configure an IKE Group on the Vyatta Appliance in DFW datacenter
3. Configure an ESP Group on the Vyatta Appliance in DFW datacenter
4. Create the connection to the Vyatta Appliance in the ORD datacenter
5. Configure Vyatta-ORD
6. Verify tunnel status
7. Exclude site-to-site VPN from NAT (only needed if Source NAT is/will be configured for outbound internet access)


#### Step 1. Enable the VPN on the Vyatta-DFW

**Note:** `eth0` is the public interface enabled for IPsec.

1. Log onto the Vyatta Appliance using ssh:

        ssh vyatta@64.X.X.101

	Where  64.x.x.101 is the IP address of the Vyatta appliance. You'll see a Welcome to Vyatta message and a prompt to enter your Vyatta password.

	Once you're logged into the appliance, you can enter a ? or press the Tab key for help.

2. Enter configuration mode:

        vyatta@vyatta: configure
        vyatta@vyatta#

    The # symbol indicates you're in configuration mode.

3. Enable VPN on eth0 on Vyatta-DFW:

        set vpn ipsec ipsec-interfaces interface eth0

4. View the IPsec interface configuration:

        vyatta@vyatta# show vpn ipsec ipsec-interfaces
        interface eth0

**Note**: Do not issue the commit command yet.

#### Step 2. Configure the IKE Group on Vyatta-DFW

The IKE group allows you to pre-define a set of one or more proposals to be used in IKE Phase 1 negotiation, after which the ISAKMP security association (SA) can be set up. For each proposal in the group, the following information is defined:

- The cipher that encrypts packets during IKE Phase
- The hash function that authenticates packets during IKE Phase 1
- Lifetime of the association

In this example we create IKE group IKE-1W on Vyatta-DFW. This IKE group contains two proposals:

- Proposal 1 uses AES-256 as the encryption cipher and SHA-1 as the hash Algorithm
- Proposal 2 uses AES-128 as the encryption cipher and SHA-1 as the hash algorithm (optional)

The lifetime of a proposal from this IKE group is set to 3600 seconds.

1. Run the following command to check existing IKE parameters before proceeding further:

        show vpn ipsec ike-group

2. Create the configuration node for proposal 1 of IKE group IKE- 1W:

        set vpn ipsec ike-group IKE-1W proposal 1

3. Set the encryption cipher for proposal 1:

        set vpn ipsec ike-group IKE-1W proposal 1 encryption aes256

4. Set the hash algorithm for proposal 1:

        set vpn ipsec ike-group IKE-1W proposal 1 hash sha1

5. Set the lifetime for the whole IKE group:

        set vpn ipsec ike-group IKE-1W lifetime 3600

6. View the IKE group:

        show vpn ipsec ike-group IKE-1W

	    lifetime 3600
	     proposal 1
		     encryption aes256
			 hash sha1
        }
	    proposal 2
    	    encryption aes128
			hash sha1
		}

**Note**: Do not issue the commit command yet.

#### Step 3. Configure the ESP GROUP on Vyatta-DFW

In this example we create an ESP group ESP-1W on Vyatta-DFW. This ESP group contains two proposals:

- Proposal 1 uses AES-256 as the encryption cipher and SHA-1 as the hash algorithm
- Proposal 2 uses Triple-DES as the encryption cipher and MD5 as the hash algorithm (optional)

The lifetime of a proposal from this ESP group is set to 1800 seconds.

1. Create the configuration node for proposal 1 of ESP group IKE- 1W:

		set vpn ipsec esp-group ESP-1W proposal 1

2. Run the following command to check existing ESP parameters before proceeding further:

        show vpn ipsec esp-group

3. Set the encryption cipher for proposal 1:

		set vpn ipsec esp-group ESP-1W proposal 1 encryption aes256

4. Set the hash algorithm for proposal 1:

		set vpn ipsec esp-group ESP-1W proposal 1 hash sha1

5. Set the lifetime for the whole ESP group:

		set vpn ipsec esp-group ESP-1W lifetime 1800

6. View the ESP group:

		show vpn ipsec esp-group ESP-1W

		lifetime 1800{
			proposal 1
			encryption aes256
			hash sha1
		}
		proposal 2 {
			encryption 3des
			hash sha1
		}

**Note**: Do not issue the commit command yet.

#### Step 4. Create the Connection to the Remote Site, Vyatta-ORD

##### Site to Site Connection Checklist

- The IP address of the remote peer.
- The authentication mode that the peers will use to authenticate one another (PSK will be used)
- The IKE group to be used in the connection.
- The ESP group to be used in the connection.
- The IP address on this Vyatta system to use for the tunnel.
- The communicating CIDR or host for each end of the tunnel (Isolated network on the cloud servers) .

Complete the following steps:

1. Configure the peer. The address 198.x.x.101 is the remote peer's IP address

        edit vpn ipsec site-to-site peer 198.x.x.101

2. Set authentication mode:

		set authentication mode pre-shared-secret

3. Provide the string that will be used to generate encryption keys:

		set authentication pre-shared-secret SECRET

4. Specify the default ESP group for all tunnels:

		set default-esp-group ESP-1W

5. Specify the IKE group:

		set ike-group IKE-1W

6. Identify the IP address on this Vyatta system (local) to be used for this connection:

		set local-address 64.x.x.101

7. Create a tunnel configuration, and provide the local subnet for this tunnel:

		set tunnel 1 local prefix 192.168.1.0/24

8. Provide the remote subnet for the tunnel:

		set tunnel 1 remote prefix 192.168.3.0/24

9. Return to the top of the configuration tree:

		top

10. Now issue the commit command:

		commit

#### Step 5. Configure Vyatta-ORD

To complete this configuration, repeat the same steps on the Vyatta Appliance in the ORD datacenter, using the correct IP addressing, ESP, and IKE. This configuration includes the following steps:

- Enable the VPN on the Vyatta Appliance in the ORD datacenter.
- Configure an IKE Group on the Vyatta Appliance in ORD datacenter.
- Configure an ESP Group on the Vyatta Appliance in ORD datacenter.
- Create the connection to the Vyatta Appliance in the DFW datacenter.

Use the previous sections to complete the configuration on Vyatta-ORD, then return to Step 6 below.

#### Step 6. Verify the Tunnel Status

With both Vyatta Appliances configured, you can verify the tunnel status.

Verify tunnel is up:

    vyatta@vyatta:~$ show vpn ipsec sa

    Peer ID / IP                            Local ID / IP

    ------------                            -------------

    198.x.x.101                          64.x.x.101


        Tunnel  State  Bytes Out/In   Encrypt  Hash  NAT-T  A-Time  L-Time  Proto
        ------  -----  -------------  -------  ----  -----  ------  ------  -----
        1       up     0.0/0.0        aes256   sha1  no     906     1800    all

Verify the tunnel status:

    vyatta@vyatta:~$ show vpn ipsec status
    IPSec Process Running PID: 13088

    1 Active IPsec Tunnels

    IPsec Interfaces :
            eth0    (64.x.x.101)

#### Step 7. Exclude site-to-site VPN traffic from NAT

This configuration will be needed if you are using Vyatta to [perform outbound NAT for internet access](/how-to/enable-internet-access-on-cloud-servers-using-snat-on-a-vyatta-network-appliance).

In case Source NAT has been configured already or needs to be configured, the following configuration needs to be applied so that the VPN traffic doesn't get translated on the Vyatta.

The below configuration assumes Source NAT rule 10 was configured already. Rule 10 translates all traffic going out eth0 to use the IP address of the Public interface on the Vyatta as the Source IP for traffic sourced from 192.168.1.0/24. Since this NAT rule would break traffic that needs to go across the VPN , we need to add Rule 5 (since NAT rules are read sequentially) so that this traffic is excluded from NAT. (See "exclude" keyword" below). Here 192.168.3.0/24 is the remote prefix and 192.168.1.0/24 is the local prefix.

    set nat source rule 5 destination address '192.168.3.0/24'
    set nat source rule 5 'exclude'
    set nat source rule 5 outbound-interface 'eth0'
    set nat source rule 5 source address '192.168.1.0/24'

Original NAT rule 10 for Outbound/Internet traffic:

    set nat source rule 10 outbound-interface 'eth0'
    set nat source rule 10 source address '192.168.1.0/24'
    set nat source rule 10 translation address 'masquerade'
    commit
