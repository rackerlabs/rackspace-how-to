---
permalink: add-an-access-list-rule-with-firewall-manager-v2/
audit_date: '2018-07-18'
title: Add an access-list rule with Firwall Manager v2
type: article
created_date: '2017-03-24'
created_by: Trevor Becker
last_modified_date: '2018-07-18'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a tool within the MyRackspace portal that allows you to manage your Cisco firewall.

This article describes how to add an access-list rule using Firewall Manager v2.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Why use access-lists?

Access control lists (ACLs), or *access-lists*, enable Cisco firewalls to filter traffic. The security of your Rackspace environment begins at your Cisco firewall. Misconfigurations in network access policies on your firewall can lead to unwanted network exposure and potential compromise.

The access-lists control the traffic that attempts to enter the internal networks from an external, unsecured network. If access-lists are not used, the Cisco firewall's default security policy of _security-levels_ is active, which does not provide the highest level of network security.

An access control entry (ACE) is an individual entry in an ACL. ACEs are referred to as _rules_ in Firewall Manager v2. The Cisco firewall allows you to configure only one access-list per interface per direction. This access-list can contain as many ACEs, or rules, as necessary.

For more information about how to view, modify, or delete access-lists, see the following articles:

- [View an access-list rule](/how-to/view-an-access-list-rules-with-firewall-manager-v2)
- [Modify an access-list's execution order](/how-to/modify-an-access-lists-execution-order-with-firewall-manager-v2)
- [Delete an access-list](/how-to/delete-an-access-list-with-firewall-manager-v2)

### Access-list best practices

To remain secure and follow compliance requirements, use the following best practices and recommendations:

- Be as specific as possible when setting up ACLs. Minimize the size of the source and destination traffic in your access-list rules when possible.

- Do not define the destination as **any** (your entire Rackspace environment) when only one destination server needs to be accessed.

- Do not allow traffic from any source to any destination of the IP, TCP, or UDP protocols. Allowing traffic to these destinations effectively turns your security platform into a router because it will not block any packets from reaching any destination in your environment over those protocols.

- Do *not* allow all traffic to a destination or group of destinations. (Do not use **permit ip any [host]** or **permit ip any [object-group]**).

-  Do *not* open the following ports globally: **22 - SSH**, **1433 - Microsoft SQL**, **3306 - MySQL**, and **3389 - RDP**.

### Add an access-list rule

**Note:** Cisco firewalls execute access-list rules in order from first to last, based on the line number. If a customer request matches a rule, Cisco firewalls stop processing the request and performs the action.

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see access-list rules.

3. Under **Rules**, click **All Rules**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-rules.png %}" />

4. In the navigation pane on the left side of the panel, click the firewall for which you want to add an access-list rules.


5. Click **Add Rule**.

   A series of pages appear in which you define the rule.

6. On the **Details** page, provide the following information and click **Next**:

    - Rule List: Select the access-list to which you want to add the rule

    - Name: Provide a descriptive name for the rule. This field is required. The name is stored in Firewall Manager v2 only and is used for your documentation and auditing purposes.

    - Rule Type: Specify whether the rule allows (permits) traffic or blocks (denies) traffic.

       <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-details.png %}" />

7. On the **Traffic coming from** page, select one of the following options for incoming traffic, provide the necessary information, and then click **Next**:

     - A single IP: Enter a host IP address or search for a device number.

     - A CIDR IP: Define a subnet range.

     - A group of IPs: This is the recommended option. Select an existing object-group. If you need to create a new object-group first, see [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups).

      - Any IP: This option defines the source as **any**. Before choosing this option, refer to the best practices section in the [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article.

         <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-traffic-coming-from.png %}" />

8. On the **Traffic going to**, select one of the options for outgoing traffic, provide the necessary information, and then click **Next**. The options are the same as those shown for incoming traffic.

9. On the **Using protocol** page, select the protocol and the port option, and then click **Next**:

    - For the protocol, select TCP, UDP, or IP. IP is the entire IP suite, which includes all TCP and UDP ports plus many more. Use caution when specifying the protocol.

    -  The same options provided on preceding pages for IP addresses are provided here for ports. Use extreme caution if you select **any** for the port, which is typically not a good security decision.     

       <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-using-protocol.png %}" />

10. Click **Add to Firewall**.

Firewall Manager v2 interacts with your firewall and adds the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.

The new access-list rule is added to the end of the access-list. If you need to change the execution order of the rule, follow the steps in [Modify an access-list's execution order]((/how-to/modify-an-access-lists-execution-order-with-firewall-manager-v2).

### Related articles

- [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups)

   - [View an object-group](/how-to/view-an-object-group-with-firewall-manager-v2)
   - [Create an object-group](/how-to/create-an-object-group-with-firewall-manager-v2)
   - [Modify an object-group](/how-to/modify-an-object-group-with-firewall-manager-v2)
   - [Delete an object-group](/how-to/delete-an-object-group-with-firewall-manager-v2)

- [Firewall Manager v2 port-objects](/how-to/firewall-manager-v2-port-groups)
- [Firewall Manager v2 change log](/how-to/firewall-manager-v2-change-log)
- [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices)
