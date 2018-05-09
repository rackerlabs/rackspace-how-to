---
permalink: add-and-remove-glusterfs-servers/
audit_date: '2018-05-09'
title: Add and remove GlusterFS servers
type: article
created_date: '2014-06-03'
created_by: Matt Sherborne
last_modified_date: '2018-05-09'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to add and remove GlusterFS servers from your server array.

### Prerequisite

- [Set up a two-server GlusterFS array](/how-to/set-up-a-two-server-glusterfs-array)

### Create a new server

Use the `nova boot` command from the previous article to create a server called web3:

    nova boot --image bb02b1a3-bc77-4d17-ab5b-421d89850fca --flavor performance1-4 web3

You could also use the [Rackspace Cloud Control Panel](/how-to/create-a-cloud-server) to create the new server.

### Add the server to the Rackspace custom network

In the previous article, you added a Rackspace custom network.

1. Get the UUID of the network by using the following `nova` command:

       nova network-list

2. After you have the UUID, associate the new host with it.

   Replace `UUID` in the following command with the actual UUID (for example, 5492de89-1497-4aa0-96eb-bcdd55e1195c). `web03` is the host name of the server that you want to add.

       nova network-associate-host UUID web03

You can also use the Rackspace Cloud Control panel to associate a server with your existing network.

When you are done, the new server should have the IP address 192.168.0.3 on interface `/dev/eth3`. That is the address that GlusterFS uses to communicate with the other server.

### Format the partition and install GlusterFS

Use the following steps to format the server partition and install GlusterFS:

1.  Use SSH to log in to the server.

2.  Using the instructions from the [previous article](/how-to/set-up-a-two-server-glusterfs-array), install GlusterFS and format the `bricks` partition as follows:

        apt-get update
        apt-get install -y glusterfs-server glusterfs-client
        apt-get install -y xfsprogs
        mkfs.xfs /dev/xvde1
        mkdir /srv/.bricks
        echo /dev/xvde1 /srv/.bricks xfs rw 0 1 >> /etc/fstab
        mount /srv/.bricks
        ufw allow in on eth2

### Incorporate the new brick into the Gluster volume

1.  Use SSH to log in to either web01 or web02.

2.  The following command instructs the GlusterFS volume to trust the new server:

        root@web02 :~# gluster peer probe 192.168.0.3
        peer probe: success

3.  Add the brick into the volume:

        root@web02 :~# gluster volume add-brick www replica 3 192.168.0.3:/srv/.bricks/www
        volume add-brick: success

The parts of the command are as follows:

 - `gluster` - The command is for GlusterFS.
 - `volume` - The command is related to a volume.
 - `add-brick` - You are adding a brick to the volume.
 - `www` - This is the name of the volume.
 - `replica 3` - After you add this brick, the volume will keep at least three copies of each file, one copy per brick, and in this case, one copy per server (because there is only one brick on each server).
 - `192.168.0.3:/srv/.bricks/www` - This is the IP address of the Gluster server, followed by the absolute path to where the brick data should be stored.

### Volume storage strategies

GlusterFS offers different types of volume storage strategies:

 - **Distributed** - One file on one brick, the next file on the next. This strategy gives you more space because your volume is the sum of all the bricks.
 - **Replicated** (*Recommended*) - Every file is copied to every server.
 - **Striped** - Files are cut into chunks, and one chunk is written to the first brick, one chunk is written to the second brick, and so on.

You can also combine strategies, for example replicated-distributed, as illustrated in the following example:

    gluster volume create www replica 2 transport tcp
    192.168.0.1:/srv/.bricks/www 192.168.0.2:/srv/.bricks/www
    192.168.0.3:/srv/.bricks/www 192.168.0.4:/srv/.bricks/www

The replica number is the number of bricks that make up a replica set, that is, hold a full copy of the files. In the preceding example 192.168.0.1 + 192.168.0.2 hold a full copy of the files, as do 192.168.0.3 + 192.168.0.4. The brick order is significant; if you ordered it 1,3,2,4 then 1+3 and 2+4 would hold the full files, so that if 1+2 went down, you would loose half your files and have two copies of the other half.

Having a replicated-distributed volume gives you a little extra speed, and more space in exchange for data safety.

Striped-replicated volumes are recommended only when you have files that are bigger than a brick, or many large files that are undergoing many IO operations.

### View the state of the servers

Following are some commands that you can use to find out more about what's happening in your cluster. You will use these commands in later GlusterFS articles.

#### peer status

If you run the following command from any server, it shows all the peer servers that it knows about:

    root@web01:~# gluster peer status
    Number of Peers: 2

    Hostname: 192.168.0.3
    Uuid: ba502dc2-447f-466a-a732-df989e71b551
    State: Peer in Cluster (Connected)

    Hostname: 192.168.0.2
    Uuid: 56e02356-d2c3-4787-ae25-6b46e867751a
    State: Peer in Cluster (Connected)

#### volume status

The following command is a helpful troubleshooting command. It gives information about all the GlusterFS volumes and tasks queued and in progress.

    root@web03:~# gluster volume status
    Status of volume: www
    Gluster process						Port	Online	Pid
    ------------------------------------------------------------------------------
    Brick 192.168.0.2:/srv/.bricks/www			49152	Y	13673
    Brick 192.168.0.1:/srv/.bricks/www			49152	Y	10249
    Brick 192.168.0.3:/srv/.bricks/www			49153	Y	13783
    NFS Server on localhost					2049	Y	13793
    Self-heal Daemon on localhost				N/A	Y	13800
    NFS Server on 192.168.0.2				2049	Y	13900
    Self-heal Daemon on 192.168.0.2				N/A	Y	13907
    NFS Server on 192.168.0.1				2049	Y	10286
    Self-heal Daemon on 192.168.0.1				N/A	Y	10293

    There are no active volume tasks

### Remove a brick

You can shrink volumes as needed while the cluster is online and available. Use the following command to remove a brick:

    # gluster volume remove-brick <volName> <brickName> start

Running `remove-brick` with the `start` option automatically triggers a rebalance operation to migrate data from the removed bricks to the rest of the volume.

The following example removes brick 2:

    root@web01:~# gluster volume remove-brick www replica 2 192.168.0.2:/srv/.bricks/www start
    Removing brick(s) can result in data loss. Do you want to Continue? (y/n) y
    volume remove-brick commit force: success

This command tells GlusterFS that the `www` volume will now keep only 2 copies of each file. It warns you that you might lose data, and prompts you to continue.

If you want to remove a brick on a distributed volume, you should to run the following command instead:

    root@web01:~# gluster volume remove-brick www 192.168.0.2:/srv/.bricks/www start

You can view the status of the `remove-brick` operation by using the following command:

    root@web01:~# watch gluster volume remove-brick www replica 2 192.168.0.2:/srv/.bricks/www status

### Re-add a brick

Re-adding a brick is not as straight forward as it could be, so this section explains how to do it.

Try adding web02 back into the volume, as follows:

    root@web01:~# gluster volume add-brick www replica 3 192.168.0.2:/srv/.bricks/www
    volume add-brick: failed:

It failed. Look at the logs on web02 to see why the command failed:

    root@web02:/srv/.bricks# tail /var/log/glusterfs/*log -f | grep E
    [2014-05-25 00:19:04.954410] I [input.c:36:cli_batch] 0-: Exiting with: 0
    [2014-05-25 00:19:12.958620] I [input.c:36:cli_batch] 0-: Exiting with: 0
    [2014-05-25 00:40:46.923747] E [glusterd-utils.c:5377:glusterd_is_path_in_use] 0-management: /srv/.bricks/www or a prefix of it is already part of a volume
    [2014-05-25 00:40:46.923789] E [glusterd-op-sm.c:3719:glusterd_op_ac_stage_op] 0-management: Stage failed on operation 'Volume Add brick', Status : -1

The issue is that `/srv/.bricks/www` still contains the data from the time when web02 was a member of the volume.

It needs a clean place to store the data. The easiest way to clean up is to just remove it all, as follows:

    root@web02:~# rm -rf /srv/.bricks/www

**Be careful** to perform this action on the correct host (web02, which is currently out of the volume). If you do make a mistake, the next article shows you how to recover. Alternative actions would be to move the `www` directory out of the way, or to add the brick using another directory, such as `www2`.

Now that you have a clean location in which to store the brick, adding the brick is easy:

    root@web01:/srv# gluster volume add-brick www replica 3 192.168.0.2:/srv/.bricks/www
    volume add-brick: success

### Next steps

- [How to recover from a failed server in a GlusterFS array](/how-to/recover-from-a-failed-server-in-a-glusterfs-array)
