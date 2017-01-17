---
permalink: server-side-monitoring-configuration/
audit_date: '2017-01-16'
title: Server-side monitoring configuration
type: article
created_date: '2017-01-03'
created_by: Nate Archer
last_modified_date: '2017-01-16'
last_modified_by: Nate Archer
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Monitoring configurations can be applied across an entire environment with a server-side configuration. Server-side configurations enable you to update and share your preferred configuration quickly, and can also be used with automation tools. This article describes how to create a server-side configuration.

### Set up the Rackspace Monitoring Agent

Before you create a monitoring configuration file on a server, ensure that the latest version of the Rackspace Monitoring Agent is connected to the server that you are targeting for configuration. To learn how to connect the monitoring agent, see [Install and configure the Rackspace Monitoring Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent/).

### Create a server-side configuration file

A configuration file written in YAML is needed in order for the servier-side configuration to work.

1. Create a YAML configuration file that defines one or more monitoring checks and one or more associated monitoring alarms. You can use the following `main_disk_check.yaml` file can be used as a template for creating your configuration file.

       type        : agent.filesystem
       label       : Check for Main Disk
       disabled    : false
       period      : 60
       timeout     : 30
       details     :
         target  : /
       alarms      :
         alarm1  :
            label                 : disk used alarm
            notification_plan_id  : npTechnicalContactsEmail
            criteria              : |
                if (percentage(metric['used'], metric['total']) > 90) {
                    return new AlarmStatus(CRITICAL, 'Less than 10% free space left - #{used} used out of #{total}');
                }
                if (percentage(metric['used'], metric['total']) > 80) {
                   return new AlarmStatus(WARNING, 'Less than 20% free space left - #{used} used out of #{total}');
                }


   **Note:** If the YAML file includes a parsing error, the file is ignored. You can see parsing results in the agent log file.

2. Save the file to the `rackspace-monitoring-agent.conf.d` directory on your target server. The location of the `conf.d` directory depends on your server's operating system.

   - Linux:

         /etc/rackspace-monitoring-agent.conf.d/main_disk_check.yaml

   - Windows:

         "C:\ProgramData\Rackspace Monitoring\config\rackspace-monitoring-agent.conf.d\main_disk_check.yaml"

   **Note:** Saving the configuration file to the `conf.d` directory might require administrative access.

3. After the YAML file is saved in the correct directory, restart the Rackspace Monitoring Agent.

   - For Linux, use the following command:

         sudo service rackspace-monitoring-agent restart

   - For Windows, use the Windows Service Manager.

   The agent uploads the file to the Rackspace Monitoring service and set up your new configuration on the target server.

### Update or delete a server-side configuration

If you want to change your server-side configuration file, update and save your YAML file, and then restart the agent. The agent updates the target server with your updated checks and alarms.

Checks and alarms defined by the server-side configuration file can also be temporarily updated by using the Rackspace Monitoring API, until the agent restarts. After the agent restarts, all changed made through the API are overwritten by the configuration file. If a check or alarm is created through the API, it is unaffected by the server-side configuration file.

If you want to delete your server-side configuration file, simply delete the YAML file and restart the agent. The agent deletes any checks and alarms that you included in the file.
