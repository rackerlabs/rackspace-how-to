---
node_id: 4236
title: Vyatta IPsec site-to-site VPN
type: article
created_date: '2014-09-11'
created_by: Rose Contreras
last_modified_date: '2015-02-19'
last_modified_by: Rose Contreras
product: Cloud Networks
product_url: cloud-networks
---

You can use two methods to configure an Internet Protocol Security (IPsec) site-to-site VPN on a Vyatta vRouter: policy-based and route-based. Rackspace supports only the policy-based method, and this article explains how to use that method.

This is an example of a site-to-site VPN configuration with a Vyatta firewall on the Rackspace side and a Cisco firewall on the customer side (data center or another remote location).

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-1.png)

### NAT and IPsec

Network Address Translation (NAT) and the IPsec engine work the same on the Vyatta vRouter as a Cisco Adaptive Security Appliance (ASA) in that NAT happens before the interesting traffic is evaluated for encryption by the IPsec engine. The reverse is also true: when a packet is received via the VPN tunnel, the packet is decrypted before it goes to the NAT engine. Policy NAT and Policy Port Address Translation (PAT) for site-to-site VPN tunnels is also possible. See [Creating NAT rules for Vyatta vRouter](/how-to/creating-nat-rules-for-vyatta-vrouter) for the current standards for NAT rule numbering.

### Outbound PAT

Assume that there is an outbound PAT policy whereby all server traffic coming from the inside segment goes through PAT to the vRouter's public IP address for Internet-bound traffic. [Be sure to refer to the example.]

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-2_0.png)

### NAT bypass

You need to bypass the preceding PAT policy for VPN traffic only. The easiest way to accomplish this is to use the `exclude` command in all of your NAT or PAT statements for the remote encryption domains. Note that these NAT rule numbers need to be lower than the PAT or NAT rule that you are trying to bypass. The order of the NAT or PAT statements is very important.

**Example of NAT bypass**

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-3_1.png)

### IPsec VPN configuration

**Note:** The default kickstart configuration populates the most common phase 1 and phase 2 settings. Be sure to check the existing configuration for required settings.

**ISAKMP and IPsec requirements**

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-4_0.png)

#### Phase 1 configuration

If the kickstart configuration does not provide the combination of Phase 1 and Phase 2 settings that you require, you can use the following options to create new Phase 1 and Phase 2 settings.

- If the required lifetime value is already part of an  IKE group, you can create a new proposal within that IKE group, as shown in the following example:

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-5_0.png)

- If you require a different lifetime value than any configured, then you would require a new IKE group, as shown in the following example:

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-6_0.png)

#### Phase 2 configuration

-  ESP group

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-7_0.png)

-  IPsec peer (tunnel group)

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-8_0.png)

-  Interesting traffic for IPsec peer

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-10_0.png)

#### The complete configuration

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-11_1.png)

### Verify the tunnels

-  Phase 1 SA

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-12_0.png)

-  Phase 2 SA

  ![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/884-13.png)
