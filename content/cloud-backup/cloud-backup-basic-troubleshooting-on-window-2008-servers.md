---
permalink: cloud-backup-basic-troubleshooting-on-window-2008-servers
audit_date:
title: Cloud Backup - Basic troubleshooting on Windows 2008 servers
created_date: '2018-08-30'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article is meant to assist with issues in which customers are experiencing Cloud Backup issues which are caused by the backup agent being disconnected on the Linux instance, including:
* Backups have not been running
* Backups taking too long
* Cloud Backup taking up all of the server’s resources
As Managed Infrastructure customers administer the servers on their end, this article intends to assist in diagnosing if the server is experiencing an issue that should be remedied from the customer side, or if the issue is something that should be escalated to a member of Rackspace support, additionally pointing out helpful pieces of information that can be included when creating a ticket to receive an expedited response.

## Check for open issues

Before you restart the DriveClient service, check [status.rackspace.com](https://status.rackspace.com) to ensure there are no Cloud Backup open issues that could be impacting your server instance.  In addition, check the current support tickets to ensure that there has not been an incident that is causing the lack of accessibility of the server.  To check your open support ticket, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and click **Tickets > Ticket List** in the top navigation bar.  If there is no open support ticket about the server in question, proceed with the troubleshooting steps below.

## Establish connection

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on **Backups > Systems>**.
2. From the list of Cloud Backup Systems, click on the backup server name. 
This action displays the following details about the backup system:
- The Internet Protocol (IP) address of the server
- The system type
- The server region
- If encryption is enabled
- The backup region 
- The agent version
3. To the right of the system name, review the status of the backup agent.
4. The backup status is **connected** or *disconnected**.
5. Wait 10 seconds to ensure that the status Is accurate because it can change after a few seconds.
6. After 10 seconds, perform one of the following actions:
- If the status is **connected**, try to run the backup again and if it fails, contact Rackspace Technical Support.
- If the status is **disconnected**, restart the DriveClient service as shown in the next section.

## Restart DriveClient Service

1. To restart the driveclient service, log into the server via RDP and click the **Start** button in the bottom-left corner of the Windows Desktop.
2. In the search field, search for **services.msc**. Click **services** in the Programs field.
3. Locate the **Driveclient Service** in the **Services (Local)** list.
4. Right-click on **Driveclient Service** then choose the **Restart** option.
5. A pop-up will display the status of the restart.
6. Once the restart is complete, find the **DriveClient Service** again in the **Services (Local)** list, and assure that its status is **Started**.
7. A common reason for the driveclient not showing as started is that it is not set to start after a reboot. Right-click on the **DriveClient Service** and choose **Properties**.
8. Click the drop-down next to **Startup type** and select (if not already selected) **Automatic**.
9. Click the **OK** button at the bottom of the page.
10. After the service is restarted, check the Control Panel again to check the backup status.
11. - If the status is **connected**, try to run the backup again and if it fails, contact Rackspace Technical Support.
- If the status is **disconnected**, download the backup log from within Windows on the server. It is located at C:\ProgramData\Driveclient\log\driveclient.log. Attach this log to a ticket for Rackspace support. This will assist in expediting the issue response.
