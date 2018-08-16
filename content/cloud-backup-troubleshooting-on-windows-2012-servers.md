---
permalink: cloud-backup-troubleshooting-on-windows-2012-servers/
audit_date:
title: Cloud Backup - Basic troubleshooting on Windows Server 2012
type: article
created_date: '2018-08-10'
created_by: Shaun Crumpler
last_modified_date: '2018-08-15'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

This article provides basic troubleshooting steps for Cloud Backup on Windows Server® 2012 if you are experiencing the following issues:

- Backups are not running.
- Backups take too long to complete.
- Cloud Backup uses all of the server’s resources.

As a Managed Infrastructure customer who administers your own servers, this article helps you diagnose if the server is experiencing an issue that you can remedy, or if the issue should be escalated to a member of Rackspace Support. This article provides instructions about helpful information that you can include when you create a ticket.

## Check for open issues

Before you restart the DriveClient service, check [status.rackspace.com](https://status.rackspace.com) to ensure there are no Cloud Backup open issues that could be impacting your server instance. In addition, check the current support tickets to ensure that there has not been an incident that is causing the lack of accessibility of the server. To check
your open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click 
**Tickets > Ticket List** in the top navigation bar.

If there are no open support tickets about the server in question, attempt to establish a connection as shown in the next section.

## Establish connection 

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on **Backups > Systems**.
2. From the list of Cloud Backup Systems, click the backup server name. 
   This action displays the following details about the backup system:
   
   - The Internet Protocol (IP) address of the server
   - The system type
   - The backup vault size
   - If encryption is enabled
   - The server region
   - The backup region
   - If service net is enabled
   - The agent version

3. To the right of the system name, review the status of the backup agent.
   The backup status is **connected** or **disconnected**.
4. Wait ten seconds to ensure that the status is accurate because it can change after a few seconds.
5. After 10 seconds, perform one of the following actions:
 - If the status is **connected**, contact Rackspace Technical Support.
 - If the status is **disconnected**, restart the DriveClient service as shown in the next section.

## Restart the DriveClient service

1. Log into the server via RDP and click the **Windows** symbol in the bottom-left corner.
2. Click the **Search** icon in the top-right corner.
3. Enter **services.msc** in the search field.
4. Locate the DriveClient service, right-click it, and select the **Restart**. A pop-up windows shows the status of the restart.
5. After the restart completes, find the DriveClient service again in the **Services (Local)** list, and ensure that its status is **Running**.
6. Ensure that the DriveClient is configured to start at boot up:

   a. Right-click the DriveClient service and click **Properties**.
   
   b. Click the drop-down list next to **Startup type** and select **Automatic** (if not already selected).
  
   c. Click the **OK** button at the bottom of the page.
   
   d. After the service restarts, check the Control Panel to ensure the service is running.
   
7. Perform one of the following:
   - If the agent is connected, contact Rackspace Technical Support.
   - If the agent is not connected, attach the backup log to a technical support ticket. The backup log is located at **C:\ProgramData\Driveclient\log\driveclient.log**. Rackspace Support uses the log file to expedite a response to the issue.
