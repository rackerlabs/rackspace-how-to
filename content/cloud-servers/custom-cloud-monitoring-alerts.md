---
permalink: custom-cloud-monitoring-alerts
audit_date:
title: Custom Cloud Monitoring Alerts
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---
There are times where you will need a monitoring alert created besides the ones that are offered via the Control Panel.  The ones we offer via the Control Panel are http, port, ping, memory, CPU, filesystem, load average and network.  But what if you want an alert to trigger if lsync stops working?  Or what if ntp becomes too far offset?  You can create these alerts, it will just require a little bit more effort.
 
Prerequisites: 
 
* Basic knowledge of GIT
* Cloud Monitoring agent installed on the server
* Basic Linux command line knowledge
 
How to do it:
 
The Cloud Monitoring Agent allows for the addition of plugins that can provide metrics to write custom Alarm Language.
 
Once a script has been written it can be placed in the /usr/lib/rackspace-monitoring-agent/plugins/ directory and then the Cloud Monitoring Agent will have access to it's metrics.  Create the directory if it does not exist, and make sure the script is executable by using the command:
 
chmod +x <filename>
 
We do have a publicly available GitHub repository where there are a number of scripts written by Rackers.
 
The full process:
 
1. Find the account number for the account and entity_id for the Cloud Server
2. Determine which plugin you want to run and place it in the /usr/lib/rackspace-monitoring-agent/plugins directory, make sure it is executable and can run from the command-line
3. Modify and run the CURL command below, this creates the check within Cloud Monitoring.  Ensure you get a 201 and confirm the check has been created in Cloud Control. 
4. Add your Alarm Criteria through Cloud Control, raxmon, or another curl command.  The check should exist from the below CURL command, so it should be pretty easy to pull together from Cloud Control.
 
Curl command:
 
curl -i -X POST \
-H 'X-Auth-Token: [AUTH_TOKEN]' \
-H 'Content-Type: application/json; charset=UTF-8' \
-H 'Accept: application/json' \
--data-binary \
'{"label": "[CHECK_NAME]", "type": "agent.plugin", "details": {"file": "[FILENAME]","args": ["arg1","arg2"]}}' \
'https://monitoring.api.rackspacecloud.com/v1.0/[ACCOUNT_ID]/entities/[ENTITY_ID]/checks'
 
We have some documentation on receiving your Auth Token and on how to get the entity ID. 
 
Alarm language:
 
Here is a basic example of the Alarm language:
 
if (metric['avail'] < 102400) { 
    return new AlarmStatus(CRITICAL, 'Less than 100MB of available space remains'); 
} 
return new AlarmStatus(OK, 'More than 100MB of space is available');
 
This alarm will throw a CRITICAL alert if there is less than 100MB available on the server that the plugin resides on.  If there is more than 100MB the check will receive an OK and no alert will be triggered. 
 
This is the Alarm Language for the default file system agent check.  It should give you a basic snippet to copy+paste.
 
Other cool things:
 
For Managed Infrastructure accounts you will want to modify the group_vars/all file.  This playbook was written by a Managed Operations admin specifically for Managed Operations, so the default is to notify our admins if an alert triggers.  For Managed Infrastructure accounts, that option is not available.  You'll want to change the notification plan to npTechnicalContactsEmail from npManaged.  You can find out how to install this playbook in the follow up article "https://community.rackspace.com/products/f/25/t/4692". 
