---
permalink: firewall-manager-v2-port-groups/
audit_date:
title: 'Firewall Manager v2 port-groups'
type: article
created_date: '2017-03-22'
created_by: Trevor Becker
last_modified_date: '2017-03-24'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the port-group feature within this tool.

To learn more about the tool, see [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2).

### What is a port-group?

A port-group is a form of an object-group. Object-groups are used to group like items, such as IP addresses, ports, or protocols. Object-groups are commonly used to make the configuration of a firewall's access-list more easily readable and controlled, which assists in support and troubleshooting. For more information about object-groups, see [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups).

A port-group is a single configuration item that logically groups ports together. The benefit to using a port-group is that you can reference a port-group in access-list entries that have object-groups as well. This is better than the alternative of having to create individual access-list entries for each component of the port-group.

A powerful example of an efficient use of port-groups is a single access-list entry that references an object-group of 100 source IPs, an object-group of 10 destination IPs, and a port-group of 5 TCP ports. Using the object-group and port-group strategy, your firewall's running configuration requires only one access-list entry. If you did not use object-groups and port-groups, you would need **5,000 access-list entries** in the running configuration, individually specifying each unique source IP, destination IP, and TCP port combinations.

**Note:** The Firewall Manager v2 allows you to create port-groups using only TCP or UDP ports.

### Why should I use a port-group?

Port-groups improve the organization and readability of a firewall's running configuration. A running configuration that is easy to read and modify reduces the chances for a misconfiguration and increases the ability to troubleshoot issues quickly.

### Port-groups in the Firewall Manager v2

In Firewall Manager v2, you can now view, modify, and delete any port-group on your firewall. In the previous version of the Firewall Manager, you were restricted to only modifying port-groups that began with the string *FWCP-*.

### View port-groups

1. Log in to the Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see port-groups.

3. Under **Rules** in the navigation pane, click **Port-groups**.

   <img src="{% asset_path dedicated-hosting/firewall-manager-v2-port-groups/FWCPv2-port-group.png %}" alt="port-groups are located under rules in the left-hand navigation menu" />

4. Scroll through or search the port-group list and click the appropriate port-group. The contents of the port-group are automatically displayed.

   Firewall Manager v2 organizes the port-groups in case-sensitive, alphabetical order. Therefore, port-groups named with uppercase letters are displayed before those with lowercase letters. If you can't locate a port-group, search for the port-group by using your browser's search function.

   You can also search the contents of a port-group. This feature enables you to quickly determine whether a TCP or UDP port exists within the specified port-group. To use this feature, type a TCP or UDP port number into the search bar that is automatically displayed when you click the group.

### Create a port-group

1. Navigate to the **Port Groups** tab.

2. Under the **Port Groups** label, click **Add Group**. The **Add Group** page is displayed.

3. In the **Group Name** field, type the name of the port-group.

   We recommend using a name that directly relates to the access that this port-group will grant. We also recommend using all capital letters with dashes separating word groups. For example, if a port-group is used to give access to TCP ports 80 and 443, you might name the port-group **TCP-80-443**.

   By clearly and appropriately naming the port-group, you reduce the risk of misconfiguration in the future, which could mistakenly result in a compromise if undesired access is opened.

4. In the **Protocol** field, select one of the following three options: TCP, UDP, or TCP-UDP.

   **Note:** The TCP-UDP option enables you to add both TCP and UDP in one configuration action.

5. Click **Add Port(s)** to add the ports to the port-group.

    In the text field, type a single port number, or enter a list of port numbers, with each unique item on their own line.

    **Warning:** You also have the ability to add a port range by separating two values with a dash (-). This feature  adds *all port numbers between* the two values that you specified around the dash. Misconfiguration here can result in a compromise due to inappropriate ports being opened.

6. Click **Add Port**.  

7. Click **Save Changes**.

   Firewall Manager v2 interacts with your firewall and adds the configurations. This typically takes about one minute, depending on the size of your firewall's configuration.

<img src="{% asset_path dedicated-hosting/firewall-manager-v2-port-groups/FWCPv2-add-port-group.png %}" alt="" />

### Modify a port-group

It is highly important that you understand the impact of modifying an existing port-group. Incorrectly modifying an existing port-group that is already referenced in an access-list has the potential to either create inappropriate network access or to remove critical access.

1. Navigate to the **Port Groups** tab.

2. Scroll through or search the port-group list and click the group that you want to modify.

3. Click **Edit Group**.

4. To add a port entry, click **Add Port(s)** and add TCP or UDP ports to the port-group. For instructions, see the "Create a port-group" section.

5. To remove a port entry, click on the minus symbol (-) to the right of the port-group entry.

6. Click **Save Changes**.

   Firewall Manager v2 interacts with your firewall and adds the configurations. This typically takes about 30 seconds, depending on the size of your firewall's configuration.

<img src="{% asset_path dedicated-hosting/firewall-manager-v2-port-groups/FWCPv2-modify-port-group.png %}" alt="" />

### Delete a port-group

1. Navigate to the **Port Groups** tab.

2. Scroll through or search the port-group list and click the port-group that you want to delete.

3. Click **Delete Group** to make a request to remove the port-group.

4. Enter any additional information in the text box, and then click **Submit Ticket**.

   A ticket is submitted on your behalf to manually remove the port-group and delete any configuration items that reference the group, such as access-lists, VPN encryption domains, or even other port-groups. The ticket is automatically forwarded to the appropriate Network Security team, and a team member will perform quality checks and confirm with you directly if anything appears to be incorrect.

<img src="{% asset_path dedicated-hosting/firewall-manager-v2-port-groups/FWCPv2-delete-port-group.png %}" alt="" />
