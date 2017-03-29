---
permalink: firewall-manager-v2/
audit_date: '2017-03-27'
title: Firewall Manager v2
type: article
created_date: '2017-03-20'
created_by: Trevor Becker
last_modified_date: '2017-03-27'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the tool and provides links to detailed articles about the Firewall Manager v2 features.

### What is Firewall Manager?

Firewall Manager, commonly referred to as the Firewall Control Panel (FWCP), is a self-service tool in the MyRackspace portal. Firewall Manager enables you to immediately view and modify the configurations of your Cisco firewalls by securely connecting to them and executing the changes on your behalf. In many cases, you can use Firewall Manager to execute a change in less time than it takes to create a ticket.

### How do I find the Firewall Manager v2?

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login) by using your Rackspace account number, username, and password.

2. In the top navigation bar, click **Network** > **Firewall Manager v2**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2/dropdown.png %}" alt="" />

### Firewall User Agreement

Rackspace requires each customer contact who attempts to use Firewall Manager to accept the Firewall User Agreement terms. These terms are prompted for each device, every 90 days. Only customer contacts who have edit or admin permissions on firewalls are permitted to make modifications. When the customer contact accepts the terms, a confirmation email is sent to the customer contact and primary contact. If the customer contact chooses not to accept the terms, that contact can only view their firewall configuration.

<img src="{% asset_path dedicated-hosting/firewall-manager-v2/user-agreement.png %}" alt="" />

### Firewall Manager v2 features

Firewall Manager v2 is the newest release for the existing Firewall Manager tool. Firewall Manager v2 contains feature enhancements that expand the capability and supportability of your environments.

These feature enhancements provide the following new abilities:

- View, create, modify, and delete all access control entries (ACEs) within any access control lists (ACLs) including intersegment communication
- Reorder ACE lines
- Search a specific ACL for keywords or IP addresses
- Create, modify, and delete any object-group and port-group, including groups not beginning with "FWCP-"
- Update VPN encryption domains
- View and manage documentation of public and private IP address on servers through the integration of the IP mapping tool

**Existing features include the ability to**:

- View the hit count numbers and add comments to ACE lines
- Export (.csv) any of the firewall's access control lists
- Export any of the firewall's ACLs to a CSV file
- Create, modify, and delete a custom whitelist to allow traffic
- Create, modify, and delete a custom blacklist to block traffic
- View and export (to a CSV file) the change log of your firewall, which includes the date, person, action, and change item
- Full support for high-availability (HA) firewalls
- Full support for Cisco ASA software later than 8.3

### Firewall Manager v2 detailed resources

The following articles provide detailed information about Firewall Manager v2 features and how to use them:

- [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups)
- [Firewall Manager v2 port-objects](/how-to/firewall-manager-v2-port-groups)
- [Firewall Manager v2 change log](/how-to/firewall-manager-v2-change-log)
- [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices)
- [Firewall Manager v2 access-list rules](/how-to/firewall-manager-v2-access-list-rules)
