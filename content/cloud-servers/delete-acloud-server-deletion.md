---
permalink: delete-a-cloud-server\
audit_date: '2018-09-25'
title: Delete a Cloud Server
created_date: ‘2018-09-05'
created_by: Shaun Crumpler
last_modified_date: '2018-09-25'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Cloud Server pricing is based on the hours that the server uses resources on the host machine. Due to this billing model, shutting down a server is not enough to stop billing. You must delete the server to stop charges. Therefore, you should understand whether the server is in active service before deleting it. Shutting down the server is a good way to determine if it is in active use.

To shut down a Linux&reg; server, run the following command at the command prompt: 

`shutdown -h now`

To shut down a Windows&reg; server, open a command prompt and run the following command: 

`shutdown`

After the shutdown command is executed, it takes a few minutes for the Cloud Control Panel to show that the instances are offline, but no attempts to connect to the server are accepted during the shutdown. After the shutdown completes, you can determine whether the server is needed by noting whether the any users or processes need the server.

If you determine that the server is still needed or you need to backup data before you delete the server, reboot the server by clicking the gear icon in the Control Panel and selecting **reboot**.

If you plan to delete the server and want to retain data for possible future needs, create a [Cloud Server Image] (https://support.rackspace.com/how-to/creating-an-image-backup-cloning/) for standard and general purpose server flavors.

For boot-from-volume servers, and servers where only specific files need to be saved, use [Cloud Backup] (https://support.rackspace.com/how-to/rackspace-cloud-backup-create-a-backup/).

Both Cloud Server images and Cloud Backups are stored in Cloud Files with associated storage costs, but for individuals who want to minimize their costs, these two options are likely much cheaper than a running an idle server.

**Warning:** Deleting a server also deletes all of the data on the server, a process that cannot be reversed. So it is important to take the time complete the previously described back up options first.

After you have backed up the data, go to the Control Panel, click **Actions** next to the server name, and click **Delete Server** to delete the server itself and stop the billing for the instance.

