---
permalink: cloud-server-deletion
audit_date:
title: Cloud Server Deletion
created_date: ‘2018-09-05'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Cloud server pricing is based on the hours that the server is utilizing resources on the host machine.  Because of this, merely shutting down a server is not enough to stop billing.  The server must be deleted to stop charges.  Because of this, it is important to understand if the server is being actively used before deleting the server.  Shutting down the server itself is a good way to determine if it is being actively used.

To shut down a Linux server, at the command prompt run shutdown -h now

To shut down a Windows server, open up a command prompt and run the command shutdown

Once these commands are ran, it can take a few minutes for the Cloud control panel to show the instances are offline, but any connection attempts to the server will immediately not be accepted.  At this point you are able to determine if the server is needed by investigating if the server is actively being used.

After the investigation completes, you are able to move forward with rebooting the server utilizing the gear icon in the control panel, then selecting **reboot**.

If you plan to delete the server and want to retain data for possible future needs, a [Cloud Server Image](https://support.rackspace.com/how-to/creating-an-image-backup-cloning/) can be created for standard and general purpose server flavors.

Additionally, for boot from volume servers and servers where only certain files need to be saved, [Cloud Backup] (https://support.rackspace.com/how-to/rackspace-cloud-backup-create-a-backup/) can be used.

Both Cloud Backups and Server Images are stored in Cloud Files and storage costs will be associated as such, but for individuals that want to minimize their costs, these two can be considerably cheaper than a running server.

**Please note that proceeding with a server deletion will also delete all of the data on the server, which cannot be reversed.  This is why it is important to take the time to complete the above back up options above first.**
Once you have backed up needed data, return to the control panel and click **Actions** next to the server name.  Then click **Delete Server**.  This will delete the server itself and cease billing of the instance.
