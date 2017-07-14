---
permalink: building-a-rackspace-private-cloud-with-linux-iscsi-volumes/
audit_date:
title: Building a Rackspace Private Cloud with Linux iSCSI Volumes
type: article
created_date: '2013-01-24'
created_by: Alyssa Hurtgen
last_modified_date: '2013-03-27'
last_modified_by: Rae D. Cabello
---

This document will describe how to build a Rackspace Private Cloud with
external storage that targets Enterprise IT applications that run on up
to 100 compute nodes. Volumes are provided via the Cinder volume service
running on Linux server head units. Cinder exposes Linux Logical Volumes
to host machines using iSCSI. Those host machines then present the iSCSI
volume as a local disk to the instance.

Following the hardware guidelines presented in this paper will accommodate a cluster with up to 1,200 physical CPU cores, 10 Terabytes of physical memory, and 3 Petabytes of storage. For a minimum specification, we recommend using at least four
compute servers and two storage servers to maintain resiliency and availability. This design focuses on the business needs of enterprise applications, in which availability and performance are critical. Using this design will help IT organizations provide a flexible, self-service platform to numerous business applications and departments, improving IT's response and agility with supporting their business units. This design is also easy to scale, which allows organizations to start small and grow as cloud adoption increases within their company.

#### Cinder software architecture

<img src="{% asset_path rpc-openstack/building-a-rackspace-private-cloud-with-linux-iscsi-volumes/cinder-refarch-sims.png %}" class="image-full_width" width="700" height="624" />

**Figure 1: The Cinder Architecture provides horizontally scaling volume
servers to serve block device volumes to guest instances**

Cinder and Nova are intertwined at the Hypervisor, and tharefore they both are required for spinning up
instances and attaching volumes to them. KVM presents the iSCSI luns that are exported from the Volume Server(s) as virtual devices to the guest instances. In this way, operating systems within the KVM guests see their underlying drives as if  the disks were attached directly to the host. This simplifies deployment of the guest instances because they do not need to be capable of booting directly from iSCSI targets.

### Reference architecture: Mass compute with external storage

<img src="{% asset_path rpc-openstack/building-a-rackspace-private-cloud-with-linux-iscsi-volumes/Screen%20Shot%202013-03-27%20at%2012.08.10%20PM.png %}" width="741" height="839" />

**Figure 2: The Mass Compute with
External Storage reference architecture provides scaling compute and
storage for  Enterprise Private Clouds (up to100 compute nodes and three
Petabytes of storage).**

### Design considerations

This design features scaling compute servers that are loosly coupled with volume storage using a dedicated
storage network, which easily allows for new capacity to be added horizontally as demand increases. Since both networks are independent of each other, they can scale with different aggregation tiering. In addition, you can easily attach legacy environments where best appropriate.

Since the storage tier is designed for horizontal scaling and infrastructure flexibility, we use Dell R515
servers with attached DAS arrays. Dell R515s provide a reasonable amount of onboard spindles and can follow the proper 1-to-1 CPU-to-Spidle ratio. You can expand storage by adding more drives directly to each volume server or by adding new volume servers with attached DAS arrays. Using this method, you can expand existing volumes by adding more drives, and you can create new volumes by adding new volume servers with attached DAS arrays. </span><span style="line-height: 1.538em;">In addition, to provide 10 Gbit connectivity for the storage network, we used Intel x520 10 Gbit network interface cards with Twinax connectivity to an Arista switching infrastructure. If additional storage is required, a popular solution is to attach a DAS device (such as a Dell MD1220) to each storage node-then you can add the block devices into the volume group.

For the compute deployment, we chose the Dell C6220 because it provides a balance of density and flexibility, while maximizing uptime with four independent, hot-swappable servers in one chassis. Thus, we can reach 100 physical nodes in the cluster with
only 25 x 2U enclosures. The networking for compute had a number of different requirements. Specifically, we needed to provide for management and instance traffic as well as storage traffic. To provide the management and instance network traffic, we used commodity, layer-2 switches. However, due to latency, stability, and performance requirements for iSCSI, we isolated storage traffic to Arista 7050 switches.

### Deploying the storage infrastructure

After the Rackspace Private Cloud Software is installed on the
infrastructure, the cinder chef roles must be added to the controller
and storage nodes. For details on this step, review the following
article: [Configuring OpenStack Block
Storage](/how-to/configuring-openstack-block-storage)[
](/how-to/configuring-openstack-block-storage)

**Note:** the storage requirements in the document. All drive devices on
the storage nodes can be added to the cinder-volumes group. This can be
a combination of any storage available on the R515s, both local storage
on the chassis and DAS.*

### Caveats

In contrast to traditional shared storage, this system favors horizontal
scaling, rather than vertical scaling. While there are multiple storage
nodes, there is no data clustering used in this design. Thus, losing a
storage node can result in data loss or corruption. We recommend RAID 10
protection on the drives to maximize performance while minimizing data
loss. If, instead, your goal is to maximize usable storage, RAID 6 can
be used to maximize space while minimizing drive failure. For the storage network, you have many
choices for protocols and transports. In this design, we use twinax for
10 GbE, but CAT6 or fiber can be used too, as long as the network
interface card or fabric adaptor is compatible with Ubuntu 12.04.</span>
