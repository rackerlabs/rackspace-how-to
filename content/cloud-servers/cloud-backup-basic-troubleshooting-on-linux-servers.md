---
permalink: cloud-backup-basic-troubleshooting-on-linux-servers
audit_date:
title: Cloud Backup - Basic troubleshooting on Linux servers
created_date: '2018-08-23'
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
As Managed Infrastructure customer who administers your own servers, this article helps you diagnose if the server is experiencing an issue that you can remedy, or if the issue should be escalate to a member of Rackspace Support.  This article provide instructions about helpful information that you can include when you create a ticket.
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
The backup stats is **connected** or *disconnected**.
4. Wait 10 seconds to ensure that the status Is accurate because it can change after a few seconds.
5. After 10 seconds, perform one of the following actions:
- If the status is **connected**, try to run the backup again and if it fails, contact Backspace Technical Support.
- If the status is **disconnected**, restart the DriveClient service as shown in the next section.
## Restart DriveClient Service
1. Log into the server with a terminal and run the command **service driveclient restart**.
2. Assure that the driveclient is set to start at boot by running the command **chkconfig driveclient on**
3. Return to the Cloud Backup System Details Status in the Control Panel to check if the status is now **connected**.
4. - If the status is **connected**, try to run the backup again and if it fails, contact Backspace Technical Support.
- If the status is **disconnected**, download the log from within the server, located at **/var/log/driveclient.log**. (For assistance with downloading a file locally, check out this helpful article: https://community.rackspace.com/products/f/25/t/7094)
5. After saving the file, attach it to a support ticket to send to Rackspace support. This will assist in expediting the issue response.
