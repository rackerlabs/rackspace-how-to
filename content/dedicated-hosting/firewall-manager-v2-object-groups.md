---
permalink: firewall-manager-v2-object-groups/
audit_date: '2017-03-23'
title: Firewall Manager v2 Object-groups
type: article
created_date: '2017-03-21'
created_by: Trevor Becker
last_modified_date: '2017-03-23'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the object-group feature within this tool.

To learn more about the tool, see [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2).

### What is an object-group?

An object-group is used to group like items, such as IP addresses, ports, or protocols. Object-groups are commonly used to make the configuration of a firewall's access list more easily readable and controlled, which assists in support and troubleshooting.

Instead of creating individual access-list entries for each component of an object-group you can reference an object-group in an access-list entry. For example, if an object-group contains 100 IP hosts, you can create one access-list entry that performs a required action on all the hosts in the object-group, rather than creating 100 access-list entries in the running configuration that individually specifying each host.

### Why should I use an object-group?

object-groups improve the organization and readability of a firewall's running
configuration. A running configuration that is easy to read and modify reduces the chances for a misconfiguration and increases the ability to troubleshoot issues quickly.

### Object-groups in the Firewall Manager v2

In Firewall Manager v2, object-groups are referred to as *IP groups*. You can now view, modify, and delete any object-group on your firewall. In the previous version of the Firewall Manager, you were restricted to only modifying object-groups that began with the string *FWCP-*.

#### View object-groups

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see object-groups.

3. Under **Rules** in the navigation pane, click **IP Groups**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/ip-groups.png %}" />

4. Scroll through or search the object-group list and click the appropriate object-group. The contents of the object-group are automatically displayed.

Firewall Manager v2 organizes the object-groups in case-sensitive alphabetical order. Therefore, object-group names with uppercase letters are displayed before those with lowercase letters. If you can’t locate an object-group, search for the object-group by using your browser’s search function.

You can also search the contents of an object-group. This feature enables you to quickly determine whether an IP address or subnet exists within the specified group. To use this feature, type an IP address or subnet IP in the search bar that is automatically displayed when you click the group.

### Create an object-groups

1. Navigate to the **IP Groups** tab.

2. Under the **IP Groups** label, click **Add Group**. The **Add Group** page is displayed.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/add-object-group.png %}" />

3. In the **Group Name** field, type the name of the object-group.

    We recommend using a name that directly relates to the access that this object-group will grant. We also recommend using all uppercase letters with dashes separating word groups. For example, if an object-group will be used to give John Doe SSH access to the web servers over TCP port 22, you might name the object-group JOHNDOE-WEBSRVS-22.

4. To add IP hosts or subnet ranges to the group, click **Add IP(s)**.

5. In the text field, type a single IP address or subnet, or enter a list of IP addresses or subnets, with each unique item on its own line.

    If you need help creating a custom subnet range, click the CIDR link under the text field. The drop-down changes to an input range field. Define the IP range required and click **Convert IPs**. Firewall Manager v2 converts the IP range into the exact CIDR values required.

    **Note:** Firewall Manager v2 permits only `/24` to `/32` subnet sizes. If you require a subnet size larger than `/24`, contact Support to manually add this value for you.

6. Click **Add IP**.

7. Click **Save Changes**.

Firewall Manager v2 interacts with your firewall and adds the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.


### Modify an object-group

It’s highly important that you understand the impact of modifying an object-group. Incorrectly modifying an existing object-group that is already referenced in an access list has the potential to either create inappropriate network access or remove critical access.

1. Navigate to the **IP Groups** tab.

2. Scroll through or search the object-group list and click the group that you want to modify.

3. Click **Edit Group**.

4. To add an entry, click **Add IP(s)** and add IP hosts or subnet ranges to the group. For instructions, see the “Create an object-group” section.

   <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/modify-object-group.png %}" />

5. To remove an entry, click on the minus (-) symbol to the right of the object-group entry.

6. Click **Save Changes**.

Firewall Manager v2 interacts with your firewall and modifies the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.

### Delete an object-group

1. Navigate to the **IP Groups** tab.

2. Scroll through or search the object-group list and click the object-group that you want to delete.

3. Click **Delete Group** to make a request to remove the object-group.

4. Enter any additional information in the text box, and then click **Submit Ticket**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/delete-object-group.png %}" />

A ticket is submitted on your behalf to manually remove the object-group and
delete any configuration items that reference the group, such as access lists, VPN encryption domains, or even other object-groups. The ticket is automatically forwarded to the appropriate Network Security team, and a team member will perform quality checks and confirm with you directly if anything appears to be incorrect.
