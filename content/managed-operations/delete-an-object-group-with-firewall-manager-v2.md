---
permalink: delete-an-object-group-with-firewall-manager-v2/
audit_date:
title: Delete an object-group with Firewall Manager v2
type: article
created_date: '2018-07-10'
created_by: Nate Archer
last_modified_date:
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a tool within the MyRackspace portal. This article describes to delete object-groups within this tool.

Object-groups are an easy to use feature that groups and sorts like items such as IP addresses, ports, or protocols.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Why should I use an object-group?

Object-groups improve the organization and readability of a firewall's running configuration. A running configuration that is easy to read and modify reduces the chances for a misconfiguration and increases the ability to troubleshoot issues quickly.

In Firewall Manager v2, object-groups are referred to as *IP groups*. You can view, create, modify, and delete any object-group on your firewall. For more information, see the following articles:

- [View an object-group](/how-to/view-an-object-group-with-firewall-manager-v2)
- [Create an object-group](/how-to/create-an-object-group-with-firewall-manager-v2)
- [Modify an object-group](/how-to/modify-an-object-group-with-firewall-manager-v2)


### Delete an object-group

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login) by using your Rackspace account number, username, and password.

2. In the top navigation bar, click **Network** > **Firewall Manager v2**.

3. In the navigation pane on the left side of the panel, click the firewall for which you want to see object-groups.

4. Under **Rules** in the navigation pane, click **IP Groups**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/ip-groups.png %}" />

5. Scroll through or search the object-group list and click the object-group that you want to delete.

6. Click **Delete Group** to make a request to remove the object-group.

7. Enter any additional information in the text box, and then click **Submit Ticket**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/delete-object-group.png %}" />

A ticket is submitted on your behalf to manually remove the object-group and
delete any configuration items that reference the group, such as access lists, VPN encryption domains, or even other object-groups. The ticket is automatically forwarded to the appropriate Network Security team, and a team member will perform quality checks and confirm with you directly if anything appears to be incorrect.
