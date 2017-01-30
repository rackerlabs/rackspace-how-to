---
permalink: attach-a-cloud-block-storage-volume-to-an-onmetal-server/
audit_date:
title: Attach a Cloud Block Storage volume to an OnMetal server
type: article
created_date: '2015-07-22'
created_by: Catherine Richardson
last_modified_date: '2016-06-06'
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

### Attach a volume

To use the CLI in your terminal window, use the following procedure to
attach a volume to your OnMetal server. (For information about
installing the nova client, see [Installing python-novaclient on Linux and Mac OS](/how-to/installing-python-novaclient-on-linux-and-mac-os).)
The procedure assumes that the server instance and volume already exist.

1. Set up the instance and the volume with their IDs as environment variables so that they are in the environment for use by subsequently executed commands.

       $ export INSTANCE=62f3ac8d-13f1-49a4-90ed-ab3c62eb302e
       $ export VOLUME=3e7af99d-655f-4af1-93bb-9160ee505d9f

2. Attach the instance. You can ignore the return value.

       $ nova volume-attach $INSTANCE $VOLUME

       +----------+--------------------------------------+
       | device   | /dev/sdb                             |
       | id       | 3e7af99d-655f-4af1-93bb-9160ee505d9f |
       | serverId | 62f3ac8d-13f1-49a4-90ed-ab3c62eb302e |
       | volumeId | 3e7af99d-655f-4af1-93bb-9160ee505d9f |
       +----------+--------------------------------------+

3. Get the volume metadata from the instance. Each attached volume has a
metadata key. These keys are named volumes\_\$VOLUME and are a JSON
string.

       $ nova show $INSTANCE

       +--------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
       | Property                             | Value                                                                                                                                                                                                                                                                       |
       +--------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
       | OS-DCF:diskConfig                    | MANUAL                                                                                                                                                                                                                                                                      |
       | OS-EXT-STS:power_state               | 1                                                                                                                                                                                                                                                                           |
       | OS-EXT-STS:task_state                | -                                                                                                                                                                                                                                                                           |
       | OS-EXT-STS:vm_state                  | active                                                                                                                                                                                                                                                                      |
       | RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId | 24e57d104262c2c4d0c7f1738a440384d3727ca9d93809f84ef54cad                                                                                                                                                                                                                    |
       | accessIPv4                           | 50.57.63.76                                                                                                                                                                                                                                                                 |
       | accessIPv6                           |                                                                                                                                                                                                                                                                             |
       | config_drive                         | True                                                                                                                                                                                                                                                                        |
       | created                              | 2015-07-17T00:18:03Z                                                                                                                                                                                                                                                        |
       | flavor                               | OnMetal IO v1 (onmetal-io1)                                                                                                                                                                                                                                                 |
       | hostId                               | 3cff0ecc09185d0bc7454019c7caee299c1a584a6a686910b1c77586                                                                                                                                                                                                                    |
       | id                                   | 62f3ac8d-13f1-49a4-90ed-ab3c62eb302e                                                                                                                                                                                                                                        |
       | image                                | OnMetal - Ubuntu 14.04 LTS (Trusty Tahr) (c199db85-c6f9-4284-b9ec-16327ee2fc84)                                                                                                                                                                                             |
       | key_name                             | jim                                                                                                                                                                                                                                                                         |
       | metadata                             | {"volumes_3e7af99d-655f-4af1-93bb-9160ee505d9f": "{\"target_iqn\": \"iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f\", \"target_portal\": \"10.190.254.69:3260\", \"initiator_name\": \"iqn.2008-10.org.openstack:9f956df7-3412-48e1-ac8b-017e2d643cf9\"}"} |
       | name                                 | jim-test-io3                                                                                                                                                                                                                                                                |
       | private network                      | 10.184.255.220                                                                                                                                                                                                                                                              |
       | progress                             | 100                                                                                                                                                                                                                                                                         |
       | public network                       | 50.57.63.76                                                                                                                                                                                                                                                                 |
       | status                               | ACTIVE                                                                                                                                                                                                                                                                      |
       | tenant_id                            | 5956439                                                                                                                                                                                                                                                                     |
       | updated                              | 2015-07-17T00:22:58Z                                                                                                                                                                                                                                                        |
       | user_id                              | 18c93a9ae8d9446b80543fdd799638ef                                                                                                                                                                                                                                            |
       +--------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

4. Go into the instance to complete the setup.

       $ export IP=50.57.63.76
       $ ssh root@$IP

5. From inside the instance, perform all instructions as root.

6. Set some variables from the metadata.

       $ export TARGET_IQN=iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
       $ export TARGET_PORTAL=10.190.254.69:3260
       $ export INITIATOR_NAME=iqn.2008-10.org.openstack:9f956df7-3412-48e1-ac8b-017e2d643cf9

7. Ensure that the iSCSI tooling is installed.

   For Ubuntu and Debian:

       $ apt-get update
       $ apt-get install open-iscsi

   For Fedora and Centos:

       $ yum install iscsi-initiator-utils

8. Discover what block devices exist, so that you can find your new one later. The output might vary depending on the server flavor.

       $ lsblk
       NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
       sda      8:0    0  28.9G  0 disk
       sda1     8:1    0  28.8G  0 part /
       sda2     8:2    0    64M  0 part
       sdb      8:16   0   1.5T  0 disk
       sdc      8:32   0   1.5T  0 disk

9. Set up the iSCSI client.

       $ echo InitiatorName=$INITIATOR_NAME > /etc/iscsi/initiatorname.iscsi

10. Attach the Cloud Block Storage volume.

        $ iscsiadm -m discovery --type sendtargets --portal $TARGET_PORTAL
        10.190.254.69:3260,1 iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
        10.13.236.75:3260,1 iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f
        $ iscsiadm -m node --targetname=$TARGET_IQN --portal $TARGET_PORTAL --login
        Logging in to [iface: default, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260] (multiple)
        Login to [iface: default, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260] successful.

11. Find the block device that was just added.  In this case, it is sdd.

        $ lsblk
        NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
        sda      8:0    0  28.9G  0 disk
        sda1     8:1    0  28.8G  0 part /
        sda2     8:2    0    64M  0 part
        sdb      8:16   0   1.5T  0 disk
        sdc      8:32   0   1.5T  0 disk
        sdd      8:48   0     2G  0 disk

Now you can use the device, just like on other cloud servers. For more
information, see [Prepare your Cloud Block Storage volume](/how-to/prepare-your-cloud-block-storage-volume).

### Detach a volume

To use the CLI in your terminal window, use the following procedure to
detach a volume from your OnMetal server.

1. From inside the instance, perform all commands as root.

2. Unmount filesystems. (For instructions, see [Detach and delete Cloud Block Storage volumes](/how-to/detach-and-delete-cloud-block-storage-volumes)).

3. Disconnect the volume.

       $ iscsiadm -m node --targetname=$TARGET_IQN --portal $TARGET_PORTAL --logout
       Logging out of session [sid: 1, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260]
       Logout of [sid: 1, target: iqn.2010-11.com.rackspace:3e7af99d-655f-4af1-93bb-9160ee505d9f, portal: 10.190.254.69,3260] successful.

4. From the local machine, detach the volume using nova. If you detach before disconnecting, the volume will remain in detaching status until the preceding command is run and the following command is run again.

       $ nova volume-detach $INSTANCE $VOLUME

**Note**: When volumes are attached to an instance, you can not delete a volume from that instance. The instance will succeed if you detach the volume, than delete the volume again.
