---
permalink: attach-a-cloud-block-storage-volume-to-an-onmetal-server-through-the-cloud-control-panel/
node_id: 4733
title: Attach a Cloud Block Storage volume to an OnMetal server through the Cloud Control Panel
type: article
created_date: '2015-07-09'
created_by: Renee Rendon
last_modified_date: '2016-03-23'
last_modified_by: Nate Archer
product: Cloud Block Storage
product_url: cloud-block-storage
---

Your OnMetal server can connect to a Cloud Block Storage volume.

Connecting an OnMetal server to a Cloud Block Storage volume is useful
if you need more than 32 GB of storage but do not have a requirement for
the fast I/O normally provided by an OnMetal server. Using an OnMetal
server with Cloud Block Storage is particularly useful for OnMetal
Compute and Memory v1 flavors.

Use the following procedure to attach a volume to your OnMetal
server via the Cloud Control Panel. The procedure assumes
that the server instance already exists.



### Create a new volume

If you want to create a new volume, the following steps will guide you.
If you have already created a volume, go to the "Attach a volume" section.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Under the Storage tab, choose **Block Storage Volumes**.

   <img src="{% asset_path cloud-block-storage/attach-a-cloud-block-storage-volume-to-an-onmetal-server-through-the-cloud-control-panel/storage.png %}" width="276" height="200" />

3. Click **Create Volume** and complete the fields.

4. Click **Create Volume** again.




### Attach a volume

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Under the Storage tab, choose Block Storage Volumes.

3. Click the cog beside the volume that you want to attach and select **Attach Volume**.

  <img src="{% asset_path cloud-block-storage/attach-a-cloud-block-storage-volume-to-an-onmetal-server-through-the-cloud-control-panel/attach%20volume.png %}" width="226" height="201" />

4. Select a server from the list and click **Attach Volume**.

**Note:** You can attach more than one volume to a server.

You must use a CLI to complete steps 5 - 12.

5. Go into the instance to complete the setup.
        $ export IP=50.57.63.76
        $ ssh root@$IP

6. From inside the instance, perform all instructions as root.

7. Set some variables from the metadata.

        $ export TARGET_IQN=iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
        $ export TARGET_PORTAL=10.190.254.69:3260
        $ export INITIATOR_NAME=iqn.2008-10.org.openstack:9f956df7-3412-48e1-ac8b-017e2d643cf9

8. Ensure that the iSCSI tooling is installed.

   For Ubuntu and Debian:

        $ apt-get update
        $ apt-get install open-iscsi

   For Fedora and Centos:

        $ yum install iscsi-initiator-utils

9. Discover what block devices exist, so that you can find your new one later. The output might vary depending on the server flavor.

        $ lsblk
        NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
        sda      8:0    0  28.9G  0 disk
        sda1     8:1    0  28.8G  0 part /
        sda2     8:2    0    64M  0 part
        sdb      8:16   0   1.5T  0 disk
        sdc      8:32   0   1.5T  0 disk

10. Set up the iSCSI client.

        $ echo InitiatorName=$INITIATOR_NAME > /etc/iscsi/initiatorname.iscsi

11. Attach the Cloud Block Storage volume.

        $ iscsiadm -m discovery --type sendtargets --portal $TARGET_PORTAL
        10.190.254.69:3260,1 iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
        10.13.236.75:3260,1 iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
      
        $ iscsiadm -m node --targetname=$TARGET_IQN --portal $TARGET_PORTAL --login
        Logging in to [iface: default, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260] (multiple)
        Login to [iface: default, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260] successful.

12. Find the block device that was just added.  In this case, it is sdd.

        $ lsblk
        NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
        sda      8:0    0  28.9G  0 disk
        sda1     8:1    0  28.8G  0 part /
        sda2     8:2    0    64M  0 part
        sdb      8:16   0   1.5T  0 disk
        sdc      8:32   0   1.5T  0 disk
        sdd      8:48   0     2G  0 disk

Now you can use the device, just like on other cloud servers. For more
information, see [Prepare your Cloud Block Storage
volume](/how-to/prepare-your-cloud-block-storage-volume).



### Detach a volume

If you want detach a volume from an OnMetal server, be sure that the
volume is [fully
unmounted](/how-to/detach-and-delete-cloud-block-storage-volumes)
from within the OnMetal server before following the steps below.

1. Under the Storage tab, choose Block Storage Volumes.

2. Click the cog beside the volume that you want to attach and
   select **Detach Volume**.

3. Click **Detach Volume**.

**Note**: If any volumes are attached to an instance, deleting the
instance fails. Detaching the instances and re-deleting will
succeed.
