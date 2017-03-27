---
permalink: firewall-manager-v2-object-groups/
audit_date:
title: Firewall Manager v2 - Object-groups
type: product
created_date: '2017-03-21'
created_by: Trevor Becker
last_modified_date: '2017-03-21'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

<!-- IMAGE "FWCPv2 Article 2 Image Logo" -->
The Firewall Manager v2 is a new tool within the MyRackspace portal. This article describes the object-group feature within this tool. 

Click here to learn more about the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2).

### What is an Object-group?

Object-groups are used to group like items together, such as IP addresses, ports, or protocols. Object-groups are commonly used to make the configuration of a firewall's access-list more easily readable and controlled, which assists in support and troubleshooting. The benefit to using an object-group is that you can reference an object-group in an access-list entry, instead of having to create individual access-list entries for each component of the object-group. An example of this is if there are 100 IP hosts in an object-group. You could create one access-list entry performing a required action and reference this object-group, or you could create one hundred access-list entries in the running configuration, individually specifying each unique IP host. 

### Why should I use an Object-group?

With the example above, you can easily see the organizational and readability impact object-groups can have on a Cisco firewall's running configuration. Remember, the easier a firewall's running configuration is to read and modify, the chances for a misconfiguration are reduced, and the quicker it can be troubleshot when issues arise.

### Object-groups in the Firewall Manager v2

In the Firewall Manager v2, object-groups are referred to as **IP Groups**. You also now have the ability to view, modify, or delete any object-group on your firewall. In the previous version of the Firewall Manager, the user was restricted to only modifying object-groups that began with the string "_FWCP-_". In this new version of the Firewall Manager, this restriction has been lifted, which enables you to more powerfully control and modify your environment.

**Location of Object-groups**

1. Log in to the Firewall Manager v2 using the steps in the [Firewall Manager v2](https://support.rackspace.com/how-to/firewall-manager-v2) "How do I find the Firewall Manager v2?" section.

2. Select the correct firewall from the list on the left by clicking on it.

3. Click the **IP Groups** tab on the left drop down menu.

<!-- Image "FWCPv2 Article 2 Image IP Group" --->

### Viewing Object-groups

Navigate to the **_IP Groups_** tab. Scroll or search through the object-group list and select the appropriate object-group by clicking on it. The contents of the object-group will automatically display in the next column to the right. You may need to scroll to the top depending on the amount of object-groups configured on your firewall.

The Firewall Manager v2 organizes the object-groups that exist on your firewall in case-sensitive alphabetical order. This means that object-groups titled in uppercase are displayed before the lowercase object-groups. If you are having a difficult time locating the object-group, perform a find within your browser, and search for the object-group.

The Firewall Manager v2 also now allows you to search through the contents of an object-group. This feature enables you to quickly identify if an IP address or subnet exists within the specified object-group. To use this feature, type an IP address or subnet IP into the search bar that automatically displays in the right column once you click on the object-group to select it.

### Creating Object-groups

Navigate to the **_IP Groups_** tab. Click on the **_add group_** button that is displayed below the IP Groups title. The Firewall Manager v2 will interactively display the **_Add Group_** page.

1. Type the name of the object-group in the **_Group Name_** field. 

    The Rackspace naming scheme best practice is to use all capital letters with dashes seperating words. We recommend making the name of an object-group directly related to what access this object-group will grant. For example, if an object-group were to be used to give Walter White SSH access to the web servers, we would recommend you call this object-group WALTERWHITE-WEBSRVS-22. This object-group would then have the web server IP addresses added to it that you would like to give Walter SSH access to. Next, an access-list would be created permitting traffic from Walter's source IP address to the destination of object-group WALTERWHITE-WEBSRVS-22 over TCP port 22.

2. Click the **_Add IP(s)_** button to add IP hosts or subnet ranges to the object-group. 

    In the text field, type a single IP address or subnet, or enter a list of IPs or subnets, with each unique item on their own line. 
    
    **Note:** The Firewall Manager v2 only permits /24 to /32 subnet sizes. If you require a subnet size larger than a /24, a Racker will need to manaually add this value for you.
    
    **Note:** If you need assistance creating a custom subnet range, click the CIDR hyperlink below the text field. The dropdown will interactively change to an input range field. Define the IP range required and click the **_Convert IPs_** button. The Firewall Manager v2 will automatically convert this IP range into the extact CIDR breakdowns required.
    
3. Click the **_Add IP_** button.  

4. Click the **_Save Changes_** button. The Firewall Manager v2 will interact with your firewall and add the configurations. This will typically take 30 seconds, depending on the size of your firewall's configuration.

<!-- IMAGE "FWCPv2 Article 2 Image Add Group" --->

### Modifying Object-groups

Navigate to the **_IP Groups_** tab. Scroll or search through the object-group list and select the appropriate object-group by clicking on it. The contents of the object-group will automatically display in the next column to the right. You may need to scroll to the top depending on the amount of object-groups configured on your firewall.

1. Click the **_Edit Group_** button to modify the contents of an object-group.

2. Adding an entry - Click the **_Add IP(s)_** button to add IP hosts or subnet ranges to the object-group. See the notes above in the _Creating Object-groups_ section above.

3. Removing an entry - Click on the **_minus symbol_** to the right of the object-group entry.

4. Click the **_Save Changes_** button. The Firewall Manager v2 will interact with your firewall and add the configurations. This will typically take 30 seconds, depending on the size of your firewall's configuration.

   **Note:** If is highly important that you understand the impact of modifying an object-group. Incorrectly modifying an existing object-group that is already referenced in an access-list has the potential to either creating inappropriate network access or removing critical access. Always ensure that you fully understand the impact of your modification.

<!-- IMAGE "FWCPv2 Article 2 Image Modify" --->

### Deleting Object-groups

Navigate to the **_IP Groups_** tab. Scroll or search through the object-group list and select the appropriate object-group by clicking on it. The contents of the object-group will automatically display in the next column to the right. You may need to scroll to the top depending on the amount of object-groups configured on your firewall.

1. Click the **_Delete Group_** button make a request to remove an object-group.

2. A ticket will be submitted on your behalf for a Racker to manaually remove the object-group and delete any configuration items that reference the object-group, such as access-lists, VPN encryption domains, or even other object-groups.

3. This ticket will be automatically forwarded to the appropriate Network Security team. A Racker will perform quality checks and confirm with you directly if anything appears to be incorrect.

<!--- IMAGE"FWCPv2 Article 2 Image Delete" --->
