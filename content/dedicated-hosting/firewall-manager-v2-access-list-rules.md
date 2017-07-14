---
permalink: firewall-manager-v2-access-list-rules/
audit_date: '2017-03-28'
title: Firewall Manager v2 access-list rules
type: article
created_date: '2017-03-24'
created_by: Trevor Becker
last_modified_date: '2017-03-24'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the access-list rule feature within this tool.

To learn more about the tool, see [Firewall Manager v2](/how-to/firewall-manager-v2).

### Prerequisite

Before you use the access-list rules feature, read the [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article.

### View access-list rules

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see access-list rules.

3. Under **Rules**, click **All Rules**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-rules.png %}" />

   The Rules page shows the rules for the access-list on the selected tab. To view the rules for a different access-list, click the its tab.

### Rackspace internal lines

For Rackspace to manage and monitor your environment properly, we must have some configurations in place on your Cisco firewall. These configurations contain sensitive Rackspace internal data, and the access-list rule that contains them has been hidden from your view in Firewall Manager v2. Because the hidden Rackspace line must remain at the top of your access-list to prevent issues. Firewall Manager v2 does not allow you to place custom rules above this line.

Following is an example of how the hidden line is indicated in the access-list:

<img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-redacted-line.png %}" />

### Access-list rule features

The Firewall Manager v2 access-list rules feature has an export function. To use this function, click the **Export to .csv** button. You can download the .csv file or open it directly from the next screen prompt.

The Rules page also has a search function that filters the rules which modifies your display based on the values you enter.

### Modify rule execution order

Cisco firewalls execute access-list rules in order from first to last. If a customer request matches a rule, Cisco firewalls stop processing the request and performs the action.

Firewall Manager v2 always adds new access-list rules to the end of the access-list, so sometimes you need to change the execution order of the rules. Use the following steps to change the order.

**Warning:** Because of a Cisco limitation, when you change the execution order of a rule, the rule is temporarily removed and then re-added. Do not change the execution order of a rule unless a momentary change in access for that rule is acceptable.

1. Navigate to the **All Rules** tab.

2. Click the gear icon next to the line number of the rule that you want to move, and select **Change Order**.

3. Section the **Change order** option.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-line-number.png %}" />

4. Specify the line number to move this entry to.

   **Note:** Firewall Manager v2 does not allow you to place rules above the highest hidden Rackspace internal line.


### Adding an access-list rule

Before you add an access-list rule, be sure to read and understand all of the best practices documented in the  [Firewall Manager v2 theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article.

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to add an access-list rules.

3. Under **Rules**, click **All Rules**.

4. Click **Add Rule**.

   A series of pages appear in which you define the rule.

5. On the **Details** page, provide the following information and click **Next**:

   - Rule List: Select the access-list to which you want to add the rule

   - Name: Provide a descriptive name for the rule. This field is required. The name is stored in Firewall Manager v2 only and is used for your documentation and auditing purposes.

   - Rule Type: Specify whether the rule allows (permits) traffic or blocks (denies) traffic.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-details.png %}" />

6. On the **Traffic coming from** page, select one of the following options for incoming traffic, provide the necessary information, and then click **Next**:

      - A single IP: Enter a host IP address or search for a device number.

      - A CIDR IP: Define a subnet range.

      - A group of IPs: This is the recommended option. Select an existing object-group. If you need to create a new object-group first, see [Firewall Manager v2 object-groups](/how-to/firewall-manager-v2-object-groups).

      - Any IP: This option defines the source as **any**. Before choosing this option, refer to the best practices section in the [Firewall Manager v2 access-list theory and best practices](/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article.

      <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-traffic-coming-from.png %}" />

7. On the **Traffic going to**, select one of the options for outgoing traffic, provide the necessary information, and then click **Next**. The options are the same as those shown for incoming traffic.

8. On the **Using protocol** page, select the protocol and the port option, and then click **Next**:

   - For the protocol, select TCP, UDP, or IP. IP is the entire IP suite, which includes all TCP and UDP ports plus many more. Use caution when specifying the protocol.

   -  The same options provided on preceding pages for IP addresses are provided here for ports. Use extreme caution if you select **any** for the port, which is typically not a good security decision.     

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-using-protocol.png %}" />

9. Click **Add to Firewall**.

    Firewall Manager v2 interacts with your firewall and adds the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.

    The new access-list rule is added to the end of the access-list. If you need to change the execution order of the rule, follow the steps in "Modify rule execution order."

### Delete an access-list rule

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to delete an access-list rules.

3. Navigate to the **All Rules** tab.

4. Click the gear icon next to the line number of the rule that you want delete, and select **Delete**.

    <img src="{% asset_path dedicated-hosting/firewall-manager-v2-access-list-rules/image-delete.png %}" />

    Firewall Manager v2 interacts with your firewall and deletes the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.
