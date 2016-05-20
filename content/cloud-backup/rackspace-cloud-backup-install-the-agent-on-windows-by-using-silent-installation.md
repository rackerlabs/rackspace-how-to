---
permalink: rackspace-cloud-backup-install-the-agent-on-windows-by-using-silent-installation/
audit_date:
title: Install the Cloud Backup agent on Windows by using silent installation
type: article
created_date: '2015-01-20'
created_by: Rose Contreras
last_modified_date: '2016-04-11'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

This article describes how to perform a fresh installation or update of the Rackspace Cloud Backup agent on your Windows server by using the silent installation method. If you are using a Linux server, see [Install the Cloud Backup Agent on Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux) for the parallel instructions.

**WARNING:** The silent installation procedure described in this article is for advanced users and should only be run from an administrator account. Whenever possible, you should install the Rackspace Cloud Backup agent using the interactive installation described in the article [Install the Cloud Backup agent on Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows).

### Before you install

**NOTE:** The Rackspace Cloud Backup agent requires **.NET 4.0 or higher**.

If you are reinstalling the agent on a server, note that a new agent installation disconnects any previously registered agents that were running on that server. The only way to associate the backup data from a disconnected agent registration is to perform a backup migration. You can perform a
[Vault Migration](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#migrate-vault) to a connected agent via the Cloud Backup API call.

### Download the installer

Determine whether your Windows server architecture is 64-bit or 32-bit, and download the latest MSI installation file for that architecture from [http://agentrepo.drivesrvr.com/](http://agentrepo.drivesrvr.com/).

- [32-bit Windows .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win32/driveclient-latest.msi)
- [64-bit Windows .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win64/driveclient-latest.msi) (This file will almost always be the correct one for your server.)

### Perform a silent installation

Use the Windows package installer (**msiexec.exe**) to install the Cloud Backup agent.

A typical installation from the command line or a batch file would be run as Administrator and look like the following example:

    msiexec /i driveclient-latest.msi /qn /l*v %tmp%\install-driveclient-latest.log APIUSER=myuser APIKEY=abcdef1234567890abcdef1234567890 APIHOSTNAME=<em>region</em>.backup.api.rackspacecloud.com DATACENTER=IAD DEBUGHIGH=true

Use values for `APIUSER`, `APIKEY`, `APIHOSTNAME`, and `DATACENTER` that match your installation.

During a fresh installation, the following options are used:

- `APIUSER` (required): The user name that you use to log in to Rackspace Cloud Control Panel.

- `APIKEY` (required): Your Rackspace Cloud API key. For information about viewing your API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).

- `APIHOSTNAME` is optional. The host address where the Cloud Backup API endpoints reside. Host addresses for various data centers are listed in the [Service Access Endpoints](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#document-general-api-info/service-access-endpoints). The Service Access Endpoints should only be passing in the domain name of the endpoint and not the full URL.

	<table>
		<tr>
			<td colspan="2" align="center"><strong>Example</strong></td>
		</tr>
		<tr>
			<td align="right"><strong>Good:</strong></td>
			<td><code>dfw.backup.api.rackspacecloud.com</code></td>
		</tr>
		<tr>
			<td align="right"><strong>Bad:</strong>
			<td><code>https://dfw.backup.api.rackspacecloud.com/v1.0/1234/</code></td>
		</tr>
	</table>

- `DEBUGHIGH` (default `false`): Turns on debug-level logging in the MSI custom actions and in the agent Updater service.

- `DATACENTER` (required): The data center associated with this server. Possible values are ORD, DFW, SYD, IAD, HKG, and LON.

Following are optional, less-frequently used (expert) installation options that you can use:

- `APIHOSTURL`: The URL that is used for registration. Host addresses for various data centers are listed in [Service Access Endpoints](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#document-general-api-info/service-access-endpoints) in the API documentation.

- `FLAVOR` (default `raxcloudserver`): [Add an explanation of what this option actually is.] Possible values are `privatecloud`, `raxcloudserver`, and `personalmachine`.

- `INSTALLDIR` (default ``%ProgramFiles%\Driveclient``): The installation directory for agent executables.

- `UPGRADEARCH` (default `win64` or `win32` depending on the MSI agent type): The folder on the download server where you find the MSI for the architecture that you want.

- `UPGRADEBASEURL` (default `http://agentrepo.drivesrvr.com/`): The URL for the download server where the setup MSI files are stored.

For more options for installing MSI packages, see [msiexec command line options](http://technet.microsoft.com/en-us/library/cc759262%28v=ws.10%29.aspx).

A successful installation results in two running services, the Driveclient and the Updater. You can see these via **services.msc**. For the verification steps to test the installation, see [Test Windows installation or update](/how-to/rackspace-cloud-backup-install-the-agent-on-windows-by-using-silent-installation).
