---
permalink: rackspace-cloud-backup-install-the-agent-on-linux/
audit_date:
title: Install or update the Cloud Backup agent on Linux
type: article
created_date: '2014-05-05'
created_by: Kyle Laffoon
last_modified_date: '2016-12-16'
last_modified_by: Cat Lookabaugh
product: Cloud Backup
product_url: cloud-backup
---

Use the following instructions to install or update the Rackspace Cloud Backup
agent on your Linux server by using the Cloud Backup updater.

**Note:** If the Cloud Backup updater fails, use the instructions in
[Manually update the Rackspace Cloud Backup agent](/how-to/update-the-rackspace-cloud-backup-agent).

If you are using a Windows server, see
[Install the Cloud Backup agent on Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows)
for parallel instructions.

**Note:** You can use Cloud Backup on almost any Linux server in the Rackspace
Cloud. Exceptions are FreeBSD 9 (not supported) and Debian 5 (End of Life
February 2012). If you use FreeBSD 9 or Debian 5, use an alternative method to
back up your data. Also note that 32-bit servers and agents on Linux are not
supported.

### Install or update the agent

To see if your server already has the Cloud Backup agent installed, run the
following command:

    sudo cloudbackup-updater -v

If the command runs without an error, the agent is already installed. This
should be the case for servers with a Managed Operations service level. If you
get a message that the command can't be found, you must install the agent.

If the Cloud Backup agent is not installed, proceed with the instructions in
this article for your Linux distribution.

**Note**: Installation of all the Linux backup agents requires a reboot.
However, updating the agent does not require a reboot.

### Install the agent on APT-based systems, such as Ubuntu and Debian

**Note:** On Tuesday, December 13th, 2016, we released a new set of packages to
production (a new version of Cloud Backup Updater for Debian Linux and a new
Debian Package - cloudbackup-keyring.deb) to the Debian APT repository to
support Debian and derivative Linux distributions, like Ubuntu. Any system that
has the Cloud Backup Updater installed and enabled should get the new packages.

1. Use SSH to log in to your server, and run the commands as a user with sudo
or superuser privileges.

2. Download the new [Cloud Backup Keyring package](http://agentrepo.drivesrvr.com/debian/pool/main/c/cloudbackup-keyring/cloudbackup-keyring_2016.12.02-1_all.deb).

3. Install the Keyring package manually.

        sudo dpkg -i cloudbackup-keyring_2016.12.02-1_all.deb

4. Update the apt repository information.

        sudo apt-get update

5. Install the `python-apt` package.

        sudo apt-get install python-apt

6. Get the auto-updater.

        wget 'http://agentrepo.drivesrvr.com/debian/cloudbackup-updater-latest.deb'

7. Install the auto-updater.

        sudo dpkg -i cloudbackup-updater-latest.deb

    The updater installs the agent (if it's not already installed) and
    sets the agent to start at boot. Any errors will be fixed it in the next
    step.

8. To ensure that the package configuration process finishes, run `apt-get` with the `-f` option. This option fixes any outstanding package dependency issues on the system.

        sudo apt-get install -f

9. Check the installation.

   The updater might take a few minutes to download and install the agent. To check the status of the agent installation, run the following command:

        sudo cloudbackup-updater -v

   The command won't respond until the installation is complete. When it returns you to the shell prompt, proceed to the next step.

   If you get a `command not found` error, run `sudo apt-get install -f`
    per the preceding step.

10. Run the agent with the `--configure` option to configure it.

        sudo /usr/local/bin/driveclient --configure --username <username> --apikey <apiKey> --flavor <flavor> --datacenter <dataCenter> --apihost api.drivesrvr.com

      - Use your Rackspace Cloud account username and API key for `<username>` and `<apiKey>`. For information about how to find your API key, see [View and reset your API key.](/how-to/view-and-reset-your-api-key).
      - The value for `<flavor>` is `privatecloud`, `raxcloudserver`, or `dedicated`. Typically it is `raxcloudserver`.
      - For installation on an OnMetal server, you *must* specify the region and host name for the data center in order to connect. For an OnMetal server, best results have been received by setting `<flavor>` to `privatecloud` with the `--snet` flag.

    **Note**: If you use any flavor other than `raxcloudserver`, the agent is shown as not installed in the **Backups** section at the bottom of the **Cloud Servers Details** page in the Cloud Control Panel. However, items do appear as they should on the **Backup** tab in the Cloud Control Panel.

11. When prompted to confirm that you want to overwrite your configuration file, answer `yes`.

12. Start the agent.

        sudo service driveclient start

### Install the agent on RPM-based systems, such as CentOS, Fedora, and Red Hat

1.  Use SSH to log in to your server and run the commands as a user with sudo
or superuser privileges.

2.  Download and install the auto-updater.

        sudo rpm -Uvh 'http://agentrepo.drivesrvr.com/redhat/cloudbackup-updater-latest.rpm'

    The updater installs the agent (if it's not already installed) and
    sets it to start at boot.

2.  Check the installation.

    The updater might take a few minutes to download and install
    the agent. To check the status of the agent install, run the
    following command:

        sudo cloudbackup-updater -v

    The command won't respond until the installation is complete. When it
    returns you to the shell prompt, proceed to the next step.

3.  Run the agent with the `--configure` option to configure it.
    You will be asked for your Rackspace Cloud account username
    and password.

        sudo /usr/local/bin/driveclient --configure --username <username> --apikey <apiKey> --flavor <flavor> --datacenter <dataCenter> --apihost api.drivesrvr.com

    - Use your Rackspace Cloud account username and API key for `<username>`
    and `<apiKey>`. For information about how to find your API key, see
    [View and reset your API key.](/how-to/view-and-reset-your-api-key)
    - The value for `<flavor>` is `privatecloud`, `raxcloudserver`, or
    `dedicated`. Typically it is `raxcloudserver`.
    - For installation on an OnMetal server, you *must* specify the region and
    host name for the data center in order to connect. For an OnMetal server,
    best results have been received by setting `<flavor>` to `privatecloud`
    with the `--snet` flag.

    **Note**: If you use any flavor other than `raxcloudserver`, the agent is
    shown as not installed in the **Backups** section at the bottom of the
    **Cloud Servers Details** page in the Cloud Control Panel. However, items
    do appear as they should on the **Backup** tab in the Cloud Control Panel.

4.  Start the agent.

        sudo service driveclient start

### Install the agent on Arch, Gentoo, and SUSE systems

For Arch, Gentoo, and SUSE Linux systems, you must first download the
tarball. The tarball has the most up-to-date instructions. If the
following instructions differ from the tarball instructions, use the
tarball instructions instead.

1.  Download the tarball.

        wget http://agentrepo.drivesrvr.com/tar/driveclient-latest.tar.bz2

2. Use SSH to log in to your server and run the commands as a user with sudo or
superuser privileges.

2.  Extract the installation files.

        tar -xvjf driveclient-latest.tar.bz2

3.  Change to the directory that was created by extracting the files. For
example:

        cd driveclient-1

4.  Create directories and copy files.

        sudo cp driveclient /usr/local/bin/
        sudo chown root:root /usr/local/bin/driveclient
        sudo chmod 700 /usr/local/bin/driveclient
        sudo mkdir -m 700 /etc/driveclient
        sudo cp cacert.pem /etc/driveclient

5.  Run the agent with the `--configure` option to configure it.
    You will be asked for your Rackspace Cloud account username
    and password.

          sudo /usr/local/bin/driveclient --configure --username <username> --apikey <apikey> --flavor <flavor> --datacenter <datacenter> --apihost api.drivesrvr.com

    - Use your Rackspace Cloud account username and API key for `<username>`
    and `<apiKey>`. For information about how to find your API key, see
    [View and reset your API key.](/how-to/view-and-reset-your-api-key)
    - The value for `<flavor>` is `privatecloud`, `raxcloudserver`, or
    `dedicated`. Typically it is `raxcloudserver`.
    - For installation on an OnMetal server, you *must* specify the region and
    host name for the data center in order to connect. For an OnMetal server,
    best results have been received by setting `<flavor>` to `privatecloud`
    with the `--snet` flag.

    **Note**: If you use any flavor other than `raxcloudserver`, the agent is
    shown as not installed in the **Backups** section at the bottom of the
    **Cloud Servers Details** page in the Cloud Control Panel. However, items
    do appear as they should on the **Backup** tab in the Cloud Control Panel.

6. When prompted to confirm that you want to overwrite your configuration file,
answer `yes`.

7.  Start the agent.

        sudo /usr/local/bin/driveclient --daemon

    Example init/startup scripts are included in the tarball.

### Troubleshooting

If you encounter issues during installation, use the tips in this
section to troubleshoot.

#### Connection error

If Cloud Backup indicates that the agent is not running on your server,
ensure that your firewall isn't blocking outgoing connections on port
443.

#### Error status codes

You might see the following status codes:

-   **Skipped:** The backup job was skipped because a backup job was
    already queued. A single backup job can be queued only once.
-   **Missed:** The backup job was missed because the agent did not respond.
    The agent was likely offline.
-   **Errored:** An error occurred during the backup. The backup job did
    run, but it needs to be investigated.
-   **Failed:** A serious problem occurred, and the backup job did not run.

You can troubleshoot these status codes as follows:

-   **Skipped:** This error likely occurs because the frequency of the
    backup job is set too high. Consider reducing the frequency of the
    job, or reducing the amount of data. If this is the initial job,
    then the subsequent jobs might finish faster.
-   **Missed:** Verify that the agent is running on the server. If the agent
    is not already running, then start it. Next, check the logs to
    determine why the backup job failed. An agent should never go
    offline by itself. Either a software exception occurred or the agent
    was manually terminated.
-   **Errored:** Look in the logs on the server. The agent stores all the
    logs in one location (see the following section). Review the logs
    line by line. If you cannot determine the cause of the error, raise
    a ticket with the SME group, and they can help you identify
    the problem.
-   **Failed:** As with the Errored status, check the logs on the server. A
    failed status is severe.

#### Agent logs

If you need to read the logs of the agent, you can find them in
`/var/log`.

### Uninstall the agent from Linux

To uninstall the agent, you can stop and remove both the auto-updater
and the backup agent by using the system package manager.

#### CentOS or Red Hat

Run the following command:

    sudo yum remove cloudbackup-updater driveclient

#### Ubuntu

Run the following command:

    sudo apt-get remove cloudbackup-updater driveclient

#### Other Linux distributions

For all other Linux operating systems, follow OS-standard uninstallation
operations. Based on the previous installation instructions, use the
following commands to uninstall the agent.

1. Remove `/usr/local/bin/driveclient`.

        sudo rm /usr/local/bin/driveclient

2. Remove the `/etc/driveclient` directory.

        sudo rm -r /etc/driveclient

3. If the `init` script for the `driveclient` was added for this
installation, remove that as well.

**Next step:** [Create a backup](/how-to/rackspace-cloud-backup-create-a-backup)
