---
permalink: site-to-site-ipsec-vpn-connection-between-vyatta-and-fortigate
audit_date:
title: Site-to-Site IPsec VPN Connection between Vyatta and Fortigate
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Site-to-Site IPsec VPN Connection between Vyatta router appliance and Fortigate

Here we are going to see about Site - to -Site IPsec VPN connection between Vyatta router ( Racspace) and Fortigate with Dynamic DNS name. Usually to configure IPsec VPN between to end points need a Static IP address on both ends. But Vyatta Server appliance have option to configure DynamicDNS name to configure VPN.
In the below image, lets take Left side as Point A ( Rackspace Vyatta Router appliance ) and right as Point B (Fortigate with dynamic IP and DDNS name ).
Fortigate have option to create our DDNS name 
To configure DDNS name in Fortigate refer this URL http://video.fortinet.com/video/64/how-to-setup-ddns-on-an-fortigate-device 
Point A ( Vyatta Router )                                                                                               Point B ( Fortigate with dynamic IP and DDNS name)
Point A :
Device : Vyatta Router Appliance at Rackspace

eth0     : 134.213.135.XXX ( Public IP )
eth1     : 10.181.200.XXX ( Private IP )
Point B :-
Device : Fortigate Firewall

wan1   : Dynamic IP with DDNS name forti.fortiddns.com
internal : 192.168.10.0/24 ( LAN Subnet ) 
Once successful Site - to - Site IPsec  VPN tunnel connection has been established between Vyatta and Fortigate. From any internal IP (eg 192.168.1.7) ping Vyatta router Private IP ( 10.181.200.xx).
Step 1) Configure IPsec VPN in Vyatta router appliance in Rackspace
i) Login to Vyatta server through ssh.
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
Till now we set the Proposal IKE and ESP group with hash algorithm.
Now we proceed with IPsec Connection Key and DDNS settings:-
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

vyatta@cloud-server-09# set local-address 134.213.XX.XX                                         // Public IP of Vyatta

[edit vpn ipsec site-to-site peer forti.fortiddns.com]

vyatta@cloud-server-09# set tunnel 1 local prefix 10.181.XX.XX/19                           // Vyatta  Private subnet IP

[edit vpn ipsec site-to-site peer forti.fortiddns.com]

vyatta@cloud-server-09# set tunnel 1 remote prefix 192.168.1.0/24                          // LAN subnet behind Fortigate

    vyatta@cloud-server-09# top
    vyatta@cloud-server-09# commit
    vyatta@cloud-server-09# show vpn ipsec site-to-site peer  // To view the IPsec configurations
Step 2) Configure IPsec VPN configuration in Fortigate Firewall:-
i) Login to Fortigate firewall as admin user

ii) Navigate to VPN -->IPsec -->Tunnel --> Create new --> Custom VPN Tunnel
iii) Give name as RSVPN . Select Static IP address and enter Public IP of Vyatta in IP Address column.
iv) IN authentication select Pre-shared Key and enter the Key as test_test_111. The Preshared key should be same both Vyatta and Fortigate.
    IKE version should be 1 and Mode = Main.
v) Here 3 encryptions are compulsion
    AES128 ,Authentication SHA1

    AED256 ,Authentication SHA1
    3DES ,Authentication MD5
    Diffie-Hellman Groups 14,5,2
    KeyLifetime 3600
vi) Local Address is the address of LAN . Remote address is Vyatta appliance private subnet IP.
    AES128 ,Authentication SHA1

    AED256 ,Authentication SHA1
    3DES ,Authentication MD5
    Diffie-Hellman Groups 14,5,2
    KeyLifetime 3600
vii) Go to network add static route  10.181.192.0/19 ( subnet of Vyatta appliance )
