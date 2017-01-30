---
permalink: recover-from-a-failed-server-in-a-glusterfs-array/
audit_date:
title: Recover from a failed server in a GlusterFS array
type: article
created_date: '2014-06-03'
created_by: Matt Sherborne
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Previous section

[Add and remove GlusterFS servers](/how-to/add-and-remove-glusterfs-servers)

This article shows the following ways to recover when a single server fails:

*  Add a new server, with a new IP address, to take its place (a less work-intensive fix).

*  Add a new server but keep the IP address of the failed server (a more work-intensive fix).

After completing the [previous article](/how-to/add-and-remove-glusterfs-servers) you should have a GlusterFS array with at least two nodes and know how to add and delete nodes.

### Prerequisites

For the purpose of this article, you must be running on a four-node, fully replicated Gluster volume.

Fill your GlusterFS array with fake data for the testing.

### Add a replacement server

In this scenario, web03 fails, but you add a new node with the IP address 192.168.0.5 to replace it. This method is easier than adding a new server with the same IP address as the failed server.

This article will show two forms of disaster recovery:

1. A single node went down, and you're adding a new node to take its place.
2. A single node went down, got rebuilt and kept the IP - this turns out to be more work to fix

### Add a replacement node

In this scenario, web03 will go down again, but you'll add a new node at 192.168.0.5 to replace it. This method is much easier.

1.  Using one of the running servers, add the new sever into the cluster:

        root@matt:~# gluster peer probe 192.168.0.5
        peer probe: success

2.  Exchange the failed brick for the new one:

        root@matt:~# gluster volume replace-brick www 192.168.0.3:/srv/.bricks/www 192.168.0.5:/srv/.bricks/www  commit force
        volume replace-brick: success: replace-brick commit successful

3.  Heal the system:

        root@matt:~# gluster volume heal www full
        Launching Heal operation on volume www has been successful
        Use heal info commands to check status

4.  Get information about the progress of the `heal` operation:

        root@matt:~# gluster volume heal www info
        Gathering Heal info on volume www has been successful  
        ...
        Brick 192.168.0.4:/srv/.bricks/www
        Number of entries: 23
        /wordpress/wp-admin/upload.php

5.  If you were running a distributed system, run the following commands:

        root@matt:~# gluster volume rebalance www fix-layout start
        volume rebalance: www: success: Starting rebalance on volume www has been successful.
        ID: 0a9719c1-cf04-4161-b3b0-cc6fd8dd9108
        root@matt:~# gluster volume rebalance www status

        Node      Rebalanced-files          size       scanned      failures       skipped         status run time in secs
        ---------      -----------   -----------   -----------   -----------   -----------   ------------   --------------
        localhost                0        0Bytes             0             0             0      completed             1.00

        localhost                0        0Bytes             0             0             0      completed             1.00

        192.168.0.2              0        0Bytes             0             0             0      completed             1.00

        192.168.0.4              0        0Bytes             0             0             0      completed             1.00

        192.168.0.4              0        0Bytes             0             0             0      completed             1.00

        192.168.0.5              0        0Bytes             0             0             0      completed             1.00

        volume rebalance: www: success:

### Keep the IP address

In this scenario, server web03, with the IP address 192.168.0.3, has crashed and is completely unrecoverable.

To recover, you build a new server, with the *same IP address*, present it to GlusterFS as the failed server, and let it self-heal. You then re-balance the volume into the GlusterFS.

Refer to the previous articles for information about building and configuring the replacement server.

### Disguise the new web03 server as the failed server

1.  Build the new server, install GlusterFS on it, and prepare the disk for the brick.

2.  Give the server the peer UUID of the failed server. To get the UUID, run the following command on one of the running servers (such as web01):

        root@web01:~# grep 192.168.0.3 /var/lib/glusterd/peers/*/var/lib/glusterd/peers/ba502dc2-447f-466a-a732-df989e71b551:hostname1=192.168.0.3

3.  Copy the file name (which is the original Web03 UUID). In the preceding example, it is: `ba502dc2-447f-466a-a732-df989e71b551`.

4.  Assign the failed server's UUID to the new server.

     1.  Stop the Gluster daemon:

             root@web03:~# service glusterfs-server stop
             glusterfs-server stop/waiting

     2.  Replace the generated node UUID with the copied one in the `glusterd` configuration file:

             root@web03:~# UUID=ba502dc2-447f-466a-a732-df989e71b551
             root@web03:~# sed  -i "s/\(UUID\)=\(.*\)/\1=$UUID/g" /var/lib/glusterd/glusterd.info
             root@web03:~# cat /var/lib/glusterd/glusterd.info
             UUID=ba502dc2-447f-466a-a732-df989e71b551
             operating-version=2

      **Note:** The `ba502dc2-447f-466a-a732-df989e71b551` UUID is an example UUID; you must replace it with the UUID from your failed server (as remembered by web01).

5.  Start the server again:

        root@web03:~# service glusterfs-server start
        glusterfs-server start/running, process 10732

### Reconfigure the peer servers

1.  On the new server, check that the other servers are visible:

        root@web03:~# gluster peer status
        peer status: No peers present

2.  If the peer servers are not visible, you must add them explicitly:

        root@web03:~# gluster peer probe 192.168.0.1
        peer probe: success
        root@web03:~# gluster peer probe 192.168.0.2
        peer probe: success
        root@web03:~# gluster peer probe 192.168.0.4
        peer probe: success

3.  Run the `gluster peer status` command again on web03. The response should be: `State: Accepted peer request (Connected)`

4.  Restart the daemon one more time, and the peer servers should be visible:

        root@web03:~# service glusterfs-server restart
        glusterfs-server stop/waiting
        glusterfs-server start/running, process 9123
        root@web03:~# gluster peer status
        Number of Peers: 3
        Hostname: 192.168.0.2
        Uuid: 177cd473-9421-4651-8d6d-18be3a7e1990
        State: Peer in Cluster (Connected)

        Hostname: 192.168.0.1
        Uuid: 8555eac6-de14-44f6-babe-f955ebc16646
        State: Peer in Cluster (Connected)

        Hostname: 192.168.0.4
        Uuid: 1681b266-dc31-42e1-ab82-4e220906eda1
        State: Peer in Cluster (Connected)

### Synchronize the volumes

1.  Check the volume status:

        root@web03:~# gluster volume status
        No volumes present

2.  Get the volumes from a peer server:

        root@web03:~# gluster volume sync 192.168.0.2 all
        Sync volume may make data inaccessible while the sync is in progress. Do you want to continue? (y/n) y
        volume sync: success

3.  Set the file system for the brick into order. In the following example, the brick is stored in **/srv/.bricks/www**:

        root@web03:~# mkdir /srv/.bricks/www

4.  Go to one of the running servers, install `attr` and get the correct volume ID.

        root@web02:~# apt-get install attr -y
        ...
        root@web02:~# getfattr  -n trusted.glusterfs.volume-id /srv/.bricks/www
        getfattr: Removing leading '/' from absolute path names
        # file: srv/.bricks/www
        trusted.glusterfs.volume-id=0s42V5HW+LSuyzqotW1jgAhA==

5.  Copy the volume ID string to your clipboard. In the example, it is `0s42V5HW+LSuyzqotW1jgAhA==`.

6.  On the replacement server, apply that extended attribute:

        root@web03:~# apt-get install attr -y
        ...
        root@web03:~# setfattr -n trusted.glusterfs.volume-id -v '0s42V5HW+LSuyzqotW1jgAhA==' /srv/.bricks/www

7.  Restart the server, and then heal the system:

        root@matt:~# service glusterfs-server restart
        glusterfs-server stop/waiting
        glusterfs-server start/running, process 13318
        root@matt:~# gluster volume heal www full
        Launching Heal operation on volume www has been successful
        Use heal info commands to check status

8.  Get information about the progress of the `heal` operation. The new server should be running as expected.

        root@matt:~# gluster volume heal www info
        Gathering Heal info on volume www has been successful

        Brick 192.168.0.1:/srv/.bricks/www
        Number of entries: 0

        Brick 192.168.0.2:/srv/.bricks/www
        Number of entries: 0

        Brick 192.168.0.3:/srv/.bricks/www
        Number of entries: 0

        Brick 192.168.0.4:/srv/.bricks/www
        Number of entries: 0

### Conclusion

You have now learned how to recover from a failed server in a GlusterFS array.
