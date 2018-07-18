---
permalink: firewall-manager-v2-access-list-rules/
audit_date: '2018-07-17'
title: Firewall Manager v2 access-list rules
type: article
created_date: '2017-03-24'
created_by: Trevor Becker
last_modified_date: '2018-07-12'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a tool within the MyRackspace portal that allows you to manage your Cisco firewall. 

This article describes the access-list rule feature of Firewall Manager v2.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Why use access-lists?

Access control lists (ACLs), or *access-lists*, enable Cisco firewalls to filter traffic. The security of your Rackspace environment begins at your Cisco firewall. Misconfigurations in network access policies on your firewall can lead to unwanted network exposure and potential compromise.

The access-lists control the traffic that attempts to enter the internal networks from an external, unsecured network. If access-lists are not used, the Cisco firewall's default security policy of _security-levels_ is active, which does not provide the highest level of network security.

An access control entry (ACE) is an individual entry in an ACL. ACEs are referred to as _rules_ in Firewall Manager v2. The Cisco firewall allows you to configure only one access-list per interface per direction. This access-list can contain as many ACEs, or rules, as necessary.

For more information about how to view, modify, add, and delete access-lists, see the following articles:

- [View an access-list](/how-to/view-an-access-list-rules-with-firewall-manager-v2)
- [Add and modify an access-list](/how-to/add-and-modify-an-access-list-with-firewall-manager-v2)
- [Delete an access-list](/how-to/delete-an-access-list-with-firewall-manager-v2)

### Access-list best practices

To remain secure and follow compliance requirements, use the following best practices and recommendations:

- Be as specific as possible when setting up ACLs. Minimize the size of the source and destination traffic in your access-list rules when possible.

- Do not define the destination as **any** (your entire Rackspace environment) when only one destination server needs to be accessed.

- Do not allow traffic from any source to any destination of the IP, TCP, or UDP protocols. Allowing traffic to these destinations effectively turns your security platform into a router because it will not block any packets from reaching any destination in your environment over those protocols.

- Do *not* allow all traffic to a destination or group of destinations. (Do not use **permit ip any [host]** or **permit ip any [object-group]**).

-  Do *not* open the following ports globally: **22 - SSH**, **1433 - Microsoft SQL**, **3306 - MySQL**, and **3389 - RDP**.

### Related articles

- [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups)

   - [View an object-group](/how-to/view-an-object-group-with-firewall-manager-v2)
   - [Create an object-group](/how-to/create-an-object-group-with-firewall-manager-v2)
   - [Modify an object-group](/how-to/modify-an-object-group-with-firewall-manager-v2)
   - [Delete an object-group](/how-to/delete-an-object-group-with-firewall-manager-v2)

- [Firewall Manager v2 port-objects](/how-to/firewall-manager-v2-port-groups)
- [Firewall Manager v2 change log](/how-to/firewall-manager-v2-change-log)
- [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices)
