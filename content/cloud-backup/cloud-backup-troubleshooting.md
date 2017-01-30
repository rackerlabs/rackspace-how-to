---
permalink: cloud-backup-troubleshooting/
audit_date:
title: Cloud Backup troubleshooting
type: article
created_date: '2015-06-29'
created_by: Rackspace Support
last_modified_date: '2016-07-19'
last_modified_by: Catherine Richardson
product: Cloud Backup
product_url: cloud-backup
---

**Previous section**: [Rackspace Cloud Backup - Preferences](/how-to/rackspace-cloud-backup-preferences)

If you encounter issues when working with Cloud Backup, use the information in this article to help you troubleshoot.

-  Backup statuses
-  Connection errors
-  Backup agent logs
-  Recovery of your encrypted vault password
-  Unable to back up or restore files (Windows only)
-  System resource utilization
-  Other errors and problems

### Backup statuses

This section describes each of the backup statuses, why you might receive each status, and what action you might take.

#### Backup status "Skipped"

A status of Skipped indicates that the backup job was skipped because a backup job was already queued. A
single backup job can be queued only once.

This status likely occurs because the frequency of the backup job is set too high (for example, hourly) and a single backup takes too long (longer than an hour). The backup scheduler will start to skip backups that it cannot meet.

Consider reducing the frequency of the job, or reducing the amount of data. If this is the initial job, the subsequent jobs might finish faster.

On older DriveClient installations, a Skipped status might be caused if the agent was hard-restarted (or the operating system was rebooted) during a backup, cleanup, or restore.

-  For Linux, a possible fix is to upgrade to the latest version of DriveClient and restart the running agent.

-  For Windows, a possible fix is to restart the DriveClient Windows service through Window's Service Manager, or through the `sc` command line Windows utility.

#### Backup status "Missed"

A status of Missed indicates that the backup job was missed. The
DriveClient service was likely not running at the time of the scheduled
backup, and the agent was therefore offline.

Verify that the agent is running on the server. If the agent is not
already running, start it. Next, check the logs to determine why the agent was not running.

An agent should never go offline by itself. If the agent did not
respond, then the agent could not reach one of the API endpoints, the
agent was not running, or the agent was manually stopped or
terminated.

#### Backup status "Completed with Errors"

A backup status of Completed with Errors indicates that the backup
completed but one or more files could not be backed up. The most common
issues that cause this status are as follows:

-   The file was deleted between the time the index of files completed and the copy of that specific file was attempted. This issue is common with any temporary files, such as PHP session files, and is almost always harmless. If it is possible and practical for you to exclude these files from the backup definition, this kind of error goes away.

-   The file was exclusively locked (Windows), so that no other process could read it. This issue is common with database binary files. With databases, you should never back up the binaries themselves, but rather dump the contents of the database to a flat file (such as an SQL file), and back up that flat file. Doing so allows for a quicker backup and an easier restore. We suggest that you break individual databases into different flat files, so that they can be manipulated easier on restore. Then,  you do not have to fully restore the flat file just to restore a single database.

-   Non-UTF-8 characters were used in the path of the file in the operating system. The current version of Cloud Backup supports only UTF-8 characters. When non-UTF-8 characters are used, a `Path Not Found` message is displayed.

For more information, see [Back up databases with Cloud Backup](https://support.rackspace.com/how-to/rackspace-cloud-backup-backing-up-databases/).

#### Backup status "Error"

Many issues might cause a backup status of Error to occur, such as cloud account permissions for the user who configured that agent or the DriveClient not being able to connect to the agent APIs.

Rackspace Support must review the **driveclient.log** file to determine the cause. If the agent is not connected, attach the **driveclient.log** file to a ticket so that Support can review it. For more information, see [Cloud Backup agent logging basics - Where to store saved logs](https://support.rackspace.com/how-to/cloud-backup-agent-logging-basics/).

Following are some of the issues and some possible fixes:

##### Missing Password for encrypted volume

If you use the API to change an account from ServiceNet to PublicNet, the volume URI is changed. However, the **bootstrap.json** file doesn't reflect that change.

To work around this issue, edit the **bootstrap.json** file and change the volume URI.

-   If the account was changed from ServiceNet to PublicNet, remove the **snet-** prefix from the volume URI.
-   If the account was changed to ServiceNet from PublicNet, add an **snet-** prefix to the volume URI.

##### Out of Disk Space

If the local system has less than 100 MB of free disk space, the backup and even the server itself might be critically affected. Effects on the backup agent include but are not limited to the following issues:

-  Logging is throttled or stopped.
-  The vault database might not be able to compress or decompress for backup, restore, or cleanup operations.
-  Corruption of the vault database might occur.
-  Automated log uploads made by using the Cloud Control Panel might not be possible.
-  File restore operations might partially or completely fail.

If disk space is so low that any of the preceding issues occur, we strongly recommend that you move as many extraneous files as possible off of the local system drive. For possible ways to do this with Cloud Backup files, see [Conserving resources with Cloud Backup](https://support.rackspace.com/how-to/best-practices-for-cloud-backup/).

##### Container does not exist

The Cloud Files container that is used to store backup data has been deleted. You can check this by getting the agent details via the Cloud Backup API. The `VolumeURI` field in the displayed JSON indicates the Cloud Files container that Cloud Backup is attempting to access. If that Cloud Files container does not exist, it must be recreated. It also means that any previous backups were deleted and cannot be used to restore.

##### CurlEasyPerformWrapper : Could not perform an HTTP request. Connection timed out while waiting for https://snet-storage101

This message indicates that a networking error is preventing DriveClient from connecting to the Cloud Files API to upload backups.

##### locale::facet::\_S\_create\_c\_locale name not valid

This message indicates that the locale is not properly set on the target system, which happens mostly in older operating systems.

This message is also common when you use SSH to connect from a Mac OS desktop to a Linux server, and run the `sudo service DriveClient status command`. The Mac OS client does not properly provide the locale information in the SSH session.

If you don't have a Linux computer available for use, you can access the web console for your server via the Cloud Control Panel. When you're in the web console for your server, perform the following actions:

1. Open the **/etc/ssh/sshd_config** file for editing.

2. Find the lines that start with `AcceptEnv`, and insert a `#` character in front of each line.

3. Save the file and then restart the SSH service (depending on the Linux distribution) by running either `service ssh restart` or `service sshd restart`.

4. Try to connect again.

#### Backup status "Failed"

A status of Failed indicates that a serious problem occurred, and the
backup job did not run. As with the Error status, check the logs on the
server.

### Connection errors

When DriveClient is started, it attempts to connect to the RSE API
endpoint (**rse.drivesrvr.com** or **rse.drivesrvr.co.uk**) to let the
API know that it is available to take commands. If it can't reach that endpoint, or the associated **api.drivesrvr.com** or **api.drivesrvr.co.uk** endpoints, the service stops.

The following symptoms might occur:

-   On Windows, the following permissions error message might be displayed: `Please check your permissions and try again`. This is the default error message that Windows displays when a service fails to start.

-   On Linux, the agent will just shut itself down.

When the agent shuts itself down, you see a line, similar to the following line, indicating that the logging is being stopped. This is the last thing that is logged before the agent shuts itself off.

`INFO |root|rax::AgentPolicy::TearDown(38)] Tearing down logging...`

You will also see this as a `Disconnected` agent through the **Backups** area of the Cloud Control Panel.

If the agent cannot communicate with one or more of the following required API endpoints, you can test the communication as indicated:

-   Cloud Backup API: **api.drivesrvr.com** (for US accounts) or **api.drivesrvr.co.uk** (for UK accounts) You can test this communication with an HTTP GET request (or Open Standard Web Browser) to the URL <https://api.drivesrvr.com/v1.0/help/apihealth>.

-   Cloud Backup RSE API: **rse.drivesrvr.com** (for US accounts) or **rse.drivesrvr.co.uk** (for UK accounts) You can test this communication with an HTTP GET request (or Open Standard Web Browser) to the URL <https://rse.drivesrvr.com/health>.

-   Cloud Files API endpoints: These are regional endpoints, but they all have the same `/healthcheck` command that allows for network connection testing. You can test this communication with an HTTP GET request: <https://%3Cendpoint%3E/healthcheck> using regional public and ServiceNet endpoints, which are shown in the following table. For example, <https://storage101.ord1.clouddrive.com/healthcheck>.


| Region | Public API                     | ServiceNet API                      |
|--------|--------------------------------|-------------------------------------|
| ORD    | storage101.ord1.clouddrive.com | snet-storage101.ord1.clouddrive.com |
| DFW    | storage101.dfw1.clouddrive.com | snet-storage101.dfw1.clouddrive.com |
| IAD    | storage101.iad3.clouddrive.com | snet-storage101.iad3.clouddrive.com |
| LON    | storage101.lon3.clouddrive.com | snet-storage101.lon3.clouddrive.com |
| SYD    | storage101.syd2.clouddrive.com | snet-storage101.syd2.clouddrive.com |
| HKG    | storage101.hkg1.clouddrive.com | snet-storage101.hkg1.clouddrive.com |

### Backup agent logs

The agent logs are stored, by default, in the following directories:

-   (Windows) **C:\\ProgramData\\DriveClient\\logs\\driveclient.log**

    The **C:\\ProgramData\\DriveClient** directory can be changed, based on the installer or through the **AgentConfig.exe** executable.

-   (Linux) **/var/log/driveclient.log**

The **log4cxx.xml** configuration file controls agent logging. This file is located in the Cloud Backup cache folder. Among the things that you can manually edit in this file are the size of the **driveclient.log** file (`MaxFileSize`) and how many previous versions (`MaxBackupIndex`) are saved before they are deleted. For more information about how to configure this file, see [Cloud Backup agent logging basics](/how-to/cloud-backup-agent-logging-basics).

#### Format of log lines

Log lines have the following format:

`[DATE TIME | THREADID | LOGLEVEL | USER | CONTEXT] LOG INFORMATION`.

- `DATE TIME`: Time stamp indicating when the log line was written.
- `THREADID`: Because DriveClient is a threaded service, this ID is an indicator to separate the thread from all of the other threads writing to the same log file.
- `LOGLEVEL`: The depth of the logging. The default is INFO, but Support might increase this level to TRACE or DEBUG. The log levels are common log levels, such as INFO, WARN, and ERROR.
- `USER`: The user that is running the service. On Linux,  this value is root, and on Windows, it is Administrator.
- `CONTEXT`: Internal information about where the log was generated.
- `LOG INFORMATION`: The context of the log.

#### Common log items

The following common items are included in the **driveclient.log** file:

- `rax::LoggingPolicy::PerformSetup(134)`: Indicates the starte of the DriveClient service.
- `rax::AgentPolicy::TearDown(38)] Tearing down logging...`: Indicates that the DriveClient service was properly shut down.

#### Common errors in the log

Common errors in the log include 401 and 403 errors that are received when the agent is accessing the **rse.drivesrvr.com**, **api.drivesrvr.com**, **rse.drivesrvr.co.uk**, or **api.drivesrvr.co.uk** endpoints.

When you first start the DriveClient service, the RSA key pair for authentication might not properly synchronize immediately, which causes a brief time of 401 and 403 errors in the **driveclient.log** file. This is normal for the Cloud Backup internal APIs. The DriveClient service handles these errors and retries the appropriate number of times before canceling the startup of that service.

If the errors continue for more than 5-10 seconds, contact Rackspace Support.

### Recovery of your encrypted vault password

You cannot recover your encrypted vault password. The vault password is stored only on the cloud server that is linked to that encrypted vault. If that password is forgotten, and the **bootstrap.json** file was overwritten or lost, there is no way to recover the password.

### Unable to back up or restore files (Windows only)

Windows has the ability to *exclusively lock* a file, so that no other
process can read or write to it. This locking is common in database
binary files, but many other programs use this locking protocol. If this
locking occurs, the only workarounds are to close the program that has
the exclusive lock, or restore the file into a different location.

If you are backing up a file that you know will be exclusively locked,
you should think about using VSS snapshots (if your version of Windows
supports it), and back up the contents of the VSS snapshot. Using VSS
snapshots enables you to get a proper backup of the file.

The latest version of Cloud Backup for Windows automatically takes a VSS
snapshot of the drive and attempts to back up files from it.

### System resource utilization

The amount of resources (memory, CPU, and load) used by the DriveClient is directly related to how many files are being backed up in each backup configuration. An increased number of files (or the size of files) can cause the agent to consume more resources. For best practice suggestions, see [Best practices for Cloud Backup](/how-to/best-practices-for-cloud-backup).

### Other errors and problems

Following are other errors and problems that you might encounter.

#### Backup failed with a 403 error from Cloud Files when the account has sub-users

A registered sub-user is authorized for Cloud Backup but not for Cloud Files access. When this user attempts a backup, all requests to Cloud Files return a 403 error. The user attempts to authenticate again, but the new authentication token is the same as the old one.

Account administrators can manage permission levels in the User Management section of the Cloud Control Panel. Submit a request to your account administrator for Full access to your account or Administrative access to Cloud Files for your sub-user account. Cloud Backup does not support Dedicated Users with Cloud access or Federated users.

#### Unable to browse a previous backup or browse a backup to select files to restore

The list of files in a backup in the Cloud Control Panel is generated by
the running DriveClient service. When you are browsing existing backup
reports that have not been rotated because of retention policies, this
information is generated on that cloud server.

When you attempt to restore, the file list is generated on the target
cloud server, the server to which you have selected to restore the
files.

#### Cleanup stuck in "preparing" mode

The cleanup process requires a large number of calculations before it
can start cleaning up for the file rotation. As a result, the cleanup
process could be shown as *preparing* for some time before the files
start being rotated. There is no way to track the percentage complete at
this time.

#### Unexpected "Skipped" notifications for a backup

You might get a Skipped notification if you have reregistered servers (the old server appears offline with a duplicate online server). By design, scheduled backups for offline servers send a notification of Skipped. To discontinue getting these notifications for offline servers, select **Disable** from the **Actions** menu for the **Backup Configuration**.

**Warning**: We do *not* recommend reregistering a DriveClient agent, especially if the server has existing backup configurations and data backed up. Reregistering disassociates the server from the prior backup configurations and backed up data.

If you have reregistered a DriveClient agent and are unintentionally disassociated from your backups, you can use the [migrate vault API operation](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/#migrate-vault) to migrate the previous backup vault from the previous agent to a new agent that has no backup configurations or previous backups run against it.

#### Files modified during backup are missing or corrupted

**Note**: This issue relates to the data that is backed up, and not to
the actual file on the file system.

The following types of file changes can occur during a backup:

-   Files are overwritten or get deleted. These files are not guaranteed
    to have usable content or to even be included in the backup at all.
-   Files, like logs, are appended to. We will make a best effort to
    back up these files, but we expect to be able to restore a
    reasonable and usable form of these files.
-   Files, like databases, might have random updates to any part
    of them. We do not in any way guarantee that these files will be
    restorable, and even if they are restored, we do not guarantee that
    what is restored is not corrupt.

These file types either change too rapidly (databases, logs, caches) or
don't exist long enough to be backed up (session files). Session files
should be avoided entirely. And if the information is valuable to your
business, log files should track it. Caches should also be avoided, as
their data is meant to be discarded.

If you need to back up these types of files, we recommend the following
workarounds:

-   For databases, take a snapshot of the database (for example, a database dump) and back up the dump. See [Back up databases with Cloud Backup](/how-to/rackspace-cloud-backup-backing-up-databases) for full instructions.
-   For log files, take snapshots of your log files and back them up. To avoid running out of disk space, rotate your log files periodically.
