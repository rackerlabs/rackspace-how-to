---
permalink: managing-cloud-databases-ha-groups-in-the-cloud-control-panel/
title: Managing Cloud Databases HA instance groups in the Cloud Control Panel
type: article
created_date: '2016-03-18'
created_by: Steve Croce
last_modified_date: '2016-03-18'
last_modified_by: Steve Croce
product: Cloud Databases
product_url: cloud-databases
---

A [high availability \(HA\) instance group](/how-to/high-availability-for-cloud-databases/) is a Cloud Databases option that provides better performance and reliability, and reduces downtime if an instance fails via a set of MySQL, Percona, MariaDB instances that failover automatically when an issue is encountered.

This article describes how to create and manage HA instance groups by using the Cloud Control Panel.

### Create a new HA instance group

Use the following steps to create a HA instance group.

**Note:** HA instances are available only on MySQL 5.6, Percona 5.6, and MariaDB 10 and later versions.

#### Create the HA group

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2.  At the top of the panel, select **Databases**.

3.  In the **Databases** menu, select **MySQL Instance** under **CREATE RESOURCES**.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-top-nav-create-1.png %})

4.  In the **Identity** section, provide a name for the instance and specify the region in which you want to launch the HA instances that you create.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-create-instance-region-2.png %})

   **Note:** The name that you provide in this step will be applied to all instances and then an index (-01, -02, and so on) will be applied to all instance names starting with the master. You can also see this in the **Build** section.

5.  In the **Engine** section, select a datastore and version that support HA instances: MySQL5.6 or later, MariaDB 10 or later, or Percona 5.6 or later.

6.  In the **Build** section, select the amount of RAM and disk space you want *each instance* of your HA group to have. The master instance and each replica instance will be created with this same amount of RAM and disk space.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-create-instance-build-3.png %})

7.  Also, in the **Build** section, select the **High-Availability Group** option next to **Instance Type**. Some new options are displayed.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-create-instance-build-ha-4.png %})

8.  Perform the following actions:
   - In the **HA Instances** section, which lists the master and replica instances, remove replicas by clicking the circle next to the last replica, or add a replica by selecting **+ Add another replica** beneath the list. Currently, HA groups support only 1 or 2 replicas.
  - In the **Networks** section, select which networks the HA group can connect to. If you select **ServiceNet**, the group is accessible only on ServiceNet, like standard Cloud Databases instances. If you select **ServiceNet and Public**, the HA group is given two hostnames after creation: one accessible on ServiceNet and another accessible on the public Internet.

   **Note:** You can specify networks only when you are creating the HA group. You can't enable public network access after the HA group is created.

9.  In **Advanced Options**, select the IP addresses or ranges that are allowed to connect to your HA instance group.

   A major difference between single instances and HA  groups is that HA groups sit behind a load balancer with a firewall. That firewall is set to block all connections by default, so you must add allowed IP addresses or ranges by clicking the **Add IP Range** button. Both single IP addresses and IP address ranges in CIDR format are allowed.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-create-instance-acl-5.png %})

   **Note:** You can't connect to your HA instance group without first setting up the allowed IP addresses or ranges here. You can also add or remove addresses and ranges after you have created the HA group.

10.  When all selections are complete, click **Create HA Group**.

   The total cost of the HA group is displayed to the right of the **Create HA Group** button.

#### View the build status and connecting to the new HA group

After you click the **Create HA Group** button, the browser is redirected to the HA Group Details page, which lists important information about the HA instance group.

Field | Information
--- | ---
HA Group Status | Displays the status of the overall HA group.
Type | Displays the engine used for the instances in the group.
HA Group ID | The UUID of the HA group. You will use this ID for many actions on the group, such as resizes, backups, and attaching configurations.
Region | The Rackspace data center where your group is deployed.
RAM | The amount of RAM provisioned on each instance of the group.
Disk | The size of the storage volume for each instance of the group.
Backups | The number of backups for this group and the option to create an on-demand backup.

While the group is building, the **HA Group Status** is shown as `Building` and a `Loading` animation is shown in the **HA Group Networks** table.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-instance-details-building-6.png %})

When the group has completed building, the **HA Group Status** value changes to `Running` and the **HA Group Networks** section shows the hostnames and ports that you can use to connect to the instance group. These hostnames will stay the same regardless of failovers and which instance is the master.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-instance-details-built-7.png %})

The **HA Group Networks** section displays the following information:

  - The **Network** column indicates whether a hostname is ServiceNet accessible or a publicly accessible.
  - The **Access** column indicates whether the address and port can be used for only reads or for reads and writes.
  - The **Port** column indicates which port can be used with the associated hostname.
  - The **Address** column indicates the hostname that can be used to connect to MySQL.

Farther down the Instance Details page, greater detail about the HA group master instance is displayed. This information farther down the page is similar to what's shown on the Instance Details page for a single instance or replica set. The `Increase Volume`, `Resize RAM`, and other instance modification options are dimmed because modifications to an HA group must be made to the group rather than the individual instances.

### Modify an HA instance group

1.  While logged in to the [Cloud Control Panel](https://mycloud.rackspace.com) select **MySQL** in the **Databases** menu.

2.  From the list of databases, select one of the HA database instances by clicking its name.

   **Note:** The gear icon on the list page does not yet provide options for performing backups, resizing, or restarting HA instance groups. This functionality will be added in an upcoming release.

3.  To resize RAM, resize volume, create on-demand backups, or create or modify backup schedules, click the link in the detail list that matches that function.

   All actions that you perform on the HA group will apply to all instances in the group. Resizes occur on all instances. Backups are performed against a replica of the HA group.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-instance-details-built-7.png %})

An alternate way to make the modifications from the previous step is to use the Actions menu in the upper-right corner. The meu adds an additional action to delete the HA group.

   ![]({% asset_path cloud-databases/managing-cloud-databases-ha-groups-in-the-cloud-control-panel/managing-cloud-databases-instance-details-gear-8.png %})
