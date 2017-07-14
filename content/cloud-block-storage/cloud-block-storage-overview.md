---
permalink: cloud-block-storage-overview/
audit_date:
title: Overview of Cloud Block Storage
type: article
created_date: '2012-10-22'
created_by: Rackspace Support
last_modified_date: '2016-12-29'
last_modified_by: Catherine Richardson
product: Cloud Block Storage
product_url: cloud-block-storage
---

Rackspace Cloud Block Storage is a block-level storage solution that
allows you to expand the storage capacity of your Rackspace Next
Generation Cloud Servers. This means you can
increase your storage without increasing the size or capacity of your
server or by provisioning new ones. Once you mount and format your
drive, you can use it just like a regular hard drive attached to your
server. Or you can detach your block storage volume from one server and
attach it to another. Or you can delete your server, keeping your data
intact and ready for the next time you need it. And since you're
leveraging the power of the Cloud, you only pay for what you use. Cloud
Block Storage offers you power and ease with the kind of storage that
works for you. For information on Cloud Block Storage and Cloud Backup
options on General Purpose servers, see [Best Practices for Backing Up Your Data: Cloud Block Storage versus Cloud Backup](/how-to/best-practices-for-backing-up-your-data-cloud-block-storage-versus-cloud-backup).

There are two types of volumes you can attach to your server:

-   A standard speed option for customers who just need additional
    storage on their Cloud server
-   A high performance option for databases and high performance
    applications, leveraging solid state drives for speed

Both types are priced per gigabyte (GB) of storage and not by
input/output operations per second (IOPS), which can be difficult to
predict or control.

### Uses of Cloud Block Storage

-   Mount a drive to a server to scale storage without paying for more
    compute capability
-   Add standard speed storage for customers who just need additional
    storage on their server
-   Add high performance storage for databases and high performance
    applications, leveraging solid state drives for speed
-   Detach your block storage and delete your server, keeping your data
    available and your costs down, because you only pay for what you use
-   Re-attach your block storage volume and move data from one server to
    another

### Access Cloud Block Storage

Access Cloud Block Storage the way you like: you can use it through the
GUI interface of the [Cloud Control Panel](https://mycloud.rackspace.com/) or through the API. This product introduction walks you through Control Panel access. If you prefer to interact with Cloud Block Storage programmatically, view the [Developer Guide](https://developer.rackspace.com/docs/cloud-block-storage/v1/developer-guide/).

### Limits of Cloud Block Storage

-   50 GB to 1 TB for SSD volumes
-   75 GB to 1 TB for SATA volumes
-   14 volumes max / server - operating system (OS) dependent
-   10 TB of SATA and 10 TB of SSD in each region -  This is the default
    for all new customers. Customers can request limit increases if more
    capacity is needed over the default limits. Please contact Rackspace
    Support, your Account Manager, or your Service Delivery Manager for
    more information.

### Cloud Block Storage terminology

You may run across some unfamiliar terms in this Getting Started Guide.
Here are some common terms and definitions we use in Cloud Block
Storage.

-   **Instance**: An instance is a virtual machine that runs inside
    the cloud.
-   **Instance type**: An instance type describes the compute, memory and
    storage capacity of Nova computing instances. In layman's terms,
    this is the size (in terms of vCPUs, RAM, and so forth) of the
    virtual server that you will be launching.
-   **Region**: The location of your server and storage volumes. You
    should create your block storage volumes in the same data center as
    your server to avoid bandwidth fees.
-   **Snapshot**: A snapshot is a point in time copy of the data contained
    in a volume.
-   **Volume**: A volume is a detachable block storage device. You can
    think of it like a USB hard drive. It can only be attached to one
    instance at a time.
-   **Volume type**: The volume type is the type of a block
    storage volume. There are two types: SATA for standard performance
    and SSD for high performance.

### Cloud Block Storage product overview contents

In this product overview, you will learn how to do the following tasks:

-   [Create and attach a volume](/how-to/create-and-attach-a-cloud-block-storage-volume).
-   [Prepare your volume for use with a server (Linux or Windows)](/how-to/create-and-attach-a-cloud-block-storage-volume).
-   [Take snapshots of your volume](/how-to/create-and-use-cloud-block-storage-snapshots).
-   [Detach and delete a volume](/how-to/detach-and-delete-cloud-block-storage-volumes).
-   [Move a Cloud Block Storage volume between servers](/how-to/moving-a-software-raid-cloud-block-storage-volume-from-one-cloud-server-to-another).
-   [Attach a Cloud Block Storage volume to an OnMetal server](/how-to/attach-a-cloud-block-storage-volume-to-an-onmetal-server).


Let's get started and [create your first
volume](/how-to/create-and-attach-a-cloud-block-storage-volume).
