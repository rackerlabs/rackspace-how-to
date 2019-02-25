---
permalink: create-a-custom-cloud-monitoring-alert/
audit_date: '2019-01-22'
title: Create a custom Cloud Monitoring alert
type: article
created_date: '2019-02-13'
created_by: Rackspace Community
last_modified_date: '2019-02-13'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

The Rackspace Cloud Control Panel enables you to create the
following monitoring checks:

- Hyper Text Transfer Protocol (HTTP) check (website)
- Transmission Control Protocol (TCP) check (port)
- Ping Check (server)
- Memory
- Central processing unit (CPU)
- Load Average (Linux&reg;)
- File system
- Network

However, you might also want to trigger an alert if the live syncing
daemon (Lsync) stops working, or if the Network Time Protocol (NTP) becomes
too far offset. This article shows you how to monitor custom conditions and
trigger custom alerts.

### Prerequisites

Before you follow the steps in this article, ensure that you have the following
capabilities:

- A basic knowledge of Git&reg;
- The Cloud Monitoring Agent installed on the server
- A basic knowledge of the Linux command line

### Create a custom monitoring alert

Rackspace's Cloud Monitoring Agent enables you to add plug-ins that generate
additional metrics, and write custom alarm language that uses these metrics to
trigger alarms.

You can see sample scripts that Rackers have written in our publicly available
[GitHub&reg;
repository](https://github.com/racker/rackspace-monitoring-agent-plugins-contrib).

Use the following steps to create a custom monitoring alert:

1. Find the account number of the account and `entity_id` of the cloud
   server.
2. Place the plug-in that you want to run in the
   **/usr/lib/rackspace-monitoring-agent/plugins** directory so that the
   Cloud Monitoring Agent has access to the metrics that it generates.

   **Note**: If this directory does not exist, you must create it.

3. Ensure that the plug-in is executable and can run from the command line by
   running the following command:

       chmod +x <filename>

4. To create the check within Cloud Monitoring, modify and run the following
   cURL command:

       curl -i -X POST \
       -H 'X-Auth-Token: [AUTH_TOKEN]' \
       -H 'Content-Type: application/json; charset=UTF-8' \
       -H 'Accept: application/json' \
       --data-binary \
       '{"label": "[CHECK_NAME]", "type": "agent.plugin", "details": {"file": "[FILENAME]","args": ["arg1","arg2"]}}' \
       'https://monitoring.api.rackspacecloud.com/v1.0/[ACCOUNT_ID]/entities/[ENTITY_ID]/checks'

   **Note**: To learn how to obtain your authentication token, see the
   [Getting Started](https://developer.rackspace.com/docs/cloud-servers/v2/getting-started/) section of the developer documentation.

5. Ensure that you receive a response with HTTP code `201`.

6. Confirm that the check exists in the [Cloud Control
   Panel](https://login.rackspace.com).

### Add your alarm criteria

Finally, you need to add your alarm criteria for the new metrics.

The following code shows a basic example of the alarm language:

    if (metric['avail'] < 102400) {
        return new AlarmStatus(CRITICAL, 'Less than 100MB of available space remains');
    }
    return new AlarmStatus(OK, 'More than 100MB of space is available');

This is the alarm language for the default file system agent check. The example
triggers a `CRITICAL` alert if there is less than 100 MB available
on the server on which the plug-in resides. If there is more than 100 MB,
the check receives an `OK` response and no alert triggers.

To learn more about alarm language, see [Alarm language in Rackspace
Monitoring](/how-to/alarm-language-in-rackspace-monitoring/).

After you have created your alarm language, you need to add the alarm to the entity
by using one of the following methods:

- The [Cloud Control Panel](/how-to/working-with-alarms/)
- The [raxmon command-line
  tool](https://developer.rackspace.com/blog/using-raxmon-to-configure-rackspace-cloud-monitoring/) for interacting with the Rackspace Cloud
  Monitoring application programming interface (API)
- A [cURL POST command](https://developer.rackspace.com/docs/rackspace-monitoring/v1/api-reference/alarms-operations/#create-an-alarm)

### Use an Ansible playbook to install plug-ins

An [Ansible&reg;
playbook](https://github.com/stevekaten/cloud-monitoring-plugin-deploy)
for installing Cloud Monitoring plug-ins on the local host is available.

If your account has THE Managed Infrastructure service level, you need to modify
the **group_vars/all** file. Because this playbook is specifically for Managed
Operations, the default is to notify our administrators if an alert triggers.
Modify the file so that Cloud Monitoring notifies your staff if a custom alert triggers.

If your account has the Managed Infrastructure service level, you need to change
the notification plan from **npManaged** to **npTechnicalContactsEmail**.
