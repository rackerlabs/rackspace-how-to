---
permalink: cloud-backup-troubleshooting-on-windows-2012-servers/
audit_date:
title: Cloud Backup - Basic Troubleshooting on Windows 2012 Servers
type: article
created_date: '2018-08-10'
created_by: Shaun Crumpler
last_modified_date: '2018-08-13'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

This article provides cloud backup basic troubleshooting steps for Windows 2012 Servers that are experiencing the following issues:

- Backups are not running
- Backups take too long to complete
- Cloud Backup uses all of the server’s resources

As Managed Infrastructure customers administer their servers, this article helps to diagnose if the server is experiencing an issue that can be remedied by the customer, or if the issue should be escalated to a member of Rackspace support. This article provides instructions about helpful information that the customer can include when creating a ticket.

## Check for open issues

Before you restart the driveclient service, check [status.rackspace.com](https://status.rackspace.com) to ensure there are no Cloud Backup open issues that could be impacting your server instance. In addition, check the current support tickets to ensure that there has not been an incident that is causing the lack of accessibility of the server.

If there are no open support tickets about the server in question, attempt to [establish a connection](#Establishconnection).

## Establish connection 

1. In the mycloud.rackspace.com control panel, click on **Backups > Systems**.

2. From the list of Cloud Backup Systems, click the backup server name. 

   This action displays the details of the backup system, including:
   
   - the IP address of the server
   - the system type
   - the server region
   - the backup region
   - the agent version

3. To the right of the system name, review the status of the backup agent.

   The backup status is **connected** or **disconnected**.

3. Wait ten seconds to ensure that the status is accurate because it can change after a few seconds.

3. After 10 seconds, perform one of the following:

 - If the status is **connected**, complete the troubleshooting steps outlined in [Download Backup Log From Control Panel](xxxxx.xxxx).

 - If the status is **disconnected**, [restart the driveclient service](#Restartdriveclientservice).

## Restart driveclient service

1. Log into the server via RDP and click the **Windows** symbol in the bottom-left corner.

2. Click the **Search** icon in the top-right corner.

3. Enter **services.msc** in the search field, and then click **services** that populates under the search bar.

4. Locate the Driveclient Service, right-click it, and select the **Restart**. A pop-up windows shows the status of the restart.

6. After the restart completes, find the DriveClient Service again in the Services (Local) list, and ensure that its status is **Running**.

7. A common reason for the driveclient not showing as started is that it is not set to start after a reboot. For good measure, ensure that the driveclient is set to start at boot. Right-click of the “DriveClient Service” and choose “Properties”.

8. Click the drop-down next to “Startup type” and select (if not already selected) “Automatic”.

9. Click the “OK” button at the bottom of the page.

10. After the service restarts, check the Control Panel to ensure the service is running.

11. If the agent is connected, move on to the "Download Backup Log From Control Panel" troubleshooting step. If the agent still shows as “disconnected” then then download the backup log from within Windows on the server. It is located at C:\ProgramData\Driveclient\log\driveclient.log. Attach this log to a ticket for Rackspace support. This will assist in expediting the issue response.
