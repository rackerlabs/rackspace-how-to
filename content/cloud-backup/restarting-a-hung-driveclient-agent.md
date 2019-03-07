---
permalink: restarting-a-stalled-driveclient-agent/
audit_date: '2019-03-07'
title: Restarting a stalled driveclient agent
type: article
created_date: '2019-03-07'
created_by: Rackspace Support
last_modified_date: '2019-03-07'
last_modified_by: William Loy
product: Cloud Backup
product_url: cloud-backup
---


This article provides instructions on resolving a stalled cloud backup driveclient by stopping and restarting the service on your server.

### Resolving a stalled Cloud Backup Driveclient

Use the following instructions to resolve a stalled cloud backup driveclient:

1.	Log into your [Cloud Control Panel](login.rackspace.com) and manually stop all jobs by using your cloud backups control panel.

2.	Stop the driveclient service from the server.


#### Command Prompt method

Use the following commands to stop and restart the driveclient agent:

1.	Stop the Driveclient:

    `sc stop driveclient`

2.	Query driveclient until it returns `STOPPED`:

    `sc query driveclient`

3.	Restart the Driveclient:

    `sc start driveclient`

4. Verify the driveclient agent is connected through the cloud backup control panel.


#### Task Manager method

Use the following commands to stop and restart the driveclient agent:

1.	Right click *driveclient.exe* and select *End Process* or *End Process Tree*.
2.	Right click *driveclient.exe* and select *Start*.
3. Verify the driveclient agent is connected through the cloud backup control panel.


#### Linux method

Use the following commands to stop and restart the driveclient agent:

1. Stop the driveclient:

    `sudo service driveclient stop`

2. Verify the driveclient is stopped:

    `ps -ef | grep driveclient`

   If the driveclient does not stop, you can force driveclient to stop by running the following command:

        `killall -9 driveclient`


3. Restart the driveclient service:

    `sudo service driveclient start`

4. Verify the driveclient agent is connected through the cloud backup control panel.
