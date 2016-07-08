---
permalink: rackspace-cloud-backup-install-the-agent-on-windows/
audit_date:
title: Install the Cloud Backup agent on Windows
type: article
created_date: '2014-05-01'
created_by: Megan Meza
last_modified_date: '2016-07-08'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

This article describes how to install the Rackspace Cloud Backup agent on your Windows server. If you are using a Linux server, see [Install the Cloud Backup Agent (Linux)](/how-to/rackspace-cloud-backup-install-the-agent-on-linux) for the parallel instructions.

To update the agent, see the instructions in [Update the Rackspace Cloud Backup Agent.](/how-to/update-the-rackspace-cloud-backup-agent)

### Requirements

A new agent installation disconnects any previous registrations from that server. You must do a backup migration in order to re-associate the backup data from a disconnected registration. However, the old registration with its backup data remains attached to the customer account until it is deleted.

**Note:** The Rackspace Cloud Backup agent requires .NET 4.0 or higher.

### Download the installer

Determine whether your Windows server architecture is 64-bit or 32-bit, and download the latest MSI installation file for that architecture from<http://agentrepo.drivesrvr.com/>.

-   [32-bit Windows
    .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win32/driveclient-latest.msi)
-   [64-bit Windows
    .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win64/driveclient-latest.msi) (This
    will almost always be the correct one for your server.)

### Installation

You can choose one of the following methods of installation:

-   Interactive
-   Silent
-   Update agent

#### Interactive installation

Use the Windows package installer (`msiexec.exe`) to install the Cloud
Backup agent in interactive mode. This command launches the Cloud Backup
Setup Wizard. Enter this code at the Windows command line to begin
interactive installation:

    msiexec /i driveclient-1.18.007148-en-us.msi

You can also double-click on the MSI in order to start the interactive
installation process. Follow the wizard instructions to complete the
installation and configuration.

1.  Read and accept the terms of the End-User License Agreement.

2.  Start the Client Registration process by selecting the API Key or
    Password option. (For information about viewing your Rackspace API key, see [View and reset your API key.)](/how-to/view-and-reset-your-api-key)

    To use the API Key option, you must install the Cloud Backup agent
    as the administrator account of your cloud server. Attempting to use
    the API Key option as a non-administrator will result in
    installation failure.

    Enter the User ID and the API Key or Password, depending on which
    option you choose. Click **Next**.

    <img src="{% asset_path cloud-backup/rackspace-cloud-backup-install-the-agent-on-windows/api-key-or-password.png %}" width="340" height="267" />

3.  Select the Datacenter and Flavor for your server.

    If you are not sure which data center or flavor to select, accept the option that
    the installer chose for you. Doing so is almost always the correct
    action to take. An exception would be the case of an OnMetal server.
    In this case, you would need to look up the datacenter
    for that server (typically IAD). Click **Next**.

    <img src="{% asset_path cloud-backup/rackspace-cloud-backup-install-the-agent-on-windows/select-datacenter-flavor.png %}" width="340" height="267" />

4.  Click **OK** when you see the **SUCCESS!** message.

5.  Click **Finish** to complete the interactive installation.

See [Test Windows installation or update](#testsetup) for the verification steps to test the installation.

#### Silent installation

See [Rackspace Cloud Backup - Install the agent on Windows by using silent installation](/how-to/rackspace-cloud-backup-install-the-agent-on-windows-by-using-silent-installation) to learn how to perform a silent installation.

**Note:** The silent installation works only when you run it from the
administrator account of the server.

#### Update Cloud Backup agent on Windows

For instructions to update the agent on Windows, see [Update the Rackspace Cloud Backup Agent.](/how-to/update-the-rackspace-cloud-backup-agent)

### Test the Windows installation or update

If you performed the silent or interactive installation, test the installation. If you performed the updated installation, test the update.

Verify that installation performed the following actions:

1.  Created the `%programfiles%\driveclient` path.

2.  Placed files in the `Program Files\driveclient` directory:

        C:\>dir "%programfiles%\driveclient" /a-d
        Volume in drive C is OS
        Volume Serial Number is EE4C-78FC
        Directory of C:\Program Files\driveclient
        10/05/2011 12:24 PM 5,749,760 driveclient.exe
        03/01/2011 05:41 PM 1,693,696 icudt42.dll
        03/01/2011 05:39 PM 1,289,216 icuuc42.dll
        10/05/2011 01:37 PM 647,630 install.log
        10/05/2011 01:37 PM 58,384 uninst.exe
        5 File(s) 9,438,686 bytes

3.  Created the `%programdata%\driveclient` path.

4.  Placed `bootstrap.json` in the `%programdata?%\driveclient` path,
    which looks as follows.

        {
            "AccountId" : "991199",
            "AgentId" : 119991,
            "AgentKey" : "ZLgIosvV558PXVlx+EKiT+2+sRtaSo+cI9BE1aY1W/73WRv8O8len56rjmeDoT0cnthAysW=",
            "ApiHostName" : "api.drivesrvr.com",
            "IsRegistered" : true,
            "Username" : "[yourusername]",
            "VolumePasswords" : [yourownveryverylongpasswordthatnoonecouldeverpossiblycrack]
        }

    Replace values in brackets with values that match your installation.
    The parameter provided with `/type=install` should be visible in the
    `bootstrap.json` file.

5.  Created a DriveClientSvc service:

        C:\>sc query DriveClient
        SERVICE_NAME: DriveClientSvc
        TYPE : 10 WIN32_OWN_PROCESS
        STATE : 1 STOPPED
        WIN32_EXIT_CODE : 0 (0x0)
        SERVICE_EXIT_CODE : 0 (0x0)
        CHECKPOINT : 0x0
        WAIT_HINT : 0x0

6.  Created the entry driveclient.exe in Control Panel &gt;
    Programs &gt; Programs and Features.

### Test the Windows update

Run `driveclient-setup-latest.exe` to show any updated files in `program files\driveclient`. This is the same as running the setup with no parameters.

    C:\>dir "%programfiles%\driveclient\driveclient.exe"
    Volume in drive C is OS
    Volume Serial Number is EE4C-78FC
    Directory of C:\Program Files\driveclient
    10/05/2011 12:24 PM 5,749,760 driveclient.exe
    1 File(s) 5,749,760 bytes
    0 Dir(s) 449,822,932,992 bytes free

### Troubleshooting installs, upgrades, and uninstalls

**Note:** The silent installation method will fail without a clear error
message if it is run as a non-administrator. If the silent installation
fails, run the interactive installation.

If the Cloud Backup agent installation is unsuccessful, look at the
Windows Event log for any errors, or look at the `msiexec` installation
log for diagnostics regarding an unsuccessful installation.

For details about an agent that fails to register or fails to start on
installation, look at `C:\ProgramData\Driveclient\log\driveclient.log`.

We recommend that you enable TRACE logging as part of the
troubleshooting process. Should you need to call the Support team, TRACE
logging will help them identify the problem. For more information about
TRACE logging, see [Cloud Backup agent logging basics](/how-to/cloud-backup-agent-logging-basics).

If the agent fails to start up, due to registration failure, for example, the
most effective log setting is to directly edit the `log4cxx.xml` file .

A Cloud Backup connection error indicates that the agent is not running
on your server. In this case, verify that your firewall isn't blocking
outgoing connections on port 443.

### Backup statuses - Skipped, Missed, Errored, and Failed

The backup statuses are defined below:

-   **Skipped:** The backup job was skipped because a backup job was
    already queued. A single backup job can be queued only once.
-   **Missed:** The backup job was missed because the agent did not respond.
    The agent was likely offline.
-   **Errored:** An error occurred during the backup. The backup job did
    run, but it needs to be investigated.
-   **Failed:** A serious problem occurred, and the backup job did not run.

To troubleshoot these error status, see [Cloud Backup Troubleshoot](/how-to/cloud-backup-troubleshooting/)

### Uninstall Cloud Backup agent on Windows

To uninstall the Cloud Backup agent, the preferred method is to use Add/Remove Programs
in the Windows Control Panel. However, in cases where the Rackspace Cloud Backup entry
does not exist there, you use the command line to uninstall.

    msiexec /x driveclient-latest.msi /qb /l*v %tmp%\uninstall.log

**Note**: If the agent installed on your server is not the latest agent, you have to download
the old MSI installer file in order to use it to uninstall the old agent. Your current agent
version is displayed as **Agent Version:** on the **Backups System Details** page. You can find
and download the MSI for this version at http://agentrepo.drivesrvr.com/win64/old_msi/.

The following changes should occur:

-   The %programdata%\driveclient path contains files and folders that you can use to reinstall
    the agent without re-registering, if desired. If you are sure that you will not reinstall
    the agent, these files and folders may be deleted.

        C:\>dir %programdata%\driveclient
        Volume in drive C is System
        Volume Serial Number is 9A20-F50E

        Directory of C:\ProgramData\driveclient

        06/17/2016  04:00 PM    <DIR>          .
        06/17/2016  04:00 PM    <DIR>          ..
        05/27/2016  02:16 PM                 0 backup-running.lock
        06/17/2016  03:54 PM             3,720 bootstrap.json
        04/01/2016  07:25 PM             3,801 bootstrap.json.20160426102748
        04/01/2016  07:25 PM    <DIR>          log
        06/17/2016  03:58 PM               827 log4cxx.xml
        05/27/2016  02:16 PM    <DIR>          MossoCloudFS_ede95edd-78f8-4097-82de-5dfa7941b7c7
        06/17/2016  03:54 PM               451 public-key.pem
        05/27/2016  02:19 PM               305 rse-client-state.json
        05/27/2016  02:16 PM    <DIR>          vss
                      10 File(s)         23,984 bytes
                       5 Dir(s)   6,035,111,936 bytes free


-   No driveclient.exe entry exists in **Control Panel > Programs
    and Features**.

-   No DriveClientSvc service is installed.

        C:\>sc query driveclient
        [SC] EnumQueryServicesStatus:OpenService FAILED 1060:
        
        The specified service does not exist as an installed service.              


### Uninstall the agent from older versions of Windows

**Note**: Complete the following steps **ONLY** if uninstalling the agent
from Window's agent version 1.18 or lower. You can check your agent
version by logging into your Cloud Control Panel, clicking on the
"Backup" tab, and selecting your backup system. The version number is
listed under *System Details.* If your version is higher than 1.18, see
the previous section for instructions on how to uninstall.

To proceed for versions 1.18 or lower, run
`%programfiles%\driveclient\uninst.exe`.

The following changes should occur:

-   The path `%programfiles%\driveclient` contains a single file:
    install.log

    C:\>dir %programfiles%\driveclient /a-d
     Volume in drive C is OS
     Volume Serial Number is EE4C-78FC
     Directory of C:\Program Files\driveclient
    10/05/2011  01:29 PM           607,013 install.log
                  1 File(s)        607,013 bytes
                   2 Dir(s)  449,805,914,112 bytes free

-   The %programdata%\\driveclient path does not exist.

    C:\>dir "%programdata%\driveclient"
     Volume in drive C is OS
     Volume Serial Number is EE4C-78FC

     Directory of C:\ProgramData

    File Not Found

-   No driveclient.exe entry exists in **Control Panel > Programs
    and Features**.

-   No DriveClientSvc service is installed.

-   There should be no scheduled tasks to "check for
    driveclient update".

        C:\>sc query driveclientsvc
        [SC] EnumQueryServicesStatus:OpenService FAILED 1060:

        The specified service does not exist as an installed service.

**Next steps:** [Create a backup](/how-to/rackspace-cloud-backup-create-a-backup-0)
