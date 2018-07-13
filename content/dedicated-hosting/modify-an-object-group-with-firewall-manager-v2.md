---
permalink: modify-an-object-group-with-firewall-manager-v2/
audit_date: '2018-07-11'
title: Modify an object-group with Firewall Manager v2
type: article
created_date: '2018-07-10'
created_by: Nate Archer
last_modified_date: '2018-07-11'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a tool within the MyRackspace portal. This article describes how to modify object-groups, an easy to use feature that groups and sorts like items such as IP addresses, ports, or protocols.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Why should I use an object-group?

Object-groups improve the organization and readability of a firewall's running configuration. A running configuration that is easy to read and modify reduces the chances for a misconfiguration and increases the ability to troubleshoot issues quickly.

In Firewall Manager v2, object-groups are referred to as *IP groups*. You can view, create, modify, and delete any object-group on your firewall. For more information, see the following articles:

- [View an object-group](/how-to/view-an-object-group-with-firewall-manager-v2)
- [Add an object-group](/how-to/add-an-object-group-with-firewall-manager-v2)
- [Delete an object-group](/how-to/delete-an-object-group-with-firewall-manager-v2)

### Modify an object-group

**Warning:** It’s important that you understand the impact of modifying an object-group. Incorrectly modifying an existing object-group that is already referenced in an access list has the potential to either create unwanted network access or remove critical access.

1. Log in to the [MyRackspace customer portal](https://my.rackspace.com/portal/auth/login) by using your Rackspace account number, username, and password.

2. In the top navigation bar, click **Network** > **Firewall Manager v2**.

3. In the navigation pane on the left side of the panel, click the firewall for which you want to see object-groups.

4. Under **Rules** in the navigation pane, click **IP Groups**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/ip-groups.png %}" />

5. Scroll through or search the object-group list and click the group that you want to modify.

6. Click **Edit Group**.

7. To add an entry, click **Add IP(s)** and add IP hosts or subnet ranges to the group. For instructions, see [Add an object-group](/how-to/add-an-object-group-with-firewall-manager-v2).

   <img src="{% asset_path dedicated-hosting/firewall-manager-v2-object-groups/modify-object-group.png %}" />

8. To remove an entry, click on the minus (-) symbol to the right of the object-group entry.

9. Click **Save Changes**.

Firewall Manager v2 interacts with your firewall and modifies the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.
