---
permalink: getting-started-with-glusterfs-considerations-and-installation/
audit_date:
title: Get started with GlusterFS - considerations and installation
type: article
created_date: '2014-08-14'
created_by: Ryan Stark
last_modified_date: '2019-12-20'
last_modified_by: Ryan Stark
product: Cloud Servers
product_url: cloud-servers
---

This article has been updated to cover GlusterFS 7 installation on CentOS 7 & Ubuntu 18.04.

Before you start to use GlusterFS, you have to make a fundamental decision: what type of volumes do you need for your environment. The following methods are used most often to achieve different results:

<table>
	<tr>
		<th>Volume type</th>
		<th>Description</th>
	</tr>
	<tr>
		<td><strong>Replicated</strong></td>
		<td>This type of volume provides file replication across multiple bricks. It is the best choice for environments where high availability and high reliability are critical, and when you want to self-mount the volume on every node, such as with a web server document root (the GlusterFS nodes are their own clients).

		Files are copied to each brick in the volume, similar to a RAID-1. However, you can have 3 or more bricks or an odd number of bricks; usable space is the size of one brick, and all files written to one brick are replicated to all others. This type works well if you are going to self-mount the GlusterFS volume, for example as the web server document root (<strong><code>/var/www</code></strong>) or similar where all files must reside on that node. The value passed to <strong>replica</strong> is the same number of nodes in the volume.

		In type of volume, files are distributed across replicated bricks in the volume. You can use this type of volume in environments where the requirement is to scale storage and have high availability. Volumes of this type also offer improved read performance in most environments, and are the most common type of volumes used when clients are external to the GlusterFS nodes themselves.</td>
	</tr>
	<tr>
		<td><strong>Distributed-Replicated</strong></td>
		<td>Somewhat like a RAID-10, an even number of bricks must be used; usable space is the size of the combined bricks passed to the <strong>replica</strong> value. For example, if there are <strong>4 bricks of 20 GB</strong> and you pass <strong>replica 2</strong> to the creation, your files are distributed to 2 nodes (40 GB) and replicated to 2 nodes. With <strong>6 bricks of 20 GB</strong> and <strong>replica 3</strong>, your files are distributed to 3 nodes (60 GB) and replicated to 3 nodes, but if you used replica 2, they are would distributed to 2 nodes (40 GB) and replicated to 4 nodes in pairs. This distribution and replication woul be used when your clients are external to the cluster, not local self-mounts.</td>
	</tr>
</table>

All the fundamental work in this document is the same except for the one step where the volume is created with the **replica** keyword. Using striped-based volumes is not covered.

### Prerequisites

- Two or more servers with separate storage. The examples in this article are based on CentOS 7 & Ubuntu 18.04 servers
- A private network between servers. The examples in this article will use 192.168.0.0/24

### Build setup

The build described in this document uses the following setup. Using Cloud Block Storage devices is no different than using VMware vDisks, SAN/DAS LUNs, iSCSI, and so on.

- Four I/O optimized Rackspace Cloud server images with a /dev/xvde partition ready to use for each brick
- One Cloud Private Network on 192.168.0.0/24 for GlusterFS communication
- GlusterFS 7.1 installed from the vendor package repository

### Preparing the servers

Perform the following configuration and installations to prepare the servers.

1. Configure **`/etc/hosts`**
2. Install OS updates
3. Install GlusterFS software
4. Configure network access
5. Connect GlusterFS nodes

#### Configure /etc/hosts for intra-node communication

Instead of using DNS, prepare **`/etc/hosts`** on every server and ensure that the servers can communicate with each other. All servers have the name <strong>gluster<em>N</em></strong> as a host name, so use <strong>glus<em>N</em></strong> for the private communication layer between servers.

    # vi /etc/hosts
	192.168.0.1  glus-01
	192.168.0.2  glus-02
	192.168.0.3  glus-03
	192.168.0.4  glus-04

	# ping -c2 glus-01; ping -c2 glus-02;  ping -c2 glus-03;  ping -c2 glus-04

#### Install packages

Run the commands in this section to perform the following steps:

1.	Install OS updates
2.	Install the GlusterFS repository and GlusterFS packages

**CentOS**

    yum update -y
    yum install -y centos-release-gluster7
    yum install -y glusterfs-server

**Ubuntu**

The default Ubuntu repository has glusterfs 3.13.2 installed. Use the following code to install 7.1:

    apt update
    apt upgrade -y
    add-apt-repository -y ppa:gluster/glusterfs-7
    apt install -y glusterfs-server

#### Configure network access

**CentOS**

These commands will allow Gluster traffic between your nodes and allow client mounts.

    firewall-cmd --add-service=glusterfs
    firewall-cmd --add-service=glusterfs --permanent

**Ubuntu**

These commands will allow all traffic over your private network segmenyt to facilitate Gluster communication.

    ufw enable
    ufw allow from 192.168.0.0/24

#### Prepare the bricks

Run the commands in this section to perform the following steps:

1.	Partition block devices
2.	Create LVM foundation
3.	Prepare volume bricks

The underlying bricks are a standard file system and mount point. However, be sure to mount each brick in such a way so as to discourage any use from changing to the directory and writing to the underlying bricks themselves.

**Warning:** Writing directly to a brick will corrupt your volume.

The bricks must be unique per node, and there should be a directory within the mount point to use in volume creation. Attempting to create a replicated volume by using the top-level of the mount points results in an error with instructions to use a subdirectory.

**All nodes**

    parted -s -- /dev/xvde mktable gpt
    parted -s -- /dev/xvde mkpart primary 2048s 100%
    parted -s -- /dev/xvde set 1 lvm on
    pvcreate /dev/xvde1
    vgcreate vgglus-01 /dev/xvde1
    lvcreate -l 100%VG -n gbrick1 vgglus-01
    mkfs.xfs /dev/vgglus-01/gbrick1
    echo '/dev/vgglus-01/gbrick1 /var/lib/gvol0 xfs defaults 0 0' >> /etc/fstab
    mkdir /var/lib/gvol0
    mount /var/lib/gvol0

-  glus-01

        mkdir /var/lib/gvol0/brick1

-  glus-02

        mkdir /var/lib/gvol0/brick2

-  glus-03

        mkdir /var/lib/gvol0/brick3

-  glus-04

        mkdir /var/lib/gvol0/brick4

### Set up GlusterFS

Use the steps below to run the GlusterFS setup.

#### Start the glusterfsd daemon

The daemon can also be restarted at run time:

    systemctl enable glusterd
    systemctl start glusterd

### Build a peer group

A peer group is known as a *trusted storage pool* in GlusterFS.

-  glus-01

       gluster peer probe glus-02
       gluster peer probe glus-03
       gluster peer probe glus-04
       gluster peer status

-  glus-02

       gluster peer status

-  glus-03

       gluster peer status

-  glus-04

       gluster peer status

Now you can verify the status of your node and the gluster server pool:

    [root@gluster1 ~]# gluster pool list
    UUID	                				Hostname	State
    734aea4c-fc4f-4971-ba3d-37bd5d9c35b8	glus-04   	Connected
    d5c9e064-c06f-44d9-bf60-bae5fc881e16	glus-03   	Connected
    57027f23-bdf2-4a95-8eb6-ff9f936dc31e	glus-02   	Connected
    e64c5148-8942-4065-9654-169e20ed6f20	localhost	Connected

### Create the volume

By default, glusterd NFS allows global read/write during volume creation, so you should set up basic authorization restrictions to only the private subnet. glusterd automatically starts NFSd on each server and exports the volume through it from each of the nodes. The reason for this behavior is that to use the native client (FUSE) for mounting the volume on clients, the clients have to run exactly the same version of GlusterFS packages. If the versions are different, there might be differences in the hashing algorithms used by servers and clients, and the clients won't be able to connect.

#### Replicated volume

This example creates replication to all four nodes; each node contains a copy of all data and the size of the volume is the size of a single brick. Note that the output shows `1 x 4 = 4`.

**One node only**:

     gluster volume create gvol0 replica 4 transport tcp \
     glus-01:/var/lib/gvol0/brick1 \
     glus-02:/var/lib/gvol0/brick2 \
     glus-03:/var/lib/gvol0/brick3 \
     glus-04:/var/lib/gvol0/brick4
     gluster volume start gvol0

    [root@gluster1 ~]# gluster volume info gvol0

    Volume Name: gvol0
    Type: Replicate
    Volume ID: 8d12cb5a-77ad-43a3-bdd1-ab48405ff1da
    Status: Started
    Snapshot Count: 0
    Number of Bricks: 1 x 4 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus-01:/var/lib/gvol0/brick1
    Brick2: glus-02:/var/lib/gvol0/brick2
    Brick3: glus-03:/var/lib/gvol0/brick3
    Brick4: glus-04:/var/lib/gvol0/brick4
    Options Reconfigured:
    transport.address-family: inet
    storage.fips-mode-rchecksum: on
    performance.client-io-threads: off

#### Distributed-Replicated volume

This example creates distributed replication to 2x2 nodes; each pair of nodes contains the data and the size of the volume is the size of two bricks. Note that the output shows `2 x 2 = 4`.

**One node only**:

    gluster volume create gvol0 replica 2 transport tcp \
    glus-01:/var/lib/gvol0/brick1 \
    glus-02:/var/lib/gvol0/brick2 \
    glus-03:/var/lib/gvol0/brick3 \
    glus-04:/var/lib/gvol0/brick4
    gluster volume start gvol0

    [root@gluster1 ~]# gluster volume info gvol0

    Volume Name: gvol0
    Type: Distributed-Replicate
    Volume ID: b2ddd34b-ffb4-4fd8-ae60-b90adbd4c2ab
    Status: Started
    Snapshot Count: 0
    Number of Bricks: 2 x 2 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus-01:/var/lib/gvol0/brick1
    Brick2: glus-02:/var/lib/gvol0/brick2
    Brick3: glus-03:/var/lib/gvol0/brick3
    Brick4: glus-04:/var/lib/gvol0/brick4
    Options Reconfigured:
    transport.address-family: inet
    storage.fips-mode-rchecksum: on
    performance.client-io-threads: off

### Delete the volume

After you ensure that no clients (either local or remote) are mounting the volume, you can stop the volume and delete it as follows:

    gluster volume stop gvol0
    gluster volume delete gvol0

#### Clearing bricks

If bricks are used in a volume and they need to be removed, you can use the following methods.

GlusterFS set an attribute on the brick subdirectories. Clear this attribute, and then the bricks can be reused.

-  glus-01:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick1/
      setfattr -x trusted.gfid /var/lib/gvol0/brick1
      rm -rf /var/lib/gvol0/brick1/.glusterfs

-  glus-02:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick2/
      setfattr -x trusted.gfid /var/lib/gvol0/brick2
      rm -rf /var/lib/gvol0/brick2/.glusterfs

-  glus-03:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick3/
      setfattr -x trusted.gfid /var/lib/gvol0/brick3
      rm -rf /var/lib/gvol0/brick3/.glusterfs

-  glus-04:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick4/
      setfattr -x trusted.gfid /var/lib/gvol0/brick4
      rm -rf /var/lib/gvol0/brick4/.glusterfs

Alternatively, you can delete the subdirectories and then re-create them.

-  glus-01

      rm -rf /var/lib/gvol0/brick1
      mkdir /var/lib/gvol0/brick1

-  glus-02:

      rm -rf /var/lib/gvol0/brick2
      mkdir /var/lib/gvol0/brick2

-  glus-03:

      rm -rf /var/lib/gvol0/brick3
      mkdir /var/lib/gvol0/brick3

-  glus-04:

      rm -rf /var/lib/gvol0/brick4
      mkdir /var/lib/gvol0/brick4

### Add bricks

You can add more bricks to a running volume. Adding an additional brick to our replcated volume example above as follows:

    gluster volume add-brick gvol0 replica 5 gluster5:/var/lib/gvol0/brick5

The `add-brick` command can also be used to change the layout of your volume; for example, to change a two-node Distributed volume into a four-node Distributed-Replicated volume. After such an operation, you *must rebalance* your volume. New files will be automatically created on the new nodes, but the old ones will not get moved.

    gluster volume add-brick gvol0 replica 2 \
    gluster5:/var/lib/gvol0/brick5 ;
    gluster6:/var/lib/gvol0/brick6
    gluster volume rebalance gvol0 start
    gluster volume rebalance gvol0 status

    ## If needed (something didn't work right)
    gluster volume rebalance gvol0 stop

### Volume options

To view configured volume options, run the following command:

    gluster volume info gvol0

Following is example output:

    Volume Name: gvol0
    Type: Replicate
    Volume ID: 8d12cb5a-77ad-43a3-bdd1-ab48405ff1da
    Status: Started
    Snapshot Count: 0
    Number of Bricks: 1 x 4 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus-01:/var/lib/gvol0/brick1
    Brick2: glus-02:/var/lib/gvol0/brick2
    Brick3: glus-03:/var/lib/gvol0/brick3
    Brick4: glus-04:/var/lib/gvol0/brick4
    Options Reconfigured:
    transport.address-family: inet
    storage.fips-mode-rchecksum: on
    performance.client-io-threads: off

To set an option for a volume, use the **set** keyword, as follows:

    gluster volume set gvol0 performance.write-behind off
    volume set: success

To clear an option to a volume back to the default, use the **reset** keyword as follows:

    gluster volume reset gvol0 performance.read-ahead
    volume reset: success: reset volume successful


### Client mounts

The preferred method for a client to mount a GlusterFS volume is by using the native FUSE client. NFS mounts are possible when GlusterFS is deployed in tandem with NFS-Ganesha, which we'll look at in a furture article.

#### FUSE client

The FUSE client allows the mount to happen with a GlusterFS "round robin" style connection. In **/etc/fstab**, the name of one node is used; however, internal mechanisms allow that node to fail, and the clients will roll over to other connected nodes in the trusted storage pool.

**CentOS**:

    yum install -y centos-release-gluster7
    yum install -y glusterfs-fuse

**Ubuntu**:

    add-apt-repository -y ppa:gluster/glusterfs-7
    apt install glusterfs-client

**Common**:

    vi /etc/hosts
    192.168.0.2  glus-01
    192.168.0.4  glus-02
    192.168.0.1  glus-03
    192.168.0.3  glus-04

    modprobe fuse
    echo 'glus-01:/gvol0 /mnt/gluster/gvol0 glusterfs _netdev 0 0' >> /etc/fstab
    mkdir -p /mnt/gluster/gvol0
    mount /mnt/gluster/gvol0

### References

- https://www.gluster.org/announcing-gluster-7-0/
- https://docs.gluster.org/en/latest/
- https://wiki.centos.org/HowTos/GlusterFSonCentOS
- https://kifarunix.com/install-and-setup-glusterfs-on-ubuntu-18-04/
- https://launchpad.net/~gluster

###Next Article

[GlusterFS Troubleshooting](/how-to/glusterfs-troubleshooting)
