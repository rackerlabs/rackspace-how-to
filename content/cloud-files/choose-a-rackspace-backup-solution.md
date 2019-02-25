---
permalink: choose-a-rackspace-backup-solution/
audit_date: '2019-01-22'
title: Choose a Rackspace backup solution
type: article
created_date: '2019-02-06'
created_by: Rackspace Community
last_modified_date: '2019-02-06'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

When you choose a backup solution, it is
important to understand the functionality, flexibility, extensibility, cost,
and life cycle of the backups that you are using. These factors can
significantly influence your requirements. In most cases, Rackspace Cloud Backup
or Rackspace Cloud Images is the best fit for backing up your data.

### Backup considerations

This section presents factors that you should consider when you are deciding
on a backup solution.

#### Functionality

Ensure that you answer the following question regarding functionality:

- What can you do with your backup application functionally?

#### Extensibility

Answer the following questions regarding extensibility:

- To what extent will the application be functional, useful, and practical?

- What limits exist, in terms of the size of the data, and what is
  the frequency of backups?

#### Cost

Know the following information about cost:

- How much does it cost to make a single backup?

- How much does it cost to restore a backup?

#### Life cycle

Ask the following questions about the life cycles of backups:

- How long will the backup exist?
  
- How permanent does the backup need to be? Will the application 
  that you use still exist in three, five, or 10 years?

- What measures are in place to ensure accessibility if the level of support
  changes?

#### Suitability

Ensure that the product that you are using is designed for your use case. For
example, are you using Cloud Images, which is designed as an environmental
backup rather than a file store? Are you using Rackspace Cloud Backups as an
environmental store when you should really use Cloud Images?

Rackspace Cloud Backup only takes backups of the file system files and folders
of your cloud server. It does not take a copy of the environment.

You cannot boot an operating system by using a restore from Cloud Backups.
To perform this action, use Cloud Images.

### Cloud Backup

Cloud Backup offers the following benefits and functionality:

1. Fully manageable through the Cloud Control Panel and an 
   application programming interface (API).

2. Deduplicates files, reducing costs and disk usage.

3. Offers Cyclic Redundancy Checking (CRC) of files, which verifies
   consistency and checks for corruption after archiving.

4. Logical application written in the C programming language, which adds many
   features for automating backup to Cloud Files.

5. No bandwidth charges for data sent through [ServiceNet](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/network/cloud-networks-product-concepts/servicenet/?_ga=2.71460947.1749091142.1548687618-526875459.1547481082).

6. Uses Cloud Files, but fully managed.

7. Backs up by using ServiceNet or [PublicNet](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/network/cloud-networks-product-concepts/publicnet/?_ga=2.37243872.1749091142.1548687618-526875459.1547481082).

#### How Cloud Backup works

Rackspace Cloud Backup uses a cloud server backup agent called _driveclient_.
The driveclient agent runs on your cloud server and connects through an
API to retrieve schedules from a central
API endpoint location. It also connects to Cloud Files to store backup
data. The agent enables you to restore the files from any Rackspace cloud server
or Rackspace dedicated server to any other cloud server or dedicated server
that also runs the agent.

For more information about using Cloud Backup, see the [Cloud Backup API
Developer
Guide](https://developer.rackspace.com/docs/cloud-backup/v1/developer-guide/).

### Cloud Images

Rackspace Cloud Images enables you to copy your cloud server's environment and
operating system (OS) to a bootable image. You can then boot an OS from the
Rackspace Cloud Image backup.

The cloud server environment image usually encapsulates your primary hard disk
partition. On Windows&reg;, this is commonly referred to as the first hard
disk, or the `C` system disk. In Linux&reg; distributions, this disk is
commonly referred to as **sda** (`sda1`) or **xvda** (`xvda1`), where `a`
indicates the first disk, and 1 indicates the first partition.

#### How Cloud Images works

A Rackspace Cloud Image is a copy of the primary partition of your cloud
server taken in a virtual hard disk (VHD) format and zipped, then uploaded to
Cloud Files. When you create a server from that image, the zipped image is
uncompressed and downloaded to the new cloud server host. The cloud
server boots up when the download to the server is complete.

#### Nova-agent

The nova-agent communicates between the server and the host. Nova-agent is an 
important Rackspace boot-time service that should be running
on all cloud servers that are imaged.

**Important**: It is critically important that this service is running at boot
time before you take a cloud server image that you intend to use later. This
step is necessary because nova-agent is used to alter the networking
configuration of new cloud servers that are built in different network
subnets.

**Warning**: If the nova-agent isn't running, it cannot set the new 
Internet Protocol (IP) address on start, and the server doesn't get 
its networking interface. When you use cloud server 
images as a backup, it is important to ensure that nova-agent is set 
to start at boot time and test the cloud server image 
before you rely on it. 

For more information about using Cloud Images, see the [Cloud Images API
developer
guide](https://developer.rackspace.com/docs/cloud-images/v2/developer-guide/).

### Rackspace Cloud Files

Rackspace Cloud Files is a hard disk on the cloud to which you can read and
write by using your username and API key credentials. It is not as fast as
Rackspace Cloud Block Storage, but it is much bigger.

Rackspace Cloud Files is very similar to the Amazon&reg; Simple Storage
Service&reg; (S3&reg;) product. It is a very large disk, and you can store a
nearly unlimited number of files and folders. However, there are some
limitations, including a limit on the maximum number of containers and files.

Cloud Files has the following characteristics:

1. Each cloud file that you upload is copied twice, so that you have three
   consistent copies of the same file.

2. Because each cloud file is copied two times, the file exists on three
   different _just a bunch of disks_ (JBODs). Each JBOD is independently
   backed by a Redundant Array of Independent Disks (RAID).

3. Each customer can have up to 500,000 containers per account in Cloud Files.

4. We recommend that you store extremely large numbers of objects in multiple
   containers.

5. When writing large numbers of objects to a single container, the limit of
   100 object write requests per second per container might reduce overall
   performance.

The following example Bash script uses Cloud Files to upload all of the
files in **/var/www/mysite.co.uk** to Cloud Files:

      #!/bin/sh

      # This script uploads an entire file structure to a Cloud Files container

      USERNAME="mycloudusername"
      APIKEY="mycloudapikeyhere"

      # Cloud Files token

      TOKEN=`curl https://identity.api.rackspacecloud.com/v2.0/tokens -X POST -d '{ "auth":{"RAX-KSKEY:apiKeyCredentials": { "username":"'$USERNAME'", "apiKey": "'$APIKEY'" }} }' -H "Content-type: application/json" |  python -mjson.tool | grep -A5 token | grep id | cut -d '"' -f4`

      # Set the destination folder

      FILES=/var/www/mysite.co.uk/*

      # Set the destination container

      CONTAINER=mysite.co.uk-backup

      for f in $FILES
      do

      echo "Upload start $f ..."
      FILENAME=`basename $f`

      # Take action on each file

      curl -i -X PUT https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_100101010/somecontainer/$FILENAME -T /root/cloud-files/files/$FILENAME -H "X-Auth-Token: $TOKEN"

      done

#### How Cloud Files works

Rackspace Cloud Files is an API-driven service. It is possible to connect 
different frameworks and software, such as Bash, Python, PHP,
and Node.js.

For more information about using Cloud Files, see the [Cloud Files API
developer
guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/).

### Cloud Block Storage

Rackspace Cloud Block Storage is not intended as a cloud backup utility.
However, a Cloud Block Storage disk store might be superior for some use cases.

For example, if you have a large number of small files for which you don't
have space locally on your cloud server and you previously used Cloud Files to
store and retrieve them, using Cloud Block Storage instead significantly speeds up the
processing workflow.

#### How Cloud Block Storage works

By using Cloud Block Storage with your cloud server, you add an additional network-attached
storage (NAS) device that your cloud server accesses through an Internet Small
Computer Systems Interface (ISCSI) connection between the cloud server
hypervisor and a RAID 10-backed Cloud Block Storage node.

The maximum performance of Cloud Block Storage can be much higher than all of the other
solutions. However, there are limitations regarding portability and
redundancy, which is why Cloud Block Storage is not considered for most backup use cases where
consistency, redundancy, and failsafe are required. The greatest advantage of
using Cloud Block Storage is its very fast speed and suitability for many small, temporary
files.

For more information, see the [Cloud Block Storage API developer
guide](https://developer.rackspace.com/docs/cloud-block-storage/v1/developer-guide/).
