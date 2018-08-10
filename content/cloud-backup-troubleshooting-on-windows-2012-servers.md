---
permalink: cloud-backup-troubleshooting-on-windows-2012-servers/
audit_date:
title: Cloud Backup Troubleshooting on Windows 2012 Servers
type: article
created_date: '2018-08-10'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
 
This article is meant to assist with issues in which customers are experiencing Cloud Backup issues including:

Backups have not been running
Backups taking too long
Cloud Backup taking up all of the server’s resources

As Managed Infrastructure customers administer the servers on their end, this article intends to assist in diagnosing if the server is experiencing an issue that should be remedied from the customer side, or if the issue is something that should be escalated to a member of Rackspace support, additionally pointing out helpful pieces of information that can be included when creating a ticket to receive an expedited response.

**Before starting the process below, check status.rackspace.com for open issues that could be impacting your server instance, ultimately impacting the Cloud Backup service running on it. Also, check current support tickets to assure that there is not an incident that is causing the lack of accessibility of the server. If there is no open support ticket about the server in question, proceed with the troubleshooting steps below.

1. In the mycloud.rackspace.com control panel, click on “Backups” and then “Systems”:
<image 1>
2. From the list of "Cloud Backup Systems," click on the server name of the backup. This will display details for the backup system, including the IP address of the server, the system type, the server region, backup region, and the agent version. To the right of the system name, the backup agent will state that it is connected or disconnected. It is important to wait ten seconds to assure that the status is accurate as it can show one status and change after a few seconds:
<image 2>
3. After ten seconds, if the status is “disconnected,” move on to the “Restart Driveclient Service" trouble shooting step. If the status is "connected," then move on to the "Download Backup Log From Control Panel” troubleshooting step.

### Restart Driveclient Service

1. To restart the driveclient service, log into the server via RDP and click the "Windows" symbol in the bottom-left corner:
<image 3>
2. Click the “Search” icon in the top-right corner:
<image 4>
3. Enter "services.msc" in the search field and then click “services” that populates under the search bar:
<image 5>
4. Locate the “Driveclient Service” and right-click on it, then choose the “Restart” option:
<image 6>
5. A pop-up will display the status of the restart:
<image 7>
6. Once the restart is complete, find the “DriveClient Service” again in the Services (Local) list, and assure that its status is “Running”:
<image 8>
7. A common reason for the driveclient not showing as started is that it is not set to start after a reboot. For good measure, assure that the driveclient is set to start at boot. Right-click of the “DriveClient Service” and choose “Properties”:
<image 9>
8. Click the drop-down next to “Startup type” and select (if not already selected) “Automatic”:
<image 10>
9. Click the “OK” button at the bottom of the page:
<image 11>
10. After the service is restarted, check the Control Panel again to see if the service shows as running:
<image 12>
11. If the agent is connected, move on to the "Download Backup Log From Control Panel" troubleshooting step. If the agent still shows as “disconnected” then then download the backup log from within Windows on the server. It is located at C:\ProgramData\Driveclient\log\driveclient.log. Attach this log to a ticket for Rackspace support. This will assist in expediting the issue response.
