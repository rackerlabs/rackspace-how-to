---
permalink: update-the-rackspace-cloud-backup-agent/
audit_date:
title: Manually update the Rackspace Cloud Backup agent
type: article
created_date: '2013-01-08'
created_by: Rackspace Support
last_modified_date: '2020-01-15'
last_modified_by: Brett Johnson
product: Cloud Backup
product_url: cloud-backup
---

If the Cloud Backup updater, which is described in
[Install or update the Cloud Backup agent on Linux&reg;](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
or [Install the Cloud Backup agent on Windows&reg;](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
failed, use the steps in this article to manually update the Rackspace Cloud
Backup agent.

We release updates as they are needed to the Rackspace Cloud Backup agent. When
a new agent is available, agent updates are pushed automatically by the
automated updater. If the automated updater fails for some reason, follow the
instructions in this article to take advantage of the latest security patches,
features, and bug fixes in Cloud Backup.

**Note:** These instructions assume that the agent has been previously
installed.

### Update the agent for Linux-based systems

For Linux-based systems, you might want to review
[Install or update the Cloud Backup agent on Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
before performing these steps.

Use the following steps to update the backup agent for Linux-based systems, such as the Red Hat operating system, Debian, etc.:

1. Use SSH to log in to your server as a user with sudo or superuser privileges.

2. Download the latest [Linux CBU package](http://agentrepo.drivesrvr.com/tar/driveclient-latest.tar.bz2).

3. Extract the package manually.

		  sudo tar jxvf driveclient-latest.tar.bz2

4. Move the agent app to /usr/local/bin.

      sudo mv driveclient*/driveclient /usr/local/bin/. && sudo chown root:root /usr/local/bin/driveclient &&
      sudo chmod 755 /usr/local/bin/driveclient

5. Create an install folder and move the agent cert.

      mkdir /etc/driveclient && mv driveclient*/cacert.pem /etc/driveclient/.

6. Register the driveclient.

      /usr/local/bin/driveclient --configure --username myuserid --apikey ${apikey} --flavor raxcloudserver --datacenter DFW

7. Start the driveclient.

      /usr/local/bin/driveclient --daemon

For more detailed information on these configuration settings, see
[Update or install the Cloud Backup agent on Linux](/how-to/update-or-install-the-cloud-backup-agent-on-linux/).

**Warning:** This assumes that you are manually installing the agent because the system you are installing it on is
not yet supported by the current updater. For that reason, we make no assumptions about the requirements to
add the agent or the updater as a service. This means you must manually start the driveclient every time you
restart the server.

### Update the agent on a Windows system

Run the steps in this section as Administrator or as a user with Administrator
privileges. You might want to review
[Install the Cloud Backup agent on Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
before performing these steps.

Because the Windows agent includes an automated updater, you should rarely need
to update the Windows agent manually. This section provides different options
to use if you need to manually update.

#### Recommended method

The recommended way to perform a manual update is to download the latest agent
from the deployment server and simply run it.

1. Download the updated agent from http://agentrepo.drivesrvr.com/win64/driveclient-setup-latest.exe

2. Run the updated agent.

        driveclient-setup-latest.exe

You can also run the agent by simply executing the wrapper application from a
Windows file browser.

#### Alternative method

You can also update an existing agent from the command line with `msiexec`.
However, using this method could adversely affect your agent registration.
Attempt this method only if you know exactly what you are doing.

1. Save the configuration files from `%PROGRAMDATA%\Driveclient`.

2. Uninstall the current agent.

3. Copy the saved configuration files back to their original locations in
`%PROGRAMDATA%\Driveclient`.

4. Download the latest MSI from the deployment server and run the installation
without APIUSER and APIKEY.

        msiexec /i driveclient-1.18.007148-en-us.msi /qn /l*v %tmp%\install-1.18.007148.log DEBUGHIGH=true

Otherwise, updating the agent by using the MSI is the same as a fresh
installation. You have all the same MSI options available. For the verification
steps to test the update, see
[Test the Windows installation or update](/how-to/rackspace-cloud-backup-install-the-agent-on-windows#test-the-windows-installation-or-update).
