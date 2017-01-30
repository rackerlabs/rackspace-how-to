---
permalink: glusterfs-troubleshooting/
audit_date:
title: Troubleshoot GlusterFS
type: article
created_date: '2014-08-14'
created_by: Marcin Stangel
last_modified_date: '2016-06-24'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section** - [GlusterFS build steps](/how-to/getting-started-with-glusterfs-considerations-and-installation)

This article describes two GlusterFS issues that you might encounter and provides steps for resolving them:

- Healing replicated volumes
- Fixing a split-brain problem

### Heal replicated volumes

When any brick in a replicated volume goes offline, the `glusterd` daemons on the remaining nodes keep track of all the files that are not replicated to the offline brick. When the offline brick becomes available again, the cluster initiates a healing process, replicating the updated files to that brick. The start of this process can take up to 10 minutes, based on observation.

You can view information about which files need to be replicated by running the following command:

     gluster volume heal volumeName info

You can view information about the files that have been replicated during the healing process. You can also view information about files that have been independently changed on the offline node (split-brain), or that have failed replication for any reason. Append the following options to the preceding command:

    gluster volume heal volumeName info healed

    gluster volume heal volumeName info heal-failed

    gluster volume heal volumeName info split-brain

You can also force healing manually by invoking the following command. If you use the optional argument `full`, all of the files that weren't marked as needing to be healed are also synchronized.

    gluster volume heal volumeName

Optional:

    gluster volume heal volumeName full

### Fix a split-brain problem

A *split-brain* problem occurs when one of the replicated nodes goes offline (or is disconnected from the cluster) and a file on one of its bricks is updated. After the node rejoins the GlusterFS cluster, the healing process fails because of the conflict caused by two different versions of the file.

In the following example, this problem is triggered manually and then fixed. The node called `gluster4` is disconnected and one of the files stored on its brick is modified:

    [root@gluster1 ~]# cat /mnt/gluster/gvol0/testfile.txt
    This is version 1 of the file

    [root@gluster4 ~]# ifdown eth2

    ##Wait just a little bit for the other nodes to see it disconnected

    [root@gluster1 ~]# gluster peer status | grep -A2 glus4
    Hostname: glus4
    Uuid: 734aea4c-fc4f-4971-ba3d-37bd5d9c35b8
    State: Peer in Cluster (Disconnected)

    [root@gluster4 ~]# echo "This is new content" >> /var/lib/gvol0/brick4/testfile.txt

    [root@gluster4 ~]# cat /var/lib/gvol0/brick4/testfile.txt
    This is version 1 of the file
    This is new content

    [root@gluster1 ~]# cat /mnt/gluster/gvol0/testfile.txt
    This is version 1 of the file

    [root@gluster4 ~]# ifup eth2

    ##Wait just a little bit for the other nodes to see it reconnected

    [root@gluster1 ~]# gluster peer status | grep -A2 glus4
    Hostname: glus4
    Uuid: 734aea4c-fc4f-4971-ba3d-37bd5d9c35b8
    State: Peer in Cluster (Connected)

Now the healing process is triggered:

    gluster volume heal gvol0 full

    gluster volume heal gvol0 info split-brain
    Gathering list of split brain entries on volume gvol0 has been successful

    Brick glus1:/var/lib/gvol0/brick1
    Number of entries: 1
    at                    path on brick
    -----------------------------------
    2014-05-16 19:55:19 /testfile.txt

    Brick glus2:/var/lib/gvol0/brick2
    Number of entries: 0

    Brick glus3:/var/lib/gvol0/brick3
    Number of entries: 0

    Brick glus4:/var/lib/gvol0/brick4
    Number of entries: 0

    [root@gluster1 ~]# cat /mnt/gluster/gvol0/testfile.txt
    cat: /mnt/gluster/gvol0/testfile.txt: Input/output error

    [root@gluster4 ~]# cat /mnt/gluster/gvol0/testfile.txt
    cat: /mnt/gluster/gvol0/testfile.txt: Input/output error

Notice that the **testfile.txt** file is listed, which means that GlusterFS does not know which version of the file is the correct one. It is important to fix this problem because it can confuse the clients and cause them to crash.

Each GlusterFS brick has a hidden folder, **glusterfs**, that contains a hexadecimal GlusterFS ID (GFID) of each file as a hard-coded link. In our example, gluster4 is a replica of the gluster1 node. The following example shows the GFIDs of **testfile.txt** on gluster1 and gluster4:

    [root@gluster1 ~]# getfattr -m . -d -e hex /var/lib/gvol0/brick1/testfile.txt
    # file: var/lib/gvol0/brick1/testfile.txt
    trusted.afr.gvol0-client-0=0x000000000000000000000000
    trusted.afr.gvol0-client-1=0x000000000000000000000000
    trusted.afr.gvol0-client-2=0x000000000000000000000000
    trusted.afr.gvol0-client-3=0x000000000000000000000000
    trusted.gfid=0xa702251de4c547e2ba2f96b896a43718

    [root@gluster4 ~]# getfattr -m . -d -e hex /var/lib/gvol0/brick4/testfile.txt
    # file: var/lib/gvol0/brick4/testfile.txt
    trusted.afr.gvol0-client-0=0x000000000000000000000000
    trusted.afr.gvol0-client-1=0x000000000000000000000000
    trusted.afr.gvol0-client-2=0x000000000000000000000000
    trusted.afr.gvol0-client-3=0x000000000000000000000000
    trusted.gfid=0xa702251de4c547e2ba2f96b896a43718

On one of the nodes, the file itself, as well as the associated GFID file (in this case, a702251d-e4c5-47e2-ba2f-96b896a43718), must be deleted from the underlying mount. Only then can the healing process be triggered again. It's critical to understand which copy of the file you want to save. If possible, save a full copy of the file to a location outside GlusterFS, delete the file from all the nodes, trigger a heal process, and copy the file back over the mount point. This method is more brute force, but it works if the healing process still cannot properly fix the file through replication.

    [root@gluster4 ~]# rm -vf /var/lib/gvol0/brick1/.glusterfs/a7/02/a702251d-e4c5-47e2-ba2f-96b896a43718
    [root@gluster4 ~]# rm -vf /var/lib/gvol0/brick1/testfile.txt
    [root@gluster4 ~]# gluster volume heal gvol0 full

    [root@gluster1 ~]# cat /var/lib/gvol0/brick1/testfile.txt
    This is version 1 of the file

    [root@gluster4 ~]# cat /var/lib/gvol0/brick4/testfile.txt
    This is version 1 of the file

**Next section** - [GlusterFS HA and load balancing](/how-to/glusterfs-high-availability-through-ctdb)
