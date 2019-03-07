---
permalink: restart-a-stalled-driveclient-agent/
audit_date: '2019-03-07'
title: Restart a stalled DriveClient agent
type: article
created_date: '2019-03-07'
created_by: Rackspace Support
last_modified_date: '2019-03-07'
last_modified_by: William Loy
product: Cloud Backup
product_url: cloud-backup
---


This article provides instructions to restart a stalled Cloud Backup DriveClient agent by stopping and restarting the service on your server.

### Resolve a stalled Cloud Backup DriveClient

Use the following instructions to resolve a stalled Cloud Backup DriveClient:

1.	Log in to your [Cloud Control Panel](https://login.rackspace.com) and manually stop all jobs by using your Cloud Backups control panel.

2.	Stop the DriveClient service on the server.


#### Command Prompt method

Use the following commands at the command prompt to stop and restart the DriveClient agent:

1.	Stop the DriveClient:

    `sc stop driveclient`

2.	Query the DriveClient until it returns `STOPPED`:

    `sc query driveclient`

3.	Restart the DriveClient:

    `sc start driveclient`

4. Verify the DriveClient agent is connected through the Cloud Backup control panel.


#### Task Manager method

Use the following commands in the Task Manager to stop and restart the DriveClient agent:

1.	Right click **driveclient.exe** and select **End Process** or **End Process Tree**.
2.	Right click **driveclient.exe** and select **Start**.
3. Verify the DriveClient agent is connected through the Cloud Backup control panel.


#### Linux method

Use the following commands in Linux&reg; to stop and restart the DriveClient agent:

1. Stop the DriveClient:

    `sudo service driveclient stop`

2. Verify the DriveClient is stopped:

    `ps -ef | grep driveclient`

   If the DriveClient does not stop, you can force DriveClient to stop by running the following command:

    `killall -9 driveclient`


3. Restart the DriveClient service:

    `sudo service driveclient start`

4. Verify the DriveClient agent is connected through the Cloud Backup control panel.
