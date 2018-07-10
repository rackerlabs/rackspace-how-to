---
permalink: firewall-manager-v2-object-groups/
audit_date: '2017-03-23'
title: Firewall Manager v2 object-groups
type: article
created_date: '2018-07-10'
created_by: Trevor Becker
last_modified_date: '2018-07-10'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a tool within the MyRackspace portal. This article describes the object-group feature within this tool, an easy to use feature that groups and sorts like items such as IP addresses, ports, or protocols.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Why should I use an object-group?

Object-groups improve the organization and readability of a firewall's running configuration. A running configuration that is easy to read and modify reduces the chances for a misconfiguration and increases the ability to troubleshoot issues quickly.

In Firewall Manager v2, object-groups are referred to as *IP groups*. You can view, modify, and delete any object-group on your firewall. For more information, see the following articles:

- [View an object-group](/how-to/view-an-object-group)
- [Create an object-group](/how-to/create-an-object-group)
- [Modify an object-group](/how-to/)
- [Delete an object-group](/how-to/delete-an-object-group)

### Object-groups and access-lists

Object-groups are commonly used to make the configuration of a firewall's access list more easily readable and controlled, which assists in support and troubleshooting. Instead of creating individual access-list entries for each component of an object-group you can reference an object-group in an access-list entry. For example, if an object-group contains 100 IP hosts, you can create one access-list entry that performs a required action on all the hosts in the object-group, rather than creating 100 access-list entries in the running configuration that individually specifying each host.

### Related articles

- [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices)
- [Firewall Manager v2 access-list rules](/how-to/firewall-manager-v2-access-list-rules)
- [Firewall Manager v2 port-objects](/how-to/firewall-manager-v2-port-groups)
- [Firewall Manager v2 change log](/how-to/firewall-manager-v2-change-log)
