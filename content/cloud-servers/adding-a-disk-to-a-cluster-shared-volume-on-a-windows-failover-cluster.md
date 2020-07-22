---
permalink: adding-a-disk-to-a-cluster-shared-volume-on-a-windows-failover-cluster/
audit_date:
title: 'Adding a disk to a cluster shared volume on a Windows failover cluster'
type: article
created_date: '2020-07-19'
created_by: Travis Gentry
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

### Add a disk to a cluster shared volume on a Windows failover cluster

This article describes the process of adding a disk to a cluster shared volume on a Windows failover cluster.

### Prerequisites
   - For Windows Server 2012 and earlier, the disk to be added must be a basic disk and partitioned with NTFS.
   - For Windows Server 2012 R2 and later, the disk to be added must be a basic disk and partitioned with either NTFS or ReFS.
   - The drive letter of the system disk for all cluster nodes must be the same.
   - The NTLM authentication protocol needs to be enabled for all cluster nodes (enabled by default).



### Limitations

The cluster shared volume cannot be used as a cluster quorum witness disk.

> **Note:** You will need to be a user with administrative privileges for the server in order to make these changes.



### Add the disk to Available Storage in Failover Cluster Manager

1. Press the **start** button, type '*Failover Cluster Manager*' and press **enter**.

2. In the left-hand pane of the Failover Cluster Manager, expand the name of the cluster for which you want to add the disk.

3. Expand the **Storage** section beneath the cluster name.

4. Right-click on **Disks** and select the option to **Add Disk**.

5. Select the disk you would like to add from the list and then click **OK**.


The disk is now assigned to the *Available Storage* group and ready to be added to the Cluster Shared Volume. 



### Add the disk in Available Storage to the Cluster Shared Volume

1. Press the **start** button, type '*Failover Cluster Manager*' and press **enter**.

2. In the left-hand pane of the Failover Cluster Manager, expand the name of the cluster.

3. Expand the **Storage** section beneath the cluster name.

4. Select **Disks**.

5. Select the disk that you assigned earlier to *Available Storage*.

6. Right-click on the selected disk and choose the option **Add to Cluster Shared Volumes**.


The disk has now been assigned to the **Cluster Shared Volume** group. The disk is now visible to each cluster node as a mount point under the %SystemDisk%ClusterStorage folder.
