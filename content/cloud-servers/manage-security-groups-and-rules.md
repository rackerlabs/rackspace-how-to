---
permalink: manage-security-groups-and-rules/
audit_date: '2019-02-07'
title: Manage security groups and rules
type: article
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-02-07'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for creating security groups, applying inbound and outbound rules, and deleting rules by using the Rackspace Control Panel and Application Programming Interface (API).

### Create a security group

1. Log in to [my.rackspace.com](https://my.rackspace.com).

2.  Navigate to **Networking** and click **Security Groups**.

3.  Click **Create Security Group**.

4.  In the box labeled as **Step 1 of 2: Create Security Group**, enter a name, region, and an optional description. Then click **Create Security Group**.

5. In the box labeled **Step 2 of 2: Add Inbound Rule**, enter the Internet Protocol (IP) version, protocol, and source IP address or IP range for the rule that you are adding.

    **Note:** Creating an inbound security group rule is optional and can be skipped by clicking **No thanks. I'll add rules later**.

6. Click **Add Rule**.

### Create Outbound security group Rule

You must create outbound rules by using the API. Use the Client URL (`curl`) command example in this section to create an outbound security group rule. Update the following variables in the `curl` example by using the appropriate values for your account referenced in the following:

- `region` - Use the region for the security group.

- `yourAuthToken` - Use the authentication token for your user account. See [How curl commands work](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/send-request-ovw/#how-curl-commands-work) for information on authentication using `curl` commands.

- `portNumber or null` - Replace this with the port number that you want to add to the rule (such as 22, 80, or 443).

- `IPv4 or IPv6` - Specify IPv4 or IPv6.

- `desiredProtocol` - Replace this with the protocol that you want to use.

- `yourSGID` - **Security Group UUID**. The **Security Group UUID** is located on the security group Details Page next to **Group ID**.

Create an outbound security rule by using the following `curl` command example:

        curl -XPOST https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules \

            -H "Content-type: application/json" \

            -H "X-Auth-Token: <yourAuthToken>" \

            -H "User-Agent: python-novaclient" \

            -H "Accept: application/json" \

            -d '{"security_group_rule":{"direction":"egress","port_range_min":"<portNumber or null>","ethertype":"<IPv4 or IPv6>","port_range_max":"<portNumber or null>","protocol":"<desiredProtocol>","security_group_id":"<yourSGID>"}}' \

            | python -m json.tool


This command puts the rule you have just added in a JavaScript&reg; Object Notation (JSON) block.

**Note:** The `id` field in the JSON output is the value you use for the `securityGroupRuleID` field to delete the rule using the `curl` method.

### Apply a security group to cloud server

Use the following instructions to apply a security group rule to a cloud server:

1. Navigate to **Servers** and select the server to which you want to apply the security group rules.

2. Navigate to **Networks and Security Groups** on the **Server Details** page .

3. Click the gear icon next to the network interface you want to apply the security group rule to.

    **Note:** You can only apply security group rules to **PublicNet** and **ServiceNet**.

4. Click **Select Security Groups**.

5. Select the check box or the corresponding security group and click **Save Selected Security Group**.



### Delete a security group Rule through the Control Panel

Use the following instructions to delete a security group rule through the Control Panel:

1. Select the **Networking** tab in the Control Panel and select **Security Groups**.

2. Select the security group from which you want to remove the rule.

3. On the **Security Group Details** page under **Rules**, select the check box and click **Delete**.

### Delete a security group rule through the API

Update the following variables in the following curl example by using the appropriate values from your rule creation and for your account:

- `securityGroupRuleID` - The `id` field in the JSON output from creating the rule originally is the value you use for the `securityGroupRuleID`.

- `yourAuthToken` - Use the authentication token for your user account. See [How curl commands work](https://developer.rackspace.com/docs/cloud-networks/v2/getting-started/send-request-ovw/#how-curl-commands-work) for information on authentication using `curl` commands.

Use the following `curl` command example to delete a security group rule through the API:

        curl -XDELETE https://<region>.networks.api.rackspacecloud.com/v2.0/security-group-rules/<securityGroupRuleID> \

            -H "Content-type: application/json" \

            -H "X-Auth-Token: <yourAuthToken>" \

            -H "Accept: application/json" \

            | python -m json.tool

### Remove a security group from a server

1. Navigate to **Servers** in the Control Panel and select the cloud server from which you want to remove the security group.

2. Navigate to the **Networks and Security Groups** section.

3. Click the gear icon next to the network interface from which you want to remove the security group.

4. Click **Select Security Groups**.

5. Uncheck the check box next to the security group and click **Save Selected Security Group**.
