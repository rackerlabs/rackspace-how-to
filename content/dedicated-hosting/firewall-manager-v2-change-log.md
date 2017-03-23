---
permalink: firewall-manager-v2-change-log/
audit_date:
title: Firewall Manager v2 - Change Log
type: product
created_date: '2017-03-22'
created_by: Trevor Becker
last_modified_date: '2017-03-22'
last_modified_by: Nate Archer
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the change log feature within this tool.

To learn more about the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2).

### What is the change log?

The change log feature documents the events that have been executed on your Cisco firewall through the Firewall Manager tool. Only changes executed through the Firewall Manager interface are logged. Changes that are executed by Network Security Rackers who connect to the device directly are not logged in this utility.

**Note:** If you would like to identify when or if changes have occurred to any of your platforms, please open a support ticket and a Network Security Racker will complete this task for you.

### Access the change log

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. Select the correct firewall from the firewall list on the left

3. Click the **Changle Log** tab on the left drop down menu.

  **Example 1.1:** Example location of the change log in the Firewall Manager v2
  <!-- Image "FWCPv2 Article 4 Image Change Log" --->

### Change log features

The Firewall Manager v2 change log has an export function. To use this feature, click on the **Export to .csv** button. You can download the .csv or open it directly from the next screen prompt

The change log also has a search bar which modifies your change log based on the values you enter, such as a username or IP address.

### What information does the change log document?

The Firewall Manager v2 change log creates one new entry per task that is performed. Each entry contains the following fields:

- **Date**: This field identifies the date in which the action was performed. You can click the arrow to alternate the sort from oldest to newest or newest to oldest. The default sort is from newest to oldest.

- **Changed By**: This field identifies who made the change. Only customer contacts who have edit or admin permissions on the firewall can execute changes. This field displays customer contacts as [first name] [last name]. If a Racker executes a change through the Firewall Manager v2, this field is documented as "Racker - [first name] [Last initial]".

- **Action**: This field identifies the action that was executed. The possible actions are Create, Delete, or Add. Create defines that an configuration such as an object-group or port-group has been created. Delete defines that an object was removed from an object-group or port-group. Add defines that an access-list policy was added.

- **Item**: This field identifies what configuration element was modified.

- **Details**: This field identifies addition details of the configuration element that was modified.

  **Example 1.2:** Example image of an active change log in the Firewall Manager v2
  <!-- Image "FWCPv2 Article 4 Image Example Change Log" --->
