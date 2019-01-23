---
permalink: managing-security-groups-and-rules
audit_date:
title: Managing Security Groups and Rules
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
--- 

This document will go over the basics for creating Security Groups, applying Inbound and Outbound rules and rule deletion.

Note - Adding Outbound Security Group Rules are only available via the API currently, so you can use the curl commands covered below to manage their creation.

### Create a Security Group and Inbound Rule
- Log into https://mycloud.rackspace.com
- Navigate to "Networking" and select "Security Groups.
- Select "Create Security Group" and set a name, region, and option description if needed.
- Select the "Create Security Group" option in the Step 1 of 2: Create Security Group box.
The next step is for adding an inbound rule. This is optional so you can choose to add rules later if you want.
- Here you will want to set the IP version, protocol and source ip or ip range for the rule you want to add.
- Select the "Add Rule" option inside the Step 2 of 2: Add Inbound Rule box.

### Create Outbound Security Group Rule
You will need to use the api to create the outbound rule. You can use the curl command below but be sure to substitute the variables referenced below with the appropriate values for your account.
- region will be the region you are working in.
- yourAuthToken will be the authentication token for your user account ( more on that here https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/send-request-ovw/#how-curl-commands-work  ).
- portNumber will be the port number you want to add to the rule (ie 22, 80, 443).
- IPv4 or IPv6 will be which ever ip version you want to use.
- desiredProtocol will be the protocol you want to use (ie tcp, icmp, all).
- yourSGID will be the Security Group UUID which you can get from the Security Group Details Page next to "Group ID".
- securityGroupRuleID will be used later to explain how to delete a rule with curl
Create Outbound SG Rule curl command

curl -XPOST https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules \

    -H "Content-type: application/json" \

    -H "X-Auth-Token: <yourAuthToken>" \

    -H "User-Agent: python-novaclient" \

    -H "Accept: application/json" \

    -d '{"security_group_rule":{"direction":"egress","port_range_min":"<portNumber or null>","ethertype":"<IPv4 or IPv6>","port_range_max":"<portNumber or null>","protocol":"<desiredProtocol>","security_group_id":"<yourSGID>"}}' \

    | python -m json.tool
- When you run this you will get output that provides an outline of the rule you have just added in a json block. Take note of the "id" field in the output as this will be the value you use for securityGroupRuleID to delete the rule when using the curl method outlined below.

### Apply Security Group to Cloud Server
- Navigate to Servers > Select the server you want to apply the rules to.
- On the Server Details page locate the "Networks and Security Groups" section.
- Select the gear icon next to the network interface you want to apply the SG to. (Note - Can only be applied to PublicNet and ServiceNet)
- Click "Select Security Groups..".
- Select the check box next to the Security Group and click "Save Selected Security Group(s)".

### Delete Security Group Rules
This can be accomplished by navigating back to "Networking" > "Security Groups" or using curl commands. Once there, you can follow the steps below.
- Select the Security Group you want to remove the rule from.
- On the Security Group Details page under "Rules" you can select the check box and click the delete option.
CURL Method

curl -XDELETE https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules/<securityGroupRuleID> \

    -H "Content-type: application/json" \

    -H "X-Auth-Token: <yourAuthToken>" \

    -H "Accept: application/json" \

    | python -m json.tool

### Remove Security Group from Server
- Navigate to Servers > select the cloud server you want to remove the Security Group from.
- Locate the "Networks and Security Groups" section.
- Select the gear icon next to the network interface you want to remove the SG from.
- Click "Select Security Groups..".
- Uncheck the check box next to the Security Group and click "Save Selected Security Group(s)".
