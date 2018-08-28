---
permalink: cloud-backup-basic-troubleshooting-on-linux-servers
audit_date: '2018-08-28'
title: Basic troubleshooting for Cloud Backup on Linux servers
created_date: '2018-08-23'
created_by: Shaun Crumpler
last_modified_date: '2018-08-28'
last_modified_by: Shaun Crumpler
product: Cloud Servers
product_url: cloud-servers
---

This article assists with issues that customers are experiencing when Cloud Backup issues
are caused by the backup agent being disconnected on the Linux instance, including
the following problems:

* Backups have not been running.
* Backups are taking too long.
* Cloud Backup is taking up all of the server’s resources.

As a Managed Infrastructure customer who administers your own servers, this article helps
you diagnose if the server is experiencing an issue that you can remedy, or if you should
escalate the issue to a member of Rackspace Support. This article provide instructions with
helpful information that you can use to troubleshoot the issue or include in a ticket when
you create onet.

## Check for open issues

Before you restart the DriveClient service, check [status.rackspace.com](https://status.rackspace.com)
to ensure that there are no open issues for Cloud Backup that could be impacting your server instance.
In addition, check the current support tickets to ensure that there has not been an incident
that is causing the lack of accessibility of the server. 

To check for open support tickets, log in to the [Cloud Control Panel](https://mycloud.rackspace.com/)
and click **Tickets > Ticket List** in the top navigation bar. If there is no open support ticket
about the server in question, proceed with the troubleshooting steps in the next sections.

## Establish a connection

Use the following steps to establish a connection:

1. In the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com), click on
   **Backups > Systems>**.

2. From the list of Cloud Backup systems, click on the backup server name.

   This action displays the following details about the backup system:
   - The Internet Protocol (IP) address of the server
   - The system type
   - The server region
   - If encryption is enabled
   - The backup region 
   - The agent version
   
3. To the right of the system name, review the status of the backup agent.

   The backup agent status is either **connected** or **disconnected**.
   
4. Wait 10 seconds to ensure that the status is accurate because it can change after
   a few seconds.
   
5. After 10 seconds, perform one of the following actions:

   - If the status is **connected**, try to run the backup again, and if it fails,
     contact Rackspace Support.
   - If the status is **disconnected**, restart the DriveClient service as shown in
     the next section.
     
## Restart the DriveClient service

Use the following steps to restart the DriveClient service:

1. Log in to the server with a terminal and run the command **service driveclient restart**.

2. Ensure that the driveclient is set to start at boot by running the command **chkconfig driveclient on**.

3. Return to the **Cloud Backup System Details Status** in the Control Panel to check
   if the agent status is now **connected**.
   
4. Follow these steps based on the status:

   - If the status is **connected**, try to run the backup again, and if it fails,
     contact Rackspace Support.
   - If the status is **disconnected**, download the log from the server that is
     located at **/var/log/driveclient.log**. (For assistance with downloading a file
     locally, check out [this helpful article](https://community.rackspace.com/products/f/25/t/7094).
     
5. After saving the file, attach it to a support ticket to send to Rackspace Support.
   This assists in expediting the issue response.
