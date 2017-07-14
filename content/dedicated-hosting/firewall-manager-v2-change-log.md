---
permalink: firewall-manager-v2-change-log/
audit_date: '2017-03-24'
title: Firewall Manager v2 change log
type: article
created_date: '2017-03-22'
created_by: Trevor Becker
last_modified_date: '2017-03-22'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the change log feature within this tool.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### What is the change log?

The change log documents the events that Firewall Manager v2 executes on your Cisco firewall. Only changes that are executed through the Firewall Manager interface are logged. Changes that are executed by Network Security Rackers who connect to the device directly are not logged.

**Note:** If you want to identify when or if changes have occurred to any of your platforms, open a support ticket and a Network Security Racker will complete this task for you.

### Access the change log

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. Select the correct firewall from the firewall list in the left pane.

3. Under **Rules**, click **Change Log**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-change-log/change-log.png %}" />


### Change log features

The Firewall Manager v2 change log has an export function. To use this feature, click on the **Export to .csv** button. You can download the .csv file or open it directly from the next screen prompt

The change log also has a search function that filters the entries based on the value that you enter, such as a username or an IP address.

<img src="{% asset_path dedicated-hosting/firewall-manager-v2-change-log/example-change-log.png %}" />

### What information does the change log document?

The Firewall Manager v2 change log creates one new entry per task that is performed. Each entry contains the following fields:

- **Date**:  The date that the action was performed. Click the arrow to alternate the sort from oldest to newest or newest to oldest. The default sort is from newest to oldest.

- **Changed By**:  Who made the change. Only customer contacts who have edit or admin permissions on the firewall can execute changes. This field displays customer contacts as [first name] [last name]. If a Racker executes a change through Firewall Manager v2, this field shows "Racker - [first name] [last initial]."

- **Action**: The action that was executed. The possible actions are Create, Delete, and Add. Create indicates that a configuration such as an object-group or portgroup was created. Delete indicates that an object was removed from an objectgroup or port-group. Add indicates that an access-list policy was added.

- **Item**: The configuration element that was modified.

- **Details**: Additional information about the configuration element that was modified.
