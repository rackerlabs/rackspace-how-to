---
node_id: 3255
title: Manually update the Rackspace Cloud Backup agent
type: article
created_date: '2013-01-08'
created_by: Rackspace Support
last_modified_date: '2016-02-10'
last_modified_by: Kelly Holcolm
product: Cloud Backup
product_url: cloud-backup
---

If the Cloud Backup updater, which is described in [Install or update the Cloud Backup agent on
Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux) failed, use the steps in this article to
manually update the Rackspace Cloud Backup agent.

### Agent updates

We release regular updates to the Rackspace Cloud Backup agent. Customers with a Managed Operations service level account have
their agent updated automatically when the new version is released.
However, Managed Infrastructure customers must update
their agent from time to time. Follow the instructions in this article to take
advantage of the latest features and fixes.

**Note:** These instructions assume that the agent has been previously
installed. Updates are typically completed automatically. Only in rare
circumstance should updates be completed manually.

### Update the agent for apt-based systems, like Ubuntu, Debian, and Vyatta

You might want to review [Install or update the Cloud Backup agent on
Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
before performing these steps.

**Note:** The Advanced Packaging Tool (APT) automatically stops and
restarts the driveclient service as part of the update process.
Driveclient versions 1.28 and later install the Cloud
Backup updater service, which keeps the agent up-to-date on the system.

1. Use SSH to log in to your server as a user with sudo or superuser privileges.

2. Update the repository data.

        apt-get update

3. Install the Cloud Backup updater.

        apt-get install --reinstall --assume-yes driveclient

### Update the agent for yum-based systems, like CentOS, Fedora, and Red Hat

You might want to review [Install or update the Cloud Backup agent on
Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
before performing these steps.

**Note:** Yum automatically stops and restarts the driveclient service
as part of the update process. Driveclient versions 1.28 and later
install the Cloud Backup updater service, which keeps the agent
up-to-date on the system.

1. Use SSH to log in to your server as a user with sudo or superuser privileges.

2. Update the driveclient.

        yum upgrade --assume-yes driveclient

**Note:** Fedora 22 and later use a new package manager called DNF
(Dandified Yum).

### Update the agent for Arch, Gentoo, and SUSE systems

You might want to review [Install or update the Cloud Backup agent on
Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
before performing these steps.

**Note:** The tarball that you download has the most up-to-date
instructions. If the tarball instructions differ from the following ones,
use the tarball instructions instead.

1. Use SSH to log in to your server as a user with sudo or superuser privileges.

2. Stop the current agent.

        pkill driveclient

3. Delete (or rename) the previously downloaded tarball.

        rm driveclient-latest.tar

4. Download the new tarball.

        wget http://agentrepo.drivesrvr.com/tar/driveclient-latest.tar.bz2

5. Extract the files.

        tar -xjf driveclient-latest.tar.bz2

6. Change to the new directory created in the preceding step. The following
command includes an example of the new directory.

        cd driveclient-1.12.006246

7. Copy the updated agent over the current agent.

    ```
    cp driveclient /usr/local/bin/
    chown root:root /usr/local/bin/driveclient
    chmod 700 /usr/local/bin/driveclient

    cp cacert.pem  /etc/driveclient
    ```
8. Start the updated agent.

        driveclient --daemon

Example init/startup scripts are included in the tarball.

### Update the agent on a Windows systems

Run the steps in this section as Administrator or as a
user with Administrator privileges. You might want to review [Install the Cloud Backup agent on
Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
before performing these steps.

Because the Windows agent includes an automated updater, you should
rarely need to update the Windows agent manually. This section provides different options to use if you need to manually update.

#### Recommended method

The recommended way to perform a manual update is to download the latest agent
from the deployment server and simply run it.

1. Download the updated agent.

  - 32-bit systems:

    http://agentrepo.drivesrvr.com/win32/driveclient-setup-latest.exe

  - 64-bit systems:

    http://agentrepo.drivesrvr.com/win64/driveclient-setup-latest.exe

2. Run the updated agent.

        driveclient-setup-latest.exe

You can even run it by simply executing the wrapper application from a Windows
file browser.

#### Alternative method

You can also update an existing agent from the command line with `msiexec`. However, using this method could adversely affect your agent registration. Attempt this method only if you know exactly what you are doing.

1. Save the configuration files from `%PROGRAMDATA%\Driveclient`.
2. Uninstall the current agent.
3. Copy the saved configuration files back to their original locations in `%PROGRAMDATA%\Driveclient`.
4. Download the latest MSI from the deployment server and run the installation without APIUSER and APIKEY.

        msiexec /i driveclient-1.18.007148-en-us.msi /qn /l*v %tmp%\install-1.18.007148.log DEBUGHIGH=true

Otherwise, updating the agent by using the MSI is the same as a fresh
installation. You have all the same MSI options available. For the
verification steps to test the update, see [Test the Windows installation or
update](/how-to/rackspace-cloud-backup-install-the-agent-on-windows#test-the-windows-installation-or-update).
