---
permalink: set-up-a-two-server-glusterfs-array/
audit_date:
title: Set up a two-server GlusterFS array
type: article
created_date: '2014-06-03'
created_by: Matt Sherborne
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article presents a step-by-step description for how to set up a two-server GlusterFS array.

Having two web servers behind a load balancer means that they have to synchronize the files that they serve and write to. On modern Linux distributions, GlusterFS is the easiest way to accomplish this task. The examples in this article use Ubuntu Trusty as the Linux distribution. This article is the first in a series of three articles about using GlusterFS within the Rackspace cloud environment.

### Disclaimers

This example in this article uses new servers. You need to alter some of the commands if you already have servers set up, or to suit your usage.

Parts of this article involve formatting disks and removing files, which could erase data. It is your responsibility to ensure that the disks that you format and files that you erase don't contain important data *before* you run the commands.

### Prerequisites

You need two Rackspace Cloud servers running Ubuntu Trusty. This article uses the new Performance flavor servers. The data disk's main partition `/dev/xvde1` is  set apart for GlusterFS.

If you are using [Nova](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#using-the-nova-client), you can build two 4-GB Performance severs with Ubuntu Trusty and PVHVM as follows:

    nova boot --image bb02b1a3-bc77-4d17-ab5b-421d89850fca --flavor performance1-4 web1
    nova boot --image bb02b1a3-bc77-4d17-ab5b-421d89850fca --flavor performance1-4 web2

### Install GlusterFS

To install GlusterFS, run the following commands on both servers:

    apt-get update
    apt-get install -y glusterfs-server glusterfs-client

### Prepare the bricks

GlusterFS needs a file system that supports extended attributes to store its data. It creates directories in the file system and calls those directories *bricks.*

On a 4-GB Performance server, you have a whole extra drive that's already partitioned for you:

    root@web01:~# ls /dev/xvde*
    /dev/xvde  /dev/xvde1

1.  Format this partition with `ext4` by running the following command on both servers:

    `mkfs.ext4 /dev/xvde1`

1.  You don't want anything other than GlusterFS using this partition, so mount it in a hidden directory. You can put them in `/srv/.bricks`. If you have multiple xfs volumes per server, you can put them in `/srv/.bricks1` and so on.

    `mkdir /srv/.bricks
    echo /dev/xvde1 /srv/.bricks ext4 defaults 0 1 >> /etc/fstab
    mount /srv/.bricks`

In the example, the term `bricks` is used because each directory in the setup is a GlusterFS brick. A GlusterFS volume is built of bricks (usually bricks on different hosts).

### Set up a Rackspace network

Run GlusterFS on its own [Rackspace cloud network](/how-to/cloud-networks), which allows you to manage the network and firewall settings more easily.

As an example, you can set up a network by using the Nova client on your laptop as follows:

    nova network-create glusterfs 192.168.0.0/24
    nova network-associate-host UUID 192.168.0.1
    nova network-associate-host UUID web02

The first command returns the UUID of the network, which you can copy and paste into the subsequent commands, replacing `UUID` with your network's actual UUID string. Also, replace `192.168.0.1` and `web02` with the IP addresses or host names of your servers, for example:

    nova network-associate-host 4dad2eb0-5ed7-4147-8196-bba7dc2bb45f 23.253.156.109

You could also perform these steps by using [the web UI](/how-to/cloud-networks) instead of using the Nova command line.

#### Open the firewall

Open the firewall to allow all traffic on this network. Run the following command on both servers:

    ufw allow in on eth2

In this example, the network is on the device `eth2`. You can use the command `ip addr show` to see all network devices and networks associated with them.

If you added web01 to the network first, it has the IP address 192.168.0.1 and web02 has the IP address 192.168.0.2.

### Link the servers

1.  Introduce the two Gluster servers to each other. The following example runs the command on `web01`, and tells it to link with `web02`:

    `root@web01:~# gluster peer probe web02
    peer probe: success`

2.  Run the `gluster peer status` command on web02 to confirm that the servers are linked:

    `root@web02:~# gluster peer status
    Number of Peers: 1`

    `Hostname: 192.168.0.1
    Port: 24007
    Uuid: d080d5cc-4181-4d3f-91bc-ef42bb4e8ec9
    State: Peer in Cluster (Connected)`

### Create the GlusterFS volumes

Now you can create the volumes. Run the following command on only *one* of the servers:

    root@web01:~# gluster volume create www replica 2 transport tcp 192.168.0.1:/srv/.bricks/www 192.168.0.2:/srv/.bricks/www
    volume create: www: success: please start the volume to access data

The parts of the command are as follows:

 * gluster - this is the Gluster command-line tool.
 * volume create - You are creating a Gluster volume.
 * www - This is the volume name. You can call it whatever you like.You will use it later in your `/etc/fstab` file when mounting the volume.
 * replica 2 - Every file on this volume will be replicated between 2 bricks. In this case, that means at least two servers (because there is only one brick on each server).
 * transport tcp - Use TCP/IP to synchronize the volumes.
 * 192.168.0.1:/srv/.bricks/www - This is the first brick with which the volume is built (on web01).
 * 192.168.0.2:/srv/.bricks/www - This is the second brick with which the volume is built (on web02).

For more information about these options, you can run the `man gluster` command.

### Start and mount the volume

The volume exists, but it is not being actively synchronized nor served.

1.  Start the volume by running the following command on either server:

     `root@web01:~# gluster volume start www
     volume start: www: success`

2.  Mount the volume in `/srv/www` initially. Run the following commands on both servers:

    `mkdir /srv/www
    echo localhost:/www /srv/www glusterfs defaults,_netdev 0 0 >> /etc/fstab
    mount /srv/www`

3.  Create the mount point, configure it in `/etc/fstab`, and then actually mount the GlusterFS volume.

4.  In `/etc/fstab`, add one special option: `_netdev`. This option tells Ubuntu that the filesystem resides on a device that requires network access, and to not mount it until the network has been enabled.

### Test it

At this point, a file written to or read from `/srv/www/*` should be the same on both systems.

To test it, create a file on web01, view it on web02, delete it on web02, and then verify that it is gone on web01:

web01:

    echo hello > /srv/www/test.txt

web02:

    cat /srv/www/test.txt  # should print 'hello'
    rm /srv/www/test.txt   # Delete the file from web02

web01:

    ls /srv/www/ # Should return nothing

### Move your web content to GlusterFS

In this example, `/var/www` must be on GlusterFS.  Ensure that web01 has the correct `/var/www`.

If you are running this on an already live server, you must to shut down Apache on both servers. You could set up a custom `down for maintenance` page and health monitoring on the [load balancer](/how-to/configure-a-load-balancer) first if you like, but that's beyond the scope of this article.

1.  On **web01**, move `/var/www/` to `/srv/www/`:

    `mv /var/www/* /srv/www/`

1.  On **web02**, if you're sure that you don't need it, you can free up space by deleting `/var/www`:

    `rm -rf /var/www
    mkdir /var/www`

1.  Create a bindmount so that `/srv/www` is accessible via `/var/www`. Run the following commands on **both** servers:

    `echo /srv/www /var/www none defaults,bind 0 0 >> /etc/fstab
    mount /var/www`

You should be able to see your web content with `ls /var/www` on both servers.

### Summary

Your `/etc/fstab` should look as follows on both servers:

    # <file system> <mount point>   <type>  <options>       <dump>  <pass>
    /dev/xvda1	/               ext4    errors=remount-ro,noatime,barrier=0 0       1
    /dev/xvde1 /srv/.bricks ext4 defaults 0 1
    localhost:/www /srv/www glusterfs defaults,_netdev 0 0
    /srv/www /var/www none defaults,bind 0 0

If you run `findmnt | grep srv` the response should look something like this:

    root@web01:~# findmnt | tail -n3
    |-/srv/.bricks         /dev/xvde1     ext4            rw,relatime,attr2,inode64,noquota
    |-/srv/www             localhost:/www fuse.glusterfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other,max_read=131072
    `-/var/www             localhost:/www fuse.glusterfs rw,relatime,user_id=0,group_id=0,default_permissions,allow_other,max_read=131072

This response shows that` /srv/.bricks` is mounted on `/dev/xvde1` and that `localhost:/www` (the GlusterFS volume) is mounted in two places, `/srv/www` and `/var/www` (thanks to bind mounting).

GlusterFS should show everything as healthy:

    root@web01:~# gluster peer list
    unrecognized word: list (position 1)
    root@web01:~# gluster peer status
    Number of Peers: 1

    Hostname: web02
    Port: 24007
    Uuid: 56e02356-d2c3-4787-ae25-6b46e867751a
    State: Peer in Cluster (Connected)

    root@web01:~# gluster volume list
    www

    root@web01:~# gluster volume info www
    Volume Name: www
    Type: Replicate
    Volume ID: bf244b65-4201-4d2f-b8c0-2b11ee836d65
    Status: Started
    Number of Bricks: 1 x 2 = 2
    Transport-type: tcp
    Bricks:
    Brick1: 192.168.0.1:/srv/.bricks/www
    Brick2: 192.168.0.2:/srv/.bricks/www

### Conclusion

You have installed GlusterFS and configured your servers to share your web content. Both servers hold a copy of the files and share changes almost instantaneously.

### Where to go from here

The next article in this GlusterFS series describes how to [Add and remove GlusterFS servers](/how-to/add-and-remove-glusterfs-servers) in a GlusterFS array.
