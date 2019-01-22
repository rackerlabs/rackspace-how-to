---
permalink: using-cloud-backup-cloud-server-images-cloud-files-for-backups
audit_date:
title: Using Cloud Backup, Cloud Server Images & Cloud Files for Backups
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---
A lot of discussion lately has been around ways to effectively backup your data.  For most customers needs the Rackspace Cloud Backup solution or Rackspace Cloud-server images will be the best fit for a whole host of use-cases. When choosing your backup solution, it's important to understand the functionality, flexibility, extensibility, costing and life cycle of the backups your using, these things can influence your requirements significantly, so remember that your requirements are altered by the products features, as much as the products features need to suit your requirements. This article is designed to explain the difference between the products and the suitable use cases for them.
After reading this article you should have an acknowledged understanding that the suitability is determined by the use case not just the product features or requirements.
BACKUP CONSIDERATIONS

1) Functionality.

-- What you can do with your backup application functionally?

2) Extensibility: 

-- To what extent will the application be functional, useful and practical? 

-- What limits exist, in terms of the size of the data, and the frequency of backups? 

3) Costing. 

-- How much does it cost to make a single backup?

-- How much to restore a backup?

4) Life Cycle: 

-- How long will this be backed up?How permanent does the backup need to be? Will the application used exist in 3 years time? 5 years? 10?

-- What effective measures are in place to ensure accessibility in the result of support changes?

5) Suitability:

-- Is the product your using really designed for the use? (i.e. are you using cloud-server images which is designed as an environmental backup, not a file store, or are you using Rackspace Cloud Backups as an environmental store, when you should really be using cloud-server images for that?).
Rackspace Cloud Backup

Rackspace Cloud Backup is designed to take backups of the filesystem files and folders of your cloud-server. It does not take a copy of the environment, only a collection of files on the filesystem. 

You cannot boot an operating system using a restore from Cloud Backups, to do that use cloud-server images.

Fig1.0 - Example of creating a Rackspace Cloud Backup


e.g. De-duplicating, CRC checking Backup /var/www/vhosts incrementally every day, retention period 7 days only

e.g. restoring a previous backup that was taken on this server to another server disk.


1. Fully manageable via Control Panel and via API.

2. De-duplication of Files (reduce cost and disk usage)

3. CRC Cyclic Redundancy Checking of Files (verify consistency & check for corruption after archiving).

4. Logical application written in C which adds many features to automate backup to cloud files.

5. No bandwidth charges through servicenet.

6. Uses Cloud Files, but fully managed.

7. Backs up via servicenet or publicnet,

How it works

Rackspace Cloud Backup utilizes a cloud-server backup agent called 'driveclient'. The driveclient agent runs on your cloud-server and connects via the API (Application Programming Interface) to retrieve schedules from a central API endpoint location. It also connects to the cloud files to store backup data. This therefore allows you to restore the files to any Rackspace cloud-server or Rackspace dedicated server to any other cloud-server or dedicated server that also runs the agent.
API Developer Guide: https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/

Rackspace Cloud Images

The Rackspace Cloud-Server images are designed to allow you to copy your cloud-server environment and OS to abootable image. You can boot an operating system from the Rackspace Cloud Image backup. 

The cloud-server environment image usually encapsulates your primary hard disk partition. This is on Windows commonly referred to as the first hard disk, or the C:\ System Disk. In Linux distributions this disk is commonly referred to as 'sda' (sda1) or 'xvda' (xvda1). Where 'a' indicates the first disk, and 1 indicates the first partition.

e.g. Scheduled backup of cloud-server OS disk ('C:\' or 'xvda1' ) every day, retention period 7 days.

e.g. Restoring a cloud-servers system OS 'C:\' or 'xvda1' disk to a previous state from last week.


Fig 1.1 - Showing how to create an image of a cloud-server from cloud-server list.


Fig 1.2 - Building a new cloud server from a cloud-server image taken earlier.


How it works

Rackspace cloud-server images is a copy of the primary partition of your cloud-server taken in a VHD format and zipped, then uploaded to cloud files. When creating a server from that image later on, the zipped image is then uncompressed and downloaded to the new cloud-server host, then the cloud-server is booted once the download to the server completes.


Important Information

Nova-agent, an important Rackspace boot time service should be running on all cloud-servers which are imaged. IT IS CRITICALLY IMPORTANT that this service is running (at boot) before taking a cloud-server image you intend to use later on. The reason is nova-agent is used to alter the networking configuration of newly build cloud-server built in different network subnet. If nova-agent isn't running it won't be able to set the new ip on boot, so it won't get it's networking interface. When using cloud-server images as a backup, it's important to make sure that nova-agent is set to start at boot-time, and preferably test the cloud-server image before relying on it.


API Developer Guide:

https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/

Rackspace Cloud Files

The Rackspace Cloud Files offering is just like what it sounds. A massive hard disk on the cloud that you can read and write to using your API USER and API KEY credentials. It's not as fast as Rackspace CBS, but it's much much bigger.



Rackspace Cloud Files is very similar to the Amazon S3 product. It's a very large disk and you can store nearly unlimited number of files and folders. However there are some limitations, and a limit on the maximum number of containers and files.



e.g. Very large Website Forum Avatar Pictures store

e.g. Very large search engines requiring a scalable Filesystem for objects

e.g. Application written in PHP/Python/BASH for a specific purpose can utilize Cloud Files API calls.


Fig 1.3 - Showing The Cloud Files Container listing from within the control panel


1. Each cloud file uploaded to Rackspace will eventually have 3 consistent copies of the same file (Eventual consistency).

2. Each customer can have up to 500,000 containers per account in Cloud Files.

3. For extremely large number of objects, we recommend storing them in multiple containers 

4. When writing large numbers of objects to a single container, the limit of 100 object write requests per second per container may reduce total performance.

5. Each cloud file is (eventually) copied an additional 2 times, so that it exists on 3 different JBODS. Each of those JBOD is independently RAID backed.

#!/bin/sh

# This Scripts Uploads an entire file structure to a cloud files container

USERNAME="mycloudusername"
APIKEY="mycloudapikeyhere"

# CLOUD FILES TOKEN

TOKEN=`curl https://identity.api.rackspacecloud.com/v2.0/tokens -X POST -d '{ "auth":{"RAX-KSKEY:apiKeyCredentials": { "username":"'$USERNAME'", "apiKey": "'$APIKEY'" }} }' -H "Content-type: application/json" |  python -mjson.tool | grep -A5 token | grep id | cut -d '"' -f4`

# Folder to Upload FROM

FILES=/var/www/mysite.co.uk/*

# Container to Upload to

CONTAINER=mysite.co.uk-backup

for f in $FILES
do

echo "Upload start $f ..."
FILENAME=`basename $f`

# take action on each file

curl -i -X PUT https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_100101010/somecontainer/$FILENAME -T /root/cloud-files/files/$FILENAME -H "X-Auth-Token: $TOKEN"

done

Fig 1.4 - Showing a BASH script utilizing Cloud Files to upload all files within /var/www/mysite.co.uk and upload them to Cloud Files.

How it works

Rackspace Cloud Files is essentially an API driven service. It is possible to connect a whole manner of different frameworks and software, such as BASH, python,php, node.js and many more. Ultimately when it comes to dealing with Cloud Files directly the sky is almost-the-limit, allowing for the hard limits set in cloud files. See the developer guide below for additional information of Cloud File supported HTTP API calls.


API Developer Guide:

https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/

Rackspace Cloud Block Storage

The Rackspace Cloud Block storage is not intended as a cloud backup utility. However CBS disk store might be superior in some use cases (which is why we included this in the article).


For instance if you had a large number of small files that you didn't have space for locally on your cloud-server and you had previously chosen Cloud Files to store them and then slowly retrieve them, then using CBS instead would massively speed up the processing workflow.


How it works

By utilizing CBS with your Cloud-server you are adding an additional Network Attached Storage (NAS) device which is accessed by your cloud-server via an ISCSI connection between the cloud-server hypervisor and a RAID 10 backed CBS node. The maximum performance of CBS can be much higher than all of the other solutions, however portability and redundancy are a problem which is why CBS is not considered for most Backup use cases where consistency, redundancy and failsafe are the requirements. CBS greatest attribute is probably very great speed and great suitability for many small temporary files. 


API Developer Guide:

https://developer.rackspace.com/docs/cloud-block-storage/v1/developer-guide/
