---
node_id: 4055
title: Install the Cloud Backup agent on Windows
type: article
created_date: '2014-05-01'
created_by: Megan Meza
last_modified_date: '2016-01-15'
last_modified_by: Rose Contreras
product: Cloud Backup
product_url: cloud-backup
---

### Previous section

[Cloud Backup
Overview](/how-to/rackspace-cloud-backup-overview)

The instructions in this article describe the procedure for the
installation of the Rackspace Cloud Backup agent on your Windows server.
If you are using a Linux server, see [Install
the Cloud Backup Agent
(Linux)](/how-to/rackspace-cloud-backup-install-the-agent-on-linux)
for the parallel instructions.

To update the agent, see the instructions in [Update the Rackspace Cloud
Backup
Agent.](/how-to/update-the-rackspace-cloud-backup-agent)

### Requirements

Before installing the agent on a server, a new agent installation
disconnects any previous registrations from that server. You must do a
backup migration in order to re-associate the backup data from a
disconnected registration. However, the old registration with its backup
data remains attached to the customer account until it is deleted.

**Note:** The Rackspace Cloud Backup agent requires .NET 4.0 or
higher.

### Download the installer

Determine whether your Windows server architecture is 64-bit or
32-bit, and download the latest MSI installation file for that
architecture
from<http://agentrepo.drivesrvr.com/>.

-   [32-bit Windows
    .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win32/driveclient-latest.msi)
-   [64-bit Windows
    .msi](http://97a6455ef60243cc8c74-57c93634a2c6eae60c16d098c741cf9b.r43.cf1.rackcdn.com/win64/driveclient-latest.msi) (This
    will almost always be the correct one for your server.)

### Installation

You can choose one of the following methods of installation:

-   [Interactive](#interactiveinstall)
-   [Silent](#silentinstall)
-   [Update](#update)


#### Interactive installation

Use the Windows package installer (`msiexec.exe`) to install the Cloud
Backup agent in interactive mode. This command launches the Cloud Backup
Setup Wizard. Enter this code at the Windows command line to begin
interactive installation:

    msiexec /i driveclient-1.18.007148-en-us.msi

You can also double-click on the MSI in order to start the interactive
installation process. Follow the wizard instructions to complete the
installation and configuration.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/install-1.png" width="338" height="266" />

1.  Read and accept the terms of the End-User License Agreement.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/install-2.png" width="340" height="267" />

2.  Start the Client Registration process by selecting API Key or
    Password option of registration. (For information about viewing your
    Rackspace API key, see [View and reset your
    API key.)](/how-to/view-and-reset-your-api-key)

    To use the API Key option, you must install the Cloud Backup agent
    as the administrator account of your cloud server. Attempting to use
    the API Key option as a non-administrator will result in
    installation failure.

    Enter the User ID and the API Key or Password, depending on which
    option you choose. Click **Next**.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/install-3.png" width="340" height="267" />

3.  Select the Datacenter and Flavor for your server. If you are not
    sure which data center or flavor to select, accept the option that
    the installer chose for you. Doing so is almost always the correct
    action to take. An exception would be the case of an OnMetal server.
    In this case, for instance, you would need to look up the datacenter
    for that server (typically IAD). Click **Next**.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/install-5.png" width="340" height="267" />

    The installation process will continue.

4.  Click **OK** when you see the **SUCCESS!** message.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/install-6.png" width="337" height="266" />

5.  Click **Finish** to complete the interactive installation.

See [Test Windows installation or update](#testsetup) for the
verification steps to test the installation.


#### Silent installation

See [Rackspace Cloud Backup - Install the agent on Windows by using
silent
installation](/how-to/rackspace-cloud-backup-install-the-agent-on-windows-by-using-silent-installation)
to learn how to perform a silent installation.

**Note:** The silent installation works only when you run it from the
administrator account of the server.

### Update Cloud Backup agent on Windows

For instructions to update the agent on Windows, see [Update the
Rackspace Cloud Backup
Agent.](/how-to/update-the-rackspace-cloud-backup-agent)

### Test the Windows installation or update

If you performed the silent or interactive installation, test the
installation. If you performed the updated installation, test the
update.

Verify that installation performed the following actions:

1.  Created the `%programfiles%\driveclient` path.

2.  Placed files in the `Program Files\driveclient` directory:

        c:\>dir "%programfiles%\driveclient" /a-d
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
            "AccountId" : &ldquo;991199&rdquo;,
            "AgentId" : 119991,
            "AgentKey" : &ldquo;ZLgIosvV558PXVlx+EKiT+2+sRtaSo+cI9BE1aY1W/73WRv8O8len56rjmeDoT0cnthAysW=",
            "ApiHostName" : "api.drivesrvr.com",
            "IsRegistered" : true,
            "Username" : &ldquo;[yourusername]",
            "VolumePasswords" : [yourownveryverylongpasswordthatnoonecouldeverpossiblycrack]
        }

    Replace values in brackets with values that match your installation.
    The parameter provided with `/type=install` should be visible in the
    `bootstrap.json` file.


5.  Created a DriveClientSvc service:

        c:\>sc query DriveClient
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

Run `driveclient-setup-latest.exe` to show any updated files in
`program files\driveclient`.
This is the same as running the setup with no parameters.

    c:\>dir "%programfiles%\driveclient\driveclient.exe"
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
TRACE logging, see [Cloud Backup agent logging
basics](/how-to/cloud-backup-agent-logging-basics).

If the agent fails to start up, e.g., registration failure, etc., the
most effective log setting is to directly edit the `log4cxx.xml` file .

A Cloud Backup connection error indicates that the agent is not running
on your server. In this case, verify that your firewall isn't blocking
outgoing connections on port 443.


### Backup statuses - skipped, missed, errored, and failed

The backup statuses are defined below:

-   **Skipped:** The backup job was skipped because a backup job was
    already queued. A single backup job can be queued only once.
-   **Missed:** The backup job was missed because the agent did not respond.
    The agent was likely offline.
-   **Errored:** An error occurred during the backup. The backup job did
    run, but it needs to be investigated.
-   **Failed:** A serious problem occurred, and the backup job did not run.

Follow these procedures to troubleshoot the skipped, missed, errored,
and failed statuses:

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

### Uninstall Cloud Backup agent on Windows

To uninstall the Cloud Backup agent, the preferred method is to
uninstall using the Windows Control Panel. However, you can also use
msiexec from the command line.

    msiexec /x driveclient-1.18.007148-en-us.msi /qn /l*v %tmp%\uninstall-1.18.007148.log


Run `%programfiles%\driveclient\uninst.exe`.

The following changes should occur:

-   The path %programfiles%\\driveclient contains a single file:
    `install.log`

        c:\>dir "%programfiles%\driveclient" /a-d
        Volume in drive C is OS
        Volume Serial Number is EE4C-78FC
        Directory of C:\Program Files\driveclient
        10/05/2011 01:29 PM 607,013 install.log
        1 File(s) 607,013 bytes
        2 Dir(s) 449,805,914,112 bytes free

-   The %programdata%\\driveclient path does not exist.

        c:\>dir "%programdata%\driveclient"
        Volume in drive C is OS
        Volume Serial Number is EE4C-78FC
        Directory of C:\ProgramData
        File Not Found

-   No driveclient.exe entry exists in Control Panel &gt; Programs
    and Features.
-   No DriveClientSvc service is installed.

    -   -   There should be no scheduled tasks to "check for driveclient
            update."

    <!-- -->

        c:\>sc query driveclientsvc
        [SC] EnumQueryServicesStatus:OpenService FAILED 1060:
        The specified service does not exist as an installed service.

### Uninstall the agent from older versions of Windows

**Note**: Complete the following steps **ONLY** if unistalling the agent
from Window's agent version 1.18 or lower. You can check your agent
version by logging into your Cloud Control Panel, clicking on the
"Backup" tab, and selecting your backup system. The version number is
listed under *System Details.* If your version is higher than 1.18, see
the previous section, [Uninstall Cloud Backup Agent on
Windows](#uninstallwindows) for your uninstall.

To proceed for versions 1.18 or lower, run
`%programfiles%\driveclient\uninst.exe`.

The following changes should occur:

-   The path `%programfiles%\driveclient` contains a single file:
    install.log

<!-- -->

    c:\>dir %programfiles%\driveclient /a-d
     Volume in drive C is OS
     Volume Serial Number is EE4C-78FC
     Directory of C:\Program Files\driveclient
    10/05/2011  01:29 PM           607,013 install.log
                  1 File(s)        607,013 bytes
                   2 Dir(s)  449,805,914,112 bytes free

-   The %programdata%\\driveclient path does not exist.

<!-- -->

    c:\>dir "%programdata%\driveclient"
     Volume in drive C is OS
     Volume Serial Number is EE4C-78FC

     Directory of C:\ProgramData

    File Not Found

-   No driveclient.exe entry exists in Control Panel &gt; Programs
    and Features.
-   No DriveClientSvc service is installed.
-   There should be no scheduled tasks to "check for
    driveclient update".

        c:\>sc query driveclientsvc
        [SC] EnumQueryServicesStatus:OpenService FAILED 1060:

        The specified service does not exist as an installed service.

### Next steps

[Create a
backup](/how-to/rackspace-cloud-backup-create-a-backup-0)
