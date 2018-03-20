---
permalink: firewall-manager-v2-access-list-theory-and-best-practices/
audit_date: '2018-03-20'
title: Firewall Manager v2 access-list theory and best practices
type: article
created_date: '2017-03-23'
created_by: Trevor Becker
last_modified_date: '2018-03-20'
last_modified_by: Kate Dougherty
product: Dedicated Hosting
product_url: dedicated-hosting
---

Before you modify your environment's access-list rules in Firewall Manager v2, you should be familiar with access control list (ACL) theory and best practices.

Firewall Manager v2 is a tool within the MyRackspace portal. To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Firewall Manager v2 access-list process

To learn more about the access-list process, see [Firewall Manager v2 access-list rules](/how-to/firewall-manager-v2-access-list-rules).

### What is an ACL?

Access control lists (ACLs), or *access-lists*, enable Cisco firewalls to filter traffic. They provide environments with network access control (NAC) by filtering network traffic and controlling whether packets are forwarded or blocked at the firewall's interfaces. As an aspect of the deep-packet-inspection process, Cisco firewalls perform this access control lookup for each packet that attempts to traverse one of its interfaces.

The access-lists control the traffic that attempts to enter the internal networks from an external, unsecured network. If access-lists are not used, the Cisco firewall's default security policy of _security-levels_ is active, which does not provide the highest level of network security.

### What is an access control entry?

An access control entry (ACE) is an individual entry in an ACL. ACEs are referred to as _rules_ in Firewall Manager v2. The Cisco firewall allows you to configure only one access-list per interface per direction. This access-list can contain as many ACEs, or rules, as necessary.

### Access-list best practices and recommendations

The security of your Rackspace environment begins at your Cisco firewall. Misconfigurations in network access policies on your firewall can lead to unwanted network exposure and potential compromise. To remain secure and follow compliance requirements, use the following best practices and recommendations:

   - Minimize the size of the source and destination traffic in your access-list rules when possible. Be as specific as possible. Do not define the destination as **any** (your entire Rackspace environment) when only one destination server needs to be accessed.

   - Do not allow traffic from any source to any destination of the IP, TCP, or UDP protocols. (Do not use **permit ip any any**, **permit tcp any any**, or **permit udp any any**.) Allowing traffic to these destinations effectively turns your security platform into a router because it will not block any packets from reaching any destination in your environment over those protocols.

   - Do not allow all traffic to a destination or group of destinations. (Do not use **permit ip any [host]** or **permit ip any [object-group]**).

   - Open globally only ports (defining source of **any**) that are considered a generally accepted best practice. Examples of ports that **should not be opened globally** are **22 - SSH**, **1433 - Microsoft SQL**, **3306 - MySQL**, and **3389 - RDP**.

### Rule order and execution

Cisco firewalls use line numbers appended to ACEs to identify the execution order of the access-list. When you create a new access-list rule in Firewall Manager v2, the rule is appended to the end of the access-list by default. Depending on the content of the access-list, this default action might or might not be what you intend to configure. You often need to place an access-list rule in a customized location within the access-list.

Cisco firewalls process traffic by first-match, from top down within the access-list applied to the interface. When a connection that is being inspected matches an access-list rule, the processing for that lookup ends. For example, if an encompassing deny rule is above a newly created rule, that deny rule prevents the new rule from triggering.

Cisco firewalls also use a fail-close approach that means that there is an implicit deny all rule at the end of each access-list. If traffic is not explicitly permitted, then it is implicitly denied.

### Access-list for DMZs and other back-end segments

A demilitarized zone (DMZ) is a separate network segment that is used to physically and logically separate networks. Our Cisco firewalls use access-lists to perform NAC on DMZs and other back-end segments.

When you create multiple segments behind Cisco firewalls, a best practice is to explicitly deny traffic from lower-trusted segments to higher-trusted segments. This best practice enables your firewall to isolate your inside segment from not only the traffic coming from the internet, but also the traffic coming from other segments behind the firewall that lie within your Rackspace environment.

An example is an environment that has both a DMZ segment and an INSIDE segment. You need to create an access-list rule that denies traffic sourcing from the DMZ segment destined to the INSIDE segment. Any exceptions to this (for example, Active Directory ports) are configured above the deny line. This technique allows you to deny all traffic by default, and then specify the individual access required as you find business needs for resources in the two segments to communicate.

### Access-list standard rule names and functions

Each environment at Rackspace is unique. However, we have implemented the following standards in each firewall environment to make some aspects of the access-list configuration uniform.

#### 101 ACL

The 101 access-list is applied to the outside interface for traffic ingressing, or coming in, from the internet. The 101 access-list defines what traffic from the internet is allowed to enter into the environment. This access-list is your Rackspace environment's first line of defense. If traffic is not explicitly permitted, traffic is implicitly denied by default.

**Warning:** The 101 access-list is the gatekeeper for the network security of your environment. Do not open more access than is required. See the preceding best practices section for details.

#### 100, inside, or FW-INSIDE ACL

The name of this access-list is less standardized. Although the name varies, the purpose is completely standardized. This access-list is applied to the inside segment for egressing traffic, which means that it is applied for traffic sourcing from the inside segment (your Rackspace servers) that is destined to go anywhere, whether it is the internet or another segment in your environment. The default for this access-list is **permit ip any any**.

This access-list gives your Rackspace servers unfiltered outbound communication, but only if the traffic is initiated by your Rackspace server. This access is useful when servers need outbound communication for software updates.

We recommend that you lock down the outbound filtering when possible. If you want to do that, send a request to Rackspace Support and mention this part of the article.

#### 200 and up ACLs

The Rackspace standard for site-to-site VPNs is to use a cryptographic map access-list name starting at 200. Each site-to-site VPN configuration increments by 1. Be cautious if you update a VPN access-list. The firewall's cryptographic engine uses this access-list as its means to build the encryption domains and SPIs for VPN tunnels. If you update the access-list with IP space that overlaps with another VPN tunnel, you can cause network degradation for these VPN tunnels.

#### FW-DMZ-SVRS, DMZ, or 99 ACL

This access-list is dedicated to your DMZ segment. If you have a DMZ, you must have a deny statement that prevents the DMZ from communicating with the INSIDE segment. The deny statement prevents intersegment communication. If intersegment communication is required, you must create a permit access-list rule and move it to above the encompassing deny statement.

#### nonat or 102 ACL

This access-list is dedicated to Network Address Translation (NAT) bypass, or the feature called NAT0, and is used in Cisco firewall code versions earlier than 8.3. On code versions earlier than 8.3, the Rackspace standard for Cisco firewalls requires NAT to occur as a packet moves from one interface to another.

Occasionally, you might not want this action to occur. An example is when two internal segments are communicating with each other or VPN traffic. If your firewall is on a code version later than 8.3, this NAT bypass access-list is no longer needed and can be removed. This syntax is likely the remnant of unused configuration after a mass code upgrade.

#### CLIENTVPN, ANYCONNECT-VPN, or 103 ACL

This access-list is dedicated to your AnyConnect or Internet Protocol security (IPsec) client VPN's access. This access-list determines what traffic is sent across your client VPN. You can have a second access-list applied to individual access further filtering this VPN traffic.

#### RackConnect ACL

This access-list is dedicated to your RackConnect v2 configuration. RackConnect v2 access-list updates can occur only through the **Network Policies** section of the RackConnect v2 portal. Currently, the Firewall Manager v2 does not permit access-list rules that contain the RackConnect subnet ranges of 10.76.0.0/12 or 10.208.0.0/12.

#### 300 or PNAT ACL

This access-list is dedicated to policy NAT ACLs on Cisco firewall code versions earlier than 8.3.

#### CLOUD-PAT ACL

This access-list is used for Port Address Translation (PAT) for your Cloud Servers environment.

#### "cap"-in "cap"-out ACLs

These "cap" variation access-lists set up captures on the firewall. Such access-lists are typically used to help with troubleshooting. When troubleshooting is complete, our best practice is to remove these access-lists to help keep your configuration clean. If you see one left behind, it is safe to remove it.
