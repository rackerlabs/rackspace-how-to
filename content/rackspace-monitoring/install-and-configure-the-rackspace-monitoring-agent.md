---
permalink: install-and-configure-the-rackspace-monitoring-agent/
audit_date:
title: Install and configure the Rackspace Monitoring Agent
type: article
created_date: '2012-11-13'
created_by: Susan Million
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

This article describes different methods for installing and
configuring the Rackspace Monitoring Agent on a cloud server.  You
install the Rackspace Monitoring Agent on the servers you want to
monitor. The agent gathers data based on the checks that you configure,
including checks for host information and host metrics, and
custom-defined checks.

Rackspace Montioring agent supports both Windows and Linux platforms. For a list of detailed supported operating systems, see [Rackspace Monitoring support matrix](/how-to/rackspace-monitoring-support-matrix/).

This article describes the following tasks:

-   Install the monitoring agent by using the Rackspace Intelligence
    interface
-   Install the monitoring agent by using meta packages
-   Configure the monitoring agent by using the agent setup
    program
-   Install the monitoring agent using other methods
-   Upgrade the monitoring agent
-   Uninstall the monitoring agent

### Install the monitoring agent
Rackspace Monitoring agents are packaged in the standard way for the ease of installation process.  To check out 
individual steps for each platform, please see the [Install and configure the agent](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/install-configure/) section of the *Rackspace Monitoring Developer Guide*.

We recommend using the Rackspace Intelligence web-based interface to install
and configure the monitoring agent. The Rackspace Intelligence
interface provides easy installation and set up based on the Windows or Linux platform you select. 
The Rackspace Intelligence interface also provides graphs for visualizing data collected by Rackspace Monitoring. 

Rackspace Intelligence has many more monitoring
configuration and visualization options than the Cloud Control Panel,
including three methods for installing the monitoring
agent: Quick Install, Step By Step, and Source.

### To use the Rackspace Intelligence interface to install the agent:

1.  Log in
    at [intelligence.rackspace.com](https://intelligence.rackspace.com/) with
    your Cloud Control Panel login credentials.
2.  Click the name of the entity (the object or resource
    that you want to monitor) for your server. If your
    server is not a cloud server or cloud database from Rackspace,
    create the entity by entering the name of the server that you want
    to monitor, and then clicking **Create Entity**.
3.  In the Monitoring Details section of the entity details page, click
    **Install Agent** next to the **Monitoring Agent** option.
    The Monitoring Agent Installation page opens.
4.  Choose the platform of your server and then click one of the
    following tabs:

-   **Quick Install**: This method provides a simple command that you
    can copy and then paste into a shell window after you are logged in
    to the server that you want to monitor.
-   **Step By Step**: This method provides a series of commands that
    give you insight into the agent installation process.  
-   **Source**: This method takes you directly to the open-source agent
    pages where you can download the agent.  

Completing the steps for any method installs the agent
immediately. You can then continue to create checks for the agent, which
you can also do within Rackspace Intelligence.

### Install the monitoring agent by using meta packages


The meta packages installation obviates the need to install the
certificate or create a repository manually.  This is for Linux distribution only.

1. Log in to the server that you want to monitor.

2. Open a browser to the [Rackspace Monitoring Meta Packages](http://meta.packages.cloudmonitoring.rackspace.com/) page.

3. Find your operating system and enter the commands provided.

### Configure the monitoring agent by using the agent setup program

After you have installed the agent package on your server, you can
configure the monitoring agent by running the [agent Setup program](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/install-configure/#run-agent-setup-program).
The agent setup program completes the following configuration tasks for
you:

-   Configures an agent token that the agent uses to authenticate with
    Rackspace Monitoring.

-   Creates an agent configuration file,
    `rackspace-monitoring-agent.cfg`{.filename}. **Note:** Rackspace
    Monitoring now supports debug logging based on the
    configuration file.

-   Verifies connectivity to the Rackspace data centers.

-   Associates the agent with a monitoring entity.

For more information, see the [Configure the agent with the Setup program](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/install-configure/#run-agent-setup-program)
section in the *Rackspace Monitoring Developer Guide*.

### Upgrade the agent

The agent does not upgrade itself. However, if you've added the agent
repository to a Linux system, the agent is upgraded when you run a
system update.

For Windows and other systems that do not have the agent in a package
repository, you must upgrade the agent manually by following the
installation instructions found in the [Rackspace Monitoring Developer guide](https://developer.rackspace.com/docs/rackspace-monitoring/v1/getting-started/install-configure/#install-agent-windows).

If you upgrade manually, we recommend that you check for an upgrade
to the agent every three to four weeks.

### Uninstall the agent

Use the standard method for your operating system to uninstall the
agent.

#### Ubuntu and Debian

On Ubuntu and Debian systems, run the following command:

    sudo apt-get remove rackspace-monitoring-agent

#### CentOS, Red Hat, and Fedora

On CentOS, Red Hat, and Fedora, run the following command:

    sudo yum remove rackspace-monitoring-agent

#### Windows

On Windows, use the Add/Remove Programs utility in the Windows Control
Panel.

### Next steps

After you have installed and configured the monitoring agent, the next
steps are to create *checks* to gather metrics (specific data points)
and *alarms* that trigger a notification at certain thresholds. You also
need to create a notification and notification plan. For details about
performing these steps in the Cloud Control Panel, see [Rackspace Monitoring Checks and Alarms](/how-to/rackspace-monitoring-checks-and-alarms "Rackspace Cloud Monitoring Checks and Alarms") and
[Creating a monitoring check using the Control Panel](/how-to/creating-a-monitoring-check-using-the-cloud-control-panel "Creating a Monitoring Check Using the Control Panel").

### Related information

-   [About the Rackspace Monitoring Agent](/how-to/about-the-rackspace-monitoring-agent "About the Monitoring Agent")
-   [Troubleshooting the Monitoring Agent](/how-to/troubleshooting-the-rackspace-monitoring-agent "Troubleshoot the Monitoring Agent")
