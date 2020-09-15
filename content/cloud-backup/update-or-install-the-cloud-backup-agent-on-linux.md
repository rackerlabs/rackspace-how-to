---
permalink: update-or-install-the-cloud-backup-agent-on-linux/
audit_date: '2020-03-27'
title: Update or install the Cloud Backup agent on Linux
type: article
created_date: '2020-03-27'
created_by: Brett Johnson
last_modified_date: '2020-09-15'
last_modified_by: Brett Johnson
product: Cloud Backup
product_url: cloud-backup
---

This article describes how to install the Rackspace Cloud Backup agent on your Linux&reg;
server. If you are using a Windows&reg; server, see [Install the Cloud Backup agent
(Windows)](/how-to/rackspace-cloud-backup-install-the-agent-on-windows) for instructions.

### Installation

The Rackspace Cloud Backup automated updater only supports 64-bit operating
systems. It also requires minimal tools, including but not limited to `curl`, `tar`,
and `bzip2`. If these tools are missing, you might not be able to install and use the updater.

#### Download the installer

Download the latest updater installation file from the
[agent repository](http://agentrepo.drivesrvr.com/updater/cloudbackup-updater-latest.tar.bz2)
by using a tool such as `curl` or `wget`.

Extract the Linux package files (`cloudbackup-updater-latest.tar.bz2`) to a temporary
directory.

    cd ~ && mkdir tmp && cd tmp && tar jxvf cloudbackup-updater-latest.tar.bz2

Change to the extracted folder. Read the LICENSE file. If you do not agree to the terms
contained in the file, do not continue with the installation.

For security reasons, you should not enter your API key directly on
the command line. Run the following command on the Linux command line to set an environment
variable with the API key:

    echo -n 'API key: ' && read -s apikey && export apikey && echo ''

To both install the updater and install and register the Cloud Backup agent, run
the following command:

    ./cloudbackup-updater --configure --user myuserid --apikey ${apikey} --flavor raxcloudserver --datacenter DFW

Change `myuserid` to the primary user ID for your account and `DFW` to the cloud server's region.

Run the following command to display other registration-time controls, which you rarely use:

    ./cloudbackup-updater --help

For cloud servers that reside in the LON region, you must specify the API host. For
USA regions, SYD, and HKG, you must use the default API host `api.drivesrvr.com`. 
For the LON region, you must use `api.drivesrvr.co.uk`.

**Note:** A forced agent registration disconnects any previous registrations from
the server in question. You must do a backup migration to reassociate the backup
data from a disconnected registration. However, the old registration with its backup
data remains attached to the customer account until you delete it.

#### Agent file locations on Linux

Assuming a default installation, following are the agent file locations
on Linux systems:

-   Configuration files: **/etc/driveclient**
-   Logs: **/var/log** (This value might be different on your server,
    depending on your settings in the **log4cxx.xml** file.)
-   Startup script: **/etc/init.d**
-   Application: **/usr/local/bin**
-   Process Identification (PID) file for running the agent:
    **/var/run/driveclient.pid**
-   Database: Search for a **\*.db** file under **/var/cache/driveclient**

**Note**: If `driveclient` is installed as an individual user,
most of these files are under **~/.driveclient**.


#### Non-cloud, non-Rackspace installation

You might need to install a Cloud Backup agent on
servers that are not in the Rackspace Public Cloud. You can use Rackspace Cloud Backup
on most Linux computers with a public Internet connection. These include machines like
company laptops and desktops, cloud servers from other providers, such as AWS EC2&reg;,
Google Cloud&reg;, and Azure&reg;, or Rackspace Private Cloud and Rackspace OnMetal, and so on.

To install on such computers or servers, you must use a different flavor of installation.

**Note:** Don't confuse the installation flavor with the Linux flavor. The Cloud
Backup installation flavor is the type or kind of Cloud Backup installation.

Normal installations on Rackspace Cloud Servers is `raxcloudserver`. For installation
on other types of computers, you should use the `dedicated` flavor.

    ./cloudbackup-updater --configure --user myuserid --apikey ${apikey} --flavor dedicated --datacenter DFW

For dedicated installations, you can specify any region accessible by the customer account.

#### Installations with existing agents

In the rare occasion that the server already has a registered Cloud Backup agent on it,
you should run the updater without the configuration option.

    ./cloudbackup-updater

This command installs the updater. If the currently installed agent is not the latest version,
the command updates the agent.

#### Check the Linux installation or update

After you have installed the updater and agent, you can verify the installation by using several
methods.

To verify the version of the updater, first check the latest version number in our repository:

    curl http://agentrepo.drivesrvr.com/updater-version.txt

Compare to the version installed on the computer:

    cloudbackup-updater --version

To verify the version of the agent, first check the latest version number in our repository:

    curl http://agentrepo.drivesrvr.com/version.txt

Compare to the version installed on the computer:

    driveclient --version

Verify the process ID (PID) of the agent and updater:

    pgrep -f cloudbackup-updater
    pgrep -f driveclient

The various flavors of Linux have different service control utilities. On CentOS&reg, for
instance, use the following commands to display the service status:

    service driveclient status
    service cloudbackup-updater status

However, on other flavors, such as Debian&reg, Fedora&reg, or Ubuntu&reg, use the following commands:

    systemctl status driveclient
    systemctl status cloudbackup-updater

You can view the following agent and updater logs with your favorite file viewer:

- **/var/log/cloudbackup-updater.log**
- **/var/log/driveclient.log**
- **/var/log/driveclient.log.1** (and so on for older versions)

If the agent or updater does not behave as expected, you can `grep` these logs to look for 
"ERROR" or other information. For more information on reading agent logs, see
[Cloud Backup Logging Basics](/how-to/cloud-backup-agent-logging-basics).

To verify that the agent is registered, look at the bootstrap file, **/etc/driveclient/boostrap.json**.

To ensure that the agent is registered, running, and connected, look at the Control Panel
status of this agent by logging in to [Cloud Control Panel](https://login.rackspace.com).
In the **Backup** section of the menu, you can create backup configurations, run backups and
cleanups, restore old backups, and so on by selecting the name of the server on which you installed
the agent.

### Troubleshooting installs, upgrades, and uninstalls

Installation and upgrade of the cloud backup agent or updater might fail for a number of reasons. 
The following troubleshooting tips might help to fix the issues.

We recommend that you enable TRACE logging as part of the troubleshooting process.
If you need to call the Support team, TRACE logging helps them identify the
problem. For more information about TRACE logging, see [Cloud Backup agent logging
basics](/how-to/cloud-backup-agent-logging-basics).

If the agent fails to start up, due to registration failure, for example, the most
effective log setting is to directly edit **log4cxx.xml** and change the level
from INFO to DEBUG or TRACE or ALL.

A Cloud Backup connection error indicates that the agent is not currently running
on the server. In this case, verify that the firewall does not block outgoing connections
on port 443.

#### Backup statuses: Skipped, Missed, Errored, and Failed

The backup statuses are defined below:

-   **Skipped:** The backup job was skipped because a backup job was
    already queued. A single backup job can be queued only once.
-   **Missed:** The backup job was missed because the agent did not respond.
    The agent was likely offline.
-   **Errored:** An error occurred during the backup. The backup job did
    run, and it needs to be investigated.
-   **Failed:** A serious problem occurred, and the backup job did not run.

To troubleshoot these error statuses, see [Cloud Backup Troubleshooting](/how-to/cloud-backup-troubleshooting/).

#### Uninstall the Cloud Backup agent or updater on Linux

To uninstall the agent, you must also uninstall the updater. Use the service control
tools provided by the flavor of Linux you are running. The name of the agent service
is `driveclient`, and the name of the updater is `cloudbackup-updater`. So for instance,
a Linux flavor that uses systemctl might require:

    systemctl disable cloudbackup-updater
    systemctl disable driveclient

**Warning:** When you disable the Cloud Backup agent, you **must** first disable the
updater, or it eventually re-enables the agent.

### More troubleshooting tips

For more troubleshooting tips and FAQs, see the following articles:
[Cloud Backup Troubleshooting](/how-to/cloud-backup-troubleshooting/)
and [Cloud Backup FAQs](/how-to/cloud-backup-faq/).
    
