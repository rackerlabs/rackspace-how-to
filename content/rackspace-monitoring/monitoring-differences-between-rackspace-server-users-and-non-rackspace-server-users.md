---
permalink: monitoring-differences-between-rackspace-server-users-and-non-rackspace-server-users/
audit_date:
title: 'Differences between monitoring Rackspace Server users and non-Rackspace Server users'
type: article
created_date: '2014-06-16'
created_by: Maria Abrahms
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Rackspace Monitoring can be used with Rackspace servers and non-Rackspace servers. When you 
are using a Rackspace server, you can be at a Managed Operations service level or a Managed 
Infrastructure service level. There are some differences between what you can do in each 
of these circumstances. This article describes the following circumstances.

- Rackspace servers with a Managed Operations service level
- Rackspace servers with a Managed Infrastructure service level
- Unmanaged non-Rackspace servers

**Note:** Non-Rackspace servers are not managed.

### Rackspace servers with a Managed Operations service level

- Entities for Rackspace servers and databases are managed automatically, which means:
  - Monitoring entities are created automatically for new cloud servers or new cloud databases.
  - When a cloud server or cloud database is deleted, the associated entity is deleted in 
    the monitoring system.
  - When the cloud server name is changed, the name is changed in monitoring automatically. 
    (You cannot change the instance name for cloud database.)


- The label for Rackspace Cloud Servers can be changed only on the server directly. The 
  change  propagates to the monitoring system quickly. The instance name for a cloud database 
  cannot be changed.

- These servers have the default notification plan **npTechnicalContactsEmail** and have 
  an additional notification entry, **npManaged**.

- The agent needs the agent token to authenticate with the monitoring server. This value is 
  stored as **monitoring_token** in the agent configuration file. The agent is able to 
  identify the server it is installed on to the server.

- By default, the monitoring agent is installed and turned on, and the monitoring is 
  configured automatically. For details, see [Managed accounts hosting](https://www.rackspace.com/dedicated-servers).

- For Cloud Databases customers, the monitoring agent is installed with monitoring configured 
  automatically, by default. For details, see the 
  [Cloud Databases documentation](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/).

- You can access some monitoring features through the Cloud Control Panel and all the 
  features through API. You can see more monitoring features, as well as metrics, through 
  the [Rackspace Intelligence interface](https://intelligence.rackspace.com/).


### Rackspace servers with a Managed Infrastructure service level

- Entities for Rackspace servers and databases are managed automatically, which means:
  - Monitoring entities are created automatically for new cloud servers or new cloud databases.
  - When a cloud server or cloud database is deleted, the associated entity is deleted in 
    the monitoring system.
  - When the cloud server name is changed, the name is changed in monitoring automatically. 
    (You cannot change the instance name for a cloud database.)


- The label for Rackspace Cloud Servers can be changed only on the server directly. The 
  change propagates to the monitoring system quickly. The instance name for a cloud database 
  cannot be changed.

- These servers have the default notification plan **npTechnicalContactsEmail** only.

- The agent needs the agent token to authenticate with the monitoring server. This value is 
  stored as **monitoring_token** in the agent configuration file. The agent is able to 
  identify the server it is installed on to the server.

- By default, the monitoring agent must be manually installed. For details, see the 
  [Rackspace Monitoring documentation](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#install-and-configure-the-agent).

- For Cloud Databases customers, the monitoring agent is installed with monitoring configured 
  automatically, by default. For details, see the 
  [Cloud Databases documentation](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/).

- You can access some monitoring features through the Cloud Control Panel and all the 
  features through API. You can see more monitoring features, as well as metrics, through 
  the [Rackspace Intelligence interface](https://intelligence.rackspace.com/).

### Unmanaged non-Rackspace servers

- Entities for non-Rackspace servers and databases must be managed manually, this means:
  - Monitoring entities need to be created manually for new servers . When configuring the 
    default monitoring agent, you either select an entity you already created for it,or let 
    the setup process create one for you.
  - When a server is deleted, you must delete the associated monitoring entity through the 
    API or CLI.
  - When the server name is changed, you must manually change the name in monitoring.


- Monitoring entities can be deleted, and the label for servers can be changed.

- These servers have the default notification plan **npTechnicalContactsEmail** only.

- The agent needs the agent token to authenticate with the monitoring server. This value is 
  stored as **monitoring_token** in the agent configuration file.

  In addition, the agent needs to know the entity on which it is installed. This value is 
  the **agent_id** associated with the entity on the monitoring server. This is also a field 
  in the agent configuration file.

  If you are going to create an image from a non-Rackspace server to be used to create more 
  servers, you need to remove the **agent_id field**, *before you generate the image*, in 
  the agent configuration file that is generated when you run the agent setup. Otherwise, 
  the agent will be associated with the entity from which the image was created and the 
  checks won't work properly.

  Agent configuration file are located at the following paths:
  - Ubuntu, CentOS: **/etc/rackspace-monitoring-agent.cfg**
  - Windows: **c:\ProgramData\Rackspace Monitoring\config\rackspace-monitoring-agent.cfg**

  To learn more about agent configuration, see 
  [Install and configure the Rackspace Monitoring Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent).

- By default, the monitoring agent must be manually installed. For details, see the [
  Cloud Monitoring documentation](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#install-and-configure-the-agent).

- You can see monitoring features, as well as metrics, through the 
  [Rackspace Intelligence interface](https://intelligence.rackspace.com/).
