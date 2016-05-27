---
permalink: troubleshooting-the-rackspace-monitoring-agent/
audit_date:
title: Troubleshoot the Rackspace Monitoring Agent
type: article
created_date: '2012-11-13'
created_by: Susan Million
last_modified_date: '2016-05-10'
last_modified_by: Zoltan Ver
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

This article describes issues related to the Rackspace Monitoring Agent
and provides actions that you can perform to resolve the issues. Issues
with the monitoring agent are typically related to the agent id. The
agent id that is associated with the entity is the unique identifier
that is automatically detected by the agent. This identifier is unique
for each account and is typically the ID of the cloud instance, but can
be a unique string.

### Issue: The Rackspace Monitoring Agent is not connected to my server


This issue might have one of the following causes:

-   The Rackspace Monitoring agent is not installed on your server. To
    install the agent, log in to your cloud server (as root on Linux or
    as an Administrator on Windows) and install the agent. For
    installation instructions, see [Install and configure the Rackspace
    Monitoring
    Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent).
-   The agent is installed but is not connected to your server. For the
    agent to work correctly, it must be associated with your server by
    using a Rackspace Monitoring entity. The entity is a representation
    of your server in the monitoring system.
-   The agent is installed but is not started or is not configured to
    start automatically during startup.
-   The monitoring agent is unable to determine the appropriate entity
    because there are duplicate entities associated with your account.
-   Connectivity issues, firewall problems.

### Resolution steps


Verify that the agent is installed and associated with your server by
performing the following steps:

### Linux

1.  Verify that the Rackspace monitoring agent is installed under
    **/usr/bin/rackspace-monitoring-agent**.
2.  Verify that the **/etc/rackspace-monitoring-agent.cfg** file exists
    and contains a valid agent token.
3.  Check for errors and status information in the
    **/var/log/rackspace-monitoring-agent.log** file:

        $ less /var/log/rackspace-monitoring-agent.log

    Look for errors like the following excerpt from a log file demonstrates a connection timeout failure:

    "Fri Feb 19 10:02:47 PM 2016 **ERR: Connection**: agent-endpoint-lon.monitoring.api.rackspacecloud.com:443 (agent-endpoint-lon.monitoring.api.rackspacecloud.com:443) -> **ETIMEDOUT**"

4.  Run the following command to verify that the agent is running:

        $ ps aux | grep rackspace-monitoring-agent

    or

        $ service rackspace-monitoring-agent status

    Attempt to start it if it's not shown as running:

        $ service rackspace-monitoring-agent start

5.  Make sure that you have firewall rules that allow IPv6 communication.
    Ff you have IPv6 disabled, make sure that the firewall is permitting
    the agent to communicate.


### Windows

1.  Verify that the Rackspace monitoring agent is installed under
    **C:\\Program Files\\Rackspace
    Monitoring\\rackspace-monitoring-agent.exe**.
    If you use a 32-bit version on a 64-bit Windows computer, the
    monitoring agent is installed under **C:\\Program Files
    (x86)\\Rackspace Monitoring\\rackspace-monitoring-agent.exe**.
2.  Verify that the **C:\\ProgramData\\Rackspace
    Monitoring\\config\\rackspace-monitoring-agent.cfg** file exists and
    contains a valid agent token.
3.  Check for errors and status information in the
    **C:\\ProgramData\\Rackspace Monitoring\\log.txt** file.
4.  Verify that the monitoring agent is running by opening the Task
    Manager, clicking the **Services** tab and locating the **Rackspace
    Monitoring** agent service.
5.  Make sure that you have firewall rules that allow IPv6 communication.
    If you have IPv6 disabled, make sure that the firewall is permitting
    the agent to communicate.

### Check for duplicate entities

### Use Raxmon to check for duplicate entities

You can use the Rackspace Monitoring Command Line Interface (Raxmon) to
troubleshoot your monitoring agent. To install the Raxmon tool, read
[Getting Started with Rackspace Monitoring
CLI](/how-to/getting-started-with-rackspace-monitoring-cli).

To troubleshoot a monitoring agent by using Raxmon, complete the
following steps:

1.  Create a config file in the following location: `~/.raxrc`

2.  Populate the config file with the following content:

        [credentials]

        username=ACCOUNT_USERNAME

        api_key=ACCOUNT_APIKEY

        [api]

        url=https://monitoring.api.rackspacecloud.com/v1.0

        [auth_api]

        url=https://identity.api.rackspacecloud.com/v2.0

        [ssl]

        verify=true

    **Note**: `ACCOUNT_USERNAME` and `ACCOUNT_APIKEY` are the Rackspace
    Cloud account username and your API key.

3.  Type the following at a command-line interface:

        raxmon-entities-list

4.  Examine the output to see if it has two entites as shown in the
    example below:

        Entity: id=enRDIKf7zG label=Krisna provider=Rackspace Monitoring...
        Entity: id=enhqYnVEnc label=krisna provider=Rackspace Monitoring...

5.  If your output has two entities, with different label cases (upper
    and lower case), open a ticket with Support to fix this issue.
6.  After Support has fixed the problem with duplicate entities, restart
    the monitoring agent, so that the changes can take full effect.

### Use cURL to check for duplicate entities

You can use cURL to check for duplicate entities.

To check for duplicate entities by using cURL, do the following:

1.  Authenticate against the Rackspace Cloud API by issuing the
    following command at a command-line interface:

        curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST'
            -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"yourUserName", "apiKey":"yourApiKey"}}}'
            -H "Content-Type: application/json" | python -m json.tool

    After a successful authentication, make sure to write down the
    authentication token.

2.  Issue the following command to obtain a list of entities:

        curl -i -X GET <br>
           -H 'X-Auth-Token: '$token''<br>
           -H 'Content-Type: application/json' <br>
           -H 'Accept: application/json' <br>
           'https://monitoring.api.rackspacecloud.com/v1.0/$accountid/entities'

    Make sure to replace the *\$token* placeholder with the
    authentication token you have obtained during authentication and the
    *\$accountid* placeholder with your Rackspace Cloud account id.

3.  If the call is successful, you will receive a list of entities and
    their corresponding metadata as shown in the following example:

            "values": [
                 {
                    "id": "en5wmQxCsz",
                    "label": "test1",
                    "ip_addresses": {
                           "access_ip0_v6": "2001:4800:7818:0103:be76:4eff:fe04:d3b6",
                           "access_ip1_v4": "104.130.141.220"
                    },
                     "metadata": null,
                     "managed": false,
                     "uri": "https://dfw.servers.api.rackspacecloud.com/1234567/servers/1b62e690-7745-4bbf-9ee8-7fcd361db227",
                     "agent_id": "1b62e690-7745-4bbf-9ee8-7fcd361db227",
                     "active_suppressions": [],
                     "scheduled_suppressions": [],
                     "created_at": 1416625774775,
                     "updated_at": 1416625774775
                   },
                   {
                      "id": "enInNqsafG",
                      "label": "test2",
                      "ip_addresses": {
                             "public0_v4": "104.130.240.201",
                             "private0_v4": "10.209.65.2",
                   },
                      "metadata": null,
                      "managed": false,
                      "uri": "https://dfw.servers.api.rackspacecloud.com/1234567/servers/880d31fb-06e7-456f-b849-aa35044d4a9b",
                      "agent_id": "880d31fb-06e7-456f-b849-aa35044d4a9b",
                      "active_suppressions": [],
                      "scheduled_suppressions": [],
                      "created_at": 1424970771920,
                      "updated_at": 1424970771920
                  },

4.  Examine the output and check whether there are duplicate entities
    with varying label cases. If duplicate entities exist, open a ticket
    with Support.

### Manually configure the Rackspace Monitoring agent to function behind an HTTPS proxy

If you need to connect the agent through an HTTP proxy, you can manually
configure the Rackspace Monitoring agent to function behind an HTTPs
proxy by setting the `monitoring_proxy_url` parameter in the agent
configuration file.

For information about configuring the monitoring agent by using the
agent configuration file, see [Configure the agent
manually](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#configure-agent-manually).
For information about the agent configuration file, see [Agent
configuration
file](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#agent-configuration-file).

### Related information

[About the Rackspace Monitoring
Agent](/how-to/about-the-rackspace-monitoring-agent).
