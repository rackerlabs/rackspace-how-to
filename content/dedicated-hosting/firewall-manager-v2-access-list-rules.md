---
permalink: firewall-manager-v2-access-list-rules/
audit_date:
title: Firewall Manager v2 - Access-list rules
type: product
created_date: '2017-03-24'
created_by: Trevor Becker
last_modified_date: '2017-03-24'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the access-list rule feature within this tool. 

To learn more about the tool, see [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2).

### Prerequisites

Please read the article [Access-list theory and best practices](https://support.rackspace.com/how-to/firewall-manager-v2-access-list-theory-and-best-practices) before using the access-list rules feature.

### Location of access-list rules

1. Access the Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see the access-lists rules.

3. Click **Rules**

  <!-- Image "FWCPv2 Article 6 Image Rules" --->

### Rackspace internal lines

In order for Rackspace to manage and monitor your environment properly, we need to have some configurations in place on your Cisco firewall. These configurations contain senstive Rackspace internal data and they have been redacted from your view in the Firewall Manager v2. The redacted Rackspace line needs to remain at the top of your access-list to prevent issues. The Firewall Manager v2 will not allow you to place custom rules above the highest redacted line.

**Example 1.2:** An example of what the redacted line looks like.
<!-- Image "FWCPv2 Article 6 Redacted Line" --->

### Access-list rule features

The Firewall Manager v2 rules has an export function. To use this feature, click on the **Export to .csv** button. You can download the .csv or open it directly from the next screen prompt.

The Rules tab also has a search bar which modifies your display based on the values you enter, such as a IP address or protocol.

### Access-list rule execution order

Cisco firewalls execute access-list rules in order from top to the bottom. If the customer request matches a rule, it stops processing the requests and performs the action. The Firewall Manager v2 always adds new access-list rules to the bottom of the access-list. Sometimes you will be required to change the execution order. Use these steps to perform this:

1. Navigate to the **All Rules** tab.

2. Click the **cog action icon** to the left of the execution order line number.

3. Section the **Change order** option.

4. Specific the line number to move this entry to. 

   **Note:** The Firewall Manager v2 will not allow you to place rules above the highest redacted Rackspace internal line. This is to prevent hindering our ability of accessing your environment and providing you Fanatical Support.
   
   **Warning:** Changing the execution order of a line requires that the line be temporarily removed and re-added. This is due to a Cisco limitation. Do not change the execution order of a rule unless a blip in access for that rule is acceptable.

**Example 1.3:** An example of the line number execution order option.
<!-- Image "FWCPv2 Article 6 Line number" --->

### Adding an access-list rule

**Warning:** Before you modify any access-list rules, ensure you have read and understand all of the best practices documented in the [Firewall Manager v2 - Theory and Best Practices](https://support.rackspace.com/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article.

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see access-list rules.
   
3. Navigate to the **All Rules** tab

4. Click **Add Rule**

5. Fill out the **Add Rule** screen options:

   **Section 1: Details**
  
      - Rule List - Select the correct access-list name you wish to add an access control entry to.
  
      - Name - This is a required field. This name is stored in the Firewall Manager v2 only and is used for your documentation and auditing purposes.
  
      - Rule Type - Define either the action of permit or deny
      
      **Example 1.4:** Example of Section 1
      <!-- Image "FWCPv2 Article 6 section 1" --->
      
   **Section 2: Traffic coming from...**
  
      - A single IP - Enter a host IP address or search for a device number.
  
      - A CIDR IP - Define a subnet range.
  
      - A group of IPs - **(Recommended option)** - Select and existing object-group. If you need to create a new object-group first, see: [Firewall Manager v2 - Object-groups](https://support.rackspace.com/how-to/firewall-manager-v2-object-groups).
  
      - Any IP - This option defines the source as any. Before using the any value, please refer the Best practices section in the [Firewall Manager v2 - Theory and Best Practices](https://support.rackspace.com/how-to/firewall-manager-v2-access-list-theory-and-best-practices) article. 
  
      **Example 1.5:** Example of Section 2
      <!-- Image "FWCPv2 Article 6 section 2" --->
      
   **Section 3: Traffic going to...**
  
      - The same four options exist from section 2 above.
  
   **Section 4: Using Protocol...**
  
      - Protocol - Select either TCP, UDP, or IP. (IP is the entire IP suite, which includes all TCP and UDP ports plus many more. Use caution when specifying this protocol.)
  
      -  The same four options exist from section 2 above except it is referring to ports. Use extreme caution if you select any for the port. This is typically not the best security decision that could be made.      
  
      **Example 1.6:** Example of Section 4
      <!-- Image "FWCPv2 Article 6 section 4" --->
      
6. Click **Next**.

7. Click **Add to Firewall**.

    Firewall Manager v2 interacts with your firewall and adds the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.
   
8. The new access-list rule is added to the bottom of the access-list. If you require changing the line number of the execution order, follow the steps above in the section: **Access-list rule execution order**

### Deleting an access-list rule

1. Access Firewall Manager v2 by following the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) article.

2. In the navigation pane on the left side of the panel, click the firewall for which you want to see access-list rules.

3. Navigate to the **All Rules** tab.

4. Locate the access-list rule to be deleted. Click the **cog action icon** to the left of the execution order line number.

5. Select **Delete**.

6. Click **Delete Rule**.

   Firewall Manager v2 interacts with your firewall and deletes the configuration. This typically takes about 30 seconds, depending on the size of your firewall's configuration.

   **Example 1.7:** Example of the Delete option within the cog action icon.
   <!-- Image "FWCPv2 Article 6 delete rule" --->
