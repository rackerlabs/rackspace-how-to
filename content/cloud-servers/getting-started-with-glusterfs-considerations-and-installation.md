---
permalink: getting-started-with-glusterfs-considerations-and-installation/
audit_date:
title: Get started with GlusterFS - considerations and installation
type: article
created_date: '2014-08-14'
created_by: Marcin Stangel
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

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

- Two or more servers with separate storage
- A private network between servers

### Build setup

The build described in this document uses the following setup. Using Cloud Block Storage devices is no different than using VMware vDisks, SAN/DAS LUNs, iSCSI, and so on.

- Four I/O optimized Rackspace Cloud server images with a 20 GB /dev/xvde partition ready to use for each brick
- One Cloud Private Network on 192.168.3.0/24 for GlusterFS communication
- GlusterFS 3.5.0 installed from the vendor package repository

### Preparing the servers

Perform the following configuration and installations to prepare the servers.

1. Configure **`/etc/hosts`** and **`iptables/`**
2. Install base toolsets
3. Install GlusterFS software
4. Connect GlusterFS nodes

#### Configure /etc/hosts and iptables/

Instead of using DNS, prepare **`/etc/hosts`** on every server and ensure that the servers can communicate with each other. All servers have the name <strong>gluster<em>N</em></strong> as a host name, so use <strong>glus<em>N</em></strong> for the private communication layer between servers.

    # vi /etc/hosts
	192.168.3.2  glus1
	192.168.3.4  glus2
	192.168.3.1  glus3
	192.168.3.3  glus4

	# ping -c2 glus1; ping -c2 glus2;  ping -c2 glus3;  ping -c2 glus4

**Red Hat**

    # vi /etc/sysconfig/iptables
    -A INPUT -s 192.168.3.0/24 -j ACCEPT

    # service iptables restart

**Granular setup for iptables**

The preceding generic iptables rule opens all ports to the subnet. If a more granular setup is required, use the following values:

- **111** - portmap/rpcbind
- **24007** - GlusterFS Daemon
- **24008** - GlusterFS Management
- **38465** to **38467** - Required for GlusterFS NFS service
- **24009** to **+X** - GlusterFS versions earlier than 3.4
- **49152** to **+X** - GlusterFS versions 3.4 and later

Each brick for every volume on the host requires its own port. For every new brick, one new port will be used starting at **24009** for GlusterFS versions earlier than 3.4 and **49152** for version 3.4 and later.

For example, if you have one volume with two bricks, you must open 24009-24010 or 49152-49153.

#### Install packages

Run the commands in this section to perform the following steps:

1.	Install the basic packages for partitioning, LVM2 and XFS
2.	Install the GlusterFS repository and GlusterFS packages
3.	Disable automatic updates of Gluster packages

Some of the required packages might already be installed on the cluster nodes.

**YUM/RPM**

    yum -y install parted lvm2 xfsprogs
    wget -P /etc/yum.repos.d
    http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-epel.repo
    yum -y install glusterfs glusterfs-fuse glusterfs-server

**Ubuntu**

The default Ubuntu repository has glusterfs 3.4.2 installed. Use the following code to install 3.5.1:

    apt-get install lvm2 xfsprogs python-software-properties
    add-apt-repository ppa:semiosis/ubuntu-glusterfs-3.5
    apt-get update
    apt-get install glusterfs-server

Use the following commands to ensure that the gluster* packages are filtered out of automatic updates. Upgrades while it's running can crash the bricks (on at least the upgrade from 3.5.0 to 3.5.1).

    grep ^exclude /etc/yum.conf
    exclude=kernel* gluster*

**Ubuntu**

    apt-mark hold glusterfs*

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
    partx -a /dev/xvde
    pvcreate /dev/xvde1
    vgcreate vgglus1 /dev/xvde1
    lvcreate -l 100%VG -n gbrick1 vgglus1
    mkfs.xfs -i size=512 /dev/vgglus1/gbrick1
    echo '/dev/vgglus1/gbrick1 /var/lib/gvol0 xfs inode64,nobarrier 0 0' >> /etc/fstab
    mkdir /var/lib/gvol0
    mount /var/lib/gvol0

-  glus1

        mkdir /var/lib/gvol0/brick1

-  glus2

        mkdir /var/lib/gvol0/brick2

-  glus3

        mkdir /var/lib/gvol0/brick3

-  glus4

        mkdir /var/lib/gvol0/brick4

### Set up GlusterFS

Use the steps below to run the GlusterFS setup.

#### Start the glusterfsd daemon

The daemon can also be restarted at run time:

**Red Hat**

    service glusterd start
    chkconfig glusterd on

### Build a peer group

A peer group is known as a *trusted storage pool* in GlusterFS.

-  glus1

       gluster peer probe glus2
       gluster peer probe glus3
       gluster peer probe glus4
       gluster peer status

-  glus2

       gluster peer probe glus1
       gluster peer probe glus3
       gluster peer probe glus4
       gluster peer status1

-  glus3

       gluster peer probe glus1
       gluster peer probe glus2
       gluster peer probe glus4
       gluster peer status

-  glus4
       gluster peer probe glus1
       gluster peer probe glus2
       gluster peer probe glus3
       gluster peer status

Now you can verify the status of your node and the gluster server pool:

    [root@gluster1 ~]# gluster pool list
    UUID	                				Hostname	State
    734aea4c-fc4f-4971-ba3d-37bd5d9c35b8	glus4   	Connected
    d5c9e064-c06f-44d9-bf60-bae5fc881e16	glus3   	Connected
    57027f23-bdf2-4a95-8eb6-ff9f936dc31e	glus2   	Connected
    e64c5148-8942-4065-9654-169e20ed6f20	localhost	Connected

### Create the volume

By default, glusterd NFS allows global read/write during volume creation, so you should set up basic authorization restrictions to only the private subnet. glusterd automatically starts NFSd on each server and exports the volume through it from each of the nodes. The reason for this behavior is that to use the native client (FUSE) for mounting the volume on clients, the clients have to run exactly the same version of GlusterFS packages. If the versions are different, there might be differences in the hashing algorithms used by servers and clients, and the clients won't be able to connect.

#### Replicated volume

This example creates replication to all four nodes; each node contains a copy of all data and the size of the volume is the size of a single brick. Note that the output shows `1 x 4 = 4`.

**One node only**:

     gluster volume create gvol0 replica 4 transport tcp \
     glus1:/var/lib/gvol0/brick1 \
     glus2:/var/lib/gvol0/brick2 \
     glus3:/var/lib/gvol0/brick3 \
     glus4:/var/lib/gvol0/brick4
     gluster volume set gvol0 auth.allow 192.168.3.*
     gluster volume set gvol0 nfs.disable off
     gluster volume set gvol0 nfs.addr-namelookup off
     gluster volume set gvol0 nfs.export-volumes on
     gluster volume set gvol0 nfs.rpc-auth-allow 192.168.3.*
     gluster volume start gvol0

    [root@gluster1 ~]# gluster volume info gvol0
    Volume Name: gvol0
    Type: Replicate
    Volume ID: 65ece3b3-a4dc-43f8-9b0f-9f39c7202640
    Status: Started
    Number of Bricks: 1 x 4 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus1:/var/lib/gvol0/brick1
    Brick2: glus2:/var/lib/gvol0/brick2
    Brick3: glus3:/var/lib/gvol0/brick3
    Brick4: glus4:/var/lib/gvol0/brick4
    Options Reconfigured:
    nfs.rpc-auth-allow: 192.168.3.*
    nfs.export-volumes: on
    nfs.addr-namelookup: off
    nfs.disable: off
    auth.allow: 192.168.3.*

#### Distributed-Replicated volume

This example creates distributed replication to 2x2 nodes; each pair of nodes contains the data and the size of the volume is the size of two bricks. Note that the output shows `2 x 2 = 4`.

**One node only**:

    gluster volume create gvol0 replica 2 transport tcp \
    glus1:/var/lib/gvol0/brick1 \
    glus2:/var/lib/gvol0/brick2 \
    glus3:/var/lib/gvol0/brick3 \
    glus4:/var/lib/gvol0/brick4
    gluster volume set gvol0 auth.allow 192.168.3.*
    gluster volume set gvol0 nfs.disable off
    gluster volume set gvol0 nfs.addr-namelookup off
    gluster volume set gvol0 nfs.export-volumes on
    gluster volume set gvol0 nfs.rpc-auth-allow 192.168.3.*
    gluster volume start gvol0

    [root@gluster1 ~]# gluster volume info gvol0
    Volume Name: gvol0
    Type: Distributed-Replicate
    Volume ID: d883f891-e38b-4565-8487-7e50ca33dbd4
    Status: Started
    Number of Bricks: 2 x 2 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus1:/var/lib/gvol0/brick1
    Brick2: glus2:/var/lib/gvol0/brick2
    Brick3: glus3:/var/lib/gvol0/brick3
    Brick4: glus4:/var/lib/gvol0/brick4
    Options Reconfigured:
    nfs.rpc-auth-allow: 192.168.3.*
    nfs.export-volumes: on
    nfs.addr-namelookup: off
    nfs.disable: off
    auth.allow: 192.168.3.*

### Delete the volume

After you ensure that no clients (either local or remote) are mounting the volume, you can stop the volume and delete it as follows:

    gluster volume stop gvol0
    gluster volume delete gvol0

#### Clearing bricks

If bricks are used in a volume and they need to be removed, you can use the following methods.

GlusterFS set an attribute on the brick subdirectories. Clear this attribute, and then the bricks can be reused.

-  glus1:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick1/
      setfattr -x trusted.gfid /var/lib/gvol0/brick1
      rm -rf /var/lib/gvol0/brick1/.glusterfs

-  glus2:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick2/
      setfattr -x trusted.gfid /var/lib/gvol0/brick2
      rm -rf /var/lib/gvol0/brick2/.glusterfs

-  glus3:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick3/
      setfattr -x trusted.gfid /var/lib/gvol0/brick2
      rm -rf /var/lib/gvol0/brick3/.glusterfs

-  glus4:

      setfattr -x trusted.glusterfs.volume-id /var/lib/gvol0/brick4/
      setfattr -x trusted.gfid /var/lib/gvol0/brick2
      rm -rf /var/lib/gvol0/brick4/.glusterfs

Alternatively, you can delete the subdirectories and then re-create them.

-  glus1

      rm -rf /var/lib/gvol0/brick1
      mkdir /var/lib/gvol0/brick1

-  glus2:

      rm -rf /var/lib/gvol0/brick2
      mkdir /var/lib/gvol0/brick2

-  glus3:

      rm -rf /var/lib/gvol0/brick3
      mkdir /var/lib/gvol0/brick3

-  glus4:

      rm -rf /var/lib/gvol0/brick4
      mkdir /var/lib/gvol0/brick4

### Add bricks

You can add more bricks to a running volume, as follows:

    gluster add-brick gvol0 gluster5:/var/lib/gvol0/brick5

The `add-brick` command can also be used to change the layout of your volume; for example, to change a two-node Distributed volume into a four-node Distributed-Replicated volume. After such an operation, you *must rebalance* your volume. New files will be automatically created on the new nodes, but the old ones will not get moved.

    gluster volume add-brick gvol0 replica 2 \
    gluster5:/var/lib/gvol0/brick5 ;
    gluster6:/var/lib/gvol0/brick6
    gluster rebalance gvol0 start
    gluster rebalance gvol0 status

    ## If needed (something didn't work right)
    gluster rebalance gvol0 stop

### Volume options

To view configured volume options, run the following command:

    gluster volume info gvol0

Following is example output:

    Volume Name: gvol0
    Type: Replicate
    Volume ID: bcbfc645-ebf9-4f83-b9f0-2a36d0b1f6e3
    Status: Started
    Number of Bricks: 1 x 4 = 4
    Transport-type: tcp
    Bricks:
    Brick1: glus1:/var/lib/gvol0/brick1
    Brick2: glus2:/var/lib/gvol0/brick2
    Brick3: glus3:/var/lib/gvol0/brick3
    Brick4: glus4:/var/lib/gvol0/brick4
    Options Reconfigured:
    performance.cache-size: 1073741824
    performance.io-thread-count: 64
    cluster.choose-local: on
    nfs.rpc-auth-allow: 192.168.3.*
    nfs.export-volumes: on
    nfs.addr-namelookup: off
    nfs.disable: off
    auth.allow: 192.168.3.*

To set an option for a volume, use the **set** keyword, as follows:

    gluster volume set gvol0 performance.write-behind off
    volume set: success

To clear an option to a volume back to the default, use the **reset** keyword as follows:

    gluster volume reset gvol0 performance.read-ahead
    volume reset: success: reset volume successful


### Client mounts

From a client perspective, the GlusterFS volume can be mounted in the following ways:

- FUSE client
- NFS client

#### FUSE client

The FUSE client allows the mount to happen with a GlusterFS "round robin" style connection. In **/etc/fstab**, the name of one node is used; however, internal mechanisms allow that node to fail, and the clients will roll over to other connected nodes in the trusted storage pool. The performance is slightly slower than the NFS method based on tests, but not drastically so. The gain is automatic HA client failover, which is typically worth the effect on performance.

**RPM**:

    wget -P /etc/yum.repos.d
    http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-epel.repo
    yum -y install glusterfs glusterfs-fuse

**Ubuntu**:

glusterfs-client 3.4.2 works with glusterfs-server 3.5.1, but for the most recent version, use the following code:

    add-apt-repository ppa:semiosis/ubuntu-glusterfs-3.5
    apt-get update
    apt-get install glusterfs-client

**Common**:

    vi /etc/hosts
    192.168.3.2  glus1
    192.168.3.4  glus2
    192.168.3.1  glus3
    192.168.3.3  glus4

    modprobe fuse
    echo 'glus1:/gvol0 /mnt/gluster/gvol0 glusterfs defaults_netdev 0 0' >> /etc/fstab
    mkdir -p /mnt/gluster/gvol0
    mount /mnt/gluster/gvol0

#### NFS client

The standard Linux NFSv3 client tools are used to mount one of the GlusterFS nodes. The performance is typically a little better than when using the FUSE client. However, the disadvantage of using this client is that the connection is 1-to-1. If the GlusterFS node fails, the client will not round-robin out to another node. A different solution must be added, such as HAProxy/keepalived or a load balancer,  to provide a floating IP proxy.

**RPM based**:

    yum -y install rpcbind nfs-utils
    service rpcbind restart; chkconfig rpcbind on
    service nfslock restart; chkconfig on

**Ubuntu**:

    apt-get install nfs-common

**Common:**

    echo 'glus1:/repvol1 /mnt/gluster/gvol0 nfs rsize=4096,wsize=4096,hard,intr 0 0' >> /etc/fstab
    mkdir -p /mnt/gluster/gvol0
    mount /mnt/gluster/gvol0

### References

- http://www.sohailriaz.com/glusterfs-howto-on-centos-6-x/
- http://kaivanov.blogspot.com/2012/07/deploying-glusterfs.html
- http://joejulian.name/blog/glusterfs-path-or-a-prefix-of-it-is-already-part-of-a-volume/
- http://www.jamescoyle.net/how-to/457-glusterfs-firewall-rules

###Next Article

[GlusterFS Troubleshooting](/how-to/glusterfs-troubleshooting)
