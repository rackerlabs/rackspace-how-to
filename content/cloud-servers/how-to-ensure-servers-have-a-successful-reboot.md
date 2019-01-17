---
permalink: how-to-ensure-servers-have-a-successful-reboot
audit_date:
title: How to Ensure Servers Have a Successful Reboot
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
From time to time you might find that your server needs to be rebooted. While the reboot is generally a fast process, it can sometimes present additional headaches. Fortunately, a little bit of  planning can prevent a lot of headache. Let's go over a few tips to make sure that any server reboots are fast and minimally disruptive.  

### Ensure server has backups configured and running. 
We recommend everyone use backups to keep their data up-to-date. Our Cloud Backup product runs a differential backup on a set frequency. This backup can be set to run on any number of directories. It is also important to remember that on Performance Cloud Servers with a data disc the data partition is not included in any image snapshots taken. Make sure those data partitions are included in your backup scheme. 
For additional information on Cloud Backup, please review our Cloud Backup Overview in our Knowledge Center: 
For many of our Linux customers these directories will need to be backed up:
/home
/root
/etc (This will contain most of your configuration files)
/var/www (This will often contain your websites and files)
/var/lib/mysqlbackup (Servers built using Rackspace Managed Operations will have an automated process that automatically runs a mysql dump to this folder.)
 
For Windows Servers we recommend you backup where your data might be stored, e.g.:
C:\inetpub
C:\Users
Any additional drives such D:, E: and so on. 
 
MS-SQL Backup
Remember, Cloud Backup will not backup live databases. Backup must be done through Microsoft SQL Server Management Studio.
Of course we recommend that you carefully consider your specific applications, and their backup needs. 
For additional reading, see our notes on the http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-vs-cloud-server-image-backups
 
Ensure services are configured to start after boot. 
When installing a service it does not automatically configure this to start again once the server is rebooted.  However, there is an easy way to resolve this.  Below are some links on how to do this on RHEL/CentOS, Ubuntu and even Windows servers.
How to use chkconfig with RHEL/CentOS
Starting services on boot - CentOS 7 / RHEL 7
How to use update-rc.d with Ubuntu
Automatically Starting Services with Windows
 
Ensure IPtables/Windows Firewall rules are saved and configured to restart on reboot.
It is important to ensure that the firewall rules that you have worked hard to configure stay active upon reboot.  Below are a couple of links on how to ensure that this is the case for both iptables and Windows Firewall.
***SSL passphrase***
We generally do not recommend using a passphrase when generating a SSL certificate.  If you do already have a passphrase in place for your SSL certificate however, you will need to input that into the server upon reboot.  The services on the server will not be able to start without first having to input that passphrase. 
***Ensure that Cloud Block Storage Volumes Attach on Reboot***
If you have data on a Cloud Block Storage volume attached to a NextGen Cloud Server, you'll want to make sure that any volumes are properly connected after a reboot. To ensure this, you need to add your volume to the static file system information in the fstab file. See step 5 in this guide. Cloud Block Storage volumes cannot be attached to a FirstGen Cloud Server.
For Windows users, mounted block storage should remain mounted after reboot.
### FSCK (File System Consistency Check)
A fsck generally runs automatically at boot time.  There are 2 common triggers for automatically executing a fsck.  Either the operating system detect that a file system is in an inconsistent state (likely due to a non graceful shutdown like crash or power loss) or after a certain number of times that the system is mounted.
Once you reboot your server this fsck may happen automatically.  If it does, this could cause an increase in the delay for your server coming back online.  Delay's are usually never good, but in this case the delay can save your server.  I would suggest just letting the fsck complete even though it may cause delays for you.  If you attempt to reboot the server again, it is just going to go right back into fsck which will only increase the delay. 
 
### Test
Having images, backups, configurations, and redundancies in place are vital, but we strongly recommend taking a few minutes to test the entire process of getting your environment back up and running, so that you know how your servers and other cloud products will react during and after the reboot. Want to know how your server will react to a reboot? There's no better way to get that answer than to just try it out and see. Of course we recommend doing any testing during the development phase, or on separate servers to limit any customer impact.
 
### Mitigating Reboot Impact
***Horizontal Scaling***
One of the best ways to prevent prolonged impact from a reboot is to distribute your application over multiple redundant, tiered, servers. We call this "Horizontal Scaling," and it's a great way to minimize the risk of downtime due to any single server going down. There's a very good discussion of Horizontal Scaling in one of our Rackspace Office Hours Hangouts. 
***Custom Error Pages***
One benefit of using a Cloud Load Balancer is the ability to set a custom error page in the event that a server connected to the Load Balancer is offline or unresponsive. By proactively configuring that error page, a visitor to your site will receive an error message designed by you, specific to your unique application. 
