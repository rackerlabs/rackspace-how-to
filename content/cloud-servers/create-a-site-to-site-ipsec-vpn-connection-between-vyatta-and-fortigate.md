---
permalink: create-a-site-to-site-ipsec-vpn-connection-between-vyatta-and-fortigate/
audit_date: '2019-01-18'
title: Create a site-to-site IPsec VPN connection between Vyatta and FortiGate
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to create a site-to-site Internet Protocol Security
(IPsec) virtual private network (VPN) connection between a Vyatta&reg; router
(Rackspace) and FortiGate&reg; by using a dynamic Domain Name System (DDNS)
name. Configuring an IPsec VPN between two end points typically requires a
static Internet Protocol (IP) address on both ends. However, the Vyatta server
appliance has an option to configure a DDNS name to configure a
VPN.

The following table shows the left side as point A (the Rackspace Vyatta
router appliance) and the right side (FortiGate with a 
dynamic IP address and DDNS name) as point B:

<table>
  <tr>
    <th>Point A (Vyatta router)</th>
    <th>Point B (FortiGate with a dynamic IP address and DDNS name)</th>
  </tr>
  <tr>
    <td>
      <strong>Device</strong>: Vyatta router appliance at Rackspace<br />
      <strong>eth0</strong>: 134.213.135.XXX (public IP)<br />
      <strong>eth1</strong>: 10.181.200.XXX (private IP)
    </td>
    <td>
      <strong>Device</strong>: Fortigate firewall<br />
      <strong>wan1</strong>: Dynamic IP with the DDNS name forti.fortiddns.com<br />
      <strong>internal</strong>: 192.168.10.0/24 (local area network (LAN) subnet)
    </td>
  </tr>
</table>

After you successfully establish a site-to-site IPsec VPN tunnel connection
between Vyatta and FortiGate, you can ping the Vyatta router's private IP
address (such as 10.181.200.XXX) from any internal IP address
(such as 192.168.1.7).

FortiGate enables you to create a DDNS name. To learn how to configure a DDNS
name in FortiGate, see [How to set up DDNS on a FortiGate device](https://video.fortinet.com/latest/how-to-setup-ddns-on-an-fortigate-device).

### Step 1: Configure the IPsec VPN in the Vyatta router appliance

Use the following steps to configure the IPsec VPN in the Vyatta router
appliance:

1. Log in to the Vyatta server by using Secure Shell (SSH), as shown in the
   following example:

       $ssh vyatta@cloud-server-09
       vyatta@cloud-server-09:~$ show interfaces ethernet                        //Get interface IP details
       $configure                                                                                         //Move to configuration mode
       vyatta@cloud-server-09# set vpn ipsec ipsec-interfaces interface eth0
       [edit]
       vyatta@cloud-server-09# show vpn ipsec ipsec-interfaces
       +interface eth0
       [edit]
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS proposal 1
       [edit]
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS proposal 1 encryption aes256
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS proposal 1 hash sha1
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS proposal 2 encryption aes128
       [edit]
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS proposal 2 hash sha1
       [edit]
       vyatta@cloud-server-09# set vpn ipsec ike-group IKE-RS lifetime 3600
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS proposal 1
       [edit]
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS proposal 1 encryption aes256
       [edit]
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS proposal 1 hash sha1
       [edit]
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS proposal 2 encryption 3des
       [edit]
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS proposal 2 hash md5
       [edit]
       vyatta@cloud-server-09# set vpn ipsec esp-group ESP-RS lifetime 3600
       [edit]

2. Configure the IPsec connection key and DDNS settings, as shown in the
   following example:

       vyatta@cloud-server-09# set vpn ipsec site-to-site peer forti.fortiddns.com authentication mode pre-shared-secret       // Replace forti.fortiddns.com with your DDNS name
       [edit]
       vyatta@cloud-server-09# edit vpn ipsec site-to-site peer forti.fortiddns.com
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set authentication pre-shared-secret test_test_111               // Use the same in key at Fortigate end
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set default-esp-group ESP-RS
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set ike-group IKE-RS
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set local-address 134.213.XX.XX                                         // Public IP of the Vyatta router appliance
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set tunnel 1 local prefix 10.181.XX.XX/19                           // Vyatta  Private subnet IP
       [edit vpn ipsec site-to-site peer forti.fortiddns.com]
       vyatta@cloud-server-09# set tunnel 1 remote prefix 192.168.1.0/24                          // LAN subnet behind Fortigate
       vyatta@cloud-server-09# top
       vyatta@cloud-server-09# commit

       vyatta@cloud-server-09# show vpn ipsec site-to-site peer  // To view the IPsec configurations

### Step 2: Configure the IPsec VPN in the FortiGate firewall

Use the following steps to configure the IPsec VPN in the FortiGate firewall:

1. Log in to the FortiGate firewall as an administrative user.
2. Select **VPN > IPsec > Tunnel > Create new > Custom VPN Tunnel**.
3. In the **Name** field, enter **RSVPN**.
4. Select **Static IP address** and enter the public IP address of the Vyatta
   router appliance in the **IP Address** column.
5. In the **Authentication** section, select **Pre-shared Key** and enter the
   key as **test_test_111**. The preshared key should be same in Vyatta and
   FortiGate.

6. Ensure that the Internet Key Exchange version (**IKE version**) is **1**
   and the **Mode** is set to **Main**.

7. You must use the following encryptions and settings:

   - Advanced Encryption Standard 128 (AES128), with authentication set to
     Secure Hash Algorithm 1 (SHA1)
   - AES256, with authentication set to SHA1
   - Triple DES (3DES), with authentication set to message digest
     algorithm 5 (MD5)

   You must also use the following settings:

   - **Diffie-Hellman (DH) Groups**: 14,5, and 2
   - **Key lifetime**: 3600 seconds

8. The **Local Address** is the address of the LAN. The **Remote Address** is
   the Vyatta appliance's private subnet IP. Use the following encryptions and
   settings:

   - AES128, with authentication set to SHA1
   - AES256, with authentication set to SHA1
   - 3DES, with authentication set to MD5

   You must also use the following settings:

   - **DH Groups**: 14,5, and 2
   - **Key Lifetime**: 3600 seconds

9. Select **Network** and add static route **10.181.192.0/19** (the
   subnet of the Vyatta appliance).

10. Add a firewall policy that allows traffic between the two private subnets.

11. Finally, select **VPN > Monitor > IPsec Monitor** and verify that the
    **Status** displays as **UP**.
