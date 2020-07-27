---
permalink: add-a-disk-to-a-cluster-shared-volume-on-a-windows-failover-cluster/
audit_date: '2020-07-24'
title: 'Add a disk to a cluster shared volume on a Windows failover cluster'
type: article
created_date: '2020-07-19'
created_by: Travis Gentry
last_modified_date: '2020-07-24'
last_modified_by: Stephanie Fillmon
product: Cloud Product
product_url: cloud-product
---

This article describes how to add a disk to a cluster shared volume on a Windows&reg; failover cluster.

### Prerequisites

- For Windows Server&reg; 2012 and earlier, the disk you want to add must be a basic disk and partitioned with NTFS.
- For Windows Server 2012 R2 and later, the disk you want to add must be a basic disk and partitioned with either NTFS or ReFS.
- The drive letter of the system disk for all cluster nodes must be the same.
- You must enable the NTLM authentication protocol for all cluster nodes. This protocol is enabled by default.

### Limitations

You cannot use the cluster shared volume as a cluster quorum witness disk.

**Note:** You must be a user with administrative privileges for the server to make these changes.


### Add the disk to Available Storage in Failover Cluster Manager

1. Click **Start**, type **Failover Cluster Manager**, and press **Enter**.

2. In the left-hand pane of the **Failover Cluster Manager**, expand the cluster name for which you want to add the disk.

3. Expand the **Storage** section beneath the cluster name.

4. Right-click on **Disks** and select the option to **Add Disk**.

5. Select the disk you want to add from the list and then click **OK**.


You can now add the disk, assigned to the *Available Storage* group, to the Cluster Shared Volume. 


### Add the disk in Available Storage to the Cluster Shared Volume

1. Click **Start**, type **Failover Cluster Manager**, and press **Enter**.

2. In the left-hand pane of the **Failover Cluster Manager**, expand the name of the cluster.

3. Expand the **Storage** section beneath the cluster name.

4. Select **Disks**.

5. Select the disk that you assigned earlier to *Available Storage*.

6. Right-click on the selected disk and choose the option **Add to Cluster Shared Volumes**.

The disk is now assigned to the **Cluster Shared Volume** group and is visible to each cluster node as a mount point under the **%SystemDisk%ClusterStorage** folder.
