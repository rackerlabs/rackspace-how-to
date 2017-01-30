---
permalink: boot-a-server-from-a-cloud-block-storage-volume/
audit_date:
title: Boot a server from a Cloud Block Storage volume
type: article
created_date: '2014-08-26'
created_by: Trey Hoehne
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

**Note:** Large Snapshots will not work with boot from volume. Currently snapshots have a min_disk based on the flavor size for example 160GB. Nova expands the file system to fill that entire vhd, qemu-img cannot handle files that are 127GB and larger. This means that if the flavor from which a snapshot was taken has a disk size or the min_disk is >= 127GB, that snapshot will not work.  This will result in a HTTP 412 invalid image when done via the API.

You can now boot most cloud servers from a network-attached [Cloud Block Storage](http://www.rackspace.com/cloud/block-storage/) volume. This feature enables you to boot a server from a remotely attached volume, which moves the system disk from local to remote. Separating the system disk from the server allows for future diskless flavors, features such as "shelving," and improvements in managing and recovering from server outages.

**Note:** You cannot boot standard servers from a Cloud Block Storage volume. Standard servers support local boot systems only.

### Benefits

Booting from a Cloud Block Storage volume provides the following benefits:

- **Resiliency** - Cloud Block Storage is a persistent volume and you can retain it after the server is deleted. You can then use the image to create a new server.
- **Scale** - If you want to change the size of your server, you can easily delete your existing server and create a new one by using the same volume in Cloud Block Storage. If the IP address is important to your use case, we recommend placing a load balancer in front of the server.
- **Flexibility** - You have control over the size and type (SSD or SATA) of volume that you use to boot your server. This control enables you to fine-tune the storage to the needs of your operating system or application.

You can get started through the [Control Panel](https://mycloud.rackspace.com) or through the [API](https://developer.rackspace.com/docs/cloud-block-storage/v1/developer-guide/).

### Setup options

Servers have a local system and can have one or more data disks depending on the flavor. Additional remote data volumes can be attached to a server; however, the local system and data are always present.

Booting from a remote volume moves the system disk off the local server. The local data disk will still be present if the flavor has one.

### Booting from an existing volume

Booting from a volume requires a Cloud Block Storage volume built from a valid image or a volume cloned from an existing bootable volume. These volumes are charged at the current Cloud Block Storage rates and can be configured to persist after server deletion.

#### Volume preparation

Server images are in a VHD file format, but Cloud Block Storage requires them to be in RAW format. When a user specifies the volume type, size, and image ID for a volume, the request is sent to Cloud Block Storage. Cloud Block Storage then sends the request to an available storage node that has capacity, and the node pulls down the image and begins the conversion process. Only one conversion process can be performed at a time on a storage node; this has been identified as a potential bottleneck in the process.

A volume must be created equal to or larger than the `min_disk` value on an image.

After the volume is prepared, its bootable flag is set to `True`, and the volume is available to boot from.

#### Boot a server from a volume (Cloud Control Panel)

Use the following steps to boot a server from a Cloud Block Storage volume through the Cloud Control Panel.

1. Create your server by choosing your image and flavor. In the Flavor Description area, click Edit next to Boot Source.

     <img src="{% asset_path cloud-servers/boot-a-server-from-a-cloud-block-storage-volume/1424-5.png %}" alt="" />

2. In the pop-up window, select **Bootable Volume (Cloud Block Storage)** as the boot source and select the size of your volume. The volume name is based on your server's name, and the volume type is set to SSD.

     <img src="{% asset_path cloud-servers/boot-a-server-from-a-cloud-block-storage-volume/1424-6.png %}" alt="" />

3.	Click **Select Boot Source**.

After you create the server, your volume is prepared from the selected image.

If you delete your server, the volume persists and is available as a selectable image when you create a new server.

You can also see the volume listed on the **Block Storage** tab.

Using the API directly or a command-line client provides some added customization, such as preparing a volume independent of booting from it.

Use the following API commands to boot a server from a Cloud Block Storage volume using the API.

### Boot a server from a volume (API)

The API provides two different methods to boot from a volume. One option is a two-step method that separates volume creation from boot, and the other is an all-in-one method that combines the steps into one step.

**Note:** OpenStack community documentation for this function using the python nova client is located [here](http://docs.openstack.org/user-guide/content/create_volume_from_image_and_boot.html).

#### Prepare the volume independently (option 1)

Send a request to Cloud Block Storage for a volume. In the following example, the nova client is used:

     nova volume-create 100 --volume-type=SSD --display-name=BFB-test-SSD --image-id=ff228647-fd57-47fe-b42d-2b7813bb9115

#### Map to an existing block device (option 2)

Use this option to perform either of the following tasks:

- Boot with an existing volume.
- Boot and build the volume in one step.

The following command boots a General Purpose 1 GB server from an existing volume that is prepared with the image set by the ID. If you use this command to boot from an existing volume, source is source=volume and id is set to the volume's ID.

     nova boot --flavor general1-1 --block-device-mapping vda=8dcf68f9-0321-42f3-a3dc-b861b9335a9b:::0 BFVServer

Block device mapping is in the format of <code>=:::</code>. Type and size can be left blank, and delete on terminate can be expressed as True or 1 and False or 0.

The preceding example boots a General Purpose 1 GB server from the prepared volume, it is set to persist on server termination, and it is labeled BVFServer.

     REQUEST:
     curl -i 'https://iad.blockstorage.api.rackspacecloud.com/v1/596067/volumes' -X POST
     RESPONSE:
     {
          "volume":
              {
                  "display_name":"BFB-test-SSD",
                  "imageRef":"255df5fb-e3d4-45a3-9a07-c976debf7c14",
                  "availability_zone":null,
                  "volume_type":"SSD",
                  "display_description":null,
                  "snapshot_id":null,
                  "size":100
              }
     }
     REQUEST:
     curl -i 'https://preprod.ord.servers.api.rackspacecloud.com/v2/5892688/os-volumes_boot' -X POST
     RESPONSE:
     {
         "server":
             {
                 "name":"BFTest3",
                 "imageRef":"",
                 "block_device_mapping":
                     [
                         {
                             "volume_id":"8dcf68f9-0321-42f3-a3dc-b861b9335a9b",
                             "delete_on_termination":"0",
                             "device_name":"vda"
                         }
                     ],
                 "flavorRef":"general1-1",
                 "max_count":1,
                 "min_count":1,
                 "networks":
                     [
                         {
                             "uuid":"00000000-0000-0000-0000-000000000000"
                         },
                         {
                             "uuid":"11111111-1111-1111-1111-111111111111"
                         }
                     ]
             }
     }

#### Option 2

The following example boots a General Purpose 1 GB server from a volume that is prepared with the image set by the id. If you wanted to use this command to boot from an existing volume <code>source</code> would be <code>source=volume</code> and <code>id</code> would be set to the volume's ID.

     nova boot --flavor general1-1 --block-device source=image,id=e0b7734d-2331-42a3-b19e-067adc0da17d,dest=volume,size=100,shutdown=preserve,bootindex=0 BFVServer

The Cloud Control Panel uses this option.

**Note:** As of August 21, 2014, this option builds only SATA drives and does not allow the volume to be named when it is built. In the future, this option will build only SSD drives, and the name will be based on the following template: 'System disk for '. The name can be changed after the volume is built and the Cloud Control Panel displays the volume ID as the name if no name is present.

### Rebuild or resize the server

If you have deleted the server that was attached to the Cloud Block Storage volume, you can rebuild the server from the volume. You can also resize the server while retaining the previously attached system disk.

**Note:** If IP address persistence is an issue, use a load balancer to maintain a static IP address.

1.	In the Cloud Control Panel, click **Create Server**.
2.	Re-create your server by choosing your bootable volume image. In the **Image** area, click **Bootable Volume**.
3.	Select the applicable volume from the **Block Storage Volume** list.
4.	Adjust the size of the server under **Flavor** and click.
