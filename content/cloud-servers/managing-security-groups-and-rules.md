---
permalink: managing-security-groups-and-rules/
audit_date: '2019-02-06'
title: Managing Security Groups and Rules
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-02-06'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions on creating Security Groups, applying inbound and outbound rules and deleting rules through the Rackspace Control Panel.

### Create a Security Group
1. Log into [my.rackspace.com](https://mycloud.rackspace.com)

2.  Navigate to **Networking** and click **Security Groups**.

3.  Click **Create Security Group**. You are prompted with a box labeled as **Step 1 of 2: Create Security Group** asking you to set a name, region, and an optional description. After completing this step click the **Create Security Group** button within the prompt.

4.  Click the **Create Security Group** button within the box labeled as **Step 1 of 2: Create Security Group**. You are prompted with a box labeled as **Step 2 of 2: Add Inbound Rule**.

    **Note:** Creating an inbound Security Group rule is optional and can be skipped by clicking **No thanks. I'll add rules later**.

5. Set the Internet Protocol (IP) version, protocol and source IP or IP range for the rule being added.

6. Select the **Add Rule** option inside the box labeled as **Step 2 of 2: Add Inbound Rule**.

### Create Outbound Security Group Rule

Outbound rules must be created by using the Application Programming Interface (API). Use the Client URL (`curl`) command example in this section to create an outbound Security Group rule. Substitute the variables in the `curl` example by using the appropriate values for your account referenced in the following:

`region` - Use the region for the Security Group.

`yourAuthToken` - Use the authentication token for your user account. See [How curl commands work](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/send-request-ovw/#how-curl-commands-work) for information on authentication using `curl` commands.

`portNumber or null` - Replace this with the port number you want to add to the rule (ie 22, 80, 443).

`IPv4 or IPv6` - Specify IPv4 or IPv6.

`desiredProtocol` - Replace this with the protocol want to use.

`yourSGID` - **Security Group UUID**. The **Security Group UUID** is located on the Security Group Details page next to **Group ID**.

Create an outbound security rule by using the following `curl` command example:

        curl -XPOST https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules \

            -H "Content-type: application/json" \

            -H "X-Auth-Token: <yourAuthToken>" \

            -H "User-Agent: python-novaclient" \

            -H "Accept: application/json" \

            -d '{"security_group_rule":{"direction":"egress","port_range_min":"<portNumber or null>","ethertype":"<IPv4 or IPv6>","port_range_max":"<portNumber or null>","protocol":"<desiredProtocol>","security_group_id":"<yourSGID>"}}' \

            | python -m json.tool


This command outputs the rule you have just added in a JavaScript&reg; Object Notation (JSON) block.

**Note:** The `id` field in the JSON output is the value you use for the `securityGroupRuleID` field to delete the rule using the `curl` method.

### Apply a Security Group to Cloud Server

Use the following instructions to apply a Security Group rule to a Cloud Server:

1. Navigate to **Servers** and select the server you want to apply the Security Group rules to.

2. Navigate to the **Networks and Security Groups** section on the **Server Details** page .

3. Click the gear icon next to the network interface you want to apply the Security Group rule to.

    **Note:** Security Group rules can only be applied to **PublicNet** and **ServiceNet**.

4. Click **Select Security Groups**.

5. Select the check box or the corresponding Security Group and click **Save Selected Security Group**.



### Delete a Security Group Rule through the Control Panel

Use the following instructions to delete a Security Group rule through the Control Panel:

1. Select the **Networking** tab in the Control Panel and select **Security Groups**.

2. Select the Security Group you want to remove the rule from.

3. On the Security Group Details page under rules you can select the check box and click the delete option.

### Delete a Security Group Rule through the API

`securityGroupRuleID` - The `id` field in the JSON output from creating the rule originally is the value you use for the `securityGroupRuleID`.

`yourAuthToken` - Use the authentication token for your user account. See [How curl commands work](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/send-request-ovw/#how-curl-commands-work) for information on authentication using `curl` commands.

Use the following `curl` command example to delete a Security Group rule through the API:

        curl -XDELETE https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules/<securityGroupRuleID> \

            -H "Content-type: application/json" \

            -H "X-Auth-Token: <yourAuthToken>" \

            -H "Accept: application/json" \

            | python -m json.tool

### Remove a Security Group from a server

1. Navigate to **Servers** in the Control Panel and select the cloud server you want to remove the Security Group from.

2. Navigate to the **Networks and Security Groups** section.

3. Click the gear icon next to the network interface you want to remove the Security Group from.

4. Click **Select Security Groups**.

5. Uncheck the check box next to the Security Group and click **Save Selected Security Group**.

